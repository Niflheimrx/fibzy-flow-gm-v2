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

	Core:Send(pl, "Print", {"Timer", "Spawn point set."})

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
end

UI:AddListener("SetSpawn", function(client, data)
	local id = data[1]

	if (id == "save") then 
		SetSpawn:Save(client)
	elseif (id == "tp") then
		SetSpawn:Teleport(client)
	elseif (id == "reset") then 
		SetSpawn:Reset(client)
	elseif (id == "angles") then 
		SetSpawn:SetUp(client)
		client.checkpoint_angles = (not client.checkpoint_angles)
	end
end)

-- Console commands
concommand.Add("bhop_setspawn_save", function(cl) SetSpawn:Save(cl) end)
concommand.Add("bhop_setspawn_tele", function(cl)	SetSpawn:Teleport(cl) end)
concommand.Add("bhop_setspawn_reset", function(cl) SetSpawn:Reset(cl) end)