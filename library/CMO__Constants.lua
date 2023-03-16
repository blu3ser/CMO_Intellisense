---@meta

--[[
Last updated: 8/30/2021
CMO Build: 1.03 1147.30

    BEGIN CONSTANTS
--]]

---@type CMO__Constants:table
CMO__Constants = {};
---see print(_enumTable_:Doctrine("wratargettype"));

---Instead of risking someone overwrite these table constants we return copies for these two.

 --- returns a table of {'360'};
CMO__Constants.Arc360 = function() return {'360'}; end;
 ---returns a table full of all arc-codes.  
 ---{'PB1','PB2','SB1','SB2','SMF1','SMF2','SMA1','SMA2','SS1','SS2','PS1','PS2','PMA1','PMA2','PMF1','PMF2'}
CMO__Constants.ArcFull = function() return {'PB1','PB2','SB1','SB2','SMF1','SMF2','SMA1','SMA2','SS1','SS2','PS1','PS2','PMA1','PMA2','PMF1','PMF2'}; end

---@type table <string,integer|string> @ used when dealing with SetUnitDamage and component type fields. Most swiped from those that inherit from PlatformComponents
CMO__Constants.ComponentType ={}
CMO__Constants.ComponentType.Cargo = "CARGO"
CMO__Constants.ComponentType.CIC = "CIC"
CMO__Constants.ComponentType.PressureHull = "PRESSUREHULL"
CMO__Constants.ComponentType.Rudder = "RUDDER"
CMO__Constants.ComponentType.Engine = "ENGINE"
CMO__Constants.ComponentType.Magazine = "MAGAZINE"
CMO__Constants.ComponentType.Mount = "MOUNT"
CMO__Constants.ComponentType.Sensor = "SENSOR"
CMO__Constants.ComponentType.AirFacility = "AIRFACILITY"
CMO__Constants.ComponentType.DockFacility = "DOCKFACILITY"
CMO__Constants.ComponentType.CommDevice = "COMMDEVICE"

---@type table <string,integer|string> @ used when dealing with SetUnitDamage and component status-statusR fields.
CMO__Constants.ComponentDamageLevel={}
CMO__Constants.ComponentDamageLevel.Light = 0;
CMO__Constants.ComponentDamageLevel.Medium = 1;
CMO__Constants.ComponentDamageLevel.Heavy = 2;
CMO__Constants.ComponentDamageLevel.Destroyed = 'Destroyed';
CMO__Constants.ComponentDamageLevel.None = 'None';
CMO__Constants.ComponentDamageLevel.Damaged = 'Damaged'
CMO__Constants.ComponentDamageLevel.Operational = 'Operational'

---@type table <string,integer> @ used when dealig with component state or sensor status.
CMO__Constants.ComponentStatus={}
CMO__Constants.ComponentStatus.Operational = 0;
CMO__Constants.ComponentStatus.Damaged = 1;
CMO__Constants.ComponentStatus.Destroyed = 2;

---@type table <string,integer> @ used when dealing with SetUnitDamage and component status-statusR fields.
CMO__Constants.FloodingIntensityLevel = {}
CMO__Constants.FloodingIntensityLevel.NoFlooding = 0;
CMO__Constants.FloodingIntensityLevel.Minor = 1;
CMO__Constants.FloodingIntensityLevel.Major = 2;
CMO__Constants.FloodingIntensityLevel.Severe = 3;
CMO__Constants.FloodingIntensityLevel.Capsizing = 4;


---@type table <string,integer> @ Side Awareness enums the text keywords are a little different though.
CMO__Constants.Awareness = {}
CMO__Constants.Awareness.Blind = -1;
CMO__Constants.Awareness.Normal = 0;
CMO__Constants.Awareness.AutoSideID=1;
CMO__Constants.Awareness.AutoSideAndUnitID =2;
CMO__Constants.Awareness.Omniscient=3

---@type table <string,integer> @ Side Proficiency enums and keywords.
CMO__Constants.Proficiency = {}
CMO__Constants.Proficiency.Novice = 0;
CMO__Constants.Proficiency.Cadet = 1; 
CMO__Constants.Proficiency.Regular = 2;
CMO__Constants.Proficiency.Veteran = 3;
CMO__Constants.Proficiency.Ace = 4;


---@type table<string,integer>
CMO__Constants.TargetTypeWRA ={}
CMO__Constants.TargetTypeWRA.None = 1001
CMO__Constants.TargetTypeWRA.Decoy = 1002
CMO__Constants.TargetTypeWRA.Air_Contact_Unknown_Type = 1999
CMO__Constants.TargetTypeWRA.Aircraft_Unspecified = 2000
CMO__Constants.TargetTypeWRA.Aircraft_5th_Generation = 2001
CMO__Constants.TargetTypeWRA.Aircraft_4th_Generation = 2002
CMO__Constants.TargetTypeWRA.Aircraft_3rd_Generation = 2003
CMO__Constants.TargetTypeWRA.Aircraft_Less_Capable = 2004
CMO__Constants.TargetTypeWRA.Aircraft_High_Perf_Bombers = 2011
CMO__Constants.TargetTypeWRA.Aircraft_Medium_Perf_Bombers = 2012
CMO__Constants.TargetTypeWRA.Aircraft_Low_Perf_Bombers = 2013
CMO__Constants.TargetTypeWRA.Aircraft_High_Perf_Recon_EW = 2021
CMO__Constants.TargetTypeWRA.Aircraft_Medium_Perf_Recon_EW = 2022
CMO__Constants.TargetTypeWRA.Aircraft_Low_Perf_Recon_EW = 2023
CMO__Constants.TargetTypeWRA.Aircraft_AEW = 2031
CMO__Constants.TargetTypeWRA.Helicopter_Unspecified = 2100
CMO__Constants.TargetTypeWRA.Guided_Weapon_Unspecified = 2200
CMO__Constants.TargetTypeWRA.Guided_Weapon_Supersonic_Sea_Skimming = 2201
CMO__Constants.TargetTypeWRA.Guided_Weapon_Subsonic_Sea_Skimming = 2202
CMO__Constants.TargetTypeWRA.Guided_Weapon_Supersonic = 2203
CMO__Constants.TargetTypeWRA.Guided_Weapon_Subsonic = 2204
CMO__Constants.TargetTypeWRA.Guided_Weapon_Ballistic = 2211
CMO__Constants.TargetTypeWRA.Satellite_Unspecified = 2300
CMO__Constants.TargetTypeWRA.Surface_Contact_Unknown_Type = 2999
CMO__Constants.TargetTypeWRA.Ship_Unspecified = 3000
CMO__Constants.TargetTypeWRA.Ship_Carrier_0_25000_tons = 3001
CMO__Constants.TargetTypeWRA.Ship_Carrier_25001_45000_tons = 3002
CMO__Constants.TargetTypeWRA.Ship_Carrier_45001_95000_tons = 3003
CMO__Constants.TargetTypeWRA.Ship_Carrier_95000_tons = 3004
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_0_500_tons = 3101
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_501_1500_tons = 3102
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_1501_5000_tons = 3103
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_5001_10000_tons = 3104
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_10001_25000_tons = 3105
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_25001_45000_tons = 3106
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_45001_95000_tons = 3107
CMO__Constants.TargetTypeWRA.Ship_Surface_Combatant_95000_tons = 3108
CMO__Constants.TargetTypeWRA.Ship_Amphibious_0_500_tons = 3201
CMO__Constants.TargetTypeWRA.Ship_Amphibious_501_1500_tons = 3202
CMO__Constants.TargetTypeWRA.Ship_Amphibious_1501_5000_tons = 3203
CMO__Constants.TargetTypeWRA.Ship_Amphibious_5001_10000_tons = 3204
CMO__Constants.TargetTypeWRA.Ship_Amphibious_10001_25000_tons = 3205
CMO__Constants.TargetTypeWRA.Ship_Amphibious_25001_45000_tons = 3206
CMO__Constants.TargetTypeWRA.Ship_Amphibious_45001_95000_tons = 3207
CMO__Constants.TargetTypeWRA.Ship_Amphibious_95000_tons = 3208
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_0_500_tons = 3301
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_501_1500_tons = 3302
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_1501_5000_tons = 3303
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_5001_10000_tons = 3304
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_10001_25000_tons = 3305
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_25001_45000_tons = 3306
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_45001_95000_tons = 3307
CMO__Constants.TargetTypeWRA.Ship_Auxiliary_95000_tons = 3308
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_0_500_tons = 3401
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_501_1500_tons = 3402
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_1501_5000_tons = 3403
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_5001_10000_tons = 3404
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_10001_25000_tons = 3405
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_25001_45000_tons = 3406
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_45001_95000_tons = 3407
CMO__Constants.TargetTypeWRA.Ship_Merchant_Civilian_95000_tons = 3408
CMO__Constants.TargetTypeWRA.Submarine_Surfaced = 3501
CMO__Constants.TargetTypeWRA.Subsurface_Contact_Unknown_Type = 3999
CMO__Constants.TargetTypeWRA.Submarine_Unspecified = 4000
CMO__Constants.TargetTypeWRA.Land_Contact_Unknown_Type = 4999
CMO__Constants.TargetTypeWRA.Land_Structure_Soft_Unspecified = 5000
CMO__Constants.TargetTypeWRA.Land_Structure_Soft_Building_Surface = 5001
CMO__Constants.TargetTypeWRA.Land_Structure_Soft_Building_Reveted = 5002
CMO__Constants.TargetTypeWRA.Land_Structure_Soft_Structure_Open = 5005
CMO__Constants.TargetTypeWRA.Land_Structure_Soft_Structure_Reveted = 5006
CMO__Constants.TargetTypeWRA.Land_Structure_Soft_Aerostat_Moring = 5011
CMO__Constants.TargetTypeWRA.Land_Structure_Hardened_Unspecified = 5100
CMO__Constants.TargetTypeWRA.Land_Structure_Hardened_Building_Surface = 5101
CMO__Constants.TargetTypeWRA.Land_Structure_Hardened_Building_Reveted = 5102
CMO__Constants.TargetTypeWRA.Land_Structure_Hardened_Building_Bunker = 5103
CMO__Constants.TargetTypeWRA.Land_Structure_Hardened_Building_Underground = 5104
CMO__Constants.TargetTypeWRA.Land_Structure_Hardened_Structure_Open = 5105
CMO__Constants.TargetTypeWRA.Land_Structure_Hardened_Structure_Reveted = 5106
CMO__Constants.TargetTypeWRA.Runway_Facility_Unspecified = 5200
CMO__Constants.TargetTypeWRA.Runway = 5201
CMO__Constants.TargetTypeWRA.Runway_Grade_Taxiway = 5202
CMO__Constants.TargetTypeWRA.Runway_Access_Point = 5203
CMO__Constants.TargetTypeWRA.Radar_Unspecified = 5300
CMO__Constants.TargetTypeWRA.Mobile_Target_Soft_Unspecified = 5400
CMO__Constants.TargetTypeWRA.Mobile_Target_Soft_Mobile_Vehicle = 5401
CMO__Constants.TargetTypeWRA.Mobile_Target_Soft_Mobile_Personnel = 5402
CMO__Constants.TargetTypeWRA.Mobile_Target_Hardened_Unspecified = 5500
CMO__Constants.TargetTypeWRA.Mobile_Target_Hardened_Mobile_Vehicle = 5501
CMO__Constants.TargetTypeWRA.Underwater_Structure = 5601
CMO__Constants.TargetTypeWRA.Air_Base_Single_Unit_Airfield = 5801

---see print(_enumTable_:Doctrine("weaponstate"));
---@type table<string,integer>
CMO__Constants.WRAWeaponState ={}
CMO__Constants.WRAWeaponState.LoadoutSetting = 0 ---@ use setting from database
CMO__Constants.WRAWeaponState.Winchester = 2001 ---@ Vanilla Winchester.
CMO__Constants.WRAWeaponState.Winchester_ToO = 2002 ---@ Same as above, but engage nearby bogies with guns after we're out of missiles. Applies to air-to-air missile loadouts only. For guns-only air-to-air loadouts and all air-to-ground loadouts the behaviour is the same as above. PREFERRED OPTION!
CMO__Constants.WRAWeaponState.ShotgunBVR = 3001 ---@ Disengage after firing all Beyond Visual Range (BVR, air-to-air) or Stand-Off (SO, air-to-ground) weapons. This is a risky option as your fighter aircraft may only have one medium-range air-to-air missile (AAM) left, and attempt to engage 'fresh' flights of bogies. Use with caution.
CMO__Constants.WRAWeaponState.ShotgunBVR_WVR = 3002 ---@ Same as above, but if easy targets or threats are nearby then shoot at them with remaining Within Visual Range (WVR, air-to-air) or SR (Short-Range, air-to-ground) weapons before disengaging.
CMO__Constants.WRAWeaponState.ShotgunBVR_WVR_Guns = 3003 ---@ Same as above, but also engage bogies with guns. Applies to air-to-air (A/A) loadouts only. For air-to-ground (A/G) loadouts the behaviour is the same as above.
CMO__Constants.WRAWeaponState.ShotgunOneEngagementBVR = 5001 ---@ Make one engagement with BVR or SO weapons. Continue fighting for as long as there are targets within easy reach and then disengage. This is a safe option as it ensures aircraft do not 'hang around' after they have expended their most potent weapons, and becoming easy targets when engaged by 'fresh' enemy units.
CMO__Constants.WRAWeaponState.ShotgunOneEngagementBVR_Opportunity_WVR = 5002 ---@ Same as above, but if easy targets or threats are nearby, shoot at them with remaining WVR or Short-Range weapons before disengaging. A target is considered 'easy' when within 120% of the remaining WVR or Strike weapon's maximum range. In other words, the fighter won't spend much energy chasing down a target after the Shotgun weapon state has been reached, and will leave the target area as quickly as possible. PREFERRED OPTION!
CMO__Constants.WRAWeaponState.ShotgunOneEngagementBVR_Opportunity_WVR_Guns = 5003 ---@ Same as above, but also engage bogies with guns. Applies to air-to-air (A/A) loadouts only. For air-to-ground (A/G) loadouts the behaviour is the same as above.
CMO__Constants.WRAWeaponState.ShotgunOneEngagementBVR_And_WVR = 5005 ---@ Make one engagement with BVR and WVR, or SO and Strike Weapons. Do not disengage when out of BVR or SO weapons, but continue the engagement with WVR weapons.
CMO__Constants.WRAWeaponState.ShotgunOneEngagementBVR_And_WVR_Opportunity_Guns = 5006 ---@
CMO__Constants.WRAWeaponState.ShotgunOneEngagementWVR = 5011 ---@ Make one engagement with WVR or SR weapons. Continue fighting for as long as there are targets within easy reach and then disengage.
CMO__Constants.WRAWeaponState.ShotgunOneEngagementWVR_Guns = 5012 ---@ Same as above but also engage bogies with guns. Applies to air-to-air (A/A) loadouts only. For air-to-ground (A/G) loadouts, the behaviour is the same as above. PREFERRED OPTION!
CMO__Constants.WRAWeaponState.ShotgunOneEngagementGun = 5021 ---@ Make one engagement with guns. Continue fighting for as long as there are targets nearby and then disengage.
CMO__Constants.WRAWeaponState.Shotgun25 = 4001 --- Disengage after 1/4 of mission-specific weapons have been expended.
CMO__Constants.WRAWeaponState.Shotgun25_ToO = 4002 ---@ Same as above, but if easy targets or threats are nearby then shoot at those too. Also engage bogies with guns. Applies to air-to-air (A/A) loadouts only.
CMO__Constants.WRAWeaponState.Shotgun50 = 4011 ---@ Disengage after half of mission-specific weapons have been expended.
CMO__Constants.WRAWeaponState.Shotgun50_ToO = 4012 ---@ Same as above, but if easy targets or threats are nearby then shoot at those too. Also engage bogies with guns. Applies to air-to-air (A/A) loadouts only.
CMO__Constants.WRAWeaponState.Shotgun75 = 4021 ---@ Disengage after 3/4 of mission-specific weapons have been expended.
CMO__Constants.WRAWeaponState.Shotgun75_ToO = 4022 ---@ Same as above, but if easy targets or threats are nearby then shoot at those too. Also engage bogies with guns. Applies to air-to-air (A/A) loadouts only.

---see print(_enumTable_:Doctrine("fuelstate")); for reverse
---@type table<string,integer>
CMO__Constants.WRAFuelState = {}
CMO__Constants.WRAFuelState.Bingo = 0;
CMO__Constants.WRAFuelState.Joker10Percent = 1
CMO__Constants.WRAFuelState.Joker20Percent = 2
CMO__Constants.WRAFuelState.Joker25Percent = 3
CMO__Constants.WRAFuelState.Joker30Percent = 4
CMO__Constants.WRAFuelState.Joker40Percent = 5
CMO__Constants.WRAFuelState.Joker50Percent = 6
CMO__Constants.WRAFuelState.Joker60Percent = 7
CMO__Constants.WRAFuelState.Joker70Percent = 8
CMO__Constants.WRAFuelState.Joker75Percent = 9
CMO__Constants.WRAFuelState.Joker80Percent = 10
CMO__Constants.WRAFuelState.Joker90Percent = 11
CMO__Constants.WRAFuelState.Various = 12
CMO__Constants.WRAFuelState.Chicken = 13
CMO__Constants.WRAFuelState.NotConfigured = 14

---see print(_enumTable_.FuelType) for the reverse.
---@type table<string,integer>
CMO__Constants.FuelType={};
CMO__Constants.FuelType.NoFuel = 1001
CMO__Constants.FuelType.AviationFuel = 2001
CMO__Constants.FuelType.DieselFuel = 3001
CMO__Constants.FuelType.OilFuel = 3002
CMO__Constants.FuelType.GasFuel = 3003
CMO__Constants.FuelType.Battery = 4001
CMO__Constants.FuelType.AirIndepedent = 4002
CMO__Constants.FuelType.RocketFuel = 5001
CMO__Constants.FuelType.TorpedoFuel = 5002
CMO__Constants.FuelType.WeaponCoast = 5003

---see print(_enumTable_:Doctrine("rechargebattery")) for reverse
---@type table<string,integer>
CMO__Constants.WRARechargeBattery = {}
CMO__Constants.WRARechargeBattery.NotConfigured = -101
CMO__Constants.WRARechargeBattery.Various = -100
CMO__Constants.WRARechargeBattery.Recharge_Empty = 0
CMO__Constants.WRARechargeBattery.Recharge_10_Percent = 10
CMO__Constants.WRARechargeBattery.Recharge_20_Percent = 20
CMO__Constants.WRARechargeBattery.Recharge_30_Percent = 30
CMO__Constants.WRARechargeBattery.Recharge_40_Percent = 40
CMO__Constants.WRARechargeBattery.Recharge_50_Percent = 50
CMO__Constants.WRARechargeBattery.Recharge_60_Percent = 60
CMO__Constants.WRARechargeBattery.Recharge_70_Percent = 70
CMO__Constants.WRARechargeBattery.Recharge_80_Percent = 80
CMO__Constants.WRARechargeBattery.Recharge_90_Percent = 90


---@type table<string,integer>
CMO__Constants.FlightSize = {}
CMO__Constants.FlightSize.None = 0
CMO__Constants.FlightSize.SingleAircraft = 1
CMO__Constants.FlightSize.TwoAircraft = 2
CMO__Constants.FlightSize.ThreeAircraft = 3
CMO__Constants.FlightSize.FourAircraft = 4
CMO__Constants.FlightSize.SixAircraft = 6
CMO__Constants.FlightSize.All = 'All'

---@type table<string,integer>
CMO__Constants.FlightQuantity = {}
CMO__Constants.FlightQuantity.None = 0
CMO__Constants.FlightQuantity.Flight_x1 = 1
CMO__Constants.FlightQuantity.Flight_x2 = 2
CMO__Constants.FlightQuantity.Flight_x3 = 3
CMO__Constants.FlightQuantity.Flight_x4 = 4
CMO__Constants.FlightQuantity.Flight_x6 = 6
CMO__Constants.FlightQuantity.Flight_x8 = 8
CMO__Constants.FlightQuantity.Flight_x12 = 12
CMO__Constants.FlightQuantity.All = 'All'

---@type table <string,integer>
CMO__Constants.GroupSize = {}
CMO__Constants.GroupSize.None = 0
CMO__Constants.GroupSize.SingleVessel = 1
CMO__Constants.GroupSize.TwoVessel = 2
CMO__Constants.GroupSize.ThreeVessel = 3
CMO__Constants.GroupSize.FourVessel = 4
CMO__Constants.GroupSize.SixVessel = 6
CMO__Constants.GroupSize.All = 'All'

---@type table <string,integer>
CMO__Constants.Stance = {}
CMO__Constants.Stance.Neutral = 0
CMO__Constants.Stance.Friendly = 1
CMO__Constants.Stance.Unfriendly = 2
CMO__Constants.Stance.Hostile = 3
CMO__Constants.Stance.Unknown = 4

---@type table <string,integer>@ active unit type code 0-7 (Useful for example in dealing with event TargetFilters)
CMO__Constants.UnitType ={}
CMO__Constants.UnitType.None = 0;
CMO__Constants.UnitType.Aircraft = 1;
CMO__Constants.UnitType.Ship = 2;
CMO__Constants.UnitType.Submarine = 3;
CMO__Constants.UnitType.Facility = 4;
CMO__Constants.UnitType.Aimpoint = 5;
CMO__Constants.UnitType.Weapon = 6;
CMO__Constants.UnitType.Satellite = 7;
CMO__Constants.UnitType.GroundFacility = 8;


---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.FixedUnitCategory  = {}
CMO__Constants.FixedUnitCategory.None = 1001
CMO__Constants.FixedUnitCategory.Runway = 2001
CMO__Constants.FixedUnitCategory.RunwayGradeTaxiway = 2002
CMO__Constants.FixedUnitCategory.RunwayAccessPoint = 2003
CMO__Constants.FixedUnitCategory.Building_Surface = 3001
CMO__Constants.FixedUnitCategory.Building_Reveted = 3002
CMO__Constants.FixedUnitCategory.Building_Bunker = 3003
CMO__Constants.FixedUnitCategory.Building_Underground = 3004
CMO__Constants.FixedUnitCategory.Underwater = 4001
CMO__Constants.FixedUnitCategory.Mobile_Vehicle = 5001
CMO__Constants.FixedUnitCategory.Mobile_Personnel = 5002
CMO__Constants.FixedUnitCategory.AerostatMooring = 6001
CMO__Constants.FixedUnitCategory.AirBase = 9001

---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.MobileUnitSubType  = {}
CMO__Constants.MobileUnitSubType .None = 0
CMO__Constants.MobileUnitSubType .Infantry = 1000
CMO__Constants.MobileUnitSubType .Armor = 2000
CMO__Constants.MobileUnitSubType .ArtilleryGun = 3000
CMO__Constants.MobileUnitSubType .ArtillerySSM = 4000
CMO__Constants.MobileUnitSubType .AAA = 5000
CMO__Constants.MobileUnitSubType .SAM = 6000
CMO__Constants.MobileUnitSubType .Engineer = 7000
CMO__Constants.MobileUnitSubType .Supply = 8000
CMO__Constants.MobileUnitSubType .Surveillance = 9000
CMO__Constants.MobileUnitSubType .Recon = 10000
CMO__Constants.MobileUnitSubType .MechInfantry = 11000

---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.UnitAircraftCategory = {}
CMO__Constants.UnitAircraftCategory.None = 1001
CMO__Constants.UnitAircraftCategory.Fixed_Wing = 2001
CMO__Constants.UnitAircraftCategory.Fixed_Wing_CarrierCapable = 2002
CMO__Constants.UnitAircraftCategory.Helicopter = 2003
CMO__Constants.UnitAircraftCategory.Tiltrotor = 2004
CMO__Constants.UnitAircraftCategory.Airship = 2006
CMO__Constants.UnitAircraftCategory.Seaplane = 2007
CMO__Constants.UnitAircraftCategory.Amphibian = 2008

---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.UnitAircraftSubType = {}
CMO__Constants.UnitAircraftSubType.None = 1001
CMO__Constants.UnitAircraftSubType.Fighter = 2001
CMO__Constants.UnitAircraftSubType.Multirole_FighterAttack = 2002
CMO__Constants.UnitAircraftSubType.Anti_Satellite_ASAT = 2101
CMO__Constants.UnitAircraftSubType.Airborne_LaserPlatform = 2102
CMO__Constants.UnitAircraftSubType.Attack = 3001
CMO__Constants.UnitAircraftSubType.WildWeasel = 3002
CMO__Constants.UnitAircraftSubType.Bomber = 3101
CMO__Constants.UnitAircraftSubType.Battlefield_AirInterdictionBAICAS = 3401
CMO__Constants.UnitAircraftSubType.Electronic_Warfare = 4001
CMO__Constants.UnitAircraftSubType.Airborne_Early_Warning = 4002
CMO__Constants.UnitAircraftSubType.Airborne_CommandPost = 4003
CMO__Constants.UnitAircraftSubType.Search_And_Rescue = 4101
CMO__Constants.UnitAircraftSubType.Mine_Sweeper = 4201
CMO__Constants.UnitAircraftSubType.AntiSubmarineWarfare = 6001
CMO__Constants.UnitAircraftSubType.Maritime_PatrolAircraft = 6002
CMO__Constants.UnitAircraftSubType.ForwardObserver = 7001
CMO__Constants.UnitAircraftSubType.AreaSurveillance = 7002
CMO__Constants.UnitAircraftSubType.Recon = 7003
CMO__Constants.UnitAircraftSubType.ElectronicIntelligence = 7004
CMO__Constants.UnitAircraftSubType.SignalsIntelligence= 7005
CMO__Constants.UnitAircraftSubType.Transport = 7101
CMO__Constants.UnitAircraftSubType.Cargo = 7201
CMO__Constants.UnitAircraftSubType.Commercial = 7301
CMO__Constants.UnitAircraftSubType.Civilian = 7302
CMO__Constants.UnitAircraftSubType.Utility = 7401
CMO__Constants.UnitAircraftSubType.NavalUtility = 7402
CMO__Constants.UnitAircraftSubType.Tanker_AirRefueling = 8001
CMO__Constants.UnitAircraftSubType.Trainer = 8101
CMO__Constants.UnitAircraftSubType.Target_Towing = 8102
CMO__Constants.UnitAircraftSubType.Target_Drone = 8103
CMO__Constants.UnitAircraftSubType.UAV = 8201
CMO__Constants.UnitAircraftSubType.UCAV = 8202
CMO__Constants.UnitAircraftSubType.Airship = 8901
CMO__Constants.UnitAircraftSubType.Aerostat = 8902

---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.UnitShipCategory = {}
CMO__Constants.UnitShipCategory.None = 1001
CMO__Constants.UnitShipCategory.Carrier = 2001
CMO__Constants.UnitShipCategory.SurfaceCombatant = 2002
CMO__Constants.UnitShipCategory.Amphibious = 2003
CMO__Constants.UnitShipCategory.Auxiliary = 2004
CMO__Constants.UnitShipCategory.Merchant = 2005
CMO__Constants.UnitShipCategory.Civilian = 2006
CMO__Constants.UnitShipCategory.SurfaceCombatantAVCap = 2007
CMO__Constants.UnitShipCategory.MobileOffshoreBase = 2008

---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.UnitShipSubType = {}
CMO__Constants.UnitShipSubType.None = 1001
CMO__Constants.UnitShipSubType.CV = 2001
CMO__Constants.UnitShipSubType.CVA = 2002
CMO__Constants.UnitShipSubType.CVB = 2003
CMO__Constants.UnitShipSubType.CVE = 2004
CMO__Constants.UnitShipSubType.CVGH = 2005
CMO__Constants.UnitShipSubType.CVH = 2006
CMO__Constants.UnitShipSubType.CVL = 2007
CMO__Constants.UnitShipSubType.CVN = 2008
CMO__Constants.UnitShipSubType.CVS_Seaplane =2009
CMO__Constants.UnitShipSubType.CVS_AntiSub =2010
CMO__Constants.UnitShipSubType.AVT = 2011
CMO__Constants.UnitShipSubType.B = 3001
CMO__Constants.UnitShipSubType.BB = 3002
CMO__Constants.UnitShipSubType.BBC = 3003
CMO__Constants.UnitShipSubType.BBG = 3004
CMO__Constants.UnitShipSubType.BBH = 3005
CMO__Constants.UnitShipSubType.BCGN = 3006
CMO__Constants.UnitShipSubType.BM = 3007
CMO__Constants.UnitShipSubType.C = 3101
CMO__Constants.UnitShipSubType.CA = 3102
CMO__Constants.UnitShipSubType.CAG = 3103
CMO__Constants.UnitShipSubType.CB = 3104
CMO__Constants.UnitShipSubType.CBG = 3105
CMO__Constants.UnitShipSubType.CG = 3106
CMO__Constants.UnitShipSubType.CGH = 3107
CMO__Constants.UnitShipSubType.CGN = 3108
CMO__Constants.UnitShipSubType.CL = 3109
CMO__Constants.UnitShipSubType.CLAA = 3110
CMO__Constants.UnitShipSubType.CLC = 3111
CMO__Constants.UnitShipSubType.CLG = 3112
CMO__Constants.UnitShipSubType.CLH = 3113
CMO__Constants.UnitShipSubType.CS = 3114
CMO__Constants.UnitShipSubType.D = 3201
CMO__Constants.UnitShipSubType.DD = 3202
CMO__Constants.UnitShipSubType.DDG = 3203
CMO__Constants.UnitShipSubType.DDH = 3204
CMO__Constants.UnitShipSubType.DDK = 3205
CMO__Constants.UnitShipSubType.DDR = 3206
CMO__Constants.UnitShipSubType.DE = 3207
CMO__Constants.UnitShipSubType.DEG = 3208
CMO__Constants.UnitShipSubType.DER = 3209
CMO__Constants.UnitShipSubType.DL = 3210
CMO__Constants.UnitShipSubType.DLG = 3211
CMO__Constants.UnitShipSubType.DM = 3212
CMO__Constants.UnitShipSubType.F = 3301
CMO__Constants.UnitShipSubType.FF = 3302
CMO__Constants.UnitShipSubType.FFG = 3303
CMO__Constants.UnitShipSubType.FFL = 3304
CMO__Constants.UnitShipSubType.PF = 3305
CMO__Constants.UnitShipSubType.LCS = 3306
CMO__Constants.UnitShipSubType.OPV = 3307
CMO__Constants.UnitShipSubType.USV = 3308
CMO__Constants.UnitShipSubType.PB = 3401
CMO__Constants.UnitShipSubType.PC_Coastal = 3402
CMO__Constants.UnitShipSubType.PC_Sub = 3403
CMO__Constants.UnitShipSubType.PCE = 3404
CMO__Constants.UnitShipSubType.PCF = 3405
CMO__Constants.UnitShipSubType.PCFG = 3406
CMO__Constants.UnitShipSubType.PG_GunBoat = 3407
CMO__Constants.UnitShipSubType.PG_Corvette = 3408
CMO__Constants.UnitShipSubType.PGM = 3409
CMO__Constants.UnitShipSubType.PH = 3410
CMO__Constants.UnitShipSubType.PHM = 3411
CMO__Constants.UnitShipSubType.PHT = 3412
CMO__Constants.UnitShipSubType.PT = 3413
CMO__Constants.UnitShipSubType.PTS = 3414
CMO__Constants.UnitShipSubType.MTB = 3415
CMO__Constants.UnitShipSubType.WHEC_CGHEC = 3416
CMO__Constants.UnitShipSubType.WHEC_CGMEC = 3417
CMO__Constants.UnitShipSubType.WPB = 3418
CMO__Constants.UnitShipSubType.WPG = 3719
CMO__Constants.UnitShipSubType.MCDV = 3420
CMO__Constants.UnitShipSubType.AGF = 4000
CMO__Constants.UnitShipSubType.AGC = 4001
CMO__Constants.UnitShipSubType.LCAC = 4002
CMO__Constants.UnitShipSubType.LCC = 4003
CMO__Constants.UnitShipSubType.LCM = 4004
CMO__Constants.UnitShipSubType.LCP = 4005
CMO__Constants.UnitShipSubType.LCT = 4006
CMO__Constants.UnitShipSubType.LCU = 4007
CMO__Constants.UnitShipSubType.LCVP = 4008
CMO__Constants.UnitShipSubType.LFR = 4009
CMO__Constants.UnitShipSubType.LHA = 4010
CMO__Constants.UnitShipSubType.LHD = 4011
CMO__Constants.UnitShipSubType.LKA = 4012
CMO__Constants.UnitShipSubType.LPD = 4013
CMO__Constants.UnitShipSubType.LPH = 4014
CMO__Constants.UnitShipSubType.LSD = 4015
CMO__Constants.UnitShipSubType.LSH = 4016
CMO__Constants.UnitShipSubType.LSL = 4017
CMO__Constants.UnitShipSubType.LSM = 4018
CMO__Constants.UnitShipSubType.LSMR = 4019
CMO__Constants.UnitShipSubType.LST = 4020
CMO__Constants.UnitShipSubType.LSU = 4021
CMO__Constants.UnitShipSubType.LSV = 4022
CMO__Constants.UnitShipSubType.LCI = 4023
CMO__Constants.UnitShipSubType.LSDV = 4024
CMO__Constants.UnitShipSubType.LCPA = 4025
CMO__Constants.UnitShipSubType.EPF = 4026
CMO__Constants.UnitShipSubType.ESD = 4027
CMO__Constants.UnitShipSubType.ESB = 4028
CMO__Constants.UnitShipSubType.A = 5001
CMO__Constants.UnitShipSubType.AD = 5002
CMO__Constants.UnitShipSubType.AE = 5003
CMO__Constants.UnitShipSubType.AF = 5004
CMO__Constants.UnitShipSubType.AFS = 5005
CMO__Constants.UnitShipSubType.AG = 5006
CMO__Constants.UnitShipSubType.AGB = 5007
CMO__Constants.UnitShipSubType.AGF = 5008
CMO__Constants.UnitShipSubType.AGI = 5009
CMO__Constants.UnitShipSubType.AGMR = 5010
CMO__Constants.UnitShipSubType.AGOR = 5011
CMO__Constants.UnitShipSubType.AGOS = 5012
CMO__Constants.UnitShipSubType.AGR = 5013
CMO__Constants.UnitShipSubType.AGS = 5014
CMO__Constants.UnitShipSubType.AGTR = 5015
CMO__Constants.UnitShipSubType.AH = 5016
CMO__Constants.UnitShipSubType.AK = 5017
CMO__Constants.UnitShipSubType.AKA = 5018
CMO__Constants.UnitShipSubType.AKE = 5019
CMO__Constants.UnitShipSubType.AKR = 5020
CMO__Constants.UnitShipSubType.AKS = 5021
CMO__Constants.UnitShipSubType.AO = 5022
CMO__Constants.UnitShipSubType.AOE = 5023
CMO__Constants.UnitShipSubType.AOL = 5024
CMO__Constants.UnitShipSubType.AOR = 5025
CMO__Constants.UnitShipSubType.AOT = 5026
CMO__Constants.UnitShipSubType.APA = 5027
CMO__Constants.UnitShipSubType.APD = 5028
CMO__Constants.UnitShipSubType.AR = 5029
CMO__Constants.UnitShipSubType.AS = 5030
CMO__Constants.UnitShipSubType.ATC = 5031
CMO__Constants.UnitShipSubType.ATA = 5032
CMO__Constants.UnitShipSubType.ATS = 5033
CMO__Constants.UnitShipSubType.AV = 5034
CMO__Constants.UnitShipSubType.AX = 5035
CMO__Constants.UnitShipSubType.ASR = 5036
CMO__Constants.UnitShipSubType.AP = 5037
CMO__Constants.UnitShipSubType.DSV = 5038
CMO__Constants.UnitShipSubType.AGM = 5039
CMO__Constants.UnitShipSubType.AD = 5040
CMO__Constants.UnitShipSubType.T_AGOS = 5101
CMO__Constants.UnitShipSubType.T_AH = 5102
CMO__Constants.UnitShipSubType.T_AK = 5103
CMO__Constants.UnitShipSubType.T_AKE = 5104
CMO__Constants.UnitShipSubType.T_AKR = 5105
CMO__Constants.UnitShipSubType.T_AO_FleetOiler = 5106
CMO__Constants.UnitShipSubType.T_AO_TransportOiler = 5107
CMO__Constants.UnitShipSubType.T_MLP = 5108
CMO__Constants.UnitShipSubType.MCD = 6001
CMO__Constants.UnitShipSubType.MCM = 6002
CMO__Constants.UnitShipSubType.MCS = 6003
CMO__Constants.UnitShipSubType.MHC = 6004
CMO__Constants.UnitShipSubType.ML = 6005
CMO__Constants.UnitShipSubType.MSC = 6006
CMO__Constants.UnitShipSubType.MSF = 6007
CMO__Constants.UnitShipSubType.MSI = 6008
CMO__Constants.UnitShipSubType.MSO = 6010
CMO__Constants.UnitShipSubType.MST = 6011
CMO__Constants.UnitShipSubType.MHI = 6012
CMO__Constants.UnitShipSubType.MM = 6013
CMO__Constants.UnitShipSubType.YAG = 7001
CMO__Constants.UnitShipSubType.YRT = 7002
CMO__Constants.UnitShipSubType.YRM = 7003
CMO__Constants.UnitShipSubType.Civilian = 9001
CMO__Constants.UnitShipSubType.Merchant = 9002
CMO__Constants.UnitShipSubType.Platform = 9003
CMO__Constants.UnitShipSubType.NGS_Buoy = 9004
CMO__Constants.UnitShipSubType.Bottom_FixedArraySonar = 9005
CMO__Constants.UnitShipSubType.Moored_SonoBuoy = 9006
CMO__Constants.UnitShipSubType.Special = 9007
CMO__Constants.UnitShipSubType.SmallWatercraft = 9008
CMO__Constants.UnitShipSubType.MobileOffshoreBase = 9011

---@type table <string,integer>
CMO__Constants.UnitSubmarineCategory = {}
CMO__Constants.UnitSubmarineCategory.None = 1001
CMO__Constants.UnitSubmarineCategory.Submarine = 2001
CMO__Constants.UnitSubmarineCategory.Biologics = 2002
CMO__Constants.UnitSubmarineCategory.FalseTarget = 2003

---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.UnitSubmarineSubType = {}
CMO__Constants.UnitSubmarineSubType.None = 1001
CMO__Constants.UnitSubmarineSubType.AGSS = 2001
CMO__Constants.UnitSubmarineSubType.APSS = 2002
CMO__Constants.UnitSubmarineSubType.SS = 2003
CMO__Constants.UnitSubmarineSubType.SSB = 2004
CMO__Constants.UnitSubmarineSubType.SSBN = 2005
CMO__Constants.UnitSubmarineSubType.SSG = 2006
CMO__Constants.UnitSubmarineSubType.SSGN = 2007
CMO__Constants.UnitSubmarineSubType.SSK = 2008
CMO__Constants.UnitSubmarineSubType.SSM = 2009
CMO__Constants.UnitSubmarineSubType.SSN = 2010
CMO__Constants.UnitSubmarineSubType.SSP = 2011
CMO__Constants.UnitSubmarineSubType.SSR = 2012
CMO__Constants.UnitSubmarineSubType.SSRN = 2013
CMO__Constants.UnitSubmarineSubType.SDV = 3001
CMO__Constants.UnitSubmarineSubType.ROV = 4001
CMO__Constants.UnitSubmarineSubType.UUV = 4002
CMO__Constants.UnitSubmarineSubType.UUG = 4003
CMO__Constants.UnitSubmarineSubType.Biologics = 9001
CMO__Constants.UnitSubmarineSubType.FalseTarget = 9002

---@type table <string,integer> @names may not be one to one with strings due to spaces etc.
CMO__Constants.WeaponType = {}
CMO__Constants.WeaponType.None = 1001
CMO__Constants.WeaponType.GuidedWeapon = 2001
CMO__Constants.WeaponType.Rocket = 2002
CMO__Constants.WeaponType.IronBomb = 2003
CMO__Constants.WeaponType.Gun = 2004
CMO__Constants.WeaponType.Decoy_Expendable = 2005
CMO__Constants.WeaponType.Decoy_Towed = 2006
CMO__Constants.WeaponType.Decoy_Vehicle = 2007
CMO__Constants.WeaponType.TrainingRound = 2008
CMO__Constants.WeaponType.Dispenser = 2009
CMO__Constants.WeaponType.ContactBomb_Suicide = 2010
CMO__Constants.WeaponType.ContactBomb_Sabotage = 2011
CMO__Constants.WeaponType.GuidedProjectile = 2012
CMO__Constants.WeaponType.SensorPod = 3001
CMO__Constants.WeaponType.DropTank = 3002
CMO__Constants.WeaponType.BuddyStore = 3003
CMO__Constants.WeaponType.FerryTank = 3004
CMO__Constants.WeaponType.Torpedo = 4001
CMO__Constants.WeaponType.DepthCharge = 4002
CMO__Constants.WeaponType.Sonobuoy = 4003
CMO__Constants.WeaponType.BottomMine = 4004
CMO__Constants.WeaponType.MooredMine = 4005
CMO__Constants.WeaponType.FloatingMine = 4006
CMO__Constants.WeaponType.MovingMine = 4007
CMO__Constants.WeaponType.RisingMine = 4008
CMO__Constants.WeaponType.DriftingMine = 4009
CMO__Constants.WeaponType.DummyMine = 4011
CMO__Constants.WeaponType.HeliTowedPackage = 4101
CMO__Constants.WeaponType.RV = 5001
CMO__Constants.WeaponType.Laser = 6001
CMO__Constants.WeaponType.HGV = 8001
CMO__Constants.WeaponType.Cargo = 9001
CMO__Constants.WeaponType.Troops = 9002
CMO__Constants.WeaponType.Paratroops = 9003


---@type table <string,integer> @names may not be one to one with strings.
CMO__Constants.LandCoverType = {}
CMO__Constants.LandCoverType.Water = 0
CMO__Constants.LandCoverType.Evergreen_Needleleaf_forest = 1
CMO__Constants.LandCoverType.Evergreen_Broadleaf_forest = 2
CMO__Constants.LandCoverType.Deciduous_Needleleaf_forest =3
CMO__Constants.LandCoverType.Deciduous_Broadleaf_forest =4
CMO__Constants.LandCoverType.Mixed_forest = 5
CMO__Constants.LandCoverType.Closed_shrublands = 6
CMO__Constants.LandCoverType.Open_shrublands = 7
CMO__Constants.LandCoverType.Woody_savannas = 8
CMO__Constants.LandCoverType.Savannas = 9
CMO__Constants.LandCoverType.Grasslands = 10
CMO__Constants.LandCoverType.Permanent_wetlands = 11
CMO__Constants.LandCoverType.Croplands = 12
CMO__Constants.LandCoverType.UrbanAndBuiltUp = 13
CMO__Constants.LandCoverType.CroplandNaturalVegetationMosaic = 14
CMO__Constants.LandCoverType.SnowAndIce = 15
CMO__Constants.LandCoverType.BarrenOrSparselyVegetated = 16
CMO__Constants.LandCoverType.Unclassified = 254
CMO__Constants.LandCoverType.Fill_Value = 255

---@type table <string,integer> @Zone Type codes, names represent the strings as well.
CMO__Constants.ZoneTypes = {};
CMO__Constants.ZoneTypes.NoNavZone = 0;
CMO__Constants.ZoneTypes.ExclusionZone = 1;

---@type table <string,integer> @Zone Type codes, names represent the strings as well.
CMO__Constants.PostureType = {};
CMO__Constants.PostureType.Neutral = 0; ---"Neutral | N"
CMO__Constants.PostureType.Friendly = 1; ---"Friendly | F"
CMO__Constants.PostureType.Unfriendly = 2; ---"Unfriendly | U"
CMO__Constants.PostureType.Hostile = 3; ---"Hostile | H"
CMO__Constants.PostureType.Unknown = 4; ---"Unknown | X"

---@type table <string,integer> @msgbox type codes.
CMO__Constants.MsgBoxType={};
CMO__Constants.MsgBoxType.OKOnly=0; ---Default
CMO__Constants.MsgBoxType.OKCancel=1;
CMO__Constants.MsgBoxType.AbortRetryIgnore=2;
CMO__Constants.MsgBoxType.YesNoCancel=3;
CMO__Constants.MsgBoxType.YesNoOnly=4;
CMO__Constants.MsgBoxType.RetryCancel=5;
---@type table <string,integer> @msgbox response string codes.
CMO__Constants.MsgBoxResult={}
CMO__Constants.MsgBoxResult.OK = "OK";
CMO__Constants.MsgBoxResult.No = "No";
CMO__Constants.MsgBoxResult.Yes = "Yes";
CMO__Constants.MsgBoxResult.Cancel = "Cancel";
CMO__Constants.MsgBoxResult.Retry = "Retry";
CMO__Constants.MsgBoxResult.Ignore = "Ignore";

---@type table <string,integer> @EventAction type strings and codes.
CMO__Constants.EventActionType={};
CMO__Constants.EventActionType.Points = 0;
CMO__Constants.EventActionType.EndScenario = 1;
CMO__Constants.EventActionType.TeleportInArea = 2;
CMO__Constants.EventActionType.Message = 3;
CMO__Constants.EventActionType.ChangeMissionStatus = 4;
CMO__Constants.EventActionType.LuaScript = 5;

---@type table <string,integer> @EventCondition type strings and codes.
CMO__Constants.EventConditionType={};
CMO__Constants.EventConditionType.SidePosture = 0;
CMO__Constants.EventConditionType.ScenHasStarted = 1;
CMO__Constants.EventConditionType.LuaScript = 2;


---@type table <string,integer> @EventTrigger type strings and codes.
CMO__Constants.EventTriggerType={};
CMO__Constants.EventTriggerType.UnitDestroyed = 0;
CMO__Constants.EventTriggerType.Points = 1;
CMO__Constants.EventTriggerType.Time = 2;
CMO__Constants.EventTriggerType.UnitDamaged = 3;
CMO__Constants.EventTriggerType.UnitRemainsInArea = 4;
CMO__Constants.EventTriggerType.UnitEntersArea = 5;
CMO__Constants.EventTriggerType.RandomTime = 6;
CMO__Constants.EventTriggerType.UnitDetected = 7;
CMO__Constants.EventTriggerType.ScenLoaded = 8;
CMO__Constants.EventTriggerType.RegularTime = 9;
CMO__Constants.EventTriggerType.ScenEnded = 10;
CMO__Constants.EventTriggerType.UnitBaseStatus = 11;
CMO__Constants.EventTriggerType.UnitEmissions = 12;
CMO__Constants.EventTriggerType.UnitCargoMoved = 13;


---@type table <string,integer> @EventTrigger RegularTime Interval codes.
CMO__Constants.EventTimeInterval = {}
CMO__Constants.EventTimeInterval.OneSecond= 0;
CMO__Constants.EventTimeInterval.FiveSeconds= 1;
CMO__Constants.EventTimeInterval.FifteenSeconds= 2;
CMO__Constants.EventTimeInterval.ThirtySeconds= 3;
CMO__Constants.EventTimeInterval.OneMinute= 4;
CMO__Constants.EventTimeInterval.FiveMinutes= 5;
CMO__Constants.EventTimeInterval.FifteenMinutes= 6;
CMO__Constants.EventTimeInterval.ThirtyMinutes= 7;
CMO__Constants.EventTimeInterval.OneHour= 8;
CMO__Constants.EventTimeInterval.SixHours= 9;
CMO__Constants.EventTimeInterval.TwelveHours= 10;
CMO__Constants.EventTimeInterval.TwentyFourHours= 11;

---@type table <string,integer> @cargo type enum names and values.
CMO__Constants.CargoType = {}
CMO__Constants.CargoType.NoCargo = 0;
CMO__Constants.CargoType.Personnel = 1000;
CMO__Constants.CargoType.SmallCargo = 2000;
CMO__Constants.CargoType.MediumCargo = 3000;
CMO__Constants.CargoType.LargeCargo = 4000;
CMO__Constants.CargoType.VLargeCargo = 5000;


--[[
    END CONSTANTS
--]]
