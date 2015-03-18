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
function ulx.setCurrentAmmo(calling_ply, target_ply, amount, secondary)
	local affected_plys = {}
	if not target_ply then
		target_ply = calling_ply
	end
	if not secondary then
		if ammotypes[target_ply:GetActiveWeapon():GetPrimaryAmmoType()] ~= nil then
			target_ply:SetAmmo(amount, target_ply:GetActiveWeapon():GetPrimaryAmmoType())
				ulx.fancyLogAdmin(calling_ply, "#A set #s of #T to #s", ammotypes[target_ply:GetActiveWeapon():GetPrimaryAmmoType()], target_ply, amount)
			else
				ULib.tsayError(calling_ply, "No Primary Ammo Type Defined - Try Secondary?", true)
			end
		else
			if ammotypes[target_ply:GetActiveWeapon():GetSecondaryAmmoType()] ~= nil then
				target_ply:SetAmmo(amount, target_ply:GetActiveWeapon():GetSecondaryAmmoType())
				ulx.fancyLogAdmin(calling_ply, "#A set #s of #T to #s", ammotypes[target_ply:GetActiveWeapon():GetSecondaryAmmoType()], target_ply, amount)
			else
				ULib.tsayError(calling_ply, "No Secondary Ammo Type Defined - Try Primary?", true)
			end
		end
	end
local stripamd = ulx.command( CATEGORY_NAME, "ulx setcurrentammo", ulx.setCurrentAmmo, "!setcurrentammo" )
stripamd:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
stripamd:addParam{ type=ULib.cmds.NumArg, min=0, hint="Amount" }
stripamd:addParam{ type=ULib.cmds.BoolArg, hint="Set Secondary Ammo", ULib.cmds.optional }
stripamd:defaultAccess( ULib.ACCESS_ADMIN )
stripamd:help( "Sets the ammo for the currently selected weapon for targeted player(s)." )

------ Get Current Ammo ID ------
function ulx.getAmmoID(calling_ply)
	ULib.tsay(calling_ply, "---- "..calling_ply:GetActiveWeapon():GetClass().." ----")
	ULib.tsay(calling_ply, "Primary Ammo: "..calling_ply:GetActiveWeapon():GetPrimaryAmmoType())
	ULib.tsay(calling_ply, "Secondary Ammo: "..calling_ply:GetActiveWeapon():GetSecondaryAmmoType())
end
local getammoid = ulx.command(CATEGORY_NAME, "ulx getammoid", ulx.getAmmoID, "!getammoid")
getammoid:defaultAccess(ULib.ACCESS_SUPERADMIN)
getammoid:help("Returns the numerical ammoID for the currently selected weapon (mainly for debug use).")