if(!isServer) exitWith {};

tardisPlayers = [];
tardisState = "spawned";
tardisTarget = getPos player;

_tardisInt = [
	["Logic",[9,9,8.88038],[0,1,0],[0,0,1],""],
	["Land_GH_Stairs_F",[325.579,-402.295,31.6893],[0.373318,-0.927703,0],[0,0,1],""],
	["Land_GH_Stairs_F",[324.187,-402.818,31.6543],[0.373318,-0.927703,0],[0,0,1],""],
	["Land_AirConditioner_02_F",[328.205,-410.74,38.0232],[0.924255,0.381777,0],[0,0,1],""],
	["Land_AirConditioner_03_F",[328.436,-407.589,35.6866],[-0.353299,0.93551,0],[0,0,1],""],
	["Land_AirConditioner_02_F",[321.129,-408.092,32.9122],[-0.941669,-0.33654,6.04567e-007],[-0.33654,0.941669,-1.725e-006],""],
	["UserTexture10m_F",[323.429,-397.263,30.8682],[-0.356218,0.934403,0],[0,0,1],""],
	["Land_TripodScreen_01_dual_v1_black_F",[329.05,-411.918,35.762],[0.258819,-0.965926,0],[0,0,1],""],
	["Land_Laptop_Intel_01_F",[328.532,-412.613,36.5771],[-8.74228e-008,-1,0],[0,0,1],""],
	["Land_GamingSet_01_controller_F",[329.114,-408.78,36.5771],[-0.602069,-0.798444,0],[0,0,1],""],
	["Land_MobileRadar_01_radar_F",[324.023,-412.697,35.7615],[-0.920082,-0.391726,0],[0,0,1],""],
	["Land_Device_slingloadable_F",[328.898,-411.451,37.7533],[-2.06197e-006,-1.82316e-006,-1],[0.384006,-0.923331,8.91567e-007],""],
	["Land_Device_slingloadable_F",[328.264,-409.843,37.7507],[3.814e-006,1.12413e-006,-1],[-0.371363,0.928488,-3.72639e-007],""],
	["Land_PortableServer_01_black_F",[329.874,-409.484,36.5771],[-0.918805,-0.394712,0],[0,0,1],""],
	["Land_AirconCondenser_01_F",[323.57,-407.129,37.6181],[-0.926515,-0.376258,0],[0,0,1],""],
	["Land_AirconCondenser_01_F",[328.941,-412,37.392],[-0.926516,-0.376257,0],[0,0,1],"tardis_center"],
	["PowerCable_01_CurveLong_F",[326.984,-409.098,35.7615],[0.330891,-0.943669,0],[0,0,1],""],
	["PowerCable_01_CurveLong_F",[325.017,-404.202,35.0956],[0.330891,-0.943669,0],[0,0,1],""],
	["PowerCable_01_CurveLong_F",[326.127,-409.358,35.7615],[-0.739038,0.673664,0],[0,0,1],""],
	["SatelliteAntenna_01_Small_Mounted_Olive_F",[329.298,-413.023,35.7615],[-0.137331,-0.990525,0],[0,0,1],""],
	["SatelliteAntenna_01_Small_Mounted_Olive_F",[329.859,-410.907,37.5269],[0.866025,-0.5,0],[0,0,1],""],
	["Land_ExtensionCord_F",[329.628,-412.563,36.7538],[0,1,0],[0,0,1],""],
	["Land_ConnectorTent_01_white_cross_F",[319.508,-388.785,35.633],[-0.360094,0.932916,1.31787e-005],[-0.00150098,-0.000593487,0.999999],""],
	["PowerCable_01_StraightLong_F",[325.855,-404.185,35.0956],[-0.476039,0.879424,0],[0,0,1],""],
	["Land_DataTerminal_01_F",[326.738,-411.319,36.222],[0.921049,0.389446,0],[0,0,1],"tardis_console"],
	["Land_Pier_Box_F",[328.419,-410.767,35.7559],[0.927003,0.375053,0],[0,0,1],""],
	["Land_ConnectorTent_01_white_open_F",[320.906,-392.351,35.6333],[-0.3675,0.930023,2.86597e-006],[-0.00150498,-0.000597778,0.999999],""],
	["Land_ConnectorTent_01_white_open_F",[322.253,-395.774,35.6333],[-0.3675,0.930023,2.86597e-006],[-0.00150498,-0.000597778,0.999999],""],
	["Land_ConnectorTent_01_white_open_F",[323.112,-387.349,35.6398],[0.930022,0.367499,0.00161935],[-0.00150498,-0.000597778,0.999999],""],
	["Land_ConnectorTent_01_white_open_F",[326.545,-386.024,35.6458],[0.930022,0.367499,0.00161935],[-0.00150498,-0.000597778,0.999999],""],
	["PowerCable_01_Corner_F",[326.916,-412.112,35.7615],[-0.153109,-0.988209,0],[0,0,1],""],
	["Land_ConnectorTent_01_floor_dark_F",[328.353,-416.274,35.0956],[0,1,0],[0,0,1],""],
	["Land_Pier_F",[314.143,-378.94,33.3606],[-0.927164,-0.374655,0],[0,0,1],""],
	["Land_Pier_F",[327.509,-373.5,33.3606],[-0.927164,-0.374655,0],[0,0,1],""],
	["Land_Dome_Small_F",[328.366,-410.787,20.2788],[0.379181,-0.925322,-1.61385e-006],[-9.78587e-007,1.34309e-006,-1],""],
	["Land_Dome_Small_F",[328.363,-410.786,35.627],[0.379182,-0.925322,0],[0,0,1],""],
	["Land_ConcretePanels_02_single_v1_F",[324.278,-400.508,35.6546],[0.922423,0.386181,0],[0,0,1],""],
	["Land_ConcretePanels_02_single_v1_F",[323.548,-398.684,35.6555],[0.922423,0.386181,0],[0,0,1],""],
	["Land_BatteryPack_01_open_olive_F",[327.72,-412.309,36.5771],[-0.379086,-0.925361,0],[0,0,1],""],
	["Land_CampingTable_F",[329.249,-408.875,35.8],[6.91507e-008,1.65875e-007,-1],[0.38483,0.922987,1.79712e-007],""],
	["Land_CampingTable_F",[327.779,-412.378,35.8],[7.58097e-007,3.51054e-006,1],[-0.384832,-0.922987,3.53192e-006],""],
	["Land_CampingTable_F",[327.788,-408.873,35.7615],[-0.380534,0.924767,0],[0,0,1],""],
	["Land_CampingTable_F",[326.76,-411.351,35.7615],[0.924767,0.380534,0],[0,0,1],""],
	["Land_CampingTable_F",[326.778,-409.887,35.8],[5.04777e-007,1.16696e-006,-1],[-0.922987,0.38483,-1.68215e-008],""],
	["Land_CampingTable_F",[326.768,-411.351,35.8],[-6.59271e-007,1.61409e-006,1],[-0.924768,-0.380531,4.53779e-009],""],
	["Land_CampingTable_F",[329.228,-412.388,35.8],[1.31247e-006,3.41301e-006,1],[0.380531,-0.924768,2.65681e-006],""],
	["Land_CampingTable_F",[329.25,-408.87,35.7615],[0.384831,0.922987,0],[0,0,1],""],
	["Land_CampingTable_F",[327.785,-412.391,35.7615],[0.384831,0.922987,0],[0,0,1],""],
	["Land_CampingTable_F",[326.767,-409.892,35.7615],[-0.922987,0.384831,0],[0,0,1],""],
	["Land_CampingTable_F",[327.795,-408.868,35.8],[1.90292e-006,2.6249e-007,-1],[-0.380534,0.924767,-4.81386e-007],""],
	["Land_CampingTable_F",[329.23,-412.391,35.7615],[-0.380534,0.924767,0],[0,0,1],""],
	["Land_GH_Stairs_F",[332.638,-418.925,31.6081],[-0.37362,0.927582,0],[0,0,1],""],
	["Land_GH_Stairs_F",[331.245,-419.447,31.6432],[-0.37362,0.927582,0],[0,0,1],""],
	["Land_TripodScreen_01_large_black_F",[340.052,-415.512,35.718],[-0.940668,0.339329,0],[0,0,1],"tardis_screen"],
	["PowerCable_01_SBend_F",[332.133,-407.984,35.7615],[-0.769123,-0.639101,0],[0,0,1],""],
	["PowerCable_01_SBend_F",[332.127,-407.71,35.7615],[-0.769123,-0.639101,0],[0,0,1],""],
	["UserTexture10m_F",[333.397,-424.479,30.822],[0.356559,-0.934273,0],[0,0,1],""],
	["Land_IPPhone_01_black_F",[330.408,-411.421,36.5771],[-0.907313,0.420457,0],[0,0,1],""],
	["Land_MultiScreenComputer_01_black_F",[330.413,-410.046,36.575],[-0.92004,-0.391823,0],[0,0,1],"tardis_destPad"],
	["Land_TransferSwitch_01_F",[333.535,-406.093,36.4574],[0.922423,0.38618,0],[0,0,1],""],
	["Land_Pier_F",[340.804,-368.093,33.349],[-0.927164,-0.374655,0],[0,0,1],""],
	["Land_Pier_F",[354.7,-362.448,33.3063],[-0.927164,-0.374655,0],[0,0,1],""],
	["Land_Pier_F",[355.832,-390.435,33.3334],[-0.375089,0.926989,0],[0,0,1],""],
	["Land_Dome_Big_F",[350.428,-377.16,35.6287],[0.35677,-0.934192,0],[0,0,1],""],
	["Land_ConcretePanels_02_single_v1_F",[333.719,-423.808,36.276],[0,-4.37114e-008,-1],[-0.386486,0.922295,-4.03148e-008],"tardis_mainDoor"],
	["Land_ConcretePanels_02_single_v1_F",[333.278,-423.058,35.609],[-0.922295,-0.386486,0],[0,0,1],"tardis_pad"],
	["Land_ConcretePanels_02_single_v1_F",[332.529,-420.876,35.7053],[0.922423,0.386181,0],[0,0,1],""],
	["Land_ConcretePanels_02_single_v1_F",[333.98,-424.656,35.7801],[-0.922295,-0.386486,0],[0,0,1],"tardis_pad_1"],
	["Land_CampingTable_F",[330.279,-409.886,35.7615],[-0.924767,-0.380534,0],[0,0,1],""],
	["Land_CampingTable_F",[330.28,-411.357,35.7615],[-0.922987,0.384831,0],[0,0,1],""],
	["Land_CampingTable_F",[330.273,-411.353,35.8],[-6.66724e-007,4.13489e-006,1],[0.922986,-0.384833,2.20662e-006],""],
	["Land_CampingTable_F",[330.281,-409.889,35.8],[-1.30345e-006,2.73446e-006,1],[0.924765,0.380538,1.64821e-007],""],
	["Land_dp_transformer_F",[334.65,-405.613,35.7397],[0.918569,0.39526,0],[0,0,1],""],
	["UserTexture_1x2_F",[333.682,-423.723,37.0336],[0.375739,-0.926725,0],[0,0,1],""],
	["Land_Pier_F",[372.074,-367.425,33.3152],[-0.927164,-0.374655,0],[0,0,1],"test"]
];

_tardisOut = [
	["UserTexture_1x2_F",[-1.58008,-1.89258,1.09099],226.5,1,0,[],"tardisSide_1","",true,false], 
	["Land_ToiletBox_F",[-1.66797,-1.95313,-5.72205e-006],226.775,1,0,[],"tardis_outer","",true,false], 
	["UserTexture_1x2_F",[-2.40234,-1.9082,1.07903],136.938,1,0,[],"tardisSide_2","",true,false], 
	["UserTexture_1x2_F",[-1.63477,-2.71875,1.091],316.656,1,0,[],"tardisSide_3","",true,false], 
	["UserTexture_1x2_F",[-2.46094,-2.72461,1.09104],46.5358,1,0,[],"tardisSide_4","",true,false], 
	["Land_Camping_Light_F",[-1.99121,-2.30273,2.32036],315.044,1,0,[],"tardis_light","",true,false]
];

{
	
    _objectClass = _x select 0;
    _objectPosition = _x select 1;
    _objectDirection = _x select 2;
    _objectUp = _x select 3;
    _objectVariable = _x select 4;
    _current = createVehicle [_objectClass, [0 ,0]];
	_current enableSimulation false;
    _current setPosASL _objectPosition;
    _current setVectorDirAndUp [_objectDirection, _objectUp];
    

    switch (_objectVariable) do {
    	case "": {};
    	case "tardis_console": {
    	tardisActionLand = _current addAction ["<t color='#003B6F'>TakeOff TARDIS</t>", {["arrive"] remoteExec ["TARDIS_fnc_action", 2];}, nil, 0];
    	tardis_console = _current;
    	};
    	case "tardis_destPad": {_current addAction ["<t color='#003B6F'>Set tardis destination</t>", {
			openMap[true, true];

			hint "Click map to set tardis destination";

			onMapSingleClick {
				["setdestination", "", _pos] remoteExec ["TARDIS_fnc_action",2]; openMap[false, false]; hint "Tardis Destination Set"; destSet = true; true;
			};

			sleep 0.5;
		}, nil, 0];
			_current addAction["<t color='#003B6F'>Fly TARDIS</t>", {[] call TARDIS_fnc_flight}, nil, 0];
    		tardis_destPad = _current;

    	};
    	case "tardis_screen": {_current setObjectTexture [0, "#(argb,512,512,1)r2t(tardis_camera,1)"];
    		tardis_screen = _current;
    	};
    	case "tardis_mainDoor": {
    		tardis_mainDoor = _current;
    		tardisActionExit = _current addAction ["<t color='#003B6F'>Exit TARDIS</t>", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			["exit", _caller] remoteExec ["TARDIS_fnc_action", 2];
			
			}, nil, 0, true, true, "", "true", 3];

    	};
    	case "tardis_center": {tardis_center = _current};
    	case "tardis_pad": {tardis_pad = _current;}


    };

} forEach _tardisInt;



[[0, 100], 0, _tardisOut] call BIS_fnc_ObjectsMapper;

[tardisSide_1, tardis_outer] call BIS_fnc_attachToRelative;
[tardisSide_2, tardis_outer] call BIS_fnc_attachToRelative;
[tardisSide_3, tardis_outer] call BIS_fnc_attachToRelative;
[tardisSide_4, tardis_outer] call BIS_fnc_attachToRelative;
[tardis_light, tardis_outer] call BIS_fnc_attachToRelative;


tardisActionEnter = tardis_outer addAction ["<t color='#003B6F'>Enter TARDIS</t>", {
params ["_target", "_caller", "_actionId", "_arguments"];

["enter", _caller] remoteExec ["TARDIS_fnc_action", 2];

}, nil, 0, true, true, "", "true", 3];

call TARDIS_fnc_texture;

cam1 = "camera" camCreate [0,0];

cam1 cameraEffect ["Internal", "Back", "tardis_camera"];

cam1 attachTo [tardis_outer, [1.5, 0, 0]];


//add tardis setup