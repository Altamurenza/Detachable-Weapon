-- DETACHABLE WEAPON AE
-- AUTHOR	: ALTAMURENZA


--[[
	----------------
	# SLVESEFF.LUA #
	----------------
]]

if not SystemIsReady() then
	EffectAddLeavesInArea(POINTLIST._LEAVESMAIN, 0)
	EffectAddLeavesInArea(POINTLIST._LEAVESBUSINESS, 0)
	EffectAddLeavesInArea(POINTLIST._LEAVESRICHAREA, 0)
end


--[[
	---------------------
	# DETACHABLE WEAPON #
	---------------------
]]

_G.DETACHABLE_WEAPON_MAIN = function()
	while not SystemIsReady() or AreaIsLoading() do
		Wait(0)
	end
	
	
	-----------------
	-- # SHARED ENV #
	-----------------
	
	shared.gDetachableWeapon = {}
	shared.gDetachableWeapon.IS_PC = type(_G.ClassMusicSetPlayers) == 'function'
	
	
	----------------------
	-- # SHARED FUNCTION #
	----------------------
	
	shared.gDetachableWeapon.Function = {}
	shared.gDetachableWeapon.Function.GetID = function(PED)
		if PedIsValid(PED) then
			for INDEX = 0, 258 do
				if PedIsModel(PED, INDEX) then
					return INDEX
				end
			end
		end
		
		return nil
	end
	shared.gDetachableWeapon.Function.GetSize = function(IN)
		if type(IN) == 'string' then
			return ({['Small'] = 1, ['Fat'] = 2, ['Medium'] = 2, ['Large'] = 3, ['Huge'] = 4})[IN] or 0
		end
		
		if type(IN) == 'number' then
			if not shared.gDetachableWeapon.SizeRef then
				shared.gDetachableWeapon.SizeRef = {
					[0] = 'Medium',
					[1] = 'Medium',
					[2] = 'Medium',
					[3] = 'Medium',
					[4] = 'Fat',
					[5] = 'Fat',
					[6] = 'Fat',
					[7] = 'Large',
					[8] = 'Medium',
					[9] = 'Large',
					[10] = 'Medium',
					[11] = 'Medium',
					[12] = 'Huge',
					[13] = 'Medium',
					[14] = 'Medium',
					[15] = 'Medium',
					[16] = 'Huge',
					[17] = 'Huge',
					[18] = 'Large',
					[19] = 'Large',
					[20] = 'Huge',
					[21] = 'Large',
					[22] = 'Large',
					[23] = 'Large',
					[24] = 'Medium',
					[25] = 'Medium',
					[26] = 'Large',
					[27] = 'Medium',
					[28] = 'Large',
					[29] = 'Huge',
					[30] = 'Medium',
					[31] = 'Medium',
					[32] = 'Large',
					[33] = 'Huge',
					[34] = 'Large',
					[35] = 'Large',
					[36] = 'Large',
					[37] = 'Large',
					[38] = 'Medium',
					[39] = 'Medium',
					[40] = 'Large',
					[41] = 'Large',
					[42] = 'Medium',
					[43] = 'Huge',
					[44] = 'Medium',
					[45] = 'Large',
					[46] = 'Huge',
					[47] = 'Huge',
					[48] = 'Medium',
					[49] = 'Huge',
					[50] = 'Huge',
					[51] = 'Huge',
					[52] = 'Large',
					[53] = 'Huge',
					[54] = 'Large',
					[55] = 'Huge',
					[56] = 'Huge',
					[57] = 'Huge',
					[58] = 'Huge',
					[59] = 'Large',
					[60] = 'Large',
					[61] = 'Fat',
					[62] = 'Large',
					[63] = 'Large',
					[64] = 'Huge',
					[65] = 'Huge',
					[66] = 'Small',
					[67] = 'Medium',
					[68] = 'Small',
					[69] = 'Small',
					[70] = 'Medium',
					[71] = 'Fat',
					[72] = 'Medium',
					[73] = 'Large',
					[74] = 'Fat',
					[75] = 'Huge',
					[76] = 'Large',
					[77] = 'Large',
					[78] = 'Large',
					[79] = 'Large',
					[80] = 'Large',
					[81] = 'Large',
					[82] = 'Large',
					[83] = 'Huge',
					[84] = 'Fat',
					[85] = 'Large',
					[86] = 'Huge',
					[87] = 'Huge',
					[88] = 'Medium',
					[89] = 'Huge',
					[90] = 'Medium',
					[91] = 'Large',
					[92] = 'Huge',
					[93] = 'Medium',
					[94] = 'Medium',
					[95] = 'Medium',
					[96] = 'Medium',
					[97] = 'Huge',
					[98] = 'Medium',
					[99] = 'Medium',
					[100] = 'Large',
					[101] = 'Large',
					[102] = 'Large',
					[103] = 'Huge',
					[104] = 'Huge',
					[105] = 'Huge',
					[106] = 'Huge',
					[107] = 'Large',
					[108] = 'Huge',
					[109] = 'Medium',
					[110] = 'Large',
					[111] = 'Medium',
					[112] = 'Huge',
					[113] = 'Huge',
					[114] = 'Huge',
					[115] = 'Small',
					[116] = 'Huge',
					[117] = 'Large',
					[118] = 'Large',
					[119] = 'Large',
					[120] = 'Huge',
					[121] = 'Huge',
					[122] = 'Fat',
					[123] = 'Huge',
					[124] = 'Huge',
					[125] = 'Huge',
					[126] = 'Huge',
					[127] = 'Huge',
					[128] = 'Huge',
					[129] = 'Huge',
					[130] = 'Medium',
					[131] = 'Large',
					[132] = 'Large',
					[133] = 'Huge',
					[134] = 'Medium',
					[135] = 'Large',
					[137] = 'Small',
					[138] = 'Small',
					[139] = 'Medium',
					[140] = 'Small',
					[141] = 'Small',
					[142] = 'Medium',
					[143] = 'Large',
					[144] = 'Huge',
					[145] = 'Large',
					[146] = 'Medium',
					[147] = 'Large',
					[148] = 'Huge',
					[149] = 'Huge',
					[150] = 'Medium',
					[151] = 'Huge',
					[152] = 'Huge',
					[153] = 'Huge',
					[154] = 'Large',
					[155] = 'Fat',
					[156] = 'Huge',
					[157] = 'Huge',
					[158] = 'Huge',
					[159] = 'Small',
					[160] = 'Medium',
					[161] = 'Large',
					[162] = 'Medium',
					[163] = 'Large',
					[164] = 'Huge',
					[165] = 'Medium',
					[166] = 'Medium',
					[167] = 'Medium',
					[168] = 'Huge',
					[169] = 'Medium',
					[170] = 'Large',
					[171] = 'Medium',
					[172] = 'Huge',
					[173] = 'Medium',
					[174] = 'Large',
					[175] = 'Medium',
					[176] = 'Huge',
					[177] = 'Medium',
					[178] = 'Large',
					[179] = 'Large',
					[180] = 'Medium',
					[181] = 'Medium',
					[182] = 'Medium',
					[183] = 'Large',
					[184] = 'Large',
					[185] = 'Medium',
					[186] = 'Fat',
					[187] = 'Huge',
					[188] = 'Small',
					[189] = 'Small',
					[190] = 'Huge',
					[191] = 'Huge',
					[192] = 'Medium',
					[193] = 'Medium',
					[194] = 'Huge',
					[195] = 'Huge',
					[196] = 'Large',
					[197] = 'Huge',
					[198] = 'Large',
					[199] = 'Huge',
					[200] = 'Large',
					[201] = 'Huge',
					[202] = 'Large',
					[203] = 'Medium',
					[204] = 'Large',
					[205] = 'Huge',
					[206] = 'Huge',
					[207] = 'Medium',
					[208] = 'Fat',
					[209] = 'Large',
					[210] = 'Large',
					[211] = 'Large',
					[212] = 'Large',
					[213] = 'Medium',
					[214] = 'Medium',
					[215] = 'Medium',
					[216] = 'Large',
					[217] = 'Large',
					[218] = 'Large',
					[219] = 'Small',
					[220] = 'Small',
					[221] = 'Huge',
					[222] = 'Huge',
					[223] = 'Huge',
					[224] = 'Large',
					[225] = 'Small',
					[226] = 'Small',
					[227] = 'Medium',
					[228] = 'Large',
					[229] = 'Huge',
					[230] = 'Medium',
					[231] = 'Large',
					[232] = 'Huge',
					[234] = 'Huge',
					[235] = 'Medium',
					[236] = 'Huge',
					[237] = 'Huge',
					[238] = 'Huge',
					[239] = 'Large',
					[240] = 'Large',
					[241] = 'Large',
					[242] = 'Large',
					[243] = 'Huge',
					[244] = 'Large',
					[245] = 'Large',
					[246] = 'Large',
					[247] = 'Large',
					[248] = 'Huge',
					[249] = 'Huge',
					[250] = 'Medium',
					[251] = 'Medium',
					[252] = 'Huge',
					[253] = 'Huge',
					[254] = 'Huge',
					[255] = 'Medium',
					[256] = 'Fat',
					[257] = 'Small',
					[258] = 'Small',
				}
			end
			return shared.gDetachableWeapon.SizeRef[IN] or 'Medium'
		end
		
		return nil
	end
	
	
	-----------------------
	-- # SHARED FRAMEWORK #
	-----------------------
	
	shared.gDetachableWeapon.Framework = {}
	shared.gDetachableWeapon.Framework.Steal = {}
	shared.gDetachableWeapon.Framework.Pickup = {}
	shared.gDetachableWeapon.Framework.Loot = {}
	shared.gDetachableWeapon.Framework.Detach = {}
	shared.gDetachableWeapon.Framework.Delay = {}
	
	_G.DETACHABLE_WEAPON_FRAMEWORK = function()
		local THROWABLE = {[301] = true, [309] = true, [312] = true, [320] = true, [349] = true, [394] = true}
		
		while true do
			Wait(0)
			
			
			------------
			-- # STEAL #
			------------
			
			for PED, CONTENT in pairs(shared.gDetachableWeapon.Framework.Steal) do
				if PedIsValid(PED) then
					if not CONTENT[6] then
						if PedGetGrappleTargetPed(PED) ~= CONTENT[4] or not PedIsValid(PED) or not PedIsValid(CONTENT[4]) then
							shared.gDetachableWeapon.Framework.Steal[PED] = nil
						end
						
						if CONTENT[3] > GetTimer() and not (PedIsPlaying(PED, '/Global/Actions/Grapples/Front/Grapples/GrappleMoves/WeaponSteal/Steal/Give', true) or PedIsPlaying(CONTENT[4], '/Global/Actions/Grapples/Front/Grapples/GrappleMoves/WeaponSteal/Steal/Give', true)) then
							if PED == gPlayer or CONTENT[4] == gPlayer then
								if IsButtonBeingPressed(9, 0) then
									CONTENT[3] = GetTimer() + ({['Small'] = math.random(2000, 2500), ['Medium'] = math.random(750, 1250), ['Fat'] = math.random(1000, 1250), ['Large'] = math.random(400, 600), ['Huge'] = math.random(150, 300)})[shared.gDetachableWeapon.Function.GetSize(shared.gDetachableWeapon.Function.GetID(PED == gPlayer and CONTENT[4] or PED))]
								end
							end
						else
							if PED ~= gPlayer and CONTENT[4] ~= gPlayer then
								if math.random(0, 100) <= (({['Small'] = 5, ['Medium'] = 15, ['Fat'] = 10, ['Large'] = 30, ['Huge'] = 50})[shared.gDetachableWeapon.Function.GetSize(shared.gDetachableWeapon.Function.GetID(PED))] + ({['Small'] = 50, ['Medium'] = 30, ['Fat'] = 25, ['Large'] = 15, ['Huge'] = 5})[shared.gDetachableWeapon.Function.GetSize(shared.gDetachableWeapon.Function.GetID(PED))]) then
									CONTENT[5] = true
								end
								
								PedSetActionNode(CONTENT[5] and PED or CONTENT[4], '/Global/Actions/Grapples/Front/Grapples/GrappleMoves/WeaponSteal/Steal/Give', 'Act/Globals.act')
							else
								if PedIsPlaying(gPlayer, '/Global/Actions/Grapples/Front/Grapples/GrappleMoves/WeaponSteal/Steal/Give', true) then
									CONTENT[5] = PED == gPlayer
								else
									if CONTENT[4] == gPlayer then
										CONTENT[5] = true
										
										PedSetActionNode(PED, '/Global/Actions/Grapples/Front/Grapples/GrappleMoves/WeaponSteal/Steal/Give', 'Act/Globals.act')
									end
								end
							end
							
							CONTENT[6] = true
						end
					else
						if CONTENT[7] then
							if PedGetGrappleTargetPed(PED) ~= CONTENT[4] then
								if CONTENT[5] then
									_G['PedSetWeapon'..(PED == gPlayer and '' or 'Now')](PED, CONTENT[1], THROWABLE[CONTENT[1]] and PedGetAmmoCount(PED, ({[305] = 316, [396] = 316, [307] = 308})[CONTENT[1]] or CONTENT[1]) + 1 or CONTENT[2], false)
									_G['Ped'..(THROWABLE[CONTENT[1]] and 'Set' or 'Destroy')..'Weapon'](CONTENT[4], CONTENT[1], THROWABLE[CONTENT[1]] and CONTENT[2] - 1 or nil, THROWABLE[CONTENT[1]] and false or nil)
								end
								
								shared.gDetachableWeapon.Framework.Steal[PED] = nil
							end
						else
							shared.gDetachableWeapon.Framework.Steal[PED] = nil
						end
					end
				else
					shared.gDetachableWeapon.Framework.Steal[PED] = nil
				end
			end
			
			
			-------------
			-- # PICKUP #
			-------------
			
			for ITEM, CONTENT in pairs(shared.gDetachableWeapon.Framework.Pickup) do
				if ITEM ~= nil or not PickupIsPickedUp(ITEM) then
					
					if AreaGetVisible() ~= CONTENT[6] then
						shared.gDetachableWeapon.Framework.Pickup[ITEM] = nil
					end
					
					for _, PED in {PedFindInAreaXYZ(0, 0, 0, 99999)} do
						if PedIsValid(PED) and PedIsInAreaXYZ(PED, CONTENT[3], CONTENT[4], CONTENT[5], 1.2) and PedMePlaying(PED, 'DEFAULT_KEY') then
							PickupDelete(ITEM)
							
							if PED == gPlayer then
								GiveAmmoToPlayer(CONTENT[1], CONTENT[2])
							else
								PedSetWeapon(PED, CONTENT[1], CONTENT[2])
							end
							
							shared.gDetachableWeapon.Framework.Pickup[ITEM] = nil
						end
					end
				else
					shared.gDetachableWeapon.Framework.Pickup[ITEM] = nil
				end
			end
			
			
			-----------
			-- # LOOT #
			-----------
			
			for PED, CONTENT in pairs(shared.gDetachableWeapon.Framework.Loot) do
				if PedIsValid(PED) then
					if CONTENT[1] then
						local PX, PY, PZ = PedGetPosXYZ(PED)
						
						if not CONTENT[3] then
							if not CONTENT[2] then
								if PedMePlaying(gPlayer, 'DEFAULT_KEY') and GetStickValue(16, 0) == 0 and GetStickValue(17, 0) == 0 and PedIsInAreaXYZ(gPlayer, PX, PY, PZ, 1) and not PedIsValid(PedGetTargetPed(gPlayer)) then
									if not CONTENT[4] then
										TutorialShowMessage('[Crouch] Look', -1, false)
										CONTENT[4] = true
									end
									
									if IsButtonBeingPressed(shared.gDetachableWeapon.IS_PC and 9 or 15, 0) then
										local X, Y, Z = PlayerGetPosXYZ()
										local SAFE = true
										
										for _, NPC in {PedFindInAreaXYZ(0, 0, 0, 999999)} do
											if PedIsValid(NPC) and NPC ~= gPlayer and NPC ~= PED and PedGetHealth(NPC) > 0 then
												local NX, NY, NZ = PedGetPosXYZ(NPC)
												
												if math.sqrt((X - NX)*(X - NX) + (Y - NY)*(Y - NY) + (Z - NZ)*(Z - NZ)) <= 5.0 then
													SAFE = false
													break
												end
											end
										end
										
										if SAFE then
											PedSetActionNode(gPlayer, '/Global/4_06/GuardDog/Planting', 'Act/Conv/4_06.act')
										else
											ExecuteActionNode(gPlayer, '/Global/Weapons/PickUpActions/PickupSnowball/PickupWeapon/PickupWeapon', 'Act/Weapons.act')
										end
										
										CONTENT[2] = true
									end
								else
									if CONTENT[4] then
										TutorialRemoveMessage()
										CONTENT[4] = false
									end
								end
							else
								if PedMePlaying(gPlayer, 'PickUpActions') or PedMePlaying(gPlayer, 'Planting') then
									if PedHasWeapon(gPlayer, 313) then
										PedDestroyWeapon(gPlayer, 313)
									end
								else
									local GOTHIT = PedMePlaying(gPlayer, 'HitTree')
									
									CONTENT[GOTHIT and 2 or 3] = not GOTHIT
								end
							end
						else
							local FACTION = PedGetFaction(PED)
							
							if math.random(0, 100) < ({[0] = 20, [1] = 60, [2] = 60, [3] = 40, [4] = 60, [5] = 30, [6] = 30, [7] = 20, [8] = 20, [9] = 10, [10] = 10, [11] = 40})[FACTION] then
								if not shared.gDetachableWeapon.LootItem then
									shared.gDetachableWeapon.LootItem = {
										[0] = {
											{CODE = 420, ITEM = false}, {CODE = 397, ITEM = false}, {CODE = 362, ITEM = true},
											{CODE = 357, ITEM = false}, {CODE = 504, ITEM = true}, {CODE = 310, ITEM = false},
										},
										
										[1] = {
											{CODE = 301, ITEM = false}, {CODE = 309, ITEM = false}, {CODE = 321, ITEM = false},
											{CODE = 349, ITEM = false}, {CODE = 358, ITEM = false}, {CODE = 310, ITEM = false},
											{CODE = 405, ITEM = false}, {CODE = 413, ITEM = false}, {CODE = 414, ITEM = false},
											{CODE = 415, ITEM = false}, {CODE = 416, ITEM = false}, {CODE = 421, ITEM = true},
											{CODE = 437, ITEM = false}, {CODE = 478, ITEM = true}, {CODE = 316, ITEM = true},
											{CODE = 308, ITEM = true},
										},
										
										[2] = {
											{CODE = 299, ITEM = false}, {CODE = 300, ITEM = false}, {CODE = 302, ITEM = false},
											{CODE = 314, ITEM = false}, {CODE = 317, ITEM = false}, {CODE = 323, ITEM = false},
											{CODE = 331, ITEM = false}, {CODE = 334, ITEM = false}, {CODE = 336, ITEM = false},
											{CODE = 348, ITEM = false}, {CODE = 349, ITEM = false}, {CODE = 357, ITEM = false},
											{CODE = 362, ITEM = true}, {CODE = 372, ITEM = false},
										},
										
										[3] = {
											{CODE = 299, ITEM = false}, {CODE = 300, ITEM = false}, {CODE = 301, ITEM = false},
											{CODE = 310, ITEM = false}, {CODE = 311, ITEM = false}, {CODE = 314, ITEM = false},
											{CODE = 317, ITEM = false}, {CODE = 321, ITEM = false}, {CODE = 336, ITEM = false},
											{CODE = 346, ITEM = false},
										},
										
										[4] = {
											{CODE = 299, ITEM = false}, {CODE = 300, ITEM = false}, {CODE = 301, ITEM = false},
											{CODE = 310, ITEM = false}, {CODE = 311, ITEM = false}, {CODE = 314, ITEM = false},
											{CODE = 317, ITEM = false}, {CODE = 321, ITEM = false}, {CODE = 336, ITEM = false},
											{CODE = 346, ITEM = false}, {CODE = 303, ITEM = false}, {CODE = 349, ITEM = false},
											{CODE = 357, ITEM = false}, {CODE = 418, ITEM = false}, {CODE = 430, ITEM = true},
										},
										
										[5] = {
											{CODE = 328, ITEM = false}, {CODE = 312, ITEM = false}, {CODE = 478, ITEM = true},
											{CODE = 426, ITEM = false}, {CODE = 359, ITEM = false}, {CODE = 358, ITEM = false},
											{CODE = 321, ITEM = false}, {CODE = 310, ITEM = false}, {CODE = 357, ITEM = false},
											{CODE = 355, ITEM = false}, {CODE = 338, ITEM = false}, {CODE = 397, ITEM = false},
										},
										
										[6] = {
											{CODE = 405, ITEM = false}, {CODE = 413, ITEM = false}, {CODE = 414, ITEM = false},
											{CODE = 415, ITEM = false}, {CODE = 416, ITEM = false}, {CODE = 475, ITEM = true},
											{CODE = 478, ITEM = true}, {CODE = 479, ITEM = true},
										},
										
										[7] = {
											{CODE = 420, ITEM = false}, {CODE = 397, ITEM = false}, {CODE = 362, ITEM = true},
											{CODE = 357, ITEM = false}, {CODE = 310, ITEM = false},
										},
										
										[8] = {
											{CODE = 438, ITEM = false}, {CODE = 426, ITEM = false}, {CODE = 328, ITEM = false},
											{CODE = 320, ITEM = false},
										},
										
										[9] = {
											{CODE = 438, ITEM = false}, {CODE = 426, ITEM = false}, {CODE = 328, ITEM = false},
											{CODE = 320, ITEM = false},
										},
										
										[10] = {
											{CODE = 438, ITEM = false}, {CODE = 426, ITEM = false}, {CODE = 328, ITEM = false},
											{CODE = 320, ITEM = false},
										},
										
										[11] = {
											{CODE = 299, ITEM = false}, {CODE = 300, ITEM = false}, {CODE = 301, ITEM = false},
											{CODE = 310, ITEM = false}, {CODE = 311, ITEM = false}, {CODE = 314, ITEM = false},
											{CODE = 317, ITEM = false}, {CODE = 321, ITEM = false}, {CODE = 336, ITEM = false},
											{CODE = 346, ITEM = false}, {CODE = 303, ITEM = false}, {CODE = 349, ITEM = false},
											{CODE = 357, ITEM = false}, {CODE = 418, ITEM = false},
										},
									}
								end
								
								if PedIsFemale(PED) and math.random(1, 5) == 3 then
									GiveItemToPlayer(515, 1)
								else
									local OBJ = shared.gDetachableWeapon.LootItem[FACTION][math.random(1, table.getn(shared.gDetachableWeapon.LootItem[FACTION]))]
									
									if OBJ.ITEM then
										ItemSetCurrentNum(OBJ.CODE, ItemGetCurrentNum(OBJ.CODE) + 1)
									else
										PedSetWeapon(gPlayer, OBJ.CODE, PedGetAmmoCount(gPlayer, ({[305] = 316, [396] = 316, [307] = 308})[OBJ.CODE] or OBJ.CODE) + math.random(1, (math.random(1, 2) == 1 and 8 or 4)))
									end
								end
							else
								PlayerAddMoney(({[0] = math.random(5, 15), [1] = math.random(2, 4), [2] = math.random(1, 3), [3] = math.random(1, 3), [4] = math.random(1, 3), [5] = math.random(3, 7), [6] = math.random(1, 2), [7] = math.random(10, 25), [8] = math.random(5, 15), [9] = math.random(10, 15), [10] = math.random(5, 15), [11] = math.random(1, 3)})[FACTION] * 100, true)
							end
							
							if CONTENT[4] then
								TutorialRemoveMessage()
								CONTENT[4] = false
							end
							
							CONTENT[1] = false
						end
					end
				else
					shared.gDetachableWeapon.Framework.Loot[PED] = nil
				end
			end
			
			
			-------------
			-- # DETACH #
			-------------
			
			for PED, CONTENT in pairs(shared.gDetachableWeapon.Framework.Detach) do
				if PedIsValid(PED) then
					if not CONTENT[4] then
						if not CONTENT[1] then
							CONTENT[1] = ({{PedGetHeading(PED), PedGetHeading(PED) * 1.5, {-0.5, 0, 1.2}}, {PedGetHeading(PED), PedGetHeading(PED) * 2, {-0.5, 0, 1.2}}, {PedGetHeading(PED), PedGetHeading(PED) / 1.5, {0.5, 0, 1.2}}, {PedGetHeading(PED), PedGetHeading(PED) / 2, {0.5, 0, 1.2}}})[math.random(1, 4)]
						end
						
						if CONTENT[1][2] then
							CONTENT[1][1] = (CONTENT[1][1] + CONTENT[1][2] > 3.05) and -CONTENT[1][1] + ((CONTENT[1][1] + CONTENT[1][2]) - 3.05) or (CONTENT[1][1] + CONTENT[1][2] > -3.22 and CONTENT[1][1] + ((CONTENT[1][1] + CONTENT[1][2]) - -3.22) or CONTENT[1][1] + CONTENT[1][2] + (CONTENT[1][1] > 0.01 and 0.08 or -0.08))
						end
						
						local PX, PY, PZ = PedGetOffsetInWorldCoords(PED, unpack(CONTENT[1][3]))
						if THROWABLE[CONTENT[2][1]] then
							_G['PedSetWeapon'..(PED == gPlayer and '' or 'Now')](PED, CONTENT[2][1], CONTENT[2][2] - 1, false)
						else
							PedDestroyWeapon(PED, CONTENT[2][1])
						end
						
						CONTENT[3] = CreateProjectile(CONTENT[2][1], PX, PY, PZ, -math.sin(CONTENT[1][1]) / 10, math.cos(CONTENT[1][1]) / 10, 0, 1)
						if PED == gPlayer then
							SoundPlay2D('ButtonUp')
						end
						
						CONTENT[4] = GetTimer() + 200
					else
						if CONTENT[4] < GetTimer() then
							local TX, TY, TZ = PedGetPosXYZ(PED)
							TX, TY = TX - math.sin(CONTENT[1][1]) * 2, TY + math.cos(CONTENT[1][1]) * 2
							local ITEM = PickupCreateXYZ(CONTENT[2][1], TX, TY, TZ)
							
							DestroyProjectile(CONTENT[3])
							
							shared.gDetachableWeapon.Framework.Pickup[ITEM] = {CONTENT[2][1], THROWABLE[CONTENT[2][1]] and 1 or CONTENT[2][2], TX, TY, TZ, AreaGetVisible()}
							shared.gDetachableWeapon.Framework.Detach[PED] = nil
						end
					end
				end
			end
			
			
			------------
			-- # DELAY #
			------------
			
			for PED, CONTENT in pairs(shared.gDetachableWeapon.Framework.Delay) do
				if PedIsValid(PED) and PedGetHealth(PED) > 0 then
					if CONTENT[1] then
						if CONTENT[2] < GetTimer() then
							shared.gDetachableWeapon.Framework.Delay[PED] = nil
						end
					else
						if PedMePlaying(PED, 'DEFAULT_KEY') then
							shared.gDetachableWeapon.Framework.Delay[PED] = nil
						end
					end
				else
					shared.gDetachableWeapon.Framework.Delay[PED] = nil
				end
			end
		end
	end
	
	shared.gDetachableWeapon_FrameworkThread = CreateThread('DETACHABLE_WEAPON_FRAMEWORK')
	
	
	--------------------
	-- # SHARED STORES #
	--------------------
	
	shared.gDetachableWeapon.Shop = {}
	
	_G.DETACHABLE_WEAPON_STORES = function()
		DATLoad('SP_GroceryStore.dat', 0)
		DATLoad('Store.DAT', 0)
		DATLoad('SwimRace.DAT', 2)
		
		DATInit()
		
		
		----------------------
		-- # INJECT NEW ITEM #
		----------------------
		
		if not shared.SHOP_ADD then
			shared.SHOP_ADD = _G.ShopAddItem
		end
		_G.ShopAddItem = function(ZERO, ID, POINT, STOCK, PRICE, FUNC, AMOUNT)
			shared.SHOP_ADD(ZERO, ID, POINT, STOCK, PRICE, FUNC, AMOUNT)
			
			if not shared.gDetachableWeapon.Shop.NewItem then
				shared.gDetachableWeapon.Shop.BuyItem = function(ITEM)
					local STORE = {
						[303] = {GiveWeaponToPlayer, {ITEM}},
						[306] = {GiveWeaponToPlayer, {ITEM}},
						[316] = {ItemSetCurrentNum, {ITEM, 10}},
						[372] = {PedSetWeapon, {gPlayer, ITEM, 1}},
					}
					
					if STORE[ITEM] then
						if ITEM == 316 and ItemGetCurrentNum(305) == 0 then
							GiveWeaponToPlayer(307, false)
						end
						
						STORE[ITEM][1](unpack(STORE[ITEM][2]))
					end
				end
				
				shared.gDetachableWeapon.Shop.NewItem = {
					[394] = {0, 303, POINTLIST._STORE_DT_COMIC_ITEM2, IsMissionCompleated('1_04') and 3 or 0, 700, shared.gDetachableWeapon.Shop.BuyItem, 1},
					[309] = {
						{0, 306, POINTLIST._STORE_DT_COMIC_ITEM4, IsMissionCompleated('1_09') and 3 or 0, 1400, shared.gDetachableWeapon.Shop.BuyItem, 1},
						{0, 316, POINTLIST._STORE_DT_COMIC_ITEM5, IsMissionCompleated('4_02') and 5 or 0, 250, shared.gDetachableWeapon.Shop.BuyItem, 10},
						{0, 372, POINTLIST._STORE_DT_COMIC_ITEM6, 100, 50, shared.gDetachableWeapon.Shop.BuyItem, 1},
					},
				}
			end
			
			if shared.gDetachableWeapon.Shop.NewItem[ID] then
				if type(shared.gDetachableWeapon.Shop.NewItem[ID][1]) == 'table' then
					for _, CONTENT in ipairs(shared.gDetachableWeapon.Shop.NewItem[ID]) do
						shared.SHOP_ADD(unpack(CONTENT))
					end
				else
					shared.SHOP_ADD(unpack(shared.gDetachableWeapon.Shop.NewItem[ID]))
				end
			end
		end
		
		
		-------------------------
		-- # SHARED CAMERA HACK #
		-------------------------
		
		if not shared.CAMERA_FADE then
			shared.CAMERA_FADE = _G.CameraFade
		end
		_G.CameraFade = function(MS, F)
			if F == 1 then
				if not shared.gDetachableWeapon.Shop.CameraHold then
					shared.CAMERA_FADE(MS, F)
				end
			else
				shared.CAMERA_FADE(MS, F)
			end
		end
		
		
		------------------------------
		-- # SHOP SIGN, DOOR, & TIME #
		------------------------------
		
		shared.gDetachableWeapon.Shop.Firework_BT = {}
		shared.gDetachableWeapon.Shop.Firework_BT[2], shared.gDetachableWeapon.Shop.Firework_BT[3] = CreatePersistentEntity('DPE_BSignFireWrks', 501.2, -85.4, 4.4, 100, 0)
		
		shared.gDetachableWeapon.Shop.Firework_NC = {}
		shared.gDetachableWeapon.Shop.Firework_NC[2], shared.gDetachableWeapon.Shop.Firework_NC[3] = CreatePersistentEntity('DPE_BSignFireWrks', 508.4, -265.7, 2.3, 0, 0)
		
		local DOOR = {
			[1] = {nil, nil},
			[2] = {nil, nil},
		}
		
		local HOUR, MINUTE
		
		
		--------------------
		-- # PED EXCEPTION #
		--------------------
		
		local IS_EXCEPTION = function(PED)
			local LEADER = gPlayer
			while PedHasAllyFollower(LEADER) do
				LEADER = PedGetAllyFollower(LEADER)
				
				if LEADER == PED then
					return false
				end
			end
			
			return true
		end
		
		
		-----------------
		-- # STORE LOOP #
		-----------------
		
		while true do
			Wait(0)
			
			HOUR, MINUTE = ClockGet()
			
			
			------------------------
			-- # CAM STORE SETTING #
			------------------------
			
			if not shared.gDetachableWeapon.Shop.ForceClose then
				DOOR[1][1] = (HOUR >= 9 and HOUR < 21) and true or false
			else
				DOOR[1][1] = false
			end
			
			for _, CODE in ipairs({'DT_tbusiness_Recorddoor', 'icecream'}) do
				AreaSetDoorLocked(CODE, not DOOR[1][1])
				AreaSetDoorLockedToPeds(CODE, not DOOR[1][1])
				AreaSetDoorPathableToPeds(CODE, DOOR[1][1])
			end
			
			if DOOR[1][1] then
				if not shared.gDetachableWeapon.Shop.Camera_BT then
					shared.gDetachableWeapon.Shop.Camera_BT = BlipAddXYZ(570.47, -136.08, 5.86, 10)
					shared.gDetachableWeapon.Shop.Camera_OBV = BlipAddXYZ(347.89, 289.46, 7.23, 10)
					
					BlipSetShortRanged(shared.gDetachableWeapon.Shop.Camera_BT, true)
					BlipSetShortRanged(shared.gDetachableWeapon.Shop.Camera_OBV, true)
				end
				
				if (PedIsInAreaXYZ(gPlayer, 570.47, -136.08, 5.86, 3) or PedIsInAreaXYZ(gPlayer, 347.89, 289.46, 7.23, 3)) and PedIsPlaying(gPlayer, '/Global/Door/PedPropsActions', true) and not DOOR[1][2] then
					Wait(750)
					CameraFade(250, 0)
					
					Wait(251)
					DOOR[1][2] = PedIsInAreaXYZ(gPlayer, 570.47, -136.08, 5.86, 3) and 1 or 2
					
					shared.gDetachableWeapon.Shop.CameraHold = true
					AreaTransitionXYZ(26, -573.34, 388.58, 0.3, true)
				end
			else
				if shared.gDetachableWeapon.Shop.Camera_BT then
					BlipRemove(shared.gDetachableWeapon.Shop.Camera_BT)
					BlipRemove(shared.gDetachableWeapon.Shop.Camera_OBV)
					
					shared.gDetachableWeapon.Shop.Camera_BT = nil
					shared.gDetachableWeapon.Shop.Camera_OBV = nil
				end
			end
			
			
			-------------------------
			-- # FIRE STORE SETTING #
			-------------------------
			
			if not shared.gDetachableWeapon.Shop.ForceClose then
				DOOR[2][1] = (HOUR >= 9 and HOUR < 23) and true or false
			else
				DOOR[2][1] = false
			end
			
			for _, CODE in ipairs({'DT_tbusines_FirewShopDoor', 'DT_tbusiness_FirewBusDoor'}) do
				AreaSetDoorLocked(CODE, not DOOR[2][1])
				AreaSetDoorLockedToPeds(CODE, not DOOR[2][1])
				AreaSetDoorPathableToPeds(CODE, DOOR[2][1])
			end
			
			if DOOR[2][1] then
				if not shared.gDetachableWeapon.Shop.Firework_BT[1] then
					shared.gDetachableWeapon.Shop.Firework_BT[1] = BlipAddXYZ(499.5, -79.6, 4.8, 10)
					shared.gDetachableWeapon.Shop.Firework_NC[1] = BlipAddXYZ(511.6, -264.3, 2.9, 10)
					
					BlipSetShortRanged(shared.gDetachableWeapon.Shop.Firework_BT[1], true)
					BlipSetShortRanged(shared.gDetachableWeapon.Shop.Firework_NC[1], true)
				end
				
				if AreaGetVisible() ~= 0 then
					if PAnimIsDestroyed(shared.gDetachableWeapon.Shop.Firework_BT[2], shared.gDetachableWeapon.Shop.Firework_BT[3]) then
						shared.gDetachableWeapon.Shop.Firework_BT[2], shared.gDetachableWeapon.Shop.Firework_BT[3] = CreatePersistentEntity('DPE_BSignFireWrks', 501.2, -85.4, 4.4, 100, 0)
					end
					
					if PAnimIsDestroyed(shared.gDetachableWeapon.Shop.Firework_NC[2], shared.gDetachableWeapon.Shop.Firework_NC[3]) then
						shared.gDetachableWeapon.Shop.Firework_NC[2], shared.gDetachableWeapon.Shop.Firework_NC[3] = CreatePersistentEntity('DPE_BSignFireWrks', 508.4, -265.7, 2.3, 0, 0)
					end
				end
				
				if (PedIsInAreaXYZ(gPlayer, 499.5, -79.6, 4.8, 4) or PedIsInAreaXYZ(gPlayer, 511.6, -264.3, 2.9, 4)) and PedIsPlaying(gPlayer, '/Global/Door/PedPropsActions', true) and not DOOR[2][2] then
					Wait(750)
					CameraFade(250, 0)
					
					Wait(251)
					DOOR[2][2] = PedIsInAreaXYZ(gPlayer, 499.5, -79.6, 4.8, 4) and 1 or 2
					
					shared.gDetachableWeapon.Shop.CameraHold = true
					AreaTransitionXYZ(26, -573.34, 388.58, 0.3, true)
				end
			else
				if shared.gDetachableWeapon.Shop.Firework_BT[1] then
					BlipRemove(shared.gDetachableWeapon.Shop.Firework_BT[1])
					BlipRemove(shared.gDetachableWeapon.Shop.Firework_NC[1])
					
					shared.gDetachableWeapon.Shop.Firework_BT[1] = nil
					shared.gDetachableWeapon.Shop.Firework_NC[1] = nil
				end
			end
			
			
			---------------
			-- # SHOPPING #
			---------------
			
			if (DOOR[1][2] or DOOR[2][2]) and AreaGetVisible() == 26 then
				for _, PROPERTY in ipairs({'Gstore_int12', 'Gstore_int12b', 'DCL_GroceryShdw01', 'DCL_GroceryShdw02'}) do
					local ID, POOL = PAnimGetPoolIndex(PROPERTY, -573.34, 388.58, 0.3, 7)
					
					PAnimFollowPath(ID, POOL, PATH._SWIMRACE_TEST_PATH, false)
					PAnimSetPathFollowSpeed(ID, POOL, 3.5)
				end
				
				ShopEnd()
				
				ShopSetShopKeepInfo(DOOR[1][2] and 152 or 103, POINTLIST._STORE_DT_GENERAL_CLERK)
				
				if DOOR[1][2] then
					ShopAddItem(0, 426, POINTLIST._STORE_DT_GENERAL_ITEM1, IsMissionCompleated('1_S01') and 1 or 0, 4000, GiveWeaponToPlayer, 1)
					ShopAddItem(0, 328, POINTLIST._STORE_DT_GENERAL_ITEM3, IsMissionCompleated('1_S01') and 1 or 0, 1500, GiveWeaponToPlayer, 1)
					ShopAddItem(0, 437, POINTLIST._STORE_DT_GENERAL_ITEM5, IsMissionCompleated('1_07') and 1 or 0, 3500, GiveWeaponToPlayer, 1)
				else
					if not shared.gDetachableWeapon.Shop.FireStoreBuy then
						shared.gDetachableWeapon.Shop.FireStoreBuy = function(ITEM)
							local CONTENT = {
								[301] = {GiveAmmoToPlayer, {301, 5}},
								[308] = {GiveAmmoToPlayer, {308, 12}},
								[397] = {PedSetWeapon, {gPlayer, 397}},
								[400] = {PedSetWeapon, {gPlayer, 400}},
							}
							
							if CONTENT[ITEM] then
								if ITEM == 308 and ItemGetCurrentNum(307) == 0 then
									GiveWeaponToPlayer(307, false)
								end
								
								CONTENT[ITEM][1](unpack(CONTENT[ITEM][2]))
							end
						end
					end
					
					ShopAddItem(0, 301, POINTLIST._STORE_DT_GENERAL_ITEM1, 3, 400, shared.gDetachableWeapon.Shop.FireStoreBuy, 5)
					ShopAddItem(0, 308, POINTLIST._STORE_DT_GENERAL_ITEM3, (IsMissionCompleated('3_R09_N') or IsMissionCompleated('4_02')) and 5 or 0, 500, shared.gDetachableWeapon.Shop.FireStoreBuy, 12)
					ShopAddItem(0, 397, POINTLIST._STORE_DT_GENERAL_ITEM5, 1, 250, shared.gDetachableWeapon.Shop.FireStoreBuy, 1)
					ShopAddItem(0, 400, POINTLIST._STORE_DT_GENERAL_ITEM7, 1, 300, shared.gDetachableWeapon.Shop.FireStoreBuy, 1)
				end
				
				ShopSetCameraPos(POINTLIST._STORE_DT_GENERAL_CAMERA)
				ShopSetCameraAngleOffset(8)
				ShopSetCameraZoomPercentage(0.5)
				ShopSetPlayerPos(POINTLIST._STORE_DT_GENERAL_CUSTOMER)
				ConversationMovePeds(false)
				ShopSetConversationTree('Act/Conv/DTGeneral.act', 'DTGeneral', 'Cancel', 'Purchase', 'Broke', 'NoRoom', 'Browse', 103)
				
				ShopStart()
				
				for _, PED in {PedFindInAreaXYZ(0, 0, 0, 99999)} do
					if PedIsValid(PED) and PED ~= gPlayer and (PedIsModel(PED, 89) or PedIsModel(PED, 156)) and IS_EXCEPTION(PED) then
						local PX, PY, PZ = PedGetPosXYZ(PED)
						PedSwapModel(PED, DOOR[1][2] and 'TO_Record' or 'TO_FireOwner')
						PedSetPosXYZ(PED, PX, PY, PZ)
					end
				end
				
				SoundStopAmbiences()
				SoundPlayStream(DOOR[1][2] and 'E_JanitorRoomMX.rsm' or 'E_HQMX_Dropouts.rsm', 0.3)
				
				local T = GetTimer()
				while T + 2000 > GetTimer() do
					Wait(0)
				end
				
				shared.gDetachableWeapon.Shop.CameraHold = false
				
				MissionTimerPause(true)
				shared.playerShopping = true
				HUDSaveVisibility()
				HUDClearAllElements()
				ToggleHUDComponentLocked(40, true)
				ToggleHUDComponentVisibility(42, true)
				PedStartConversation('DTGeneral', 'Act/Conv/DTGeneral.act', gPlayer, shared.vendettaClerk)
				ConversationMovePeds(false)
				TextPrintString('', 1, 2)
				
				CameraFade(500, 1)
				
				while not IsButtonBeingPressed(8, 0) do
					Wait(0)
				end
				
				CameraFade(0, 0)
				Wait(100)
				
				SoundStopStream()
				SoundStopInteractiveStream()
				
				ToggleHUDComponentLocked(40, false)
				ToggleHUDComponentVisibility(42, false)
				MissionTimerPause(false)
				HUDRestoreVisibility()
				shared.playerShopping = false
				
				if not shared.gDetachableWeapon.Shop.ExitLoc then
					shared.gDetachableWeapon.Shop.ExitLoc = {
						[1] = {
							[1] = {{0, 569.85, -131.73, 5.81, true}, {gPlayer, 569.57, -129.47, 5.56}},
							[2] = {{0, 348.45, 294.88, 7.25, true}, {gPlayer, 348.45, 298.52, 7.16}},
						},
						[2] = {
							[1] = {{0, 498.9, -84.3, 4.8, true}, {gPlayer, 498.9, -86.3, 4.8}},
							[2] = {{0, 507.2, -263.7, 2.3, true}, {gPlayer, 505.2, -263.7, 2.3}},
						}
					}
				end
				
				AreaTransitionXYZ(unpack(shared.gDetachableWeapon.Shop.ExitLoc[DOOR[1][2] and 1 or 2][DOOR[1][2] and DOOR[1][2] or DOOR[2][2]][1]))
				PedFaceXYZ(unpack(shared.gDetachableWeapon.Shop.ExitLoc[DOOR[1][2] and 1 or 2][DOOR[1][2] and DOOR[1][2] or DOOR[2][2]][2]))
				
				Wait(400)
				CameraReturnToPlayer()
				
				Wait(100)
				CameraFade(500, 1)
				
				DOOR[DOOR[1][2] and 1 or 2][2] = nil
			end
		end
	end
	
	shared.gDetachableWeapon_StoresThread = CreateThread('DETACHABLE_WEAPON_STORES')
	
	
	--------------------
	-- # SHARED BUSTED #
	--------------------
	
	if not shared.STAT_ADD then
		shared.STAT_ADD = _G.StatAddToInt
	end
	_G.StatAddToInt = function(STAT)
		if STAT == 3 then
			for _, SLINGSHOT in ipairs({303, 306}) do
				PedDestroyWeapon(gPlayer, SLINGSHOT)
			end
		end
		
		shared.STAT_ADD(STAT)
	end
	
	
	----------------
	-- # LOCAL ENV #
	----------------
	
	local TARGET, X, Y, Z
	local PROCEED = {nil, nil, nil}
	
	local POSE = {
		'/Global/HitTree/Standing/Ranged/RBandBall/Front/RBandBall',
		'/Global/HitTree/Standing/Ranged/RBandBall/Rear/RBandBall',
		'/Global/HitTree/Standing/Ranged/Marbles/HIT_LEG_FRONT_L_FALL',
		'/Global/HitTree/Standing/Ranged/Marbles/HIT_LEG_FRONT_R_FALL',
		'/Global/HitTree/Standing/Melee/Generic/Body/BODYSHOTUP/Front/Front',
		'/Global/HitTree/Standing/Melee/Generic/Body/BODYSHOTUP/Rear/Rear',
	}
	
	local WEAPON = {
		[-1] = true, 
		[328] = true, 
		[426] = true,
		[420] = true, 
		[301] = true, 
		[303] = true,
		[306] = true, 
		[305] = true, 
		[396] = true,
		[307] = true, 
		[309] = true, 
		[394] = true,
		[312] = true, 
		[349] = true, 
		[320] = true,
		[321] = true,
		[437] = true, 
		[325] = true,
	}
	local AMMO = {
		[305] = 316, 
		[396] = 316, 
		[307] = 308,
	}
	
	local DATABASE = {}
	
	
	----------------
	-- # MAIN LOOP #
	----------------
	
	while true do
		Wait(0)
		
		TARGET, X, Y, Z = PedGetTargetPed(gPlayer), PlayerGetPosXYZ()
		
		for _, PED in {PedFindInAreaXYZ(0, 0, 0, 999999)} do
			if PedIsValid(PED) then
				if PED ~= gPlayer then
					
					-- LOOT
					if PedIsDead(PED) and not shared.gDetachableWeapon.Framework.Loot[PED] then
						shared.gDetachableWeapon.Framework.Loot[PED] = {math.random(0, 100) < ({[0] = 100, [1] = 70, [2] = 50, [3] = 40, [4] = 40, [5] = 50, [6] = 70, [7] = 100, [8] = 100, [9] = 100, [10] = 100, [11] = 40, [12] = 0, [13] = 0})[PedGetFaction(PED)], false, false, false}
					end
					
					-- STEAL ( NPC vs NPC )
					if PedMePlaying(PED, 'WeaponSteal') and not PedMePlaying(PED, 'Give') and not PedMePlaying(PED, 'Rcv') and not shared.gDetachableWeapon.Framework.Steal[PED] then
						PROCEED[1] = true
						
						for NPC, CONTENT in pairs(shared.gDetachableWeapon.Framework.Steal) do
							if PedIsValid(NPC) and CONTENT[6] == PED then
								PROCEED[1] = false
							end
						end
						
						if PROCEED[1] then
							shared.gDetachableWeapon.Framework.Steal[PED] = {-1, -1, GetTimer() + (PedGetGrappleTargetPed(PED) == gPlayer and 750 or math.random(1000, 1500)), PedGetGrappleTargetPed(PED), false, false, false}
						end
					end
				end
				
				-- DETECT
				if PedMePlaying(PED, 'DEFAULT_KEY') then
					if PedGetWeapon(PED) ~= 325 and PedGetWeapon(PED) ~= 437 and WEAPON[PedGetWeapon(PED)] then
						if type(DATABASE[PED]) == 'table' then
							if PedGetWeapon(PED) ~= DATABASE[PED][1] or PedGetAmmoCount(PED, AMMO[PedGetWeapon(PED)] or PedGetWeapon(PED)) ~= DATABASE[PED][2] then
								DATABASE[PED] = {PedGetWeapon(PED), PedGetAmmoCount(PED, AMMO[PedGetWeapon(PED)] or PedGetWeapon(PED))}
							end
						else
							DATABASE[PED] = {PedGetWeapon(PED), PedGetAmmoCount(PED, AMMO[PedGetWeapon(PED)] or PedGetWeapon(PED))}
						end
					else
						if type(DATABASE[PED]) == 'table' then
							DATABASE[PED] = nil
						end
					end
				end
				
				-- STEAL ( NPC vs PLAYER )
				PROCEED[2] = true
				
				for ID = 1, 5 do
					if MissionActiveSpecific('C_WRESTLING_'..ID) or MissionActiveSpecific('1_02') then
						PROCEED[2] = false
						break
					end
				end
				
				if PROCEED[2] then
					if PedIsPlaying(PED, '/Global/Actions/Grapples/Front/Grapples/GrappleAttempt/GrappleSuccess/Rcv', true) then
						local GUY = PedGetGrappleTargetPed(PED)
						
						if (GUY == gPlayer or GameGetPedStat(GUY, 17) == 2 or math.random(1, 5) == 3) and DATABASE[PED] and DATABASE[PED][1] ~= -1 and not shared.gDetachableWeapon.Framework.Steal[GUY] then
							PedSetWeaponNow(PED, DATABASE[PED][1], DATABASE[PED][2], false)
							PedSetActionNode(GUY, '/Global/Actions/Grapples/Front/Grapples/GrappleMoves/WeaponSteal', 'Act/Globals.act')
							
							shared.gDetachableWeapon.Framework.Steal[GUY] = {DATABASE[PED][1], DATABASE[PED][2], GetTimer() + ((GUY == gPlayer or PED == gPlayer) and ({['Small'] = 2500, ['Medium'] = 1000, ['Fat'] = 1000, ['Large'] = 500, ['Huge'] = 200})[shared.gDetachableWeapon.Function.GetSize(shared.gDetachableWeapon.Function.GetID(PED))] or math.random(1000, 1500)), PED, false, false, true}
						end
					end
				end
				
				-- FORCE DETACH
				if not PedHasWeapon(PED, -1) and PedGetWeapon(PED) ~= 437 and WEAPON[PedGetWeapon(PED)] and PedMePlaying(PED, 'HitTree') then
					PROCEED[3] = false
					
					for _, NODE in ipairs(POSE) do
						if PedIsPlaying(PED, NODE, true) then
							PROCEED[3] = true
							break
						end
					end
					
					if PROCEED[3] and PedGetHealth(PED) > 0 and not shared.gDetachableWeapon.Framework.Detach[PED] and not shared.gDetachableWeapon.Framework.Delay[PED] then
						shared.gDetachableWeapon.Framework.Detach[PED] = {nil, {PedGetWeapon(PED), PedGetAmmoCount(PED, AMMO[PedGetWeapon(PED)] or PedGetWeapon(PED))}, nil, nil}
						shared.gDetachableWeapon.Framework.Delay[PED] = {false}
					end
				end
			end
		end
		
		-- MANUAL DETACH
		if not PedHasWeapon(gPlayer, -1) and PedGetWeapon(gPlayer) ~= 437 and WEAPON[PedGetWeapon(gPlayer)] and not PedIsValid(TARGET) and (PedMePlaying(gPlayer, 'DEFAULT_KEY') or PedMePlaying(gPlayer, 'JUMP')) then
			if IsButtonHeld(8, 0) then
				if DETACH_WEAPON_TIMER + 2000 < GetTimer() then
					shared.gDetachableWeapon.Framework.Detach[gPlayer] = {{PedGetHeading(gPlayer), nil, {0, 0.5, 1.2}, {0, 2, 0.4}}, {PedGetWeapon(gPlayer), PedGetAmmoCount(gPlayer, AMMO[PedGetWeapon(gPlayer)] or PedGetWeapon(gPlayer))}, nil, nil}
					DETACH_WEAPON_TIMER = GetTimer()
				end
			else
				DETACH_WEAPON_TIMER = GetTimer()
			end
		else
			DETACH_WEAPON_TIMER = GetTimer()
		end
		
		-- PLAYER KNOCKED OUT
		if PlayerGetHealth() > 0 then
			if shared.gDetachableWeapon.KnockedOut_LOOTED then
				shared.gDetachableWeapon.KnockedOut_LOOTED = nil
			end
		else
			if PedMePlaying(gPlayer, 'Dead') and PedMePlaying(gPlayer, 'KOReactions') and not PedGetFlag(gPlayer, 58) then
				if not shared.gDetachableWeapon.KnockedOut_ITEM then
					shared.gDetachableWeapon.KnockedOut_ITEM = {
						328, 426, 420, 301,
						303, 306, 305, 396,
						307, 309, 394, 312,
						321, 349, 320, 437,
					}
				end
				
				if not shared.gDetachableWeapon.KnockedOut_LOOTED then
					for _, ITEM in ipairs(shared.gDetachableWeapon.KnockedOut_ITEM) do
						if ItemGetCurrentNum(ITEM) ~= 0 and math.random(1, 100) <= 25 then
							if ({[301] = true, [309] = true, [312] = true, [320] = true, [349] = true, [394] = true})[ITEM] then
								local AMOUNT = math.random(1, 10)
								ItemSetCurrentNum(ITEM, ItemGetCurrentNum(ITEM) - AMOUNT < 0 and 0 or ItemGetCurrentNum(ITEM) - AMOUNT)
							else
								PedDestroyWeapon(gPlayer, ITEM)
							end
						end
					end
				
					shared.gDetachableWeapon.KnockedOut_LOOTED = true
				end
			end
		end
	end
end

shared.gDetachableWeapon_MainThread = CreateThread('DETACHABLE_WEAPON_MAIN')
