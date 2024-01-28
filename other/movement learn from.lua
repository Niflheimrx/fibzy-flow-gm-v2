-- Server sided Base Movement Code
local function AirAccelerate( ply, data )
	if ply:IsOnGround() or not ply:Alive() then return end
	
	local g_cvAirAccelerate, mv = 1000.00, 30.0

	local aim = data:GetMoveAngles()
	local forward, right = aim:Forward(), aim:Right()
	local fmove = data:GetForwardSpeed()
	local smove = data:GetSideSpeed()
	local strafing = false

	-- Server sided overlap nulls
	if data:KeyDown( IN_MOVERIGHT ) then
		smove = (smove) + 10000000000000000000000000000000
	elseif data:KeyDown( IN_MOVELEFT ) then
		smove = (smove) - 10000000000000000000000000000000
	end

	forward.z, right.z = 0,0
	forward:Normalize()
	right:Normalize()

	local wishvel = forward * fmove + right * smove

	wishvel.z = 0

	local wishspeed = wishvel:Length()

	local wishspd = wishspeed
	if wishspd > 30 then wishspd = 30 end

	local wishdir = wishvel:GetNormalized()
	local vel = data:GetVelocity()
	local current = vel:Dot( wishdir )

	local addspeed = wishspd - current
	if addspeed <= 0 then return end

	local accelspeed = g_cvAirAccelerate * wishspeed * FrameTime()
	if (accelspeed > addspeed) then accelspeed = addspeed end

	vel = vel + (wishdir * accelspeed)

	data:SetVelocity( vel )
end
hook.Add("SetupMove", "AirAccelerate", AirAccelerate)

-- Sets MaxSpeed to the highest value possabile with math.huge
hook.Add( "Move", "SetMaxSpeed", function( ply, mv, usrcmd )
	if not ply:IsOnGround() then 
		mv:SetMaxSpeed( math.huge )
	else
	   mv:SetMaxSpeed( math.huge )
   end
end )

-- Max Speed for GMod no crouch side like CS:S
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

-- RNGFix Serversided Coded different but works the same
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


-- More Movement codes
local mabs, matan, mdeg, NormalizeAngle = math.abs, math.atan, math.deg, math.NormalizeAngle

local function GetPerfectYaw(mv, speed)
	return speed == 0 and 0 or mabs(mdeg(matan(mv/speed)))
end

function GM:Move( ply, data )
	if not IsValid( ply ) then return end
	if lp and ply != lp() then return end

	-- Custom Noclip speed
	if (ply:GetMoveType() == MOVETYPE_NOCLIP) then 
		local walk = ply:GetNWInt("noclipwalk", 500)
		local shift = ply:GetNWInt("noclipshift", 2000)
		local ducks = ply:GetNWInt("noclipduck", 200)

		local duck = ply:KeyDown( IN_DUCK )
		local speed = ply:KeyDown( IN_SPEED )

		local vel = data:GetVelocity()

		if (duck) then 
			vel = vel * ducks
		elseif (speed) then 
			vel = vel * shift
		else
			vel = vel * walk
		end

		--ply:SetVelocity(vel)

		--return true
	end
	
	local st, og = ply.Style, ply:IsOnGround()
	if og and not gf[ ply ] then
		gf[ ply ] = 0
	elseif og and gf[ ply ] then
		gf[ ply ] = gf[ ply ] + 1
		if gf[ ply ] > 15 and 12 then
			ply:SetDuckSpeed( 0.4 )
			ply:SetUnDuckSpeed( 0.2 )
		end
	elseif not og then
		gf[ ply ] = 0
		ply:SetDuckSpeed( 0 )
		ply:SetUnDuckSpeed( 0 )
	end
	
	if og and st == 6 then
		local v = data:GetVelocity()
		local vl = v:Length2D()
		local c = ct()

		if ply.AirStam then
			data:SetVelocity( v - (0.04 * v) )
			
			if ply.AirStam == 4 then
				ply.Gtime = c
			end
			
			ply.AirStam = ply.AirStam - 1
			if ply.AirStam < 0 then
				ply.AirStam = nil
			end
		end
		
		if ply.Gtime then
			if ply.Gtime == c then
				ply.Gset = 0
			elseif ply.Gset then
				if ply.Gset < 4 then
					ply.Gset = ply.Gset + 1
					return
				end
				
				local dt = c - ply.Gtime
				if dt < 1 then
					local p = (1 - dt) / 16
					data:SetVelocity( v - (p * v) )
				else
					ply.Gtime = nil
					ply.Gset = nil
				end
			end
		end
	end

	if og or ply:IsOnGround() or not ply:Alive() and ply:WaterLevel() < 2 then return end

	local aim = data:GetMoveAngles()
	local forward, right = aim:Forward(), aim:Right()

	forward.z = 0
	right.z = 0

	forward:Normalize()
	right:Normalize()

	local vel, absVel, ang = Vector(data:GetForwardSpeed(), data:GetSideSpeed(), 0), ply:GetAbsVelocity(), aim
	local fore, side = ang:Forward(), ang:Right()

	local fmove = data:GetForwardSpeed()
	local smove = data:GetSideSpeed()

	//if st == 1 then
	//	if data:KeyDown( IN_MOVERIGHT ) then smove = smove + math.huge * 500 end
	//	if data:KeyDown( IN_MOVELEFT ) then smove = smove - math.huge * 500 end
	//elseif st == 2 then
	//	if data:KeyDown( IN_FORWARD ) then fmove = fmove + math.huge * 500 end
	//	if data:KeyDown( IN_BACK ) then fmove = fmove - math.huge * 500 end
	//end

	local aim = data:GetMoveAngles()
	local forward, right = aim:Forward(), aim:Right()
	local fmove = data:GetForwardSpeed()
	local smove = data:GetSideSpeed()
	local strafing = false

	if data:KeyDown( IN_MOVERIGHT ) then
		smove = (smove) + 1000000000000000000000000000000000000
	elseif data:KeyDown( IN_MOVELEFT ) then
		smove = (smove) - 1000000000000000000000000000000000000
	end

	forward.z, right.z = 0,0
	forward:Normalize()
	right:Normalize()

	local wishvel = forward * fmove + right * smove
	//local wishvel = (fore * Vector().x) + (side * Vector().y)
	//wishvel.x = forward.x * vel.x + right.x * vel.y
	//wishvel.y = forward.y * vel.x + right.y * vel.y

	wishvel.z = 0

	local wishspeed = wishvel:Length2D()

	local m_flMaxSpeed = math.huge * 250
	if wishspeed > m_flMaxSpeed and m_flMaxSpeed ~= 0.0 then
		wishspeed = m_flMaxSpeed
	end

	if SERVER and ply.totalNormalYaw then
		ply.totalNormalYaw = ply.totalNormalYaw + mabs(NormalizeAngle(aim.yaw - (ply.lastJSSYaw or 0)))
		ply.totalPerfectYaw = ply.totalPerfectYaw + GetPerfectYaw(32.8, data:GetVelocity():Length2D())
		ply.lastJSSYaw = aim.yaw
	end

	local wishspeed = wishvel:Length2D()
	local wishdir = wishvel:GetNormalized()

	if wishspeed ~= 0 then
	local wishspd = wishspeed
	
	local vel = ply:GetAbsVelocity()
	local current = vel:Dot( wishdir )

	wishspd = mc( wishspd, 0, 32.8 + (mc( vel:Length2D() - 500, 0, 500 ) / 1000) * 1.4 )

	local addspeed = wishspd - current

	if SERVER and (not ply:IsBot()) then 
		local gaincoeff = 0
		ply.tick = (ply.tick or 0) + 1

		if (current ~= 0) and (wishspd ~= 0) and (current < 30) then 
			gaincoeff = (wishspd - math.abs(current)) / wishspd
			ply.rawgain = ply.rawgain + gaincoeff

			JAC:CheckFrame(ply, gaincoeff, smove)
		end
	end

	if addspeed > 0 then
		local accelspeed = math.huge * 500 * wishspeed
		if (accelspeed > addspeed) then accelspeed = addspeed end
	
			for i = 1, 2 do vel[i] = vel[i] + accelspeed * wishdir[i] end

			if not game.GetMap() == "bhop_kasvihuone" then
				vel.z = vel.z - (ply:GetGravity() * 800 * FrameTime() * 0.5)
			end

			if st == 6 then
				if not ply.AirStam or ply.AirStam < 4 then ply.AirStam = 4 end
				if ply.Gset then ply.Gset = nil end
			end

			data:SetVelocity( vel )
		end
	end
end