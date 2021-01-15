import 'dart:convert';

VinModel vinFromJson(String str) =>
    VinModel.fromJson(json.decode(str) as Map<String, dynamic>);

class VinModel {
  VinModel({this.count, this.message, this.searchCriteria, this.results});

  VinModel.fromJson(Map<String, dynamic> json) {
    count = json['Count'] as int;
    message = json['Message'] as String;
    searchCriteria = json['SearchCriteria'] as String;
    if (json['Results'] != null) {
      results = List<Results>();
      json['Results'].forEach((v) {
        results.add(Results.fromJson(v as Map<String, dynamic>));
      });
    }
  }
  int count;
  String message;
  String searchCriteria;
  List<Results> results;
}

class Results {
  Results(
      {this.aBS,
      this.activeSafetySysNote,
      this.adaptiveCruiseControl,
      this.adaptiveDrivingBeam,
      this.adaptiveHeadlights,
      this.additionalErrorText,
      this.airBagLocCurtain,
      this.airBagLocFront,
      this.airBagLocKnee,
      this.airBagLocSeatCushion,
      this.airBagLocSide,
      this.autoReverseSystem,
      this.automaticPedestrianAlertingSound,
      this.axleConfiguration,
      this.axles,
      this.basePrice,
      this.batteryA,
      this.batteryATo,
      this.batteryCells,
      this.batteryInfo,
      this.batteryKWh,
      this.batteryKWhTo,
      this.batteryModules,
      this.batteryPacks,
      this.batteryType,
      this.batteryV,
      this.batteryVTo,
      this.bedLengthIN,
      this.bedType,
      this.blindSpotMon,
      this.bodyCabType,
      this.bodyClass,
      this.brakeSystemDesc,
      this.brakeSystemType,
      this.busFloorConfigType,
      this.busLength,
      this.busType,
      this.cANAACN,
      this.cIB,
      this.cashForClunkers,
      this.chargerLevel,
      this.chargerPowerKW,
      this.coolingType,
      this.curbWeightLB,
      this.customMotorcycleType,
      this.daytimeRunningLight,
      this.destinationMarket,
      this.displacementCC,
      this.displacementCI,
      this.displacementL,
      this.doors,
      this.driveType,
      this.driverAssist,
      this.dynamicBrakeSupport,
      this.eDR,
      this.eSC,
      this.eVDriveUnit,
      this.electrificationLevel,
      this.engineConfiguration,
      this.engineCycles,
      this.engineCylinders,
      this.engineHP,
      this.engineHPTo,
      this.engineKW,
      this.engineManufacturer,
      this.engineModel,
      this.entertainmentSystem,
      this.errorCode,
      this.errorText,
      this.forwardCollisionWarning,
      this.fuelInjectionType,
      this.fuelTypePrimary,
      this.fuelTypeSecondary,
      this.gCWR,
      this.gCWRTo,
      this.gVWR,
      this.gVWRTo,
      this.keylessIgnition,
      this.laneDepartureWarning,
      this.laneKeepSystem,
      this.lowerBeamHeadlampLightSource,
      this.make,
      this.makeID,
      this.manufacturer,
      this.manufacturerId,
      this.model,
      this.modelID,
      this.modelYear,
      this.motorcycleChassisType,
      this.motorcycleSuspensionType,
      this.nCSABodyType,
      this.nCSAMake,
      this.nCSAMapExcApprovedBy,
      this.nCSAMapExcApprovedOn,
      this.nCSAMappingException,
      this.nCSAModel,
      this.nCSANote,
      this.note,
      this.otherBusInfo,
      this.otherEngineInfo,
      this.otherMotorcycleInfo,
      this.otherRestraintSystemInfo,
      this.otherTrailerInfo,
      this.parkAssist,
      this.pedestrianAutomaticEmergencyBraking,
      this.plantCity,
      this.plantCompanyName,
      this.plantCountry,
      this.plantState,
      this.possibleValues,
      this.pretensioner,
      this.rearCrossTrafficAlert,
      this.rearVisibilitySystem,
      this.sAEAutomationLevel,
      this.sAEAutomationLevelTo,
      this.seatBeltsAll,
      this.seatRows,
      this.seats,
      this.semiautomaticHeadlampBeamSwitching,
      this.series,
      this.series2,
      this.steeringLocation,
      this.suggestedVIN,
      this.tPMS,
      this.topSpeedMPH,
      this.trackWidth,
      this.tractionControl,
      this.trailerBodyType,
      this.trailerLength,
      this.trailerType,
      this.transmissionSpeeds,
      this.transmissionStyle,
      this.trim,
      this.trim2,
      this.turbo,
      this.vIN,
      this.valveTrainDesign,
      this.vehicleType,
      this.wheelBaseLong,
      this.wheelBaseShort,
      this.wheelBaseType,
      this.wheelSizeFront,
      this.wheelSizeRear,
      this.wheels,
      this.windows});

  Results.fromJson(Map<String, dynamic> json) {
    aBS = json['ABS'] as String;
    activeSafetySysNote = json['ActiveSafetySysNote'] as String;
    adaptiveCruiseControl = json['AdaptiveCruiseControl'] as String;
    adaptiveDrivingBeam = json['AdaptiveDrivingBeam'] as String;
    adaptiveHeadlights = json['AdaptiveHeadlights'] as String;
    additionalErrorText = json['AdditionalErrorText'] as String;
    airBagLocCurtain = json['AirBagLocCurtain'] as String;
    airBagLocFront = json['AirBagLocFront'] as String;
    airBagLocKnee = json['AirBagLocKnee'] as String;
    airBagLocSeatCushion = json['AirBagLocSeatCushion'] as String;
    airBagLocSide = json['AirBagLocSide'] as String;
    autoReverseSystem = json['AutoReverseSystem'] as String;
    automaticPedestrianAlertingSound =
        json['AutomaticPedestrianAlertingSound'] as String;
    axleConfiguration = json['AxleConfiguration'] as String;
    axles = json['Axles'] as String;
    basePrice = json['BasePrice'] as String;
    batteryA = json['BatteryA'] as String;
    batteryATo = json['BatteryA_to'] as String;
    batteryCells = json['BatteryCells'] as String;
    batteryInfo = json['BatteryInfo'] as String;
    batteryKWh = json['BatteryKWh'] as String;
    batteryKWhTo = json['BatteryKWh_to'] as String;
    batteryModules = json['BatteryModules'] as String;
    batteryPacks = json['BatteryPacks'] as String;
    batteryType = json['BatteryType'] as String;
    batteryV = json['BatteryV'] as String;
    batteryVTo = json['BatteryV_to'] as String;
    bedLengthIN = json['BedLengthIN'] as String;
    bedType = json['BedType'] as String;
    blindSpotMon = json['BlindSpotMon'] as String;
    bodyCabType = json['BodyCabType'] as String;
    bodyClass = json['BodyClass'] as String;
    brakeSystemDesc = json['BrakeSystemDesc'] as String;
    brakeSystemType = json['BrakeSystemType'] as String;
    busFloorConfigType = json['BusFloorConfigType'] as String;
    busLength = json['BusLength'] as String;
    busType = json['BusType'] as String;
    cANAACN = json['CAN_AACN'] as String;
    cIB = json['CIB'] as String;
    cashForClunkers = json['CashForClunkers'] as String;
    chargerLevel = json['ChargerLevel'] as String;
    chargerPowerKW = json['ChargerPowerKW'] as String;
    coolingType = json['CoolingType'] as String;
    curbWeightLB = json['CurbWeightLB'] as String;
    customMotorcycleType = json['CustomMotorcycleType'] as String;
    daytimeRunningLight = json['DaytimeRunningLight'] as String;
    destinationMarket = json['DestinationMarket'] as String;
    displacementCC = json['DisplacementCC'] as String;
    displacementCI = json['DisplacementCI'] as String;
    displacementL = json['DisplacementL'] as String;
    doors = json['Doors'] as String;
    driveType = json['DriveType'] as String;
    driverAssist = json['DriverAssist'] as String;
    dynamicBrakeSupport = json['DynamicBrakeSupport'] as String;
    eDR = json['EDR'] as String;
    eSC = json['ESC'] as String;
    eVDriveUnit = json['EVDriveUnit'] as String;
    electrificationLevel = json['ElectrificationLevel'] as String;
    engineConfiguration = json['EngineConfiguration'] as String;
    engineCycles = json['EngineCycles'] as String;
    engineCylinders = json['EngineCylinders'] as String;
    engineHP = json['EngineHP'] as String;
    engineHPTo = json['EngineHP_to'] as String;
    engineKW = json['EngineKW'] as String;
    engineManufacturer = json['EngineManufacturer'] as String;
    engineModel = json['EngineModel'] as String;
    entertainmentSystem = json['EntertainmentSystem'] as String;
    errorCode = json['ErrorCode'] as String;
    errorText = json['ErrorText'] as String;
    forwardCollisionWarning = json['ForwardCollisionWarning'] as String;
    fuelInjectionType = json['FuelInjectionType'] as String;
    fuelTypePrimary = json['FuelTypePrimary'] as String;
    fuelTypeSecondary = json['FuelTypeSecondary'] as String;
    gCWR = json['GCWR'] as String;
    gCWRTo = json['GCWR_to'] as String;
    gVWR = json['GVWR'] as String;
    gVWRTo = json['GVWR_to'] as String;
    keylessIgnition = json['KeylessIgnition'] as String;
    laneDepartureWarning = json['LaneDepartureWarning'] as String;
    laneKeepSystem = json['LaneKeepSystem'] as String;
    lowerBeamHeadlampLightSource =
        json['LowerBeamHeadlampLightSource'] as String;
    make = json['Make'] as String;
    makeID = json['MakeID'] as String;
    manufacturer = json['Manufacturer'] as String;
    manufacturerId = json['ManufacturerId'] as String;
    model = json['Model'] as String;
    modelID = json['ModelID'] as String;
    modelYear = json['ModelYear'] as String;
    motorcycleChassisType = json['MotorcycleChassisType'] as String;
    motorcycleSuspensionType = json['MotorcycleSuspensionType'] as String;
    nCSABodyType = json['NCSABodyType'] as String;
    nCSAMake = json['NCSAMake'] as String;
    nCSAMapExcApprovedBy = json['NCSAMapExcApprovedBy'] as String;
    nCSAMapExcApprovedOn = json['NCSAMapExcApprovedOn'] as String;
    nCSAMappingException = json['NCSAMappingException'] as String;
    nCSAModel = json['NCSAModel'] as String;
    nCSANote = json['NCSANote'] as String;
    note = json['Note'] as String;
    otherBusInfo = json['OtherBusInfo'] as String;
    otherEngineInfo = json['OtherEngineInfo'] as String;
    otherMotorcycleInfo = json['OtherMotorcycleInfo'] as String;
    otherRestraintSystemInfo = json['OtherRestraintSystemInfo'] as String;
    otherTrailerInfo = json['OtherTrailerInfo'] as String;
    parkAssist = json['ParkAssist'] as String;
    pedestrianAutomaticEmergencyBraking =
        json['PedestrianAutomaticEmergencyBraking'] as String;
    plantCity = json['PlantCity'] as String;
    plantCompanyName = json['PlantCompanyName'] as String;
    plantCountry = json['PlantCountry'] as String;
    plantState = json['PlantState'] as String;
    possibleValues = json['PossibleValues'] as String;
    pretensioner = json['Pretensioner'] as String;
    rearCrossTrafficAlert = json['RearCrossTrafficAlert'] as String;
    rearVisibilitySystem = json['RearVisibilitySystem'] as String;
    sAEAutomationLevel = json['SAEAutomationLevel'] as String;
    sAEAutomationLevelTo = json['SAEAutomationLevel_to'] as String;
    seatBeltsAll = json['SeatBeltsAll'] as String;
    seatRows = json['SeatRows'] as String;
    seats = json['Seats'] as String;
    semiautomaticHeadlampBeamSwitching =
        json['SemiautomaticHeadlampBeamSwitching'] as String;
    series = json['Series'] as String;
    series2 = json['Series2'] as String;
    steeringLocation = json['SteeringLocation'] as String;
    suggestedVIN = json['SuggestedVIN'] as String;
    tPMS = json['TPMS'] as String;
    topSpeedMPH = json['TopSpeedMPH'] as String;
    trackWidth = json['TrackWidth'] as String;
    tractionControl = json['TractionControl'] as String;
    trailerBodyType = json['TrailerBodyType'] as String;
    trailerLength = json['TrailerLength'] as String;
    trailerType = json['TrailerType'] as String;
    transmissionSpeeds = json['TransmissionSpeeds'] as String;
    transmissionStyle = json['TransmissionStyle'] as String;
    trim = json['Trim'] as String;
    trim2 = json['Trim2'] as String;
    turbo = json['Turbo'] as String;
    vIN = json['VIN'] as String;
    valveTrainDesign = json['ValveTrainDesign'] as String;
    vehicleType = json['VehicleType'] as String;
    wheelBaseLong = json['WheelBaseLong'] as String;
    wheelBaseShort = json['WheelBaseShort'] as String;
    wheelBaseType = json['WheelBaseType'] as String;
    wheelSizeFront = json['WheelSizeFront'] as String;
    wheelSizeRear = json['WheelSizeRear'] as String;
    wheels = json['Wheels'] as String;
    windows = json['Windows'] as String;
  }

  String aBS;
  String activeSafetySysNote;
  String adaptiveCruiseControl;
  String adaptiveDrivingBeam;
  String adaptiveHeadlights;
  String additionalErrorText;
  String airBagLocCurtain;
  String airBagLocFront;
  String airBagLocKnee;
  String airBagLocSeatCushion;
  String airBagLocSide;
  String autoReverseSystem;
  String automaticPedestrianAlertingSound;
  String axleConfiguration;
  String axles;
  String basePrice;
  String batteryA;
  String batteryATo;
  String batteryCells;
  String batteryInfo;
  String batteryKWh;
  String batteryKWhTo;
  String batteryModules;
  String batteryPacks;
  String batteryType;
  String batteryV;
  String batteryVTo;
  String bedLengthIN;
  String bedType;
  String blindSpotMon;
  String bodyCabType;
  String bodyClass;
  String brakeSystemDesc;
  String brakeSystemType;
  String busFloorConfigType;
  String busLength;
  String busType;
  String cANAACN;
  String cIB;
  String cashForClunkers;
  String chargerLevel;
  String chargerPowerKW;
  String coolingType;
  String curbWeightLB;
  String customMotorcycleType;
  String daytimeRunningLight;
  String destinationMarket;
  String displacementCC;
  String displacementCI;
  String displacementL;
  String doors;
  String driveType;
  String driverAssist;
  String dynamicBrakeSupport;
  String eDR;
  String eSC;
  String eVDriveUnit;
  String electrificationLevel;
  String engineConfiguration;
  String engineCycles;
  String engineCylinders;
  String engineHP;
  String engineHPTo;
  String engineKW;
  String engineManufacturer;
  String engineModel;
  String entertainmentSystem;
  String errorCode;
  String errorText;
  String forwardCollisionWarning;
  String fuelInjectionType;
  String fuelTypePrimary;
  String fuelTypeSecondary;
  String gCWR;
  String gCWRTo;
  String gVWR;
  String gVWRTo;
  String keylessIgnition;
  String laneDepartureWarning;
  String laneKeepSystem;
  String lowerBeamHeadlampLightSource;
  String make;
  String makeID;
  String manufacturer;
  String manufacturerId;
  String model;
  String modelID;
  String modelYear;
  String motorcycleChassisType;
  String motorcycleSuspensionType;
  String nCSABodyType;
  String nCSAMake;
  String nCSAMapExcApprovedBy;
  String nCSAMapExcApprovedOn;
  String nCSAMappingException;
  String nCSAModel;
  String nCSANote;
  String note;
  String otherBusInfo;
  String otherEngineInfo;
  String otherMotorcycleInfo;
  String otherRestraintSystemInfo;
  String otherTrailerInfo;
  String parkAssist;
  String pedestrianAutomaticEmergencyBraking;
  String plantCity;
  String plantCompanyName;
  String plantCountry;
  String plantState;
  String possibleValues;
  String pretensioner;
  String rearCrossTrafficAlert;
  String rearVisibilitySystem;
  String sAEAutomationLevel;
  String sAEAutomationLevelTo;
  String seatBeltsAll;
  String seatRows;
  String seats;
  String semiautomaticHeadlampBeamSwitching;
  String series;
  String series2;
  String steeringLocation;
  String suggestedVIN;
  String tPMS;
  String topSpeedMPH;
  String trackWidth;
  String tractionControl;
  String trailerBodyType;
  String trailerLength;
  String trailerType;
  String transmissionSpeeds;
  String transmissionStyle;
  String trim;
  String trim2;
  String turbo;
  String vIN;
  String valveTrainDesign;
  String vehicleType;
  String wheelBaseLong;
  String wheelBaseShort;
  String wheelBaseType;
  String wheelSizeFront;
  String wheelSizeRear;
  String wheels;
  String windows;
}
