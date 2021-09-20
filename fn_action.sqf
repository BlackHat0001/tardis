params["_action", "_caller", "_tardisTarget"];

if(!isServer) exitWith {};

_targetPos = tardisTarget;

switch(_action) do {
	
	case "arrive": {
		
		if (_targetPos select 0 == getPos tardis_outer select 0 || _targetPos select 1 == getPos tardis_outer select 1) then {

			"Tardis Materialisng. Tardis is at original location" remoteExec["hint", tardisPlayers];

		} else {

			_tardisDestTemp = nearestLocation [ _targetPos, "nameCity"];

			_message = format["Tardis Materialsing. Tardis is around: %1", _tardisDestTemp];
			
			_message remoteExec["hint", tardisPlayers];

		};
		
		{tardis_center say3D ["tardisArrive", 120]} remoteExec ["call", tardisPlayers];
		
		["arrive", _targetPos] call TARDIS_fnc_animate;
		
		
	};
	
	case "leave": {
		
		if (_targetPos select 0 == getPos tardis_outer select 0 || _targetPos select 1 == getPos tardis_outer select 1) then {

			"Tardis Dematerialising. Destination is not set" remoteExec["hint", tardisPlayers];

		} else {

			_tardisDestTemp = nearestLocation [ _targetPos, "nameCity"];

			_message = format["Tardis Dematerialising. Destination is around: %1", _tardisDestTemp];
			
			_message remoteExec["hint", tardisPlayers];

		};
		
		{tardis_center say3D ["tardisLeave", 120]} remoteExec ["call", tardisPlayers];
		
		["leave"] call TARDIS_fnc_animate;
		
	};
	
	case "exit": {
		
		for "_i" from 0 to (count tardisPlayers) -1 do {
			if((tardisPlayers select _i) isEqualTo _caller) then {
				tardisPlayers deleteAt _i;
			};
		};
		
		_caller setPosASL (getPosASL tardis_outer);
		
		{ playSound "tardisDoor" } remoteExec ["call", _caller];
		
	};
	
	case "enter": {
		
		tardisPlayers pushBack _caller;
		
		_caller setPosASL (getPosASL tardis_pad);
		
		{ playSound "tardisDoor" } remoteExec ["call", _caller];
	};
	
	case "setdestination": {
		
		tardisTarget = _tardisTarget;
		
	};
};
