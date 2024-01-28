include( "core.lua" )
include( "core_lang.lua" )
include( "core_data.lua" )
include( "sv_player.lua" )
include( "sv_command.lua" )
include( "sv_timer.lua" )
include( "sv_zones.lua" )
include( "modules/sv_rtv.lua" )
include( "modules/sv_admin.lua" )
include( "modules/sv_bot.lua" )
include( "modules/sv_spectator.lua" )
include( "modules/sv_smgr.lua" )
include( "modules/sv_stats.lua" )
include("modules/sv_ssj.lua")
include("modules/sv_jac.lua")
include("modules/sv_boosterfix.lua")

-- Checkpoints
include( "modules/sv_checkpoint.lua" )
include( "modules/sv_segment.lua" )

gameevent.Listen( "player_connect" )
Core:AddResources()

-- Ensure certain ConVars
RunConsoleCommand("fps_max", "0")

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

-- Gets base gains server sided
/*local function AirAccelerate( ply, data )
	if ply:IsOnGround() or not ply:Alive() then return end
	
	local g_cvAirAccelerate, mv = math.huge, 32.8

	local aim = data:GetMoveAngles()
	local forward, right = aim:Forward(), aim:Right()
	local fmove = data:GetForwardSpeed()
	local smove = data:GetSideSpeed()
	local strafing = false

	-- Server sided overlap
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

	local wishspeed = wishvel:Length2D()
	local wishdir = wishvel:GetNormalized()

	if wishspeed ~= 0 then
	local wishspd = wishspeed
	
	local vel = ply:GetAbsVelocity()
	local current = vel:Dot( wishdir )

	wishspd = math.Clamp( wishspd, 0, 32.8 + (math.Clamp( vel:Length2D() - 500, 0, 500 ) / 1000) * 1.4 )

	local addspeed = wishspd - current

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
hook.Add("SetupMove", "AirAccelerate", AirAccelerate)*/

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