--[[
ULX Ammo Module
	Unlimited Ammo
	Set Ammo Amount
	Set Current Ammo
	--Strip Ammo
	Strip Weapons
	Strip Current Weapon
	Force Drop Weapon
]]--

local CATEGORY_NAME = "Ammo"

------ Strip Ammunition ------
function ulx.stripAmmo( calling_ply, target_plys )
	if not target_ply then
		target_plys = {}
		table.insert(target_plys, calling_ply)
	end
		local affected_plys = {}
	for i = 1, #target_plys do
		local v = target_plys[ i ]
		v:StripAmmo()
		table.insert( affected_plys, v )
	end
	ulx.fancyLogAdmin( calling_ply, "#A stripped ammo from #T", affected_plys )
end
local stripam = ulx.command( CATEGORY_NAME, "ulx stripammo", ulx.noclip, "!stripammo" )
stripam:addParam{ type=ULib.cmds.PlayersArg, ULib.cmds.optional }
stripam:defaultAccess( ULib.ACCESS_ADMIN )
stripam:help( "Strips the ammo from target player(s)." )