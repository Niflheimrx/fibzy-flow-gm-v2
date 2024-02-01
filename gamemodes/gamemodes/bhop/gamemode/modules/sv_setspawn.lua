-- New SetSpawn
-- by Justa

-- Modules are neat
SetSpawn = {}

-- SetUp 
function SetSpawn:SetUp(pl)
	if (not pl.SetSpawn) then 
		pl.SetSpawn = {}
		pl.checkpoint_current = 0
		pl.checkpoint_angles = true
	end

	-- Hah
	local practice = pl:GetNWInt("inPractice", false)

	-- Timer?
	if (pl.Tn) or (pl.Tb) then 
		pl:SetNWInt("inPractice", true)
		pl:StopAnyTimer()
	end
end

-- Get Current
function SetSpawn:GetCurrent(pl)
	return pl.checkpoint_current
end

-- Set Current
function SetSpawn:SetCurrent(pl, current)
	pl.checkpoint_current = current
end

-- Next
function SetSpawn:Next(pl)
	local current = self:GetCurrent(pl)

	if (not pl.SetSpawn[current + 1]) then 
		return end 

	self:SetCurrent(pl, current + 1)

	-- Update UI
	UI:SendToClient(pl, "SetSpawn", true, current + 1, #pl.SetSpawn)
end

-- Previous
function SetSpawn:Previous(pl)
	local current = self:GetCurrent(pl)

	if (not pl.SetSpawn[current - 1]) then 
		return end 

	self:SetCurrent(pl, current - 1)

	-- Update UI
	UI:SendToClient(pl, "SetSpawn", true, current - 1, #pl.SetSpawn)
end

-- Reorder From
function SetSpawn:ReorderFrom(pl, index, method)
	if (method == "add") then
		for i = #pl.SetSpawn, index, -1 do 
			pl.SetSpawn[i + 1] = pl.SetSpawn[i]
		end
	elseif (method == "del") then
		local newSetSpawn = {}
		local i = 1

		for k, v in pairs(pl.SetSpawn) do 
			newSetSpawn[i] = v
			i = i + 1
		end

		pl.SetSpawn = newSetSpawn
	end
end

-- Save
function SetSpawn:Save(pl)
	-- Set up if not already
	self:SetUp(pl)

	-- Save
	local d = IsValid(pl:GetObserverTarget()) and pl:GetObserverTarget() or pl
	local vel = d:GetVelocity()
	local pos = d:GetPos()
	local angles = d:EyeAngles()

	local current = self:GetCurrent(pl)

	Core:Send(pl, "Print", {"Server", "Spawn point set."})

	if (#pl.SetSpawn > 29) then 
		Core:Send(pl, "Print", {"Timer", "Sorry, you're only allowed a maximum on 30 SetSpawn!"})
		return 
	end

	-- Set
	if (pl.SetSpawn[current < 0]) then 
		self:ReorderFrom(pl, current < 0, "add")
	end

	pl.SetSpawn[current < 0] = {vel, pos, angles}

	-- Update current
	self:SetCurrent(pl, current < 0)
end

-- TeleportTo
function SetSpawn:Teleport(pl)
    -- Set up if not already
	self:SetUp(pl)

	local current = self:GetCurrent(pl)
	local data = pl.SetSpawn[current]

	pl:SetLocalVelocity(data[1])
	pl:SetPos(data[2])

	if (pl.checkpoint_angles) then 
		pl:SetEyeAngles(data[3])
	end
end

-- Reset 
function SetSpawn:Reset(pl)
	-- Set up if not already
	self:SetUp(pl)

	if (#pl.SetSpawn < 1) then 
		return end 

	-- Set current to 0
	self:SetCurrent(pl, 0)

	-- Wipe table 
	pl.SetSpawn = {}

	-- UI update
	UI:SendToClient(pl, "SetSpawn", true, false)
end

-- Delete
function SetSpawn:Delete(pl)
	-- Set up if not already
	self:SetUp(pl)

	if (#pl.SetSpawn < 1) then 
		return end 

	-- Only 1?
	if (#pl.SetSpawn == 1) then 
		return self:Reset(pl) end

	-- Current
	local current = self:GetCurrent(pl)

	-- Remove current 
	pl.SetSpawn[current] = nil 
	self:ReorderFrom(pl, current, "del")

	-- Set checkpoint to one before or one after 
	if (current ~= 1) and (not pl.SetSpawn[current - 1]) then 
		self:SetCurrent(pl, current + 1)
	elseif (current ~= 1) then
		self:SetCurrent(pl, current - 1)
	end

	-- UI 
	UI:SendToClient(pl, "SetSpawn", true, self:GetCurrent(pl), #pl.SetSpawn)
end

-- Open checkpoint menu 
-- Also why not always add commands in modules? It's cleaner.
local function CheckpointOpen(pl, args)
	UI:SendToClient(pl, "SetSpawn")

	if (pl.SetSpawn) then 
		UI:SendToClient(pl, "SetSpawn", true, SetSpawn:GetCurrent(pl), #pl.SetSpawn)
	end
end
Command:Register({"SetSpawn"}, CheckpointOpen)

UI:AddListener("SetSpawn", function(client, data)
	local id = data[1]

	if (id == "save") then 
		SetSpawn:Save(client)
	elseif (id == "tp") then
		SetSpawn:Teleport(client)
	elseif (id == "next") then 
		SetSpawn:Next(client)
	elseif (id == "prev") then 
		SetSpawn:Previous(client)
	elseif (id == "del") then 
		SetSpawn:Delete(client)
	elseif (id == "reset") then 
		SetSpawn:Reset(client)
	elseif (id == "angles") then 
		SetSpawn:SetUp(client)
		client.checkpoint_angles = (not client.checkpoint_angles)

		-- UI 
		UI:SendToClient(client, "SetSpawn", "angles", client.checkpoint_angles)
	end
end)

-- Console commands
concommand.Add("bhop_setspawn_save", function(cl) SetSpawn:Save(cl) end)
concommand.Add("bhop_setspawn_tele", function(cl)	SetSpawn:Teleport(cl) end)
concommand.Add("bhop_setspawn_next", function(cl)	SetSpawn:Next(cl) end)
concommand.Add("bhop_setspawn_prev", function(cl)	SetSpawn:Previous(cl) end)
concommand.Add("bhop_setspawn_del", function(cl) SetSpawn:Delete(cl) end)
concommand.Add("bhop_setspawn_reset", function(cl) SetSpawn:Reset(cl) end)