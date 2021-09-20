params["_type", "_targetPos"];

if(!isServer) exitWith {};

switch(_type) do {

	case "arrive": {
		
		tardis_outer removeAction tardisActionEnter;
		tardis_console removeAction tardisActionLand;
		tardis_mainDoor removeAction tardisActionExit;
		
		tardis_outer hideObjectGlobal true;
		tardisSide_1 hideObjectGlobal true;
		tardisSide_2 hideObjectGlobal true;
		tardisSide_3 hideObjectGlobal true;
		tardisSide_4 hideObjectGlobal true;
		tardis_light hideObjectGlobal true;
		
		call TARDIS_fnc_texture;
		
		tardis_outer setPos _targetPos;
		
		{tardis_outer say3D ["tardisArrive", 120]} remoteExec ["call", 0];
		
		uiSleep 1.9;
		_last = false;
		for "_i" from 1 to 7 do {
			tardis_outer hideObjectGlobal _last;
			tardisSide_1 hideObjectGlobal _last;
			tardisSide_2 hideObjectGlobal _last;
			tardisSide_3 hideObjectGlobal _last;
			tardisSide_4 hideObjectGlobal _last;
			tardis_light hideObjectGlobal _last;
			if (_last == false) then {
				_last = true;
			} else {
				_last = false;
			};
			uiSleep 1;
		};
		
		//reattach actions
		tardisActionTakeoff = tardis_console addAction ["<t color='#003B6F'>TakeOff TARDIS</t>", {["leave"] remoteExec ["TARDIS_fnc_action", 2];}, nil, 0];
		tardisActionEnter = tardis_outer addAction ["<t color='#003B6F'>Enter TARDIS</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; ["enter", _caller] remoteExec ["TARDIS_fnc_action", 2];}, nil, 0, true, true, "", "true", 3];
		tardisActionExit = tardis_mainDoor addAction ["<t color='#003B6F'>Exit TARDIS</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; ["exit", _caller] remoteExec ["TARDIS_fnc_action", 2];}, nil, 0, true, true, "", "true", 3];
		
	};
	
	case "leave": {
		
		tardis_outer removeAction tardisActionExit;
		tardis_mainDoor removeAction tardisActionExit;
		tardis_console removeAction tardisActionTakeoff;
		
		call TARDIS_fnc_texture;
		
		tardis_outer hideObjectGlobal false;
		tardisSide_1 hideObjectGlobal false;
		tardisSide_2 hideObjectGlobal false;
		tardisSide_3 hideObjectGlobal false;
		tardisSide_4 hideObjectGlobal false;
		tardis_light hideObjectGlobal false;
		
		{tardis_outer say3D ["tardisLeave", 120]} remoteExec ["call", 0];
		
		uiSleep 5.5;
		_last = true;
		for "_i" from 1 to 9 do {
			tardis_outer hideObjectGlobal _last;
			tardisSide_1 hideObjectGlobal _last;
			tardisSide_2 hideObjectGlobal _last;
			tardisSide_3 hideObjectGlobal _last;
			tardisSide_4 hideObjectGlobal _last;
			tardis_light hideObjectGlobal _last;
			if (_last == false) then {
				_last = true;
			} else {
				_last = false;
			};
			uiSleep 1.2;
		};
		
		tardisActionLand = tardis_console addAction ["<t color='#003B6F'>Land TARDIS</t>", {["arrive"] remoteExec ["TARDIS_fnc_action", 2];}, nil, 0];
		
		
	};
	
	

};
