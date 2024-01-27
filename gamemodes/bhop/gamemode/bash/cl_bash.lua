include("cl_menu.lua")

local ID = "bash2_gmod"
local TURN_BIND_DELAY = 150
local BLOCK_BINDS = true
local BINDS_BLACKLIST = {
	-- ["-back"] = true, ["-forward"] = true, ["-moveleft"] = true, ["-moveright"] = true, -- Nulls
	["+left"] = true, ["+right"] = true, -- Autostrafe binds
	["+klook"] = true, ["-klook"] = true, -- Longjump binds
	["+strafe"] = true, ["-strafe"] = true, -- prevent AC false-positives
}

-- TODO: send client code using lua

-- [ Strip binds ] --

local input, bit, string, IN_RIGHT, IN_LEFT = input, bit, string, IN_RIGHT, IN_LEFT

local lastTurn = 0
local nextTurnTick = 0
local cmdNum = 0
local prevYaw = 0
local nextMessageTick = 0
local g_ply = LocalPlayer()
local g_leftBypass = true

hook.Add("InitPostEntity", ID, function()
	g_ply = LocalPlayer()
end)

local function BindMessage(str)
	if cmdNum < nextMessageTick then return end
	chat.AddText(Color(255, 32, 32, 220), "[AntiCheat] ", color_white, str)
	nextMessageTick = cmdNum + TURN_BIND_DELAY
end

local function NotifyServerBind(bind)
	if cmdNum < nextMessageTick then return end
	net.Start(ID, true)
	net.WriteUInt(1, 4)
	net.WriteString(bind)
	net.SendToServer()
end

local IsValidBind
IsValidBind = function(bind)
	local alias = input.TranslateAlias(bind)
	if not alias then return true end
	for _, cmd in ipairs(string.Split(string.lower(alias), ";")) do
		cmd = string.Trim(cmd)
		if BINDS_BLACKLIST[cmd] or not IsValidBind(cmd) then
			return false
		end
	end
	return true
end

local function PlayerBindPress(ply, bind, pressed)
	if g_ply.Practice then return end
	if (bind == "+strafe" or bind == "+klook") and BINDS_BLACKLIST[bind] then
		NotifyServerBind(bind)
		BindMessage(bind .. " is disabled on this server!")
		return true
	end
	if not IsValidBind(bind) then
		NotifyServerBind(bind)
		BindMessage("Forbidden bind: " .. bind)
		return true
	end
end

local function BindToggler(varArgs)
	local left, full = not varArgs[1], not varArgs[2]
	for k, v in pairs(BINDS_BLACKLIST) do
		BINDS_BLACKLIST[k] = full
	end
	BINDS_BLACKLIST["+left"], BINDS_BLACKLIST["+right"] = left, left
	g_leftBypass = varArgs[1]
end

-- Unnecessary because we allow Turn Binds on this gamemode --
--[[
hook.Add("PostGamemodeLoaded", ID, function()
	if istable(Core) and isfunction(Core.Register) then
		Core.Register("Timer/BypassBind", BindToggler)
	end
end)-]]

local function CreateMove(cmd)
	if g_leftBypass or not IsValid(g_ply) or g_ply.Practice or not g_ply:Alive() then return end

	local turn = cmd:KeyDown(IN_RIGHT)
	local ang = cmd:GetViewAngles()

	if cmd:KeyDown(IN_LEFT) ~= turn then
		if lastTurn ~= nil and lastTurn ~= turn and cmdNum < nextTurnTick then
			cmd:RemoveKey(IN_LEFT + IN_RIGHT)
			ang.yaw = prevYaw
			cmd:SetViewAngles(ang)
			BindMessage("Wait until making an opposite turn")
		else
			nextTurnTick = cmdNum + TURN_BIND_DELAY
			lastTurn = turn
		end
	end

	if cmd:TickCount() ~= 0 then
		cmdNum, prevYaw = cmdNum + 1, ang.yaw
	end
end

if TURN_BIND_DELAY ~= 0 then
	hook.Add("CreateMove", ID, CreateMove)
else
	hook.Remove("CreateMove", ID)
end
if BLOCK_BINDS then
	hook.Add("PlayerBindPress", ID, PlayerBindPress)
else
	hook.Remove("PlayerBindPress", ID)
end

-- [ Network ] --

net.Receive(ID, function()
	local msg = { Color(255, 32, 32, 220), "BASH | " }
	local level = net.ReadInt(8)
	local text = net.ReadString()

	if level >= 1 then -- MEDIUM+
		table.Add(msg, { Color(100, 200, 100, 255), os.date("(%X) ", os.time())})
	end
	if level >= 2 then -- HIGH+
		surface.PlaySound("buttons/bell1.wav")
	end

	table.Add(msg, { color_white, text })
	chat.AddText(unpack(msg))
end)

local g_cvars = {}

-- TODO: better way to get cvars values
local function ConVarCallback(cv, _, val)
	net.Start(ID .. "_cv")
	net.WriteUInt(g_cvars[cv], 8)
	net.WriteFloat(tonumber(val) or 0)
	net.SendToServer()
end

net.Receive(ID .. "_cv", function()
	g_cvars = {}
	local size = net.ReadUInt(8)
	for i = 1, size do
		local cv = net.ReadString()
		if not g_cvars[cv] then
			cvars.RemoveChangeCallback(cv, ID)
			cvars.AddChangeCallback(cv, ConVarCallback, ID)
			g_cvars[cv] = i
			ConVarCallback(cv, nil, GetConVar(cv):GetFloat())
		end
	end
end)
