hook.Add("SetupMove","SetMaxClientSpeed", function( ply, mv )
	
	 if not ply:KeyDown(IN_DUCK) then 
		 mv:SetMaxClientSpeed( 0 )
	 end
	
	 if ply:KeyDown(IN_WALK) then 
		 mv:SetMaxClientSpeed( 150 )
	 end

	 if not ply:IsOnGround() then 
		 mv:SetMaxClientSpeed( 0 )
	 end

	 if ply:KeyDown(IN_JUMP) then 
		 mv:SetMaxClientSpeed( 0 )
	 end

	 if ply:KeyDown(IN_DUCK) and !ply:IsFlagSet(FL_DUCKING) then 
		 mv:SetMaxClientSpeed( 88.4 )
	 end

	 if not ply:IsOnGround() then 
    	  ply:ConCommand("cl_sidespeed 400")
	 end

	if ply:IsOnGround() then 
         ply:ConCommand("cl_sidespeed 500")
	end

end )

local function AirAccelerate( ply, data )
	if ply:IsOnGround() or not ply:Alive() and ply:WaterLevel() < 2 then return end
	local g_cvAirAccelerate, mv = 500, 32.8

	local aim = data:GetMoveAngles()
	local forward, right = aim:Forward(), aim:Right()
	local fmove = data:GetForwardSpeed()
	local smove = data:GetSideSpeed()

	forward.z = 0
 	right.z = 0
	forward:Normalize()
	right:Normalize()

	local mv, vel, absVel, ang = 32.8, Vector(data:GetForwardSpeed(), data:GetSideSpeed(), 0), ply:GetAbsVelocity(), aim
	local fore, side = ang:Forward(), ang:Right()

	local wishvel = Vector()
	wishvel.x = forward.x * vel.x + right.x * vel.y
	wishvel.y = forward.y * vel.x + right.y * vel.y

	wishvel.z = 0

	local wishspeed = wishvel:Length()
	local m_flMaxSpeed = data:GetMaxSpeed()
	if wishspeed > m_flMaxSpeed and m_flMaxSpeed ~= 0.0 then
		wishspeed = m_flMaxSpeed
	end

	if wishspeed ~= 0 then
	local wishspd = wishspeed
	local vel = data:GetVelocity()

	if wishspd > 30 then wishspd = 30 end

	local wishdir = wishvel:GetNormalized()
	local vel = data:GetVelocity()
	local current = vel:Dot( wishdir )

	local currentgain = vel:Dot(wishdir)
	local gaincoeff = 0.0
	local wishspd = (wishspeed > 30) and 30 or wishspeed

	-- if speed isnt clamped
	if currentgain < 30 then
		gaincoeff = (wishspd - math.abs(currentgain)) / wishspd
	end

	-- Gain Stats
	if SERVER and (not ply:IsBot()) then 
		local gaincoeff = 0
		ply.tick = (ply.tick or 0) + 1

		if (current ~= 0) and (wishspd ~= 0) and (current < 30) then 
			gaincoeff = (wishspd - math.abs(current)) / wishspd
			ply.rawgain = ply.rawgain + gaincoeff
		end
	end

	local addspeed = wishspd - current

	if addspeed > 0 then
	local accelspeed = g_cvAirAccelerate * wishspeed * FrameTime()
	if (accelspeed > addspeed) then accelspeed = addspeed end
	
		vel = vel + (wishdir * accelspeed)

		vel.z = vel.z - (ply:GetGravity() * 800 * FrameTime() * 0.5)

		if ply:GetGravity() == 0.5 then return 
			ply:GetGravity(1) 
		end

		data:SetVelocity( vel )
		end
	end
	--return false
end
hook.Add("SetupMove", "AirAccelerate", AirAccelerate)