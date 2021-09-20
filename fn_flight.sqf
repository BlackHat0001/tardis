//tardis flight

_pos = getPos tardis_outer;

_pos = _pos vectorAdd [0, 0, 2];

_velocity = velocity tardis_outer;
hint format ["%1", _velocity];
_dir = [0,0,0];
_up = [0,0,0];

flightCam = "camcurator" camCreate _pos;

flightCam cameraEffect ["internal", "BACK"];
flightCam camCommit 0;

flightRunning = true;

endCam = {
	 params ["_displayCode","_keyCode","_isShift","_isCtrl","_isAlt"]; 
	 if(_keyCode in actionKeys "ReloadMagazine") then {
		 flightCam cameraEffect["terminate", "back"]; 
		 camDestroy flightCam; 
	 };
};

(findDisplay 46) displayAddEventHandler ["KeyDown", {_this spawn endCam; _flightRunning = false}];

while {flightRunning} do {
	
	_camPosCurrent = getPosASL flightCam;
	_camDirCurrent = vectorDir flightCam;
	_camUpCurrent = vectorUp flightCam;

	_diff = _pos vectorDistance _camPosCurrent;
	_camVelocity = velocity flightCam;

	_newPos = _camPosCurrent vectorAdd [2, 2, -2];

	_tardisPos = getPosAsL tardis_outer;

	if (_diff > 5 || _diff < -5) then {


		tardis_outer setVelocityTransformation [_tardisPos, _newPos, _velocity, _camVelocity, _dir, _camDirCurrent, _up, _camUpCurrent, 0.5];

		_velocity = _camVelocity;
		_pos = _camPosCurrent;
		_dir = _camDirCurrent;
		_up = _camUpCurrent;

		sleep 0.25;

	} else {

		tardis_outer setPosASL _newPos;
		sleep 0.1;

		tardis_outer setVectorDir _camDirCurrent;
		tardis_outer setVectorUp _camUpCurrent;

	};

};