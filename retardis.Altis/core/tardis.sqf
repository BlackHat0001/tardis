
BH_TARDIS_tardisSetup = {
	
	target = null;

	tardisPresent = true;

	tardisInvis = false;

	playersInTardis = 0;

	//add tardis setup

};

BH_TARDIS_tardisEnter = {
	
	_marker = getPosASL tardis_pad;

	player setPosASL _marker;

	playSound "tardisDoor";

	playersInTardis = playersInTardis + 1;

	IF(playersInTardis == 0) {

		playSound3D //tardis

	};

};

BH_TARDIS_tardisLeave = {
	
	_marker = getPosATL tardis_outer;

	player setPosATL _marker;

	playSound "tardisDoor";

	playersInTardis = playersInTardis - 1;

	IF(playersInTardis == 0) {

		//remove sound

	}

};

BH_TARDIS_tardisDest = {
	

	openMap[true, true];

	hint "Click map to set tardis destination";

	onMapSingleClick "target = _pos; openMap[false, false]; hint 'Tardis Destination Set'; destSet = true; true";

	sleep 0.5;

};

BH_TARDIS_tardisLeave = {
	
	IF(target == null) {

		hint "Tardis Dematerialising. Destination is not set";

	} else {

		_tardisDestTemp = nearestLocations [target, [nameCity, nameTown, nameVillage], 2000];

		_tardisDestName = _tardisDestTemp select 0;

		hint("Tardis Dematerialising. Destination is around: " _tardisDestName);

	};

	playSound3D["tardisLeave", "tardis_center", 100];
	playSound3D["tardisLeave", "tardis_outer", 200];

	sleep 10;
	hideObjectGlobal["tardis_outer"];
	sleep 1;
	showObjectGlobal["tardis_outer"];
	sleep 1;
	hideObjectGlobal["tardis_outer"];
	sleep 1;
	showObjectGlobal["tardis_outer"];
	sleep 1;
	hideObjectGlobal["tardis_outer"]; //change me ^^^

	taridsPresent = false;

};

BH_TARDIS_tardisArrive = {

	playSound3D["tardisArrive", "tardis_center", 100];
	playSound3D["tardisArrive", "tardis_outer", 200];
	
	tardis_outer setPos target;

	IF(target == null) {

		hint "Tardis Materialisng. Tardis is at original location";

	} else {

		_tardisDestTemp = nearestLocations [target, [nameCity, nameTown, nameVillage], 2000];

		_tardisDestName = _tardisDestTemp select 0;

		hint("Tardis Materialsing. Tardis is around: ", _tardisDestName);

	};

	sleep 5;
	showObjectGlobal["tardis_outer"];
	sleep 1;
	hideObjectGlobal["tardis_outer"];
	sleep 1;
	showObjectGlobal["tardis_outer"];
	sleep 1;
	hideObjectGlobal["tardis_outer"];
	sleep 1;
	showObjectGlobal["tardis_outer"]; //change me ^^^

	tardisPresent = true;


};

BH_TARDIS_tardisToggleInvisible = {

	IF(taridsPresent == false) {

		hint "You must land the tardis before you can do this";

	} ELSE IF(tardisInvis == false) {

		playSound3D["tardisInvis", "tardis_outer", 100];
		playSound3D["tardisInvis", "tardis_center", 100];

		hideObjectGlobal["tardis_outer"]; //changeme

		hint "tardis is invisible";

	} ELSE IF(taridsInvis == true) {

		playSound3D["tardisInvis", "tardis_outer", 100];
		playSound3D["tardisInvis", "tardis_center", 100];

		showObjectGlobal["tardis_outer"]; //changeme

		hint "tardis is visible";

	};

}