require("setflags")

include "sv_config.lua"
include "core.lua"
include "core_lang.lua"
include "core_data.lua"
include "sv_player.lua"
include "sv_command.lua"
include "sh_paint.lua"
include "sh_pebblebuster.lua"
include "sv_timer.lua"
include "sv_zones.lua"

include "modules/sv_rtv.lua"
include "modules/sv_admin.lua"
include "modules/sv_bot.lua"
include "modules/sv_spectator.lua"
include "modules/sv_smgr.lua"
include "modules/sv_stats.lua"
include "modules/sv_ssj.lua"
include "modules/sv_trailing.lua"
include "modules/sv_jac.lua"
include "modules/sv_boosterfix.lua"

include "modules/sv_checkpoint.lua"
include "modules/sv_setspawn.lua"
include "modules/sv_segment.lua"

gameevent.Listen "player_connect"
Core:AddResources()

-- Ensure certain ConVars
RunConsoleCommand("fps_max", "0")

local sv_minrate = GetConVar("sv_minrate")
local sv_maxrate = GetConVar("sv_maxrate")

local sv_maxupdaterate = GetConVar("sv_maxupdaterate")
local sv_minupdaterate = GetConVar("sv_minupdaterate")
local sv_maxcmdrate = GetConVar("sv_maxcmdrate")
local sv_mincmdrate = GetConVar("sv_mincmdrate")

local cl_sidespeed = GetConVar("cl_sidespeed")
local cl_upspeed = GetConVar("cl_upspeed")

local cl_forwardspeed = GetConVar("cl_forwardspeed")
local cl_backspeed = GetConVar("cl_backspeed")

local cvar_maxvelocity = GetConVar("sv_maxvelocity")
local cvar_gravity = GetConVar("sv_gravity")
local cvar_maxspeed = GetConVar("sv_maxspeed")
local cvar_backspeed = GetConVar("sv_backspeed")

local cvar_airaccelerate = GetConVar("sv_airaccelerate")
local cvar_accelerate = GetConVar("sv_accelerate")
local cvar_stopspeed = GetConVar("sv_stopspeed")
local cvar_sticktoground = GetConVar("sv_sticktoground")

local cvar_specspeed = GetConVar("sv_specspeed")
local cvar_noclipspeed = GetConVar("sv_noclipspeed")

local cvar_friction  = GetConVar("sv_friction")
local cvar_defaultdeployspeed = GetConVar("sv_defaultdeployspeed")
local mp_show_voice_icons = GetConVar("mp_show_voice_icons")
local cvar_client_predict = GetConVar("sv_client_predict")

local gmod_physiterations  = GetConVar("gmod_physiterations")

local gmod_fpsmax  = GetConVar("fps_max")

sv_minrate:SetFlags(bit.band(sv_minrate:GetFlags(), bit.bnot(FCVAR_CHEAT)))
sv_maxrate:SetFlags(bit.band(sv_maxrate:GetFlags(), bit.bnot(FCVAR_CHEAT)))

sv_maxupdaterate:SetFlags(bit.band(sv_maxupdaterate:GetFlags(), bit.bnot(FCVAR_CHEAT)))
sv_minupdaterate:SetFlags(bit.band(sv_minupdaterate:GetFlags(), bit.bnot(FCVAR_CHEAT)))
sv_maxcmdrate:SetFlags(bit.band(sv_maxcmdrate:GetFlags(), bit.bnot(FCVAR_CHEAT)))
sv_mincmdrate:SetFlags(bit.band(sv_mincmdrate:GetFlags(), bit.bnot(FCVAR_CHEAT)))

cl_sidespeed:SetFlags(bit.band(cl_sidespeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cl_upspeed:SetFlags(bit.band(cl_upspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))

cl_forwardspeed:SetFlags(bit.band(cl_forwardspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cl_backspeed:SetFlags(bit.band(cl_backspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))

cvar_maxvelocity:SetFlags(bit.band(cvar_maxvelocity:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_gravity:SetFlags(bit.band(cvar_gravity:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_maxspeed:SetFlags(bit.band(cvar_maxspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_backspeed:SetFlags(bit.band(cvar_backspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))

cvar_airaccelerate:SetFlags(bit.band(cvar_airaccelerate:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_accelerate:SetFlags(bit.band(cvar_accelerate:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_stopspeed:SetFlags(bit.band(cvar_stopspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_sticktoground:SetFlags(bit.band(cvar_sticktoground:GetFlags(), bit.bnot(FCVAR_CHEAT)))

cvar_specspeed:SetFlags(bit.band(cvar_specspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_noclipspeed:SetFlags(bit.band(cvar_noclipspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))

cvar_friction:SetFlags(bit.band(cvar_friction:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_defaultdeployspeed:SetFlags(bit.band(cvar_defaultdeployspeed:GetFlags(), bit.bnot(FCVAR_CHEAT)))
mp_show_voice_icons:SetFlags(bit.band(mp_show_voice_icons:GetFlags(), bit.bnot(FCVAR_CHEAT)))
cvar_client_predict:SetFlags(bit.band(cvar_client_predict:GetFlags(), bit.bnot(FCVAR_CHEAT)))

gmod_physiterations:SetFlags(bit.band(gmod_physiterations:GetFlags(), bit.bnot(FCVAR_CHEAT)))

gmod_fpsmax:SetFlags(bit.band(gmod_fpsmax:GetFlags(), bit.bnot(FCVAR_CHEAT)))

game.ConsoleCommand("sv_minrate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_maxrate 0\n")

game.ConsoleCommand("sv_maxupdaterate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_minupdaterate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_maxcmdrate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_mincmdrate 80000000000000000000000000000000000000\n")

game.ConsoleCommand("cl_sidespeed 80000000000000000000000000000000000000\n")
game.ConsoleCommand("cl_upspeed 80000000000000000000000000000000000000\n")

game.ConsoleCommand("cl_forwardspeed 80000000000000000000000000000000000000\n")
game.ConsoleCommand("cl_backspeed 80000000000000000000000000000000000000\n")

game.ConsoleCommand("sv_maxvelocity 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_gravity 800\n")
game.ConsoleCommand("sv_maxspeed 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_backspeed 80000000000000000000000000000000000000\n")

game.ConsoleCommand("sv_airaccelerate 0\n")
game.ConsoleCommand("sv_accelerate 5\n")
game.ConsoleCommand("sv_stopspeed 75\n")
game.ConsoleCommand("sv_sticktoground 0\n")

game.ConsoleCommand("sv_specspeed 10\n")
game.ConsoleCommand("sv_noclipspeed 10\n")

game.ConsoleCommand("sv_friction 4\n")
game.ConsoleCommand("sv_defaultdeployspeed 1\n")
game.ConsoleCommand("mp_show_voice_icons 0\n")
game.ConsoleCommand("sv_client_max_interp_ratio 0\n")
game.ConsoleCommand("sv_client_min_interp_ratio 0\n")
game.ConsoleCommand("sv_client_cmdrate_difference 0\n")
game.ConsoleCommand("sv_client_predict 0\n")

game.ConsoleCommand("gmod_physiterations 0\n")

game.ConsoleCommand("sv_minrate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_maxrate 0\n")

game.ConsoleCommand("sv_maxupdaterate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_minupdaterate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_maxcmdrate 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_mincmdrate 80000000000000000000000000000000000000\n")

game.ConsoleCommand("cl_sidespeed 80000000000000000000000000000000000000\n")
game.ConsoleCommand("cl_upspeed 80000000000000000000000000000000000000\n")

game.ConsoleCommand("cl_forwardspeed 80000000000000000000000000000000000000\n")
game.ConsoleCommand("cl_backspeed 80000000000000000000000000000000000000\n")

game.ConsoleCommand("sv_maxvelocity 999999\n")
game.ConsoleCommand("sv_gravity 800\n")
game.ConsoleCommand("sv_maxspeed 80000000000000000000000000000000000000\n")
game.ConsoleCommand("sv_backspeed 80000000000000000000000000000000000000\n")

game.ConsoleCommand("sv_airaccelerate 0\n")
game.ConsoleCommand("sv_accelerate 5\n")
game.ConsoleCommand("sv_stopspeed 75\n")
game.ConsoleCommand("sv_sticktoground 0\n")

game.ConsoleCommand("sv_specspeed 10\n")

game.ConsoleCommand("sv_friction 4\n")
game.ConsoleCommand("sv_defaultdeployspeed 1\n")
game.ConsoleCommand("mp_show_voice_icons 0\n")
game.ConsoleCommand("sv_client_max_interp_ratio 0\n")
game.ConsoleCommand("sv_client_min_interp_ratio 0\n")
game.ConsoleCommand("sv_client_cmdrate_difference 0\n")
game.ConsoleCommand("sv_client_predict -1\n")

game.ConsoleCommand("gmod_physiterations 0\n")

game.ConsoleCommand("fps_max 0\n")

-- Hogs
function GM:CanPlayerSuicide() return false end
function GM:PlayerShouldTakeDamage() return false end
function GM:GetFallDamage() return false end
function GM:PlayerCanHearPlayersVoice() return true end
function GM:IsSpawnpointSuitable() return true end
function GM:PlayerDeathThink() end
function GM:PlayerSetModel() end

function GM:Think() return true end
function GM:Tick() return true end
function GM:PlayerTick() return true end

hook.Add("Think","Think",function()
	hook.Remove("Think", "Think")
end)

hook.Add("Tick","Tick",function()
	hook.Remove("Tick", "Tick")
end)

hook.Add("PlayerTick","PlayerTick",function()
	hook.Remove("PlayerTick", "PlayerTick")
end)

local function Startup()
	Core:Boot()
end
hook.Add( "Initialize", "Startup", Startup )

local function LoadEntities()
	Core:AwaitLoad()
end
hook.Add( "InitPostEntity", "LoadEntities", LoadEntities )

function GM:PlayerSpawn( ply )
	player_manager.SetPlayerClass( ply, "player_bhop" )
	self.BaseClass:PlayerSpawn( ply )
	
	Player:Spawn( ply )
end

local function PlyConnectMSG( name )
	umsg.Start("DispatchChatJoin")
		umsg.String(name)
		umsg.String("1")
	umsg.End()
end
hook.Add( "PlayerConnect", "PlyConnectMSG", PlyConnectMSG )

local function PlyLoadedMSG( ply )
	timer.Simple(1, function()
		if ply:IsValid() and !ply:IsBot() then
			umsg.Start("DispatchChatJoin")
				umsg.String(ply:GetName())
				umsg.String("2")
				umsg.String(ply:SteamID())
			umsg.End()
		end
	end)
end
hook.Add( "PlayerInitialSpawn", "PlyLoadedMSG", PlyLoadedMSG )

local function PlyDisconnectMSG( ply )
	umsg.Start("DispatchChatJoin")
		umsg.String(ply:GetName())
		umsg.String("3")
		umsg.String(ply:SteamID())
	umsg.End()
end
hook.Add( "PlayerDisconnected", "PlyDisconnectMSG", PlyDisconnectMSG )

function GM:PlayerInitialSpawn( ply )
	Player:Load( ply )
end

function GM:CanPlayerSuicide() return false end
function GM:PlayerShouldTakeDamage() return false end
function GM:GetFallDamage() return false end
function GM:PlayerCanHearPlayersVoice() return true end
function GM:IsSpawnpointSuitable() return true end
function GM:PlayerDeathThink( ply ) end
function GM:PlayerSetModel() end

function GM:PlayerCanPickupWeapon( ply, weapon )
	if ply.WeaponStripped then return false end
	if ply:HasWeapon( weapon:GetClass() ) then return false end
	if ply:IsBot() then return false end
	
	timer.Simple( 0.1, function()
		if IsValid( ply ) and IsValid( weapon ) then
			ply:SetAmmo( 999, weapon:GetPrimaryAmmoType() )
		end
	end )
	
	return true
end

hook.Add("Think", "Unlimtitedaddmmdo", function()
	for _, ply in pairs(player.GetHumans()) do
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) then continue end
		local max = wep:GetMaxClip1()
		if max > 0 then
			wep:SetClip1(max)
		end
	end
end)

function GM:EntityTakeDamage( ent, dmg )
	if ent:IsPlayer() then return false end
	return self.BaseClass:EntityTakeDamage( ent, dmg )
end