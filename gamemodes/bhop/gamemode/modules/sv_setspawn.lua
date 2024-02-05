-- Code for segmented style
-- by justa

-- module 
SetSpawn = {}

-- Setup waypoints
function SetSpawn:WaypointSetup(client)

	if (not client.waypoints) then 
		client.waypoints = {}
		client.lastWaypoint = 0
		client.lastTele = 0
	end

end

-- Reset
function SetSpawn:Reset(client)
	client.waypoints = nil
end

-- Set a waypoint
function SetSpawn:SetWaypoint(client)

	-- Set up if not already
	if client.Style == 2 then return end
	if client.Style == 3 then return end
	if client.Style == 4 then return end
	if client.Style == 5 then return end
	if client.Style == 6 then return end
	if client.Style == 7 then return end
	if client.Style == 8 then return end
	if client.Style == 9 then return end
	if client.Style == 10 then return end

	-- Set up waypoints
	self:WaypointSetup(client)

	if client.Tn then
		Core:Send(client, "Print", {"Timer", "You can only set spawn point in a zone."})
		return 
	end

	-- Too fast
	if (client.lastWaypoint > CurTime()) then 
		return
	end

	-- Checks
	if (not client.Style == _C.Style.Normal) then 
		return end 

	-- Set waypoint
	table.insert(client.waypoints, {
		frame = Bot:GetFrame(client),
		pos = client:GetPos(),
		angles = client:EyeAngles(),
		vel = client:GetVelocity(),
	})

	-- Lil' inform 
	Core:Send(client, "Print", {"Timer", "New spawn set."})

	-- Last waypoint
	client.lastWaypoint = CurTime() + 0.5
end

-- Goto waypoint
function SetSpawn:GotoWaypoint(client)
	-- Set up waypoints
	self:WaypointSetup(client)

	-- Checks
	if (not client.Style == _C.Style.Normal) then 
		return end

	-- Do we even have a waypoint
	if (#client.waypoints < 1) then 
		Core:Send(client, "Print", {"Timer", "Waiting for you to set a spawn point."})
		return
	end

	-- Too fast
	if (client.lastTele > CurTime()) then 
		return
	end


	-- Get waypoint
	local waypoint = client.waypoints[#client.waypoints]

	-- Set player values
	client:SetPos(waypoint.pos)
	client:SetLocalVelocity(waypoint.vel)
	client:SetEyeAngles(waypoint.angles)

	Spectator:PlayerRestart(client)

	-- Strip bot frames 
	Bot:StripFromFrame(client, waypoint.frame)

	-- Last tele
	client.lastTele = 0
end

-- Goto waypoint
function SetSpawn:RemoveWaypoint(client)
	-- Set up waypoints
	self:WaypointSetup(client)

	-- Checks
	if (not client.Style == _C.Style.Normal) then 
		return end

	-- Do we even have a waypoint
	if (#client.waypoints < 1) then 
		Core:Send(client, "Print", {"Timer", "Set a waypoint first."})
		return
	end

	-- Remove waypoint
	client.waypoints[#client.waypoints] = nil 

	-- Message
	Core:Send(client, "Print", {"Timer", "Waypoint removed."})

	-- Goto 
	self:GotoWaypoint(client)
end

-- Exit
function Segment:Exit(client)
	UI:SendToClient(client, "normal", true)
end

-- UI 
UI:AddListener("ss", function(client, data)
	local id = data[1]

	if (id == "set") then 
		Segment:SetWaypoint(client)
	elseif (id == "goto") then
		Segment:GotoWaypoint(client)
	elseif (id == "remove") then 
		Segment:RemoveWaypoint(client)
	elseif (id == "reset") then
		client.hasWarning = client.hasWarning or false

		if (client.hasWarning) then 
			client:ConCommand("reset")
			client.hasWarning = false
		else 
			client.hasWarning = true 
			Core:Send(client, "Print", {"Timer", "Are you sure you wish to reset your waypoints? Press again to confirm."})

			timer.Simple(3, function()
				client.hasWarning = false
			end)
		end 
	end
end)