openMap[true, true];

hint "Click map to set tardis destination";

onMapSingleClick "target = _pos; openMap[false, false]; hint 'Tardis Destination Set'; true";

