local CATEGORY_NAME = "Utility"

--------- Administrator Mode ---------
function ulx.administrate(calling_ply, target_ply, should_revoke)
	if not target_ply then
		target_ply = calling_ply
		if not target_ply:IsValid() then
			Msg("You are God, you command everything, no matter what people think of you.")
			return
		end
		if not should_revoke then
			target_ply.adminmode = target_ply.adminmode or "player"
			if target_ply.adminmode == "administrative" then
				ULib.tsayError(calling_ply, "This person is already in administrative mode.")
			else
				target_ply.adminmode = "administrative"
				target_ply:GodEnable()
				target_ply:SetMoveType(MOVETYPE_NOCLIP)
				ULib.invisible(target_ply, true, 0)
				ulx.fancyLogAdmin(calling_ply, true, "#A set #T to administrative mode.", target_ply)
			end
		else
			if target_ply.adminmode == "player" then
				ULib.tsayError(calling_ply, "This person is already in player mode.")
			else
				target_ply.adminmode = "player"
				target_ply:GodDisable()
				target_ply:SetMoveType(MOVETYPE_WALK)
				ULib.invisible(target_ply, false, 0)
				ulx.fancyLogAdmin(calling_ply, true, "#A set #T to player mode.", target_ply)
	end
end
local administrate = ulx.command( CATEGORY_NAME, "ulx administrate", ulx.administrate, "!administrate" )
administrate:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
administrate:addParam{ type=ULib.cmds.BoolArg, invisible=true }
administrate:defaultAccess( ULib.ACCESS_ADMIN )
administrate:help( "Sets the target to administrative mode." )
administrate:setOpposite( {"ulx unadministrate", "ulx play"}, {_, _, true}, {"!play", "!unadministrate"} )