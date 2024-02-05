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


-- Gets shared base movement
local function AirAccelerate( ply, data )
	if ply:IsOnGround() or not ply:Alive() and ply:WaterLevel() < 2 then return end
	
	-- 1000 is Base movement
	local g_cvAirAccelerate, mv = 1000, 32.8

	local aim = data:GetMoveAngles()
	local forward, right = aim:Forward(), aim:Right()
	local fmove = data:GetForwardSpeed()
	local smove = data:GetSideSpeed()

	forward.z = 0
 	right.z = 0
	forward:Normalize()
	right:Normalize()

	local mv, vel, absVel, ang = 3220.8, Vector(data:GetForwardSpeed(), data:GetSideSpeed(), 0), ply:GetAbsVelocity(), aim
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

	-- port from g_cvAirAccelerate to lua not used in RNGFix
	-- wishspd = mc( wishspd, 0, 30 + (mc( vel:Length2D() - 500, 0, 500 ) / g_cvAirAccelerate) * 1.4)
	local mc = math.Clamp

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

	local addspeed = wishspd - current

	if addspeed > 0 then
	local accelspeed = g_cvAirAccelerate * wishspeed * FrameTime()
	if (accelspeed > addspeed) then accelspeed = addspeed end
	
		vel = vel + (wishdir * accelspeed)



		data:SetVelocity( vel )
		end
	end
	--return false
end
hook.Add("SetupMove", "AirAccelerate", AirAccelerate)

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