-- Edited: justa
-- No-Timer Glitch

local Zone = {
	MStart = 0,
	MEnd = 1,
	BStart = 2,
	BEnd = 3,
	AC = 4,
	FS = 5,
	NAC = 6,
	BAC = 7,
	LS = 100,
	SOILDAC = 120,
	SURFGRAVTY = 122,
	STEPSIZE = 123,
}

function ENT:Initialize()
	local mi, ma = self.min, self.max

	mi = mi + Vector( -16, -16, 0 )
	ma = ma - Vector( -16, -16, 0 )

	local BBOX = (mi - ma) / 2

	self:SetSolid( SOLID_BBOX )
	self:PhysicsInitBox( -BBOX, BBOX )
	self:SetCollisionBoundsWS( mi, ma )

	self:SetTrigger( true )
	self:DrawShadow( false )
	self:SetNotSolid( true )
	self:SetNoDraw( false )

	self.Phys = self:GetPhysicsObject()
	if self.Phys and self.Phys:IsValid() then
		self.Phys:Sleep()
		self.Phys:EnableCollisions( false )
	end

	self:SetZoneType( self.zonetype )
end

function ENT:StartTouch(ent)
	-- See if the entity is valid, and is a player.	
	if (not IsValid(ent)) or (not ent:IsPlayer()) or (ent:Team() == TEAM_SPECTATOR) then
		return end;

	-- Zone
	local zone = self:GetZoneType()

	-- Calls
	if (zone == Zone.MEnd) and ent.Tn and (not ent.TnF) then
		ent:StopTimer()
	elseif (zone == Zone.BEnd) and ent.Tb and (not ent.TbF) then 
		ent:BonusStop()
	elseif (zone == Zone.AC) then
		ent:StopAnyTimer()
	elseif (zone == Zone.BAC) then 
		ent:BonusReset()
	elseif (zone == Zone.NAC) then
		ent:ResetTimer()
	elseif (zone == Zone.SURFGRAVTY) then
		ent:SetGravity(0.6)
	elseif (zone == Zone.STEPSIZE) then
		ent:SetStepSize(6)
	elseif (zone == Zone.LS) then
		ent:SetLegitSpeed(self.speed)
	elseif (zone == Zone.SOILDAC) then
		ent:SetLegitSpeed(self:SetNotSolid( false ))
	end

	if (zone == Zone.MStart) then 
		if ent.Tn and (not ent:KeyDown(IN_JUMP)) and ent:IsOnGround() then 
			ent:ResetTimer()
		end 
	end
end

function ENT:Touch(ent)
	-- See if the entity is valid, and is a player.	
	if (not IsValid(ent)) or (not ent:IsPlayer()) or (ent:Team() == TEAM_SPECTATOR) then
		return end;

	-- Zone
	local zone = self:GetZoneType()	

	-- Normal
	if (zone == Zone.MStart) then 
		if ent.Tn and (not ent:KeyDown(IN_JUMP)) and ent:IsOnGround() then 
			if (ent.Style == _C.Style.Segment) and ent.waypoints then 
				if (not ent.informedSegment) then 
					Core:Send(ent, "Print", {"Timer", "The timer doesn't reset when entering zone on this style with waypoints set, to reset use !r."})
					ent.informedSegment = true
				end

				return
			end

			ent:ResetTimer()
		elseif (not ent.Tn) and ent:KeyDown(IN_JUMP) then
			if (ent:GetMoveType() == MOVETYPE_NOCLIP) then return end
			ent:StartTimer()
		end 
	-- Bonus
	elseif (zone == Zone.BStart) then
		if ent.Tb and (not ent:KeyDown(IN_JUMP)) and ent:IsOnGround() then 
			ent:BonusReset()
		elseif (not ent.Tb) and ent:KeyDown(IN_JUMP) then
			if (ent:GetMoveType() == MOVETYPE_NOCLIP) then return end
			ent:BonusStart()
		end 
	end
end

function ENT:EndTouch(ent)
	-- See if the entity is valid, and is a player.	
	if (not IsValid(ent)) or (not ent:IsPlayer()) or (ent:Team() == TEAM_SPECTATOR) then
		return end;
	ent:SetGravity(1)
	-- Zone
	local zone = self:GetZoneType()

	-- Calls
	if (ent:GetMoveType() == MOVETYPE_NOCLIP) then return end
	
	if (zone == Zone.FS) then
		ent:StopFreestyle()
	elseif (zone == Zone.MStart) and (not ent.Tn) then 
		ent:StartTimer()
		ent:SetStepSize(18)
	elseif (zone == Zone.BStart) and (not ent.Tb) then
		ent:BonusStart()
	elseif (zone == Zone.STEPSIZE) then 
		ent:SetStepSize(18)
	end
end