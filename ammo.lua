--[[
ULX Ammo/Weapons Module
	Unlimited Ammo
	Set Ammo Amount
	Set Current Ammo
	--Strip Ammo
	Strip Weapons
	Strip Current Weapon
	Force Drop Weapon
]]--

local CATEGORY_NAME = "Ammo"

ammotypes = {}
ammotypes[3] = "Pistol"
ammotypes[5] = ".357"
ammotypes[1] = "AR2"
ammotypes[6] = "Crossbow Bolts"
ammotypes[10] = "Grenades"
ammotypes[8] = "RPG"
ammotypes[7] = "12 Gauge Shells"
ammotypes[11] = "SLAM Explosives" 
ammotypes[9] = "SMG Grenades"
ammotypes[4] = "SMG Ammo"
ammotypes[2] = "AR2 Secondary"
------ Strip Ammunition ------
function ulx.stripAmmo( calling_ply, target_plys )
	if not target_plys then
		target_plys = {}
		table.insert(target_plys, calling_ply)
	end
		local affected_plys = {}
	for i = 1, #target_plys do
		local v = target_plys[ i ]
		v:StripAmmo()
		for _, i in pairs(v:GetWeapons()) do
			i:SetClip1(0)
			i:SetClip2(0)
		end
		table.insert( affected_plys, v )
	end
	ulx.fancyLogAdmin( calling_ply, "#A stripped ammo from #T", affected_plys )
end
local stripam = ulx.command( CATEGORY_NAME, "ulx stripammo", ulx.stripAmmo, "!stripammo" )
stripam:addParam{ type=ULib.cmds.PlayersArg, ULib.cmds.optional }
stripam:defaultAccess( ULib.ACCESS_ADMIN )
stripam:help( "Strips the ammo from target player(s)." )

------ Set Current Ammo ------
function ulx.setCurrentAmmo (calling_ply, target_plys, amount)
	if not target_plys then
		target_plys = {}
		table.insert(target_plys, calling_ply)
	end
	local affected_plys = {}
	for i = 1, #target_plys do
		local v = target_plys[i]
		v:GetActiveWeapon():SetAmmo(amount)
	end
end
local stripamd = ulx.command( CATEGORY_NAME, "ulx stripammod", ulx.setCurrentAmmo, "!stripammod" )
stripamd:addParam{ type=ULib.cmds.PlayersArg, ULib.cmds.optional }
stripamd:defaultAccess( ULib.ACCESS_ADMIN )
stripamd:help( "Strips the ammo from target player(s)." )