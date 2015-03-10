--[[ ULX DarkRP Integration Module, by Doctor Internet.
This Module has been designed and initially coded on a computer without access to Garry's Mod, so may have some errors.

FAdmin Teamban
FAdmin Unteamban

DarkRP Change Name
DarkRP Change Job (Title)
DarkRP Change Job (Team)
DarkRP Arrest
DarkRP Unarrest
DarkRP SetMoney
DarkRP Make Wanted
DarkRP Make Unwanted
DarkRP Grant Warrant
DarkRP Revoke Warrant
DarkRP Force Payday

Set Model
Set Weapon Colour
]]--

local CATAGORY_NAME = "DarkRP Integration"

if not string.lower(GetConVarString("gamemode")) == "darkrp" then
	ULib.tsayError("Running DarkRP Module On Non-DarkRP Gamemode.")
end

------ DarkRP Change Name ------
function ulx.darkrp.doChangeName( calling_ply, target_ply, newname )
	if not target_ply then
		target_ply = calling_ply
	end
	if not newname then
		ULib.tsayError("Name required for change.")
		return
	end
	DarkRP.retrieveRPNames( newname , ulx.darkrp.doChangeName2( _, target_ply, newname ))
end
function ulx.darkrp.doChangeName2( allow, target_ply, name )
	if allow then
		oldname = target_ply:Nick()
		target_ply:setRPName( name, false )
		ulx.fancyLogAdmin( calling_ply, "#A set RP name of #T from #s to #s", target_ply, oldname, name )
	else
		ULib.tsayError("Name Selected Already In Use - Name Change Failed.")
	end
end
local changename = ulx.command( CATEGORY_NAME, "ulx changename", ulx.darkrp.forceChangeName, "!changename" )
changename:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
changename:addParam{ type=ULib.cmds.StringArg }
changename:defaultAccess( ULib.ACCESS_ADMIN )
changename:help( "Attempts to change the name of the target." )

------ DarkRP Force Change Name ------
function ulx.darkrp.forceChangeName( calling_ply, target_ply, newname )
	if not target_ply then
		target_ply = calling_ply
	end
	target_ply:setRPName( newname, false )
end
local forcename = ulx.command( CATEGORY_NAME, "ulx forcename", ulx.darkrp.forceforcename, "!forcename" )
forcename:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
forcename:addParam{ type=ULib.cmds.StringArg }
forcename:defaultAccess( ULib.ACCESS_SUPERADMIN )
forcename:help( "Attempts to force-change the name of the target -Limited to SA until tested-." )

------ DarkRP Change Job Title ------
function ulx.darkrp.changeJobTitle( calling_ply, target_ply, title )
	if not target_ply then
		target_ply = calling_ply
	end
	newjob = title
	ulx.fancyLogAdmin( calling_ply, "#A set job title of #T to #s", target_ply, newjob )
	target_ply:updateJob(title)
end
local updatejobfunc = ulx.command( CATAGORY_NAME, "ulx jobtitle", ulx.darkrp.changeJobTitle, "!jobtitle" )
updatejobfunc:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
updatejobfunc:addParam{ type=ULib.cmds.StringArg }
updatejobfunc:defaultAccess( ULib.ACCESS_ADMIN )
updatejobfunc:help( "Changes the job title of the targeted player." )

------ DarkRP Change Job Title Old ------
function ulx.darkrp.changeJobTitleOld( calling_ply, target_ply, title )
	if not target_ply then
		target_ply = calling_ply
	end
	newjob = title
	ulx.fancyLogAdmin( calling_ply, "#A set job title of #T to #s", target_ply, newjob )
	target_ply:ConCommand( "say /job "..newjob )
end
local updatejobfunc = ulx.command( CATAGORY_NAME, "ulx jobtitleold", ulx.darkrp.changeJobTitleOld, "!jobtitleold" )
updatejobcon:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
updatejobcon:addParam{ type=ULib.cmds.StringArg }
updatejobcon:defaultAccess( ULib.ACCESS_ADMIN )
updatejobcon:help( "Changes the job title of the targeted player, using console commands." )

------ FAdmin Teamban ------

------ FAdmin Unteamban ------

------ DarkRP Change Name ------
function ulx.darkrp.changeName( calling_ply, target_ply, newName )
	if not target_ply then
		target_ply = calling_ply
	end
	if not newName then
		ULib.tsayError("Name required for change.")
		return
	end
	oldName = target_ply:Nick()
	target_ply:setRPName(newname, false)
	newName = target_ply:Nick()
	if oldName == newName then
		ULib.tsayError("Name failed to change")
	else
		ulx.fancyLogAdmin(calling_ply, "#A set the RP name of #T from #s to #s", target_ply, oldName, newName)
	end
end

function ulx.darkrp.doChangeName2( allow, target_ply, name )
	if allow then
		oldname = target_ply:Nick()
		target_ply:setRPName( name, false )
		ulx.fancyLogAdmin( calling_ply, "#A set RP name of #T from #s to #s", target_ply, oldname, name )
	else
		ULib.tsayError("Name Selected Already In Use - Name Change Failed.")
	end
end
local changename = ulx.command( CATEGORY_NAME, "ulx changename", ulx.darkrp.forceChangeName, "!changename" )
changename:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
changename:addParam{ type=ULib.cmds.StringArg }
changename:defaultAccess( ULib.ACCESS_ADMIN )
changename:help( "Attempts to change the name of the target." )
DarkRP Change Job (Title)
DarkRP Change Job (Team)
DarkRP Arrest
DarkRP Unarrest
DarkRP SetMoney
DarkRP Make Wanted
DarkRP Make Unwanted
DarkRP Grant Warrant
DarkRP Revoke Warrant
DarkRP Force Payday

Set Model
Set Weapon Colour