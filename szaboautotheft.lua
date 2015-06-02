<<<<<<< HEAD
local szaboautotheft = {}

--configs
local wantedlevelforstealing = 2
local disablemodkey = 107
local modenabled = true

--		KEY CODES
--
--	Space = 32            D4 = 52       O = 79             NumPad4 = 100         F9 = 120
--  PageUp = 33           D5 = 53       P = 80             NumPad5 = 101         F10 = 121
--	Next = 34             D6 = 54       Q = 81             NumPad6 = 102         F11 = 122
--  End = 35              D7 = 55       R = 82             NumPad7 = 103         F12 = 123
--	Home = 36             D8 = 56       S = 83             NumPad8 = 104         F13 = 124
--  Left = 37             D9 = 57       T = 84             NumPad9 = 105         F14 = 125
--	Up = 38               A = 65        U = 85             Multiply = 106        F15 = 126
--  Right = 39            B = 66        V = 86             Add = 107             F16 = 127
--	Down = 40             C = 67        W = 87             Separator = 108       F17 = 128
--  Select = 41           D = 68        X = 88             Subtract = 109        F18 = 129
--  Print = 42            E = 69        Y = 89             Decimal = 110         F19 = 130
--	Execute = 43          F = 70        Z = 90             Divide = 111          F20 = 131
--  PrintScreen = 44      G = 71        LWin = 91          F1 = 112              F21 = 132
--	Insert = 45           H = 72        RWin = 92          F2 = 113              F22 = 133
--  Delete = 46           I = 73        Apps = 93          F3 = 114              F23 = 134
--	Help = 47             J = 74        Sleep = 95         F4 = 115              F24 = 135
--  D0 = 48               K = 75        NumPad0 = 96       F5 = 116            
--	D1 = 49               L = 76        NumPad1 = 97       F6 = 117            
--  D2 = 50               M = 77        NumPad2 = 98       F7 = 118            
--	D3 = 51               N = 78        NumPad3 = 99       F8 = 119   
--end configs

local texttimer = 100
local texttoshow = "Szabo's Auto Theft Mod"
local function showtext5(str)
	texttimer = 300
	texttoshow = str
end

local function drawtext5()
	UI.SET_TEXT_FONT(0)
	UI.SET_TEXT_SCALE(0.5, 0.6)
	UI.SET_TEXT_COLOUR(255, 0, 0, 255)
	UI.SET_TEXT_WRAP(0, 1)
	UI.SET_TEXT_CENTRE(true)
	UI.SET_TEXT_DROPSHADOW(15, 15, 0, 0, 0)
	UI.SET_TEXT_EDGE(5, 0, 0, 0, 255)
	UI._SET_TEXT_ENTRY("STRING")
	UI._ADD_TEXT_COMPONENT_STRING(texttoshow)
	UI._DRAW_TEXT(0.5, 0.1)
	texttimer = texttimer-1
end

local function szclamp(val, xmin, xmax)
	if (val < xmin) then
		return xmin
	elseif (val > xmax) then
		return xmax
	else
		return val
	end
end

local function addmoneytoplayer(val)

	mhash = GAMEPLAY.GET_HASH_KEY("SP0_TOTAL_CASH")
	if (PED.IS_PED_MODEL(PLAYER.PLAYER_PED_ID(), GAMEPLAY.GET_HASH_KEY("player_one"))) then                                
		mhash = GAMEPLAY.GET_HASH_KEY("SP1_TOTAL_CASH")                                     
	elseif (PED.IS_PED_MODEL(PLAYER.PLAYER_PED_ID(), GAMEPLAY.GET_HASH_KEY("player_two"))) then
		mhash = GAMEPLAY.GET_HASH_KEY("SP2_TOTAL_CASH")  
	end
	
	local _, curval = STATS.STAT_GET_INT(mhash, 0, -1)
	STATS.STAT_SET_INT(mhash, curval+val, true)
		
end

local carslist = {
--expensive cars
{0xB779A091,	600000	},--adder
{0x9AE6DDA1,	93000	},--bullet
{0x7B8AB45F,	117000	},--carboniz
{0xB1D95DA0,	390000	},--cheetah
{0x13B57D8A,	111000	},--cogcabri
{0xB2FE5CF9,	477000	},--entityxf
{0xFFB15B5E,	123000	},--exemplar
{0xDCBCBE48,	111000	},--f620
{0x8911B9F5,	87000	},--feltzer?
{0xBC32A33B,	99000	},--fq2?
{0x18F25AC7,	264000	},--infernus
{0x3EAB5555,	285000	},--jb700
{0xE62B361B,	294000	},--monroe
{0x3D8FA25C,	72000	},--ninef
{0xA8E38B01,	72000	},--ninef2
{0x8CB29A14,	79000	},--rapidgt
{0x679450AF,	84000	},--rapidgt2
{0x5C23AF9B,	600000	},--stinger
{0x82E499FA,	660000	},--stingergt
{0x42F2ED16,	150000	},--superd
{0x142E0DC3,	144000	},--vacca
{0x9F4B77BE,	90000	},--voltic
{0x2D3BD401,	2000000	}--ztype
=======
-- Auto Theft script
-- Original by szabo, rewritten by laxu
-- Spawns a vehicle or cargo vehicle that can be delivered and sold to Los Santos Customs
-- Version 1.1

local szaboAutoTheft = {}

local carsList = {
-- Expensive cars
    {0xB779A091,    600000  },--adder
    {0x9AE6DDA1,    93000   },--bullet
    {0x7B8AB45F,    117000  },--carboniz
    {0xB1D95DA0,    390000  },--cheetah
    {0x13B57D8A,    111000  },--cogcabri
    {0xB2FE5CF9,    477000  },--entityxf
    {0xFFB15B5E,    123000  },--exemplar
    {0xDCBCBE48,    111000  },--f620
    {0x8911B9F5,    87000   },--feltzer?
    {0xBC32A33B,    99000   },--fq2?
    {0x18F25AC7,    264000  },--infernus
    {0x3EAB5555,    285000  },--jb700
    {0xE62B361B,    294000  },--monroe
    {0x3D8FA25C,    72000   },--ninef
    {0xA8E38B01,    72000   },--ninef2
    {0x8CB29A14,    79000   },--rapidgt
    {0x679450AF,    84000   },--rapidgt2
    {0x5C23AF9B,    600000  },--stinger
    {0x82E499FA,    660000  },--stingergt
    {0x42F2ED16,    150000  },--superd
    {0x142E0DC3,    144000  },--vacca
    {0x9F4B77BE,    90000   },--voltic
    {0x2D3BD401,    2000000 } --ztype
>>>>>>> c7e4e228995bc9ae6b05ddc43a63d2fec70d5464
}

local cargoLowVal = {
-- Cargo lvl 1: 50k - 300k
    0xAFBB2CA4,
    0xC9E8FF76,
    0x98171BD3,
    0x353B561D,
    0xF8DE29A8,
    0x38408341,
    0x4543B74D,
    0x961AFEF7,
    0xCFB3870C,
    0x2B6DC64A,
    0x03E5F6B8
}

local cargoMedVal = {
-- Cargo lvl 2: 300k-2m
    0x7DE35E7D,
    0x7A61B330,
    0xF21B33BE,
    0x07405E08,
    0x35ED670B,
    0xC1632BEB
}

local cargoHighVal = {
-- Cargo lvl 3 (stockade): 2-5m
    0x6827CF72
}

local carPeds = {
    0xBE086EFD, --  A_F_M_BevHills_01
    0xA039335F, --  A_F_M_BevHills_02
    -- 0x3BD99114,  --  A_F_M_BodyBuild_01
    -- 0x1FC37DBC,  --  A_F_M_Business_02
    0x654AD86E, --  A_F_M_Downtown_01
    0x445AC854, --  A_F_Y_BevHills_01
    0x5C2CF7F8, --  A_F_Y_BevHills_02
    -- 0x20C8012F,  --  A_F_Y_BevHills_03
    -- 0x36DF2D5D,  --  A_F_Y_BevHills_04
    -- 0x2799EFD8,  --  A_F_Y_Business_01
    -- 0x31430342,  --  A_F_Y_Business_02
    0xAE86FDB4, --  A_F_Y_Business_03
    0xB7C61032, --  A_F_Y_Business_04
    -- 0x563B8570,  --  A_F_Y_Tourist_01
    -- 0x9123FB40,  --  A_F_Y_Tourist_02
    0x19F41F65, --  A_F_Y_Vinewood_01
    0xDAB6A0EB, --  A_F_Y_Vinewood_02
    0x379DDAB8, --  A_F_Y_Vinewood_03
    0xFAE46146, --  A_F_Y_Vinewood_04
    0xC99F21C4, --  A_M_Y_Business_01
    0xB3B3F5E6, --  A_M_Y_Business_02
    0xA1435105, --  A_M_Y_Business_03
    0x4B64199D, --  A_M_Y_Vinewood_01
    0x5D15BD00, --  A_M_Y_Vinewood_02
    0x1FDF4294, --  A_M_Y_Vinewood_03
    0x31C9E669, --  A_M_Y_Vinewood_04
    0x54DBEE1F, --  A_M_M_BevHills_01
    0x3FB5C3D3, --  A_M_M_BevHills_02
    0x7E6A64B7, --  A_M_M_Business_01
}

local cargoPeds = {
    0x59511A6C, --  S_M_M_Trucker_01
    -- 0xF5B0079D,  --  A_F_Y_EastSA_01
    -- 0x0438A4AE,  --  A_F_Y_EastSA_02
    -- 0x51C03FA4,  --  A_F_Y_EastSA_03
    0xF9A6F53F, --  A_M_M_EastSA_01
    0x07DD91AC, --  A_M_M_EastSA_02
    0xA4471173, --  A_M_Y_EastSA_01
    0x168775F6  --  A_M_Y_EastSA_02
}

local cargoHighValPeds = {
    0xD768B228, --  S_M_M_Security_01
    0x95C76ECD, --  S_M_M_Armoured_01
    0x63858A4A  --  S_M_M_Armoured_02
}

local weapons = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_ASSAULTSMG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_CARBINERIFLE",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_STUNGUN",
    -- "WEAPON_GRENADELAUNCHER",
    -- "WEAPON_RPG",
    "WEAPON_MINIGUN",
    -- "WEAPON_GRENADE"
}

local textTimer = 0
local textToShow = ""

local target = 0
<<<<<<< HEAD
local payment = 0
local pedslist = {}
local lscblip = 0
local waittime = 0
local stealtrigger = false
-- local jacktrigger = false

local function deletev()
	for _,v in ipairs(pedslist) do
		ENTITY.DELETE_ENTITY(v)
	end
	pedslist = {}
	
	VEHICLE.DELETE_VEHICLE(target)
	print('SZAT - deleted')
	target = 0;
	payment = 0
	stealtrigger = false
	waittime = 0
	
end

local function spawnv(vtr)
		
		local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vtr,-1)
		
		local chance = GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,70)
		if (driver ~= 0) then
			chance = GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,101)
		end
		
		
		local hash = 0
		local pedlist = {}
		
		local spawnpos = ENTITY.GET_ENTITY_COORDS(vtr, true)
		local lscdist = GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(spawnpos.x,spawnpos.y,spawnpos.z, -374.5, -122.5, 38.5, true)
		
		local rich = false
		
		if (chance < 70) then --TODO ADJUST
			cdata = carslist[GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,#carslist+1)]
			hash = cdata[1]
			payment = cdata[2]
			if(chance > 40) then
				pedlist = carspeds
				rich = true
			else
				pedlist = cargospeds
			end
		elseif (chance < 85) then
			hash = cargo1list[GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,#cargo1list+1)]
			payment = GAMEPLAY.GET_RANDOM_INT_IN_RANGE(50000,300000) + (lscdist*10)
			pedlist = cargospeds
		elseif (chance < 95) then
			hash = cargo2list[GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,#cargo2list+1)]
			payment = GAMEPLAY.GET_RANDOM_INT_IN_RANGE(300000,2000000) + (lscdist*50)
			pedlist = cargospeds
		else
			hash = cargo3list[GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,#cargo3list+1)]
			payment = GAMEPLAY.GET_RANDOM_INT_IN_RANGE(2000000,5000000) + (lscdist*100)
			pedlist = cargo3peds
		end
		
		payment = math.floor(payment)
		
		
		if (STREAMING.IS_MODEL_IN_CDIMAGE(hash) and STREAMING.IS_MODEL_A_VEHICLE(hash)) then
		
			STREAMING.REQUEST_MODEL(hash)
			
			stealtrigger = true;
			-- jacktrigger = true
			
			while (not STREAMING.HAS_MODEL_LOADED(hash)) do
				wait(0)
			end
			
			local vheading = ENTITY.GET_ENTITY_HEADING(vtr)
			
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vtr, true, true)
			VEHICLE.DELETE_VEHICLE(vtr)
			
			newv = VEHICLE.CREATE_VEHICLE(hash, spawnpos.x,spawnpos.y,spawnpos.z, vheading, true, true)
			
			if (chance < 60) then
				--mod the v
				local cols = modcols[GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,#modcols+1)]
				VEHICLE.SET_VEHICLE_MOD_KIT(newv, 0)
				
				local pc = GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,100)
				
				local paint = 0
				if (pc < 5) then
					paint = 5
				elseif (pc < 30) then
					paint = 3
				end
				
				VEHICLE.SET_VEHICLE_MOD_COLOR_1(newv, paint, 0, 0)
				VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(newv,cols[1],cols[2],cols[3])
				VEHICLE.SET_VEHICLE_EXTRA_COLOURS(newv, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,75), GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,41))
				VEHICLE.TOGGLE_VEHICLE_MOD(newv, 18, true)
				VEHICLE.SET_VEHICLE_WHEEL_TYPE(newv, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,7))
				VEHICLE.SET_VEHICLE_WINDOW_TINT(newv, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,6))
				VEHICLE.SET_VEHICLE_MOD(newv, 0, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 1, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 2, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 3, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 4, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 5, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 6, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 7, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 8, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 9, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 10, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,2), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 11, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,4), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 12, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,3), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 13, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,3), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 14, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,15), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 15, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,4), false)
				VEHICLE.SET_VEHICLE_MOD(newv, 23, GAMEPLAY.GET_RANDOM_INT_IN_RANGE(0,20), true)
			end
			
			if (driver ~= 0) then
				local numtogen = 1 --TODO set to 1 and make peds attack when v is hijacked
				if (rich) then
					numtogen = 0
				end
				
				-- PED.CREATE_GROUP(167)
				for i = 0, numtogen, 1 do
					pedhash = pedlist[GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,#pedlist+1)]
					
					STREAMING.REQUEST_MODEL(pedhash)
					while(not STREAMING.HAS_MODEL_LOADED(pedhash)) do
						wait(0)
					end
					local newped = PED.CREATE_PED( 0,pedhash,spawnpos.x,spawnpos.y,spawnpos.z,1,false,true)
					table.insert(pedslist, newped)
					-- PED.SET_PED_COMBAT_ATTRIBUTES(newped, 100, true)
					-- PED.SET_PED_COMBAT_ABILITY(newped, 100)
					-- AI.TASK_COMBAT_PED(newped, PLAYER.PLAYER_PED_ID(), 1, 1)
					-- PED.SET_PED_AS_ENEMY(newped, true)
					-- PED.SET_PED_STAY_IN_VEHICLE_WHEN_JACKED(newped, false)
					PED.SET_PED_AS_COP(newped, true)
					PED.SET_PED_CAN_SWITCH_WEAPON(newped,true)
					if (not rich) then
						WEAPON.GIVE_WEAPON_TO_PED(newped, GAMEPLAY.GET_HASH_KEY(weapons[GAMEPLAY.GET_RANDOM_INT_IN_RANGE(1,#weapons+1)]),1000,true,true)
					end
					-- PED.SET_PED_DIES_WHEN_INJURED(newped, false)
					-- PED.SET_PED_MAX_HEALTH(newped, 1000)
					-- PED.SET_PED_ARMOUR(newped, 1000)
					
					PED.SET_PED_INTO_VEHICLE(newped, newv, i-1)
					if (i==0) then
						--AI.TASK_VEHICLE_DRIVE_WANDER(newped, newv, 3, 2)
						AI.TASK_VEHICLE_DRIVE_WANDER(newped, newv, 30, 3)
					end
					
					-- PED.SET_PED_AS_GROUP_MEMBER(newped, 167)
					-- PED.SET_PED_RELATIONSHIP_GROUP_HASH(newped, GAMEPLAY.GET_HASH_KEY(""))
					
					STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedhash)
				end
			else
				VEHICLE.SET_VEHICLE_NEEDS_TO_BE_HOTWIRED(newv, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED(newv,0)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED(newv,1)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(newv,true)
				VEHICLE.SET_VEHICLE_ALARM(newv, true)
			end
			
			
			VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(newv)
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(newv, true, true)
			
			STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
			
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(newv, true, true)
			local blip = UI.ADD_BLIP_FOR_ENTITY(newv)
			--UI.SET_BLIP_SCALE(blip, 1.6)
			UI.SET_BLIP_COLOUR(blip, 19)--4278246911)--, 0xFF00DDFF)  --broken in v10
			UI.SET_BLIP_FLASHES(blip, false)
			
			
			if (chance < 70) then
				showtext5("There's a VALUABLE CAR nearby you can sell. It's marked on your GPS.\nPayment: $"..tostring(payment))
			else
				showtext5("There's a CARGO VEHICLE nearby you can sell. It's marked on your GPS.\nPayment: $"..tostring(payment))
			end
			
			return newv
		
		end

=======
local missionData = {}
local creatingMission = false

local searchAngle = 0

-- Los Santos Customs related variables
local lscBlip = 0
local lscPos = {x = -374.5, y = -122.5, z = 38.5}
local lscDistance = 0
local minDistanceToLSC = 300
local maxDistanceToLSC = 1000
local minSuccessDistanceToLSC = 30

-- Target vehicle variables
local vehicleBlip = 0
local vehicleStolen = false
local vehicleHealth = 0
local vehicleTooDamagedHealth = 600

-- Player status variables
local playerInVehicle = 0
local lastPlayerInVehicle = false
local maxDistanceFromCar = 300
local wantedLevel = 0

-- Route variables
local routeRefresh = 0
local routeRefreshRate = 100

-- Wait timers in ms
local cooldownTime = 6000
local cooldownCounter = 0
local waitTime = 3000
local waitTimeCounter = 0

-- Chance variables
local chance = 0
local chances = { vehicle = 70, lowCargo = 85, medCargo = 95, isModded = 60 }

 -- DEBUG MODE, enable to activate alternate parameters
local debug_mode = true

if(debug_mode) then
    cooldownTime = 500
    waitTime = 1000
    minDistanceToLSC = 100
    maxDistanceToLSC = 100000
end

local function randomInt(a, b)
    return GAMEPLAY.GET_RANDOM_INT_IN_RANGE(a, b)
>>>>>>> c7e4e228995bc9ae6b05ddc43a63d2fec70d5464
end

local function randomFloat(a, b)
    return GAMEPLAY.GET_RANDOM_FLOAT_IN_RANGE(a, b)
end

<<<<<<< HEAD
local lastplayerinv = false
local routerefresh = 0
local searchangle = 0

local lastdisablekeystate = false

function szaboautotheft.tick()
	-- dump pos = -374.5, -122.5, 38.5
	
	if (texttimer > 0) then
		drawtext5()
	end
	
	if(get_key_pressed(disablemodkey) and not lastdisablekeystate) then
		modenabled = not modenabled
	
		if modenabled then
			showtext5("Szabo's Auto Theft Mod ENABLED")
		else
			deletev()
			showtext5("Szabo's Auto Theft Mod DISABLED")
		end
	end
	lastdisablekeystate = get_key_pressed(disablemodkey)
	
	if(not modenabled) then
		return 0
	end
	
	local playerPed = PLAYER.PLAYER_PED_ID()
	local player = PLAYER.GET_PLAYER_PED(playerPed)
	-- local playerID = PLAYER.PLAYER_ID()
	local playerPos = ENTITY.GET_ENTITY_COORDS(playerPed, true)
	
	local stars = PLAYER.GET_PLAYER_WANTED_LEVEL(player)
	
	-- print(stars)
	
	if (target == 0) then
	
		if (lscblip ~= 0) then
			UI.REMOVE_BLIP(lscblip)
		end
		
		
		local disttolsc = GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(playerPos.x, playerPos.y, playerPos.z, -374.5, -122.5, 38.5, true)
		local searchradius = szclamp((disttolsc*0.003), 4, 20) --TODO FINE-TUNE THIS SH*T
		
		-- print (disttolsc,searchradius)
		
		searchangle = searchangle + 0.01
		if (searchangle > 2) then
			searchangle = 0
		end
		local searchdist = 180
		local searchpos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, math.sin(searchangle*math.pi)*searchdist, math.cos(searchangle*math.pi)*searchdist, math.sin(searchangle*4*math.pi)*(searchdist*0.6))
		local rv = VEHICLE.GET_RANDOM_VEHICLE_IN_SPHERE(searchpos.x, searchpos.y, searchpos.z, searchradius, 0, 0)
	
		-- rv = VEHICLE.GET_CLOSEST_VEHICLE(playerPos.x, playerPos.y, playerPos.z, 5, 0, 70)
		
		--																				800
		if (not VEHICLE.IS_THIS_MODEL_A_CAR(ENTITY.GET_ENTITY_MODEL(rv)) or disttolsc < 500) then
			rv = 0
		end
		
		if (rv ~= 0 and stars == 0) then
		
			-- local t = ENTITY.GET_ENTITY_COORDS(rv, true)
			-- local disttolsc = GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(t.x, t.y, t.z, -374.5, -122.5, 38.5, true)
			
			-- print('CAR FOUND, dtlsc',disttolsc)
			
			local rvpos = ENTITY.GET_ENTITY_COORDS(rv, true)
			-- local dist = GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(playerPos.x, playerPos.y, playerPos.z, rvpos.x, rvpos.y, rvpos.z, true)
			
			-- print('dtp',dist)
			
			-- if (dist > 150 and dist < 250) then
			--if (dist > 1 and dist < 20) then
				
			if (UI.GET_BLIP_FROM_ENTITY(rv) == 0) then
				
				target = spawnv(rv)
				waittime = 1500

			end
			-- end

		end
	
	else
		local t = ENTITY.GET_ENTITY_COORDS(target, true)
		
		local playerinv = PED.IS_PED_IN_VEHICLE(playerPed, target, true)
		
		if (playerinv and not lastplayerinv) then
			nblip = UI.ADD_BLIP_FOR_COORD(-374.5, -122.5, 38.5)
			UI.SET_BLIP_COLOUR(nblip, 0x00FF00FF)
			lscblip = nblip
			print('added route blip')
		end
		lastplayerinv = playerinv
		
		if (playerinv and routerefresh > 100) then
			UI.SET_BLIP_ROUTE(lscblip, true)
			UI.SET_BLIP_ROUTE_COLOUR(lscblip, 0x00FF00FF) --broken in v10
			routerefresh = 0
			-- print('refreshing route')
		end
		routerefresh = routerefresh+1
		
		if (playerinv and stealtrigger) then
			stealtrigger = false
			playerID = PLAYER.PLAYER_ID()
			if (stars < wantedlevelforstealing) then
				PLAYER.SET_PLAYER_WANTED_LEVEL(playerID, wantedlevelforstealing, false)
				PLAYER.SET_PLAYER_WANTED_LEVEL_NOW(playerID, false)
			end
		end
		
		-- NO WAY TO MAKE THIS WORK
		-- if (jacktrigger and not playerinv) then
			-- jacktrigger = false
			-- local ped1 = VEHICLE.GET_PED_IN_VEHICLE_SEAT(target, -1)
			-- local ped2 = VEHICLE.GET_PED_IN_VEHICLE_SEAT(target, -1)
			-- if(PED.IS_PED_BEING_JACKED(ped1) or PED.IS_PED_BEING_JACKED(ped2)) then
				-- AI.TASK_LEAVE_VEHICLE(ped1, target, 4096) --4096
				-- AI.TASK_COMBAT_PED(ped1, PLAYER.PLAYER_PED_ID(), 1, 1)
				-- AI.TASK_LEAVE_VEHICLE(ped2, target, 4096)
				-- AI.TASK_COMBAT_PED(ped2, PLAYER.PLAYER_PED_ID(), 1, 1)
			-- end
		-- end
		
		-- print(VEHICLE.GET_VEHICLE_ENGINE_HEALTH(target))
		
		if(VEHICLE.GET_VEHICLE_ENGINE_HEALTH(target) < 600) then
			target = 0
			payment = 0
			while (UI.GET_BLIP_FROM_ENTITY(target) ~= 0) do
				UI.REMOVE_BLIP(UI.GET_BLIP_FROM_ENTITY(target))
				wait(0)
			end
			ENTITY.SET_VEHICLE_AS_NO_LONGER_NEEDED(target)
			showtext5("This vehicle is too damaged to sell")
		end
		
		if (waittime > 0) then
			waittime = waittime-1
		end
		print(waittime)
		
		--																										300	or not ENTITY.DOES_ENTITY_EXIST(target)
		if (GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(playerPos.x, playerPos.y, playerPos.z, t.x, t.y, t.z, true	) > 300 and waittime<=0) then
			deletev()
			showtext5("The vehicle was lost")
		elseif (GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(t.x, t.y, t.z, -374.5, -122.5, 38.5, true) < 30 and stars == 0) then
			if (playerinv) then
				texttoshow = "Leave the vehicle"
				drawtext5()
			else
				addmoneytoplayer(payment)
				deletev()
				payment = 0
				showtext5("Thanks for your business")
			end
		end
	end
	
=======
local function clampVal(val, min, max)
    if (val < min) then
        return min
    elseif (val > max) then
        return max
    else
        return val
    end
>>>>>>> c7e4e228995bc9ae6b05ddc43a63d2fec70d5464
end

local function setNotification(str)
    textTimer = 300
    textToShow = str
end

local function drawNotification()
    if (textTimer == 0) then
        return
    end

    UI.SET_TEXT_FONT(0)
    UI.SET_TEXT_SCALE(0.4, 0.5)
    UI.SET_TEXT_COLOUR(255, 255, 180, 255)
    UI.SET_TEXT_WRAP(0, 1)
    UI.SET_TEXT_CENTRE(true)
    UI.SET_TEXT_DROPSHADOW(15, 15, 0, 0, 0)
    UI.SET_TEXT_EDGE(5, 0, 0, 0, 255)
    UI._SET_TEXT_ENTRY("STRING")
    UI._ADD_TEXT_COMPONENT_STRING(textToShow)
    UI._DRAW_TEXT(0.5, 0.9)
    textTimer = textTimer-1
end

local function giveMoneyToPlayer(amount)
    moneyHash = GAMEPLAY.GET_HASH_KEY("SP0_TOTAL_CASH")
    local playerPed = PLAYER.PLAYER_PED_ID()
    if (PED.IS_PED_MODEL(playerPed, GAMEPLAY.GET_HASH_KEY("player_one"))) then                                
        moneyHash = GAMEPLAY.GET_HASH_KEY("SP1_TOTAL_CASH")                                     
    elseif (PED.IS_PED_MODEL(playerPed, GAMEPLAY.GET_HASH_KEY("player_two"))) then
        moneyHash = GAMEPLAY.GET_HASH_KEY("SP2_TOTAL_CASH")  
    end
    local _, currentMoney = STATS.STAT_GET_INT(moneyHash, 0, -1)
    STATS.STAT_SET_INT(moneyHash, currentMoney + amount, true)
end

local function setVehicleColor(vehicle)
    -- Generate random color for vehicle
    local maxColors = VEHICLE.GET_NUMBER_OF_VEHICLE_COLOURS(vehicle)
    local carColor = {}
    for i=1,3,1 do
        carColor[i] = randomInt(0, maxColors)
    end

    local paintColor = randomInt(0,100)
    
    local paint = 0
    if (paintColor < 5) then
        paint = 5
    elseif (paintColor < 30) then
        paint = 3
    end

    VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, paint, 0, 0)
    VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, carColor[1], carColor[2], carColor[3])
    VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, randomInt(0,75), randomInt(0,41))
end

local function setVehicleMods(vehicle)
    --Mod the vehicle
    VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
    VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 18, true)
    VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, randomInt(0,7))
    VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, randomInt(0,6))

    for i=0,10,1 do
        VEHICLE.SET_VEHICLE_MOD(vehicle, i, randomInt(0,2), false)    
    end
    
    VEHICLE.SET_VEHICLE_MOD(vehicle, 11, randomInt(0,4), false)
    VEHICLE.SET_VEHICLE_MOD(vehicle, 12, randomInt(0,3), false)
    VEHICLE.SET_VEHICLE_MOD(vehicle, 13, randomInt(0,3), false)
    VEHICLE.SET_VEHICLE_MOD(vehicle, 14, randomInt(0,15), false)
    VEHICLE.SET_VEHICLE_MOD(vehicle, 15, randomInt(0,4), false)
    VEHICLE.SET_VEHICLE_MOD(vehicle, 23, randomInt(0,20), true)
end

local function getMissionData()
    local hash = 0
    local pedList = {}
    local payment = 0
    local missionType = nil
    local damageMultiplier = 1
    local armedPeds = false
    if(randomInt(0,1) == 1) then
        armedPeds = true
    end

    if (chance < chances.vehicle) then --TODO ADJUST
        -- Spawn expensive car
        missionType = "valuableVehicle"
        carData = carsList[randomInt(1,#carsList+1)]
        hash = carData[1]
        payment = carData[2]
        pedList = carPeds
        damageMultiplier = 1.2
    elseif (chance < chances.lowCargo) then
        -- Spawn low value cargo vehicle
        missionType = "cargo"
        hash = cargoLowVal[randomInt(1,#cargoLowVal+1)]
        payment = randomInt(50000,100000) + (lscDistance * 10)
        pedList = cargoPeds
    elseif (chance < chances.medCargo) then
        -- Spawn mid value cargo vehicle
        missionType = "cargo"
        hash = cargoMedVal[randomInt(1,#cargoMedVal+1)]
        payment = randomInt(100000,150000) + (lscDistance * 25)
        pedList = cargoPeds
    else
        -- Spawn high value cargo vehicle
        missionType = "cargo"
        hash = cargoHighVal[randomInt(1,#cargoHighVal+1)]
        payment = randomInt(150000,200000) + (lscDistance * 50)
        pedList = cargoHighValPeds
        armedPeds = true
        damageMultiplier = 1.2
    end

    return { 
        missionType = missionType, 
        peds = pedList, 
        pedsInCar = {}, 
        payment = math.floor(payment), 
        vehicleHash = hash, 
        damageMultiplier = damageMultiplier
    }
end

local function addPedsToCar(vehicle, numPeds, spawnPos)
    for i=1,numPeds,1 do
        local pedHash = missionData.peds[randomInt(1, #missionData.peds+1)]
                        
        STREAMING.REQUEST_MODEL(pedHash)
        while(not STREAMING.HAS_MODEL_LOADED(pedHash)) do
            -- Wait for vehicle model to load
            wait(0)
        end

        local newPed = PED.CREATE_PED(0, pedHash, spawnPos.x, spawnPos.y, spawnPos.z, 1, false, true)
        
        table.insert(missionData.pedsInCar, newPed)
        
        -- PED.SET_PED_COMBAT_ATTRIBUTES(newPed, 100, true)
        -- PED.SET_PED_COMBAT_ABILITY(newPed, 100)
        -- AI.TASK_COMBAT_PED(newPed, PLAYER.PLAYER_PED_ID(), 1, 1)
        -- PED.SET_PED_AS_ENEMY(newPed, true)
        -- PED.SET_PED_STAY_IN_VEHICLE_WHEN_JACKED(newPed, false)
        -- PED.SET_PED_DIES_WHEN_INJURED(newPed, false)
        -- PED.SET_PED_MAX_HEALTH(newPed, 1000)
        -- PED.SET_PED_ARMOUR(newPed, 1000)
        
        PED.SET_PED_AS_COP(newPed, true)
        PED.SET_PED_CAN_SWITCH_WEAPON(newPed, true)
        
        if (missionData.armedPeds) then
            randomWeapon = weapons[randomInt(1,#weapons+1)]
            WEAPON.GIVE_WEAPON_TO_PED(newPed, GAMEPLAY.GET_HASH_KEY(randomWeapon), 1000, true, true)
        end
        

        PED.SET_PED_INTO_VEHICLE(newPed, vehicle, i-2)  -- Using i-2 as GTA V assigns driver as position -1 for some reason
        if (i==1) then
            AI.TASK_VEHICLE_DRIVE_WANDER(newPed, vehicle, 30, 3)
        end
        
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash)
    end
end

local function getRandomVehiclePos(pos)
    local newPos = pos -- Copy pos so we get a valid Vector 3 object

    -- Fine tune 4th, 6th, 7th and 8th parameter to control where the car spawns
    PATHFIND.GET_NTH_CLOSEST_VEHICLE_NODE(pos.x, pos.y, pos.z, 6
        , newPos, 1, 1, 1)
    return newPos
end

local function spawnVehicle()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local spawnPos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 0.0, 0.0)
    spawnPos.heading = 1.0
    local newVehicle = 0
    
    if (STREAMING.IS_MODEL_IN_CDIMAGE(missionData.vehicleHash) and STREAMING.IS_MODEL_A_VEHICLE(missionData.vehicleHash)) then
    
        STREAMING.REQUEST_MODEL(missionData.vehicleHash)
        
        while (not STREAMING.HAS_MODEL_LOADED(missionData.vehicleHash)) do
            -- Wait for vehicle model to load
            wait(0)
        end

        local newPos = getRandomVehiclePos(spawnPos)
        
        newVehicle = VEHICLE.CREATE_VEHICLE(missionData.vehicleHash, newPos.x, newPos.y, newPos.z, newPos.heading, true, true)
        
        setVehicleColor(newVehicle)

        if (chance < chances.isModded) then
            -- Modded vehicle  
            setVehicleMods(newVehicle)
        end

        -- Use 0-10 here because the random int doesn't seem to work that great for a small range, possibly flooring/ceiling result
        local hasPeds = randomInt(0,10) 
        print("peds: "..tostring(hasPeds))
        
        if(hasPeds > 5) then
            -- Add peds to car
            local numPeds = 1
            local pedRandomizer = randomInt(0,10)
            if(pedRandomizer > 5) then
                numPeds = 2
            end
            addPedsToCar(newVehicle, numPeds, newPos)
        else
            -- Empty vehicle
            VEHICLE.SET_VEHICLE_NEEDS_TO_BE_HOTWIRED(newVehicle, true)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED(newVehicle, 1)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(newVehicle, true)
            VEHICLE.SET_VEHICLE_ALARM(newVehicle, true)
        end

        ENTITY.SET_ENTITY_COORDS(newVehicle, newPos.x, newPos.y, newPos.z, true, true, true, true)
        VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(newVehicle)
        
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(missionData.vehicleHash)

        vehicleHealth = VEHICLE.GET_VEHICLE_ENGINE_HEALTH(newVehicle)
        vehicleStolen = false
    end

    return newVehicle
end

local function removeVehicle()
    if (target == 0) then
        return
    end
    for _,ped in ipairs(missionData.pedsInCar) do
        ENTITY.DELETE_ENTITY(ped)
    end
    
    VEHICLE.DELETE_VEHICLE(target)
    target = 0
end


local function setBlip(blipName, isOn)
    if(blipName == "vehicle") then
        if(isOn) then
            UI.REMOVE_BLIP(vehicleBlip)
            vehicleBlip = UI.ADD_BLIP_FOR_ENTITY(target)
            UI.SET_BLIP_COLOUR(vehicleBlip, 0x33CCFFFF)
        else
            UI.REMOVE_BLIP(vehicleBlip)
            vehicleBlip = 0
        end
    else
        if(isOn) then
            UI.REMOVE_BLIP(lscBlip)
            lscBlip = UI.ADD_BLIP_FOR_COORD(lscPos.x, lscPos.y, lscPos.z)
            UI.SET_BLIP_COLOUR(lscBlip, 0xFFFFCCFF)
        else
            UI.REMOVE_BLIP(lscBlip)
            lscBlip = 0
        end
    end
end

function szaboAutoTheft.createMission()
    creatingMission = true
    chance = randomInt(1,101)
    missionData = getMissionData()
    target = spawnVehicle()
    if(target == 0) then
        szaboAutoTheft.resetMission(false)
    end

    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(target, true, true)

    waitTimeCounter = waitTime

     -- Add blip to map
    setBlip("vehicle", true)
    creatingMission = false
    
    if (missionData.missionType == "valuableVehicle") then
        setNotification("There's a VALUABLE CAR nearby that you can sell. It's marked on your GPS.")
    else
        setNotification("There's a CARGO VEHICLE nearby that you can sell. It's marked on your GPS.")
    end
end

function szaboAutoTheft.resetMission(removeCar)
    setBlip("vehicle", false);
    setBlip("lsc", false); 

    ENTITY.SET_VEHICLE_AS_NO_LONGER_NEEDED(target)

    if(removeCar) then
        removeVehicle()
    else
        target = 0  -- Still get rid of reference
    end

    cooldownCounter = cooldownTime
    waitTimeCounter = waitTime
    chance = 0
    missionData = {}
    creatingMission = false
end

local function checkPlayerInVehicle(playerPed)
    playerInVehicle = PED.IS_PED_IN_VEHICLE(playerPed, target, true)

    if (playerInVehicle) then
        waitTimeCounter = waitTime
        setBlip("vehicle", false)
        if(not lastPlayerInVehicle) then
            -- Player entered car the first time
            lastPlayerInVehicle = playerInVehicle

            if (not vehicleStolen) then
                -- Car is now stolen, randomly add a wanted level
                vehicleStolen = true
                playerID = PLAYER.PLAYER_ID()
                if (wantedLevel < 2) then
                    newWantedLevel = randomInt(0,2)
                    if(newWantedLevel < wantedLevel) then
                        newWantedLevel = wantedLevel -- Keep wanted level if it was larger than new one
                    end
                    PLAYER.SET_PLAYER_WANTED_LEVEL(playerID, newWantedLevel, false)
                    PLAYER.SET_PLAYER_WANTED_LEVEL_NOW(playerID, false)
                end
            end
        end

        if(wantedLevel > 0) then
            return  -- Player is wanted, can't set route to LSC
        end

        -- Add route to LSC
        setBlip("lsc", true)

        if(routeRefresh > routeRefreshRate) then
            -- Refresh route
            UI.SET_BLIP_ROUTE(lscBlip, true)
            UI.SET_BLIP_ROUTE_COLOUR(lscBlip, 0x00FF00FF)
            routeRefresh = 0
        end

        routeRefresh = routeRefresh + 1
    else
        -- Player not in vehicle, show blip to vehicle and hide the one to LSC
        setBlip("lsc", false)
        setBlip("vehicle", true)
    end
end

local function checkVehicleHealth()
    local currentVehicleHealth = VEHICLE.GET_VEHICLE_ENGINE_HEALTH(target)
    if(currentVehicleHealth < vehicleHealth) then
        local diff = vehicleHealth - currentVehicleHealth
        missionData.payment = missionData.payment - (diff * missionData.damageMultiplier)
        vehicleHealth = currentVehicleHealth

        if(vehicleHealth < vehicleTooDamagedHealth) then
            -- Vehicle too damaged and can no longer be sold
            setNotification("This vehicle is too damaged to sell")
            szaboAutoTheft.resetMission(false)
        end
    end
end

local function checkMissionStatus(playerPos)
    if(not ENTITY.DOES_ENTITY_EXIST(target)) then
        szaboAutoTheft.resetMission(false)
    end

    local vehiclePos = ENTITY.GET_ENTITY_COORDS(target, true)

    local playerDistanceFromCar = GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(playerPos.x, playerPos.y, playerPos.z, vehiclePos.x, vehiclePos.y, vehiclePos.z, true)
    if (playerDistanceFromCar > maxDistanceFromCar and waitTimeCounter == 0) then
        -- Player is too far away from vehicle
        setNotification("The vehicle was lost.")
        szaboAutoTheft.resetMission(true)
    elseif (GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(vehiclePos.x, vehiclePos.y, vehiclePos.z, lscPos.x, lscPos.y, lscPos.z, true) < minSuccessDistanceToLSC) then
        -- Player has brought vehicle to LSC
        if(wantedLevel > 0) then
            -- But has cops on his tail
            setNotification("Lose the cops.")
        else
            -- Cops no longer after player
            if (playerInVehicle) then
                setNotification("Leave the vehicle.")
            else
                -- Successful delivery! End mission
                giveMoneyToPlayer(missionData.payment)
                setNotification("Thanks for your business!")
                szaboAutoTheft.resetMission(true)
            end
        end
    end
end

function szaboAutoTheft.unload() 
    szaboAutoTheft.resetMission(true)
end

function szaboAutoTheft.init()
end

function szaboAutoTheft.tick()
    drawNotification() -- Draw text if timer is running
    
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerPos = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    
    wantedLevel = PLAYER.GET_PLAYER_WANTED_LEVEL(player)
    
    if (target == 0) then
        -- No mission in progress, try to start one

        if(wantedLevel > 0) then
            return  -- Player is wanted, can't start mission
        end

        if(cooldownCounter > 0) then
            -- Cooldown in progress, can't start mission
            cooldownCounter = cooldownCounter - 1
            return
        else
            -- Get distance from player position to Los Santos Customs
            lscDistance = GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(playerPos.x, playerPos.y, playerPos.z, lscPos.x, lscPos.y, lscPos.z, true)
            
            if(lscDistance < minDistanceToLSC) then
                -- Player too close to LSC, can't start mission, add some cooldown before checking again
                cooldownCounter = cooldownTime / 2
                return 
            end

            if(lscDistance > maxDistanceToLSC) then
                -- Player too far from LSC, can't start mission, add some cooldown before checking again
                cooldownCounter = cooldownTime / 2
                return 
            end
        end
        
        if(not creatingMission) then
            szaboAutoTheft.createMission()
        end
    else
       -- Mission already in progress

        checkPlayerInVehicle(playerPed)
        checkVehicleHealth()

        if (not playerInVehicle and waitTimeCounter > 0) then
            waitTimeCounter = waitTimeCounter - 1
        end
         
        checkMissionStatus(playerPos)
    end
end

return szaboAutoTheft
