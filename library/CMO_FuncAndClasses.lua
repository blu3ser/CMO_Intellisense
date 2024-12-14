--[[
    This file is for use with VSCode and  sumneko's Lua Plugin (at least verion 2.4) or higher and VSCode 1.59+.
    If you include it in your project either in a workspace folder or as a seperate loaded user 'libary' (highly recommended)
    it should make dealing with CMO api in the editor much easier when it comes to code completion, undefined-globals 
    and other 'as you type' support.  The CMO__Constants.xxx tables are really just for ease of lookup when you need to know something.
    That said they're in a seperate library CMO__Constant.lua in case you want to actually load them into the game.

    I do not promise to constantly update this, though I may from time to time as things change meaningful errors are reported.
    EmmyLua tagging support is always changing in Sumneko's plugin so as things improve or change I may have to re-work things.
    Take this as is, adapt as needed.

lastupdated: 11/13/2021
sumneko version at time: 2.4.0 (2.4.7 available but untested)
vscode version at time: 1.59
CMO version at time: 1.05.1309.10
--]]

---@meta
---@class CMO__UnitSelector:table @ The standard unit selector table. {name + side} or {guid}.
---@field name? string @The name of the unit to select
---@field side? string @The side of the unit to select
---@field guid? string @The guid of the unit to select

---@class CMO_Time:string @ Standard format time "%d/%m/%Y %H:%M"

---@class CMO__FillMagClass:table @ The standard unit selector table + magazines to fill. {name + side} or {guid}.
---@field name? string @The name of the unit to select
---@field side? string @The side of the unit to select
---@field guid? string @The guid of the unit to select
---@field loadoutid integer @The database id of the loadout
---@field quantity integer @The number of 'packs' in the loadout to add  

---@class CMO__DoctrineSelector:table @ selects Doctrine for the side, the mission, the unit, or group specified.
---@field guid? string @Guid of the unit
---@field side? string @The side to select/from --name or guid of side doctrine you want. (highest level)
---@field mission? string @The name of the mission to select --name or guid of mission doctrine you want
---@field unitname? string @The name of the unit (or group) to select --name or guid of unit doctrine you want. (lowest level) unitname applies to GROUPS as well.
---@field actual? boolean @=true Show the actual doctrine setting based on doctrine inheritance (defaults to only showing non-inherited values)
---@field escort? boolean @If a strike mission, adding 'escort=true' will update the escort doctrine
---@field PLAYER_EDITABLE? boolean @If including during selector usage tell the operation to return the '_player_Editable' boolean entries for each setting as well. (undocumented.)

---@class CMO__VPContactSelector:table
---@field guid string @ guid of the contact.


---@class CMO__DoctrineWRASelector:table @ Selects a WRA doctrine for on a side, group, mission, or unit. weapon_id is mandatory.  
---One of side, mission, unitname or guid is mandatory. One of contact_id or target_type is mandatory  
---If no weapon_id is supplied but just the target_type, then a WRA table (WRA_#) is returned for each weapon for the doctrine that can engage the target_type
---@field SIDE? string @The side to select/from
---@field MISSION? string @The name of the mission to select
---@field UNITNAME? string @The name of the unit to select
---@field NAME? string @The name of the unit to select (can be used instead of UnitName)
---@field GUID? string @The unit GUID to select
---@field WEAPON_ID? string @The weapon database id
---@field WEAPON_DBID? string @The weapon database id (This can be used instead of weapon_id)
---@field CONTACT_ID? string @A contact GUID (mutually exclusive with target_type)
---@field TARGET_TYPE? string@The target type (mutually exclusive with contact_id)


---@class CMO__Weapon2MountDescriptor:table @ for use with AddReloadsToUnit() AddWeaponToUnitMagazine()
---@field side? string @ The side name/GUID of the unit with mount
---@field unitname? string @ The name/GUID of unit with mount
---@field guid? string @ GUID of the unit with mount
---@field mount_guid? string @ The mount GUID if working with a mount
---@field mag_guid? string @ The guid of the magazine if working with a mag.
---@field max_cap? integer @ the max to apply to the added weapon record (only when dealing with a mag - nonfunctional for mounts.)
---@field wpn_dbid string|number @ The weapon database ID
---@field number number @ Number to add
---@field remove? boolean @ If true, this will debuct the number of weapons
---@field fillout? boolean @ If true, will fill out the weapon record to its maximum

---@class CMO__TargetInformation:table @Target information for units
---@field CMO_Contact @ The Contact information of the unit
---@class CMO__Enum_Table:table @ definitions for _enumTable_ global taken from .net LuaEnuNames
---@field Altitude table @ table of altitude presets [enum]=stringname
---@field Condition_Air table @ table of possible conditions for air units. [enum]=stringname
---@field Condition_Dock table @ table of possible condition for boat units. [enum]=stringname
---@field ContactType table @ table of contact types [enum]=stringname
---@field Depth table  @ table of depth presets [enum]=stringname
---@field FuelState table @ table of fuel types [enum]=stringname
---@field FuelType table  @ table of fuel types [enum]=stringname
---@field guidanceType table @table of guidanceType for a weapon [enum]=stringname
---@field PatrolType table @ table of Patrol mission Types [enum]=stringname
---@field Proficiency table @ table of side\unit Proficiency [enum]=stringname
---@field sensorRole table @ table of sensor Roles codes [enum]=stringname
---@field sensorType table @ table of sensor Tyep codes [enum]=stringname
---@field strikeType table @ table of Strike mission Types [enum]=stringname
---@field Throttle table @ table of throttle presets [enum]=stringname
---@field UnitType table @ table of Unit Type codes [enum]=stringname
---@field warheadType table @ table of warhead type codes [enum]=stringname
---Method to return a table, parameter Can but one of 'fuelstate'|'weaponstate'|'rechargebattery'|'wratargettype'

---@class CMO__Enum_Table
local CMO__Enum_Table = {}
---@param name string @ the name of doctrine
---@return table|nil @ returns table <integer-enumvalue,string-value>
function CMO__Enum_Table:Doctrine(name)end


---@class CMO__Zone:table
---@field guid string @The GUID of the zone. READ ONLY.
---@field type string @ the type of the zone 'NoNavZone' = 0 | 'ExclusionZone' = 1
---@field description string @The description of the zone.
---@field isactive boolean @Zone is currently active.
---@field area CMO__TableOfReferencePoints @A set of reference points marking the zone. Can be updated by a list of RPs, or a table of new RP values.
---@field affects? table @List of unit types (ship, submarine, aircraft, facility)
---@field locked? boolean @Zone is locked or not.
---@field markas? string @Posture of violator of exclusion zone.
---@field relativeto? string @ unitname or unitguid of unit to make this zones area relative-to. (undocumented) Also the side of the unit must match the 
---@field rename? string @ name to rename the description/name to [only applies for calls to ScenEdit_SetZone]


---@alias CMO__TableOfZones table<integer,CMO__Zone> @ a table of CMO_Zone tables.


---@class CMO__HostUnit:table @Source and destination unitnames or guids.
---@field HostedUnitNameOrID string @The name or GUID of the unit to put into the host.
---@field SelectedHostNameOrID string @The name or GUID of the host to put the unit into. Use SetUnit() with 'base=xxx' to assign the unit to a 'base' or unit.base = a base unit wrapper.

---@class CMO__Facility:table @ A base or dock.
---@field guid string @GUID of the facility
---@field dbid number @Database ID of the facility unit.
---@field name string @Name of the facility unit.
---@field type number @Type of the facility - 'AirGroup'=0,'SurfaceGroup','SubGroup',	'Installation', 'MobileGroup', 'AirBase', 'NavalBase'=6.
---@field status string @Status of the facility
---@field capacity number @number of Units present at the facility?

---@class CMO__LatLon:table @ latitude and longitude table.
---@field latitude number @ lat in decimal format
---@field longitude number @ lon in decimal format
---@field Latitude number @ lat in decimal format
---@field Longitude number @ lon in decimal format

---@class CMO__Location:table @ latitude and longitude entry.
---@field latitude number|string @ lat in decimal format
---@field longitude number|string @ lon in decimal format
---@alias CMO__TableOfLocations table<integer,CMO__Location>


---@Eitehr name or guid of the unit can be used.
---@class CMO__SideUnit:table
---@field guid string @guid of the unit.
---@field name string @name of unit.

---@Either name or guid of the contact can be used.
---@class CMO__SideContact:table
---@field guid string @guid of the contact relative to this side. NOTE: this is NOT the guid of the unit.
---@field name string @name of the contact relative to this side.

---The side and newside must be string names and not guids. All three required.
---They must be in the order of t = {side=,name,newside}
---@class CMO__SideDescription:table
---@field guid string @guid of the unit to select.
---@field side string @The original string side name of unit.
---@field name string @Name or guid of the unit to change. 
---@field unitname string @Name or guid of the unit to change.(prefered when doing a set operation)
---@field newside string @Name of the side to change the specified unit to.

---Either name or guid of the side may be used.
---@class CMO__SideSelector:table
---@field guid string ?@The GUID of the side to select. Much Preferred if available.
---@field Name string|nil ?@Depricated - The name of the side to select. (internally converted to side property)
---@field side string|nil ?@The name of the side to select.


---@class CMO__SideOptions:table @ a side options detail table.
---@field side string ?@Side name
---@field guid string ?@Side guid
---@field awareness string|integer ?@Side awareness enum code -1 to 3 or keyword string name. (BLIND,NORMAL,AUTOSIDE,AUTOUNIT,OMNI)
---@field proficiency string|integer ?@Side proficiency enum code 0-4 or keyword string name.
---@field switchto boolean ?@ Change players game side to side option specified. (only applicable with ScenEdit_SetSideOptions() )



---@class CMO__Weather:table
---@field temp number @Temperature (average for GetWeather(), or time-of-day for unit/contact).
---@field rainfall number @Rainfall rate.
---@field undercloud number @Fraction under cloud.
---@field seastate integer @Sea state.


---@class CMO__ReferencePointDescriptor:table @ reference point selection getter|setter
---@field side string The side the reference point is visible to (sidename may also be used in place of side)
---@field name ? string @ the name a reference pointname belonging toside [name AND side if possible] or the name you want when Adding.
---@field guid? string @ if the unique ID of the reference point is known [preferred] or
---@field area? table @ table of reference points (name or guid) or table of latitude & longitude locations. When using in AddReferencePoint() can be multiple.
---@field newname? string @ 'string' to rename a reference points name too IF using SetReferencePoint() 
---@field clear? boolean @ set this to true to remove the 'relative to' portion of the the reference point when using SetRefferencePoint()
---@field highlighted? boolean @ True to flip the reference point(s)highlight, false to turn it off/deselect it.  (wrong in the documentation as togglehighlighted)
---@field locked? boolean @ true to se the reference point to locked, false to unlock
---@field bearingType? number @ one of 'Fixed'-0 or 'Rotating'-1
---@field relativeTo? string @ guid of unit ON THE SAME SIDE that this reference point is relative to or 'none' to clear it.
---@field bearing?  number @ the bearing to set if relativeto is set to to fixed.
---@field distance? number @ the distance to try to keep from the relative to unit if bearingType is used.
---@field hidden? boolean @ indicates if the RP should be hidden from the player.



---@class CMO__ReferencePoint:table
---@field guid string @The unique identifier for the reference point.
---@field side string @The side the reference point is visible to.
---@field name string @The name of the reference point.
---@field latitude number @The latitude of the reference point.
---@field longitude number @The longitude of the reference point.
---@field highlighted? boolean @True if the point should be selected.
---@field locked? boolean @True if the point is locked.
---@field bearingtype? number @Type of bearing Fixed (0) or Rotating (1).
---@field relativeto? CMO__Unit @The unit that reference point is realtive to.
---@field hidden? boolean @ indicates if the RP should be hidden from the player.
---@alias CMO__TableOfReferencePoints table<number,CMO__ReferencePoint> @table of ReferencePoints.


---@class CMO__Mine:table @ a mine weapon unit table entry.
---@field guid string @ guid of the mine-unit 
---@field type string @ type of mine.
---@field delay integer @ number of seconds the delay is set for (or left?)
---@field depth number @ the depth of the mine weapon
---@field latitude number @ the lat of the unit.
---@field longitude number @ the lon of the unit.

---@alias CMO__TableOfMines table<integer,CMO__Mine> @ a table of mine weapons such as from GetMinefield() table is ipairs friendly.


---@class CMO__EMMatchTable:table
---@field dbid number @Databse id.
---@field name string @Matching id name.
---@field category string @Not applicable to weapons (Missile,Torpedo).
---@field type string @Not applicable to Facility.
---@field subtype number @Type of item within the contact type ( subtype is "Fighter" within scope of Aircraft).
---@field missile_defence? number @Applicable to Facility and Ships.

---@alias CMO__TableOfEMMatchTables table<number,CMO__EMMatchTable> @ table of EM Match entries.


---@class CMO__Emissions:table
---@field name string @ undefined(KH: need to test this).
---@field age number @Time detection held.
---@field solid string @Precise detected (True/false) (Why is this not a boolean?).
---@field sensor_dbid number @Databse id.
---@field sensor_name string @Sensor name.
---@field sensor_type string @Sensor type.
---@field sensor_role string @Sensor role.
---@field sensor_maxrange number @Sensor range.

---@alias CMO__TableOfEmissions table<number,CMO__Emissions> @ table of Emissions entries.


---@class CMO__ContactDetection:table @ a CMO__Contact.lastDetection entry
---@field detector_guid string @ the guid of the unit who made the detection or "" or "?" if unknown.
---@field detect_sensor_guid string @ the guid of the sensor (on the detecting unit) that made the detection.
---@field range number @ the approximate range in numeric nautical miles the contact is from the detecting sensor.
---@field special_mode number @ the mode of the detection this is an enum value between 1 and 5 (idk wtf these are just yet) added in 1147.35.
---@field age number @ The age in seconds of this detection entry relative to the current scenario time. 

---@alias CMO__TableOfContactDetections table<number,CMO__ContactDetection> @ table of ContactDetections (.lastDetections).

---@class CMO__Scenario @CMO Scenario wrapper (userdate:table)
---@field CampaignScore number @Current campaign score
---@field CampaignSessionID string @Current campaign session id
---@field CampaignID string @Campaign guid
---@field ContentTag string @ Get the ContentTag (DRM related).
---@field Complexity number @Complexity rating
---@field CurrentTime string @Current scenario time
---@field CurrentTimeNum number @Current scenario time as a number (of seconds) equivalent
---@field DBUsed string @Name of database being used
---@field Difficulty number @Difficulty rating
---@field Duration string @Length of scenario as days:hours:minutes:seconds
---@field DurationNum number @Length of scenario as a number (of seconds) equivalent
---@field fields table @ field of this object.
---@field FileName string @Name of the scenario file (.scen/.save)
---@field FileNamePath string @ the path to folder where the current playing scenario resides. (undocumented.)
---@field GameMode number @ byte value of the current game mode? (campaign vs non campaign? editor vs non editor?)
---@field GameStatus number @ byte value of the current game status? (paused not paused?)
---@field guid string @Current scenario GUID
---@field HasStarted boolean @Scenario in play
---@field InCampaignMode boolean @Currently in campaign mode
---@field PlayerSide string @Current player side GUID
---@field SaveVersion string @Game version last saved under
---@field ScenSetting string @The setting of the scenario
---@field ScenDate number @Year of settings
---@field Sides number @Number of sides in scenario
---@field StartTime string @Starting time
---@field StartTimeNum number @Starting time as a number (of seconds) equivalent
---@field TimeCompression number @Compression mode
---@field Title string @Title of the scenario
local CMO__Scenario = {} -- dummy var so we can attach functions to CMO__Scenario
---function to reset the loss and expendatures of ALL sides.
---@return boolean @ allways returns true unless some other game stopping exception.
function CMO__Scenario:ResetLossExp() end
---function to reset the scores of ALL sides.
---@return boolean @ allways returns true unless some other game stopping exception.
function CMO__Scenario:ResetScore() end



---@class CMO__Contact @CMO Contact Wrapper (userdata:table) 
---@field name string @name of the contact.
---@field guid string @The contact GUID. READ-ONLY.
---@field actualunitid string @The contacts actual guid. READ-ONLY.
---@field latitude number @The latitude of the contact. READ-ONLY.
---@field longitude number  @The longitude of the contact. READ-ONLY.
---@field lastDetections CMO__TableOfContactDetections @ a table of detection entries last made on this contact.
---@field speed number  @Speed if known READ-ONLY.
---@field heading number  @Heading if known READ ONLY.
---@field altitude number  @Altitude if known READ ONLY.
---@field missile_defence number  @Applicable to Facility and Ships. -1 = unknown contact READ ONLY.
---@field age number  @How long has contact been detected (in seconds) READ ONLY.
---@field type string  @Type of contact. READ ONLY.
---@field typed number  @Type of contact numeric. READ ONLY.
---@field type_description string  @Contact type description. READ ONLY.
---@field areaofuncertainty table  @LatLon Table of points defining the area of contact. READ ONLY.
---@field actualunitdbid number  @Actual contacts underlying DBID. READ ONLY.
---@field classificationlevel number  @Contact classification. READ ONLY.
---@field potentialmatches CMO__EMMatchTable @Table {EMmatch} on potential EMCON emission matches. READ ONLY
---@field side CMO__Side @Contact"'"s actual side. READ ONLY.
---@field fromside CMO__Side @The side who sees this contact. READ ONLY.
---@field detectedBySide CMO__Side @The side who originally saw this contact. Would be same as fromside unless shared READ ONLY.
---@field posture string @Posture towards contact.
---@field FilterOut boolean @True to filtered out contact.
---@field weather CMO__Weather @Table of weather parameters (temp, rainfall, underrain, seastate).
---@field BDA table @Table of battle damage assessment (fires, flood, structural).
---@field emissions CMO__Emissions @Table of detected emmissions from contact.
---@field detectionBy table @Table of how long ago was detected by type (radar, esm, visual, infrared, sonaractive, sonarpassive).
---(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables)  
---@field targetedBy table @Table of unit guids that have this contact as a target
---(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables)  
---@field firingAt table @Table of contact guids that this contact is firing at.
---(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables23232)  
---@field firedOn table @Table of guids that are firing on this contact.
---@type CMO__Contact

---@class CMO_Contact
local CMO__Contact = {} ----dummy entry to attach funcs
---Drops contact from the reporting side
---@return boolean|nil 
function CMO__Contact:DropContact() end
---Is contact in the 'area' defined by table of RPs.
---@param area CMO__TableOfReferencePoints @Table of CMO__ReferencePoints.
---@return boolean @true|false
function CMO__Contact:inArea(area) end

---@alias CMO__TableOfContacts table<integer,CMO__Contact> @ a table of CMO Contact wrappers.


---@class CMO__ConfigTable:table @
---@field UseEmissionInterval  ? number Use 0 to turn off or 1 to turn on the Intermittent Emission
---@field EmissionDuration ? number Emission duration in seconds
---@field EmissionInterval ? number Emission interval in seconds
---@field EmissionIntervalVariation ? number Emission variation in seconds
---@field SleepModeDelay ? number Time to sleep in seconds
---@field FollowWRAforWakeBehavior ? number Use 0 to turn off or 1 to turn on to follow WRA behavior (UI ???)
---@field WakeWhenDetectingThreat ? number Use 0 to turn off or 1 to turn on wake up on detecting threat
---@field WakeID_UNKNOWN ? number Use 0 to turn off or 1 to turn on wake if unknown on detection
---@field WwkeID_PRECISEID  ? number Use 0 to turn off or 1 to turn on if precice ID
---@field WakeID_KNWONTYPE ? number Use 0 to turn off or 1 to turn on if known type
---@field WakeIDKNOWNDOMAIN ? number Use 0 to turn off or 1 to turn on if known domain
---@field WakeIDKNOWNCLASS ? number Use 0 to turn off or 1 to turn on if known class
---@field WakeStance_FRIENDLY ? number Use 0 to turn off or 1 to turn on if friendly
---@field WakeStance_HOSTILE ? number Use 0 to turn off or 1 to turn on if hostile
---@field WakeStance_NEUTRAL ? number Use 0 to turn off or 1 to turn on if neutral
---@field WakeStance_UNFRIENDLY ? number Use 0 to turn off or 1 to turn on if unfriendly
---@field WakeStance_UNKNOWN ? number Use 0 to turn off or 1 to turn on if unknown stance



---@class CMO__Group:table @ GroupWrapper.
---@field type string @Type of group. READ ONLY 'AirGroup'=0,'SurfaceGroup','SubGroup',	'Installation', 'MobileGroup', 'AirBase', 'NavalBase'=6.
---@field guid string @READ ONLY
---@field name string @ name of the group
---@field side string @ side name READ ONLY
---@field lead? string @ guid of the Group leader
---@field unitlist table @Table of unit GUIDs in the group{[1]=guid,...}. READ ONLY


---@class CMO__Formation:table @ Formation details table entry.
---@field guid string @ guid of the unit.
---@field bearing number @ bearing of the unit.
---@field type string @ 'Fixed', or 'Rotating'
---@field distance number @ distance in nm that is desired.
---@field sprint boolean @ true or false if sprint-drift enabled.
---@field latitude number @ present lat of the desired position
---@field longitude number @ present lon of the desired position.
---@field lead boolean @ *This only exists if the unit entry in question IS actually the lead unit.

---@alias CMO__TableOfFormations table<string,CMO__Formation> @ Used by ScenEdit_GetFormation()



---@class CMO__Side:table @SideWrapper
---@field guid string @The GUID of the side.
---@field name string @The name of the side.
---@field units CMO__SideUnit @Table of units for the designated side. READ ONLY. Sorted into subtable by unit type{aircraft={tableofsideunitshere}ships={etchere}}.
---@field contacts CMO__SideContact @Table of current contacts for the designated side. READ ONLY.
---@field exclusionzones CMO__TableOfZones @Table of Zones for the designated side READ ONLY.
---@field nonavzones CMO__TableOfZones @Table of Zones for the designated side READ ONLY.
---@field rps CMO__TableOfReferencePoints @Table of ReferencePoints for the designated side READ ONLY.
---@field awareness number @Awareness READ ONLY.
---@field proficiency number @Proficiency READ ONLY.
---@field hasmines boolean @idk side has mines? READ ONLY.
---@field losses table @Table of losses to date - {type, dbid, name, number}.
---@field expenditures table @Table of expenditure to date - {type, dbid, name, number}.
---@field missions table @Table of Mission wrappers for missions on the side.
---@type CMO__Side

---@class CMO__Side
local CMO__Side = {} ----dummy entry to attach funcs
---Method returns first matching Exclusion-Zone or nil
---@param ZoneIdentifier string @ZoneGuid|ZoneName|ZoneDescription of the zone to get.
---@return CMO__Zone | nil --@returns Zone or nil on no match.
function CMO__Side:getexclusionzone(ZoneIdentifier) end --Returns matching Zone or nil
---Method returns first matching NoNav-Zone or nil
---@param ZoneIdentifier string @ZoneGuid|ZoneName|ZoneDescription of the zone to get.
---@return CMO__Zone|nil @returns Zone or nil on no match.
function CMO__Side:getnonavzone(ZoneIdentifier) end
---Method returns table of units filtered by type of unit or nil. Note that if using SubType but not Category remember to feed Category as nil.
---@param UnitType string @Type of the unit to filer on ('Aircraft','Submarine','Ship',etc..).
---@param Category? string @Category of a unit type to additionally filter on ('Aircraft','Submarine','Ship',etc..) may not apply to all types.
---@param Subtype? string @SubType of the unit type to additinally filer on ('Aircraft','Submarine','Ship',etc..) may not appy to all types.
---@return table |nil @Returns a numerical indexed table of units {name, guid} or nil on no match.
---local u = side:side:unitsBy('Ship') -- all ships  
---u = side:unitsBy('Ship', 2002, 3003) -- ships fitered for 'Surface combatant' and 'BBC'
function CMO__Side:unitsBy(UnitType,Category,Subtype) end

---comment
---@param ZoneIdentifier string @Guid identifier of the zone to retrieve
---@return table @A table with the RP names of the zone
function CMO__Side:getstandardzone(ZoneIdentifier) end

---Method returns table of current contacts filtered by type of unit or nil
---@param UnitType string @Type of the unit to filer on ('Aircraft','Submarine','Ship',etc..).
---@return table |nil @Returns a numerical indexed table of units {name, guid} or nil on no match.
function CMO__Side:contactsBy(UnitType) end
---Method returns table of units {name,guid} filtered by type of unit.
---@param AreaAndTargetFilerTable table @A table of {Area={}, [TargetFilter={}]}.
---Area={{latitude=123,longitude=124},{etc},{etc},{etc}} or these could be rp's. So long a the submittion has lat and lon entries.
---TargetFilter={TARGETTYPE="Aircraft",SPECIFICUNITCLASS="2212"} filter on aircraft with dbid 2212.
---@return table |nil @Returns a numerical indexed table of units {name, guid} or nil on no match.
function CMO__Side:unitsInArea(AreaAndTargetFilerTable) end

---@alias CMO__TableOfSides table<number,CMO__Side>

---@class CMO__AreaTableAndTargetFilterTable:table
---@field Area table @a table containing at least lat and lons, or rps, representing defining the area.
---@field TargetFilter? CMO__TargetFilter-UnitsInArea @table of targetfilter entries


--- Seperate for events, a targetfilter that does not have an area.  
--- Important to note that if supplying this in say a trigger, and what you specify does not exist yet.
--- Then if someone opens the trigger in the editor it can overwrite some of the entries where things dont exist.  
--- For example say you set specific unit class of #4875 for an f-22. But no f-22's exist with that dbid yet in scene yet
--- well now it will overrite that setting with none.  So timing can be important if you want to make sure someone opening
--- your scene or playing it in the editor doesn't screw shit up if you're pre-setting it.
---@class CMO__TargetFilter-UnitsInArea:table
---@field ID string @Guid of the target filter in a trigger etc. READONLY never supply this its just here for completeness, you should almost never need this.
---@field TARGETSIDE string @ side of the unit.
---@field TARGETTYPE string @ basic type of unit.
---@field TARGETSUBTYPE? integer @ type code of the subtype of a unit.
---@field SPECIFICUNITCLASS? integer @ dbid code of the type of a unit.
---@field SPECIFICUNIT? string @ guid of a specific unit.


---@class CMO__Mission:table @MissionWrapper
---@field guid ? string @The GUID of the mission. READ ONLY
---@field name ? string @Name of mission.
---@field isactive ? boolean @True if mission is currently active.
---@field side ? string @The side the Mission belongs to.
---@field starttime ? string|osdate @ DateTime Time mission starts.
---@field endtime ? string|osdate @DateTime Time mission ends.
---@field type ? string @MissionClass Mission class(patrol,strike,etc). READ ONLY
---@field subtype ? string @MissionSubClass Mission class(asw,land,etc). READ ONLY
---@field SISH ? boolean @'Scrub if side human' tick box
---@field unitlist ? table @ A table of units assigned to mission containing GUIDs of the units . READ ONLY
---@field targetlist? table @ A table of targets assigned to mission containing GUIDs of the contacts or units. READ ONLY
---@field aar? CMO__Mission_AAR @ A table of the mission air-to-air refueling options. READ ONLY
---@field ferrymission? table @ FerryMission A table of the mission specific options. READ ONLY
---@field mineclearmission? table @ MineClearMission A table of the mission specific options. READ ONLY
---@field minemission? table @MineMission A table of the mission specific options. READ ONLY
---@field supportmission? table @ SupportMission A table of the mission specific options. READ ONLY
---@field patrolmission? table @ PatrolMission A table of the mission specific options. READ ONLY
---@field strikemission? table @ StrikeMission A table of the mission specific options. READ ONLY
---@field cargomission? table @ CargoMission A table of the mission specific options. READ ONLY
---@field TakeOffTime? string|osdate @ os.date() format for the take off time
---@field TimeOnTargetStation? string|osdate @ os.date() format for the time on target or station

---@class CMO__Mission_AAR:table @MissionAAR table
---@field Doctrine_UseReplenishment? string @ When 'getting' this is string value of use_refuel_unrep (undocumented).
---@field use_refuel_unrep string? @This is same as the one from Doctrine setting, meaning '0' yes-exlc tankers,'1' never,'2' Always-Inctank2tank.
---@field TankerUsage string? @ or number Automatic(0), Mission(1)
---@field LaunchMissionWithoutTankersInPlace boolean? @ self explainitory?
---@field TankerMissionList table? @ {mission name or GUID Table of missions to use as source of refuellers, its GUIDs when getting, can use either when setting.
---@field TankerMinNumber_total number? @ for tanker support mission?
---@field TankerMinNumber_airborne number? @ for tanker support missions?
---@field TankerMinNumber_station number? @ for tanker support missions?
---@field MaxReceiversInQueuePerTanker_airborne number? @ self explainitory?
---@field FuelQtyToStartLookingForTanker_airborne number? @Percentage of fuel (0-100) where units on this mission start trying to refuel.
---@field TankerMaxDistance_airborne string|number? @ or number Use 'internal' or set a range. The code will match the lowest availble setting
---@field TankerFollowsReceivers boolean @ undocumented.



---@class CMO__PatrolMission:table @ PatrolMission options; these are updated by ScenEdit_SetMission()
---@field type string @Subtype of mission (ASW = 'asw', ASuW_Naval = 'naval', AAW = 'aaw', ASuW_Land = 'land', ASuW_Mixed = 'mixed', SEAD = 'sead', SeaControl = 'sea')
---@field OneThirdRule boolean @True if activated
---@field CheckOPA boolean @True if can investigate outside zones
---@field CheckWWR boolean @True if can investigate within weapon range
---@field ActiveEMCON boolean @True if active EMCON in patrol zone
---@field AttackThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field AttackAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field AttackTerrainFollowingAircraft boolean @True if terrain following
---@field AttackDistanceAircraft string
---@field AttackThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field AttackDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field AttackDistanceSubmarine string
---@field AttackThrottleShip string|number @ preset string or numeric preset enum code.
---@field AttackDistanceShip string
---@field TransitThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field TransitAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitTerrainFollowingAircraft boolean @True if terrain following
---@field StationThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field StationAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationTerrainFollowingAircraft boolean @True if terrain following
---@field TransitThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field TransitDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field StationDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitThrottleShip string|number @ preset string or numeric preset enum code.
---@field StationThrottleShip string|number @ preset string or numeric preset enum code.
---@field FlightSize string|number @ specialSize 1-6 max if you feed it anything outside that range it will revert to 1, and "5" is converted to 6.
--this can be "all",0=no preference, or 1-12. Though actual options are really only 1,2,3,4,6,8,12 Anything else will be set to all.
---@field MinAircraftReq string|number @ min aircraft required to start mission.
---@field UseFlightSize string @ 'inherit' or true|false boolean to use flightsize restrictions or not?
---@field GroupSize? string|number @ Size @ applies to ships\subs\etc same as flightsize valid options are "all" (which actually means none), and 1,2,3,4,6. >6 gets set to 1.
---@field UseGroupSize? boolean @ applies to ships
---@field ProsecutionZone? table @ if exists is a name or GUID Table of reference point names and/or GUIDs
---@field PatrolZone table @ if exists is a name or GUID Table of reference point names and/or GUIDs
---@field FlightsToInvestigate string
---@field FlightsToEngage string
---@field WingmanEngageDistance string
---@field BoatsToInvestigate string
---@field BoatsToEngage string
---@field GroupMemberEngageDistance string



---@class CMO__StrikeMission:table @ StrikeMission options; these are updated by ScenEdit_SetMission(). Note that these are split between the escorts and strikers
---@field type string @Subtype of mission (Air_Intercept = 'air', Land_Strike = 'land', Maritime_Strike = 'sea', Sub_Strike = 'sub')
---@field EscortFlightSizeShooter string|number Size
---@field EscortMinShooter number
---@field EscortMaxShooter number
---@field EscortResponseRadius number
---@field EscortUseFlightSize boolean @True if minimum size required
---@field EscortFlightSizeNonshooter string|number Size
---@field EscortMinNonshooter number
---@field EscortMaxNonshooter number
---@field EscortGroupSize string|number Size
---@field EscortUseGroupSize boolean @True if minimum size required
---@field StrikeOneTimeOnly boolean @True if activated
---@field StrikeMinimumTrigger string
---@field StrikeMax number @Max number of flights allowed
---@field StrikeFlightSize string|number Size
---@field StrikeMinAircraftReq number
---@field StrikeUseFlightSize boolean @True if minimum size required
---@field StrikeGroupSize string|number Size
---@field StrikeUseGroupSize boolean @True if minimum size required
---@field StrikeAutoPlanner boolean @True if activated
---@field StrikePreplan boolean @True if pre-planned target list only
---@field StrikeRadarUasge number @Radar usage
---@field StrikeMinDistAircraft number @Strike minimum distance
---@field StrikeMaxDistAircraft number @Strike maximum distance
---@field StrikeMinDistShip number @Strike minimum distance
---@field StrikeMaxDistShip number @Strike maximum distance
---@field FlightsToInvestigate string @Number of flights to investigate unknown contacts.
---@field FlightsToEngage string @Number of flights to engage targets.
---@field WingmanEngageDistance string @allowed distance between wingmen for engage seperate targets.
---@field BoatsToInvestigate string @number of boats to investigate unknown contacts.
---@field BoatsToEngage string @number of boats to engage targets.
---@field GroupMemberEngageDistance string  @ship\other equivlent to WingmanEngageDistance.




---@class CMO__MineClearMission:table @ A CMO Mine Clearing Mission table.
---@field OneThirdRule boolean @ false to disable to uncheck the box.
---@field TransitThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field TransitAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitTerrainFollowingAircraft boolean @
---@field StationThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field StationAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationTerrainFollowingAircraft boolean @
---@field TransitThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field TransitDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field StationDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitThrottleShip string|number @ preset string or numeric preset enum code.
---@field StationThrottleShip string|number @ preset string or numeric preset enum code.
---@field FlightSize string|number @ specialSize 1-6 max if you feed it anything outside that range it will revert to 1, and "5" is converted to 6.
--this can be "all",0=no preference, or 1-12. Though actual options are really only 1,2,3,4,6,8,12 Anything else will be set to all.
---@field MinAircraftReq string|number @ min aircraft required to start mission.
---@field UseFlightSize string @ 'inherit' or true|false boolean to use flightsize restrictions or not?
---@field GroupSize? string|number @ Size @ applies to ships\subs\etc same as flightsize valid options are "all" (which actually means none), and 1,2,3,4,6. >6 gets set to 1.
---@field UseGroupSize? boolean @ applies to ships
---@field Zone table @name or GUID Table of reference point names and/or GUIDs


---@class CMO__MineMission:table @A Cmo MineMission. options; these are updated by ScenEdit_SetMission()
---@field OneThirdRule boolean @ false to disable to uncheck the box.
---@field TransitThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field TransitAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitTerrainFollowingAircraft boolean @
---@field StationThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field StationAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationTerrainFollowingAircraft boolean @
---@field TransitThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field TransitDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field StationDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitThrottleShip string|number @ preset string or numeric preset enum code.
---@field StationThrottleShip string|number @ preset string or numeric preset enum code.
---@field FlightSize string|number @ specialSize 1-6 max if you feed it anything outside that range it will revert to 1, and "5" is converted to 6.
--this can be "all",0=no preference, or 1-12. Though actual options are really only 1,2,3,4,6,8,12 Anything else will be set to all.
---@field MinAircraftReq string|number @ min aircraft required to start mission.
---@field UseFlightSize string @ 'inherit' or true|false boolean to use flightsize restrictions or not?
---@field GroupSize? string|number @ Size @ applies to ships\subs\etc same as flightsize valid options are "all" (which actually means none), and 1,2,3,4,6. >6 gets set to 1.
---@field UseGroupSize? boolean @ applies to ships
---@field Zone table @Table of reference point names and/or GUIDs
---@field Armingdelay string @time In format of 'days:hours:minutes:seconds' e.g. 1 day, 4 hours, 30 minutes would be '1:4:30:0'



---@class CMO__SupportMission:table @ A CMO Support Mission table.
---@field OneThirdRule boolean @ false to disable to uncheck the box.
---@field TransitThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field TransitAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitTerrainFollowingAircraft boolean @
---@field StationThrottleAircraft string|number @ preset string or numeric preset enum code.
---@field StationAltitudeAircraft string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationTerrainFollowingAircraft boolean @
---@field TransitThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field TransitDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field StationThrottleSubmarine string|number @ preset string or numeric preset enum code.
---@field StationDepthSubmarine string|number @ preset string or numeric preset enum code OR parsable numeric\float.
---@field TransitThrottleShip string|number @ preset string or numeric preset enum code.
---@field StationThrottleShip string|number @ preset string or numeric preset enum code.
-- Maybe part of pro-only or on going work???
--
---@field transitthrottlefacility? any @undocumented preset string or numeric preset enum code.
---@field stationthrottleshipfacility? any @undocumented preset string or numeric preset enum code.
---@field ccenable? string @ undocumented 'inherit' or true|false boolean
---@field ccallowqra? string @ undocumented 'inherit' or true|false boolean
---@field ccflightgenmethod? string @ undocumented Some sort of enum type is parsed 0 or 1  
---@field ccstationtime? string @ undocumented some sort of enum type is parsed 0-27 possible values.
---@field ccoverlap? string @ undocumented some sort of enum type is parse 0-2 are possible root values.
-- End Maybe part of pro-only or on going work???
--
---@field FlightSize string|number @ specialSize 1-6 max if you feed it anything outside that range it will revert to 1, and "5" is converted to 6.
--this can be "all",0=no preference, or 1-12. Though actual options are really only 1,2,3,4,6,8,12 Anything else will be set to all.
---@field MinAircraftReq string|number @ min aircraft required to start mission.
---@field UseFlightSize boolean @ use flightsize restrictions or not?
---@field GroupSize? string|number @ Size @ applies to ships\subs\etc same as flightsize valid options are "all" (which actually means none), and 1,2,3,4,6. >6 gets set to 1.
---@field UseGroupSize? boolean @ applies to ships
---@field Zone table @ names or GUID Table, of reference point names and/or GUIDs {RP1,RP2,RP3...or their guids}
---@field LoopType string @Values of ContinousLoop(0) or SingleLoop(1)
---@field OnStation string|number @ converted to int, number of units to keep on station.
---@field OneTimeOnly string  @ 'inherit' or true|false boolean Mission or flights are one-time only.
---@field ActiveEMCON string  @ 'inherit' or true|false boolean to Activate EMCON inside zone\path\track only.
---@field TankerOneTime string  @ 'inherit' or true|false boolean to Allow tankers only do one refueling per flight.
---@field TankerMaxReceivers string @ 'inherit', or value.



---@class CMO__FerryMission:table @A CMO FerryMission table 
---@field FerryBehavior string @Values OneWay(0), Cycle(1), Random(2)
---@field FerryThrottleAircraft string @ preset?
---@field FerryAltitudeAircraft string|number @ presetname preset numeric code, or string that can be parsed "35000 FT" or just an integer for meters?
---@field FerryTerrainFollowingAircraft boolean @ true to enable.
---@field FlightSize number @ specialSize 1-6 max if you feed it anything outside that range it will revert to 1, and "5" is converted to 6.
--this can be "all",0=no preference, or 1-12. Though actual options are really only 1,2,3,4,6,8,12 Anything else will be set to all.
---@field MinAircraftReq string @ min aircraft required to start mission.
---@field UseFlightSize string @ 'inherit' or true|false boolean to use flightsize restrictions or not?


--- A table of Arc codes.  
--- {'360'} represents all (but doesn't always play nice with mounts so advise using full list below)  
--- {'PB1','PB2','SB1','SB2','SMF1','SMF2','SMA1','SMA2','SS1','SS2','PS1','PS2','PMA1','PMA2','PMF1','PMF2'}  
--- Also Available as CMO__Constants.Arc360 and .ArcFull
---@class CMO__ArcTable:table


---Used with ScenEdit_UpdateUnitCargo()  
---@class CMO__UpdateUnitCargo:table @ A able of options for UpdateUnitCargo().
---@field guid string @ The guid unit identifier for the unit whos cargo will be updated.
---@field mode string @ The function to perform "add_cargo | remove_cargo".
---@field cargo table @ table format is same as ScenEdit_UnloadCargo and ScenEdit_TransferCargo {guid,guid,guid} or { {number,dbid} , [{dbid}] }
---@field dbid? number @ The database id of the item to add|remove
---@field mountid? string @ The identifier (guid) of the particular mount to remove [required for remove_ mount mode if you want specific one removed]
---@field weaponid? string @ The identifier (guid) of the particular weapon to remove [required for remove_ weapon mode if you want a specific one removed]. Must have a preceeding mountid to update
---@field commsid? string @ The identifier (guid) of the particular communication device to remove [required for remove_ comms mode if you want a specific one removed]
---@field magid? string @ The identifier (guid) of the particular magazine to remove [required for remove_ magazine mode if you want a specific one removed]
---@field file? string @ File name of the INI delta to apply [required for delta mode]  PATH defaults to CMOROOT\\Scenarios\\filenamehere.ini
---@field arc_detect? CMO__ArcTable @ The effective arcs for the particular sensor to detect in [override defaults]
---@field arc_track? CMO__ArcTable @ The effective arcs for the particular sensor to track/illuminate in [override defaults]
---@field arc_mount? CMO__ArcTable @ The effective arcs for the particular mount [override defaults]



---Used with ScenEdit_UpdateUnit()  
---For the 'delta' mode, the function willl look for a matching GUID (or unit name if no GUID match) in the INI file.  
---If removing and you don't specify the specific xxxxxid field but you do include the dbid, then the first found with that dbid will be removed.
---@class CMO__UpdateUnit:table @ for use with ScenEdit_UpdateUnit
---@field guid string @The unit identifier
---Mode values: add_ sensor,remove_ sensor,add_ mount,remove_ mount,add_ weapon, remove_ weapon, add_comms, remove_comms, 
--- add_magazine, remove_magazine ,add_magazine_only, update_mount_arc, update_sensor_arc, update_sensor delta.
---@field mode string @ The function to perform 
---[required for 'add_' mode].  
---If used with 'remove_' mode, and no sensorid/mountid/commsid/magid, the first matching DBID will be removed.  
---@field dbid? number @ The database id of the item to add|remove
---@field sensorid? string @ The identifier (guid) of the particular sensor to remove [required for remove_ sensor mode if you want a specific one removed]
---@field mountid? string @ The identifier (guid) of the particular mount to remove [required for remove_ mount mode if you want specific one removed]
---@field weaponid? string @ The identifier (guid) of the particular weapon to remove [required for remove_ weapon mode if you want a specific one removed]. Must have a preceeding mountid to update
---@field commsid? string @ The identifier (guid) of the particular communication device to remove [required for remove_ comms mode if you want a specific one removed]
---@field magid? string @ The identifier (guid) of the particular magazine to remove [required for remove_ magazine mode if you want a specific one removed]
---@field file? string @ File name of the INI delta to apply [required for delta mode]  PATH defaults to CMOROOT\\Scenarios\\filenamehere.ini
---@field arc_detect? CMO__ArcTable @ The effective arcs for the particular sensor to detect in [override defaults]
---@field arc_track? CMO__ArcTable @ The effective arcs for the particular sensor to track/illuminate in [override defaults]
---@field arc_mount? CMO__ArcTable @ The effective arcs for the particular mount [override defaults]


---The difference between this one and the CMO_Unit is this includes additional options that can be set or called.   
---name+side or guid are required, everything else you only need to include if you are changing it.
---@class CMO__UnitUpdate:table @ for use with SE_SetUnit/ScenEdit_SetUnit
---@field guid? string @ the guid of the unit or group to use for the selection
---@field unitname? string @ the name of the unit or group to use for the selection.
---@field side? string @ the side of the unit or group to use for the selection
---@field newName? string @ the new name for the unit.
---@field group? string @ the name or guid of the group to set the unit too.
---@field mission? string @ the name or guid of the group to set the unit too.
---@field course? CMO__TableOfWaypoints@ the course table to assign to the unit. 
---@field speed? number @ the speed to set the unit too mutally exclusive in the same call with Throttle (which uses presets).
---@field launch? boolean @ true to launch the aircraft, false to cancel a scheduled launch. If already out of base (air or sea) does nothing.
---@field rtb? boolean @ true to trigger an RTB, false to cancel the RTB. However setting to false does not reset the RTB canceled state or if a unit it prior 'state' for example.
---@field refuel? boolean @ if true trigger the unit to refuel when set to true. false may cancel it (not sure been awhile since I tested it).
---@field unassign? boolean@ if true trigger mimics pressing the [u] key in game to unassign the unit from mission, disenage it, and stop its current activity at least temporarly.
---@field moveto? boolean @ when set to true unit with "move to" the setting for alitude,depth, when its false those setting immediate change. Basically when true setting become 'desired' vs actual.
---@field altitude? number @ the altitude. number 1-7 will be interpreted as a preset code, so you cant actually set 1-7meters.
---@field desiredAltitude? number @ the desired altitude, same as alt expect this is effecitvely sets move-to to true.
---@field depth? number @ the depth. HOWEVER setting a depth of '1' - '6' will be interpreted as a preset code, so you cant actually set 1-6 meters.
---@field desiredDepth? number @ the desired depth, same as depth expect this is effecitvely sets move-to to true.
---@field heading? number @ change the heading to this.
---@field desiredheading? number @ change the heading to this but let the unit 'move-to' it natually. 
---@field latitude? number @ the latitude of the unit to set.
---@field longitude? number @ the longitude of the unit to set. 
---@field autodetectable? boolean @ true to let the other side always see this unit.
---@field outofcomms? boolean @ true to enable, false to disable.
---@field holdposition? boolean @ pause units location?
---@field holdfire? boolean @  when set to true sets the 4 main targeting doctrines to hold, when setting to false I believe it reverts them to tight.
---@field proficiency? string|number @ The unit proficiency, "Novice"|0, "Cadet"|1,"Regular"|2, "Veteran"|3, "Ace"|4.
---@field manualThrottle? string @ "Current|Desired|Off" disable manual, or set it to current throttle setting or desired throttle setting, or preset keyword.
---@field manualSpeed? string|number @ "Current|Desired|Off" disable manual, or set it to current speed setting or desired speed setting, or numeric speed.
---@field manualAltitude? string|number @ "Current|Desired|Off" disable manual, or set it to current altitude setting or desired altitude setting, or preset or numeric alt.
---@field fuel? table @ table of parirs of one or more {fueltypecode,fuelamount} entries.
---@field base? string @ name or guid of the base to assign to the unit.
---@field sprintDrift? boolean @ true to enable sprint and drift or false to disable.
---@field avoidCavitation? boolean @ true to enable anti-cavitation, false to disable
---@field CSAR? boolean @ true to enable SAR flag on a unit false to disable.  (This is SAR_enabled on the actual Unit Wrapper)
---@field TimeToReady_Minutes? number @ number of minutes till the unit is ready if on the ground.  (this could be set via SetLoadout as well.)


---@class CMO__LoadoutAvailable:table @LoadoutAvailable
---@field LoadoutDBID number @Number of loadout
---@field Available boolean @If the loadout is available or not

---@class CMO__Unit:table @UnitWrapper
---@field type string @ The type of object, may be of type in _enumTable_.UnitType or 'Group' .READ ONLY
---@field typeN CMO__ActiveUnitTypeEnum @ The type code of the object. (undocumented numerics are in _enumTable_.UnitType)
---@field guid string @ The unit's unique ID. READ ONLY
---@field name string @ name of the unit.
---@field side string @ The unit"'"s side. READ ONLY
---@field subtype string @ The unit"'"s subtype (if applicable). READ ONLY
---@field base CMO__Unit @ The unit"'"s assigned base.
---@field latitude number @ Latitude The latitude of the unit.
---@field longitude number @ Longitude The longitude of the unit.
---@field dbid number @ The database ID of the unit READ ONLY
---@field altitude number @ The altitude of the unit in meters.
---@field speed number @ The unit"'"s current speed.
---@field throttle string|number @ Throttle The unit"'"s current throttle setting.
---@field autodetectable boolean @ True if the unit is automatically detected.
---@field holdposition boolean @ True if the unit should hold.
---@field holdfire table @ Doctrine WCS setting for {air,surface,subsurface,land}. READ ONLY
---@field heading number @ The unit"'"s heading.
---@field proficiency string|number @ The unit proficiency, "Novice"|0, "Cadet"|1,"Regular"|2, "Veteran"|3, "Ace"|4.
---@field newname string @ If changing existing unit, the unit"'"s new name .
---@field course CMO__TableOfWaypoints @ The unit"'"s course, as a table of waypoints
---Fuel type can be found in special var _enumTable_.FuelType
---@field UseCustomIntermittentEmissionOnly boolean @Activate the custom intermittent emissions 
---@field target CMO__Contact @The unit target. Only for Weapons.
---@field fuel CMO__TableOfFuelStates @ FuelTable A table of fuel types used by unit (aggrogate) by type.  IF EDITING USE THIS or SetUnit() if you need specific tank refueling like a specific drop tank.
---@field fuels CMO__TableOfFuelStates @ FuelTable2 A table of fuel tanks used by unit each with an entry for the fuel involved for that tank. THIS IS READONLY
---@field mission CMO__Mission @ The unit"'"s assigned mission. Can be changed by setting to the Mission name or guid (calls ScenEdit_AssignUnitToMission).
---@field group string|CMO__Group @Group @The unit"'"s group. If setting the group, use a text name of an existing group or a new name to create a group. To remove unit from a group, use "none" as the name.
---@field readytime string @ how long aircraft/ship takes to be ready. "0" or formated in the "0hrs:0mins:0secs" string format - Can also be other oddball string like "ready", or "No","Unavailable" READ ONLY
---Set the time in seconds Can use 'TimeToReady_Minutes=' in SetLoadout() to set the ready time in minutes for aircraft and ship/sub.
---@field readytime_v number @ how long aircraft/ship takes to be ready in numerical seconds. (Thanks michael!)
---@field airbornetime string @ how long aircraft has been flying. "0" or formated in the "0hrs:0mins:0secs" string format - how long aircraft/ship takes to be ready. Can also be other oddball string like "ready", or "No","Unavailable" READ ONLY
---@field airbornetime_v number @ how long aircraft has been flying in seconds (returned as number). READ ONLY
--- This is false it's really a string and in the same useless format as readytime.
---@field loadoutdbid number @ current aircraft loadout DBID. READ ONLY
--- Use SetLoadout() to change.
---@field unitstate string @ Message on unit status. READ ONLY
---@field fuelstate string @ Message on unit fuel status. READ ONLY
---@field weaponstate string @ Message on unit weapon status. READ ONLY
---@field condition_v string @ Docking/Air Ops condition value. READ ONLY These states can be found in _enumTable_.Condition_Air and _enumTable_.Condition_Dock var tables.
---@field condition string @ Message on unit dock/air ops status. READ ONLY
---@field classname string @ Unit class name READ ONLY
---@field crew number @ db specified number of crew for the unit. READ ONLY
---@field manualSpeed boolean @ string|number on _SE_setter. Desired speed or 'OFF' to turn off manual mode
---the getter returns a boolean, the setter is float number or string CURRENT,DESIRED,OFF or one of the presets FullStop,Loiter,Cruise,Full,Flank (0-4).
---@field manualAltitude boolean @ string|number on _SE_setter. Desired altitude/depth or 'OFF' to turn off manual mode
---the getter returns a boolean, the setter is float number or string CURRENT,DESIRED,OFF or one of the presets  
---None,MinAltitude,Low1000,Low2000,Medium12000,High25000,High36000,MaxAltitude (0-7).  
---None,Periscope,Shallow,OverLayer,UnderLayer,MaxDepth,Surface (0-6).
---@field damage table  @ Table{dp,flood,fires,startDp} of start and current DP, flood and fire level. READ ONLY
---@field magazines table @Magazine @A table of magazines (with weapon loads) in the unit or group. Can be updated by ScenEdit_AddWeaponToUnitMagazine READ ONLY
---@field mounts table @Mounts @A table of mounts (with weapon loads) in the unit or group. Can be updated by ScenEdit_AddReloadsToUnit READ ONLY
---@field components CMO__TableOfUnitComponents @A table of components on the unit. READ ONLY
---@field ascontact table @ A table {side,guid,name} of this unit seen from the other sides (as contacts). READ ONLY
---@field weather CMO__Weather @ Table of weather parameters (temp, rainfall, underrain, seastate)
---@field areaTriggersFired table @ Table of active 'in area' triggers that have fired for unit.
---@field OODA table @ Table contain unit"'"s "observe, orient, decide, act" values {evasion, targeting, detection}.
---@field embarkedUnits table @ Table of boats and aircraft docked/embarked on the unit {aircraft={guid,...} boats={guid,...}}.
---@field assignedUnits table @ Table of boats and aircraft assigned to the unit (base) {guid,...}
---@field weapon table @ Table of shooter unit, at contact unit and detonated (when destroyed) if a weapon READ ONLY.
---@field targetedBy table @ Table of unit guids that have this unit as a target READONLY  
---(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables)
---@field firingAt table @ Table of contact guids that this unit is firing at READLONY  
---(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables)
---@field firedOn table @ Table of guids that are firing on this unit READLONLY  
---(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables)
---@field formation table @ Table of unit"'"s formation info {bearing, type (of bearing), distance, sprint (and drift)
---@field sprintDrift boolean @ Sprint and drift 'True/False'
---@field avoidCavitation boolean @ Avoid cavitation 'True/False'
---@field hostFacility CMO__Unit @ UnitWrapper of the Facility|ShiP etc Where unit is hosted
---@field cargo CMO__TableOfCargo @Cargo @Unit cargo information
---@field isEscort boolean @ is unit asssigned to escort in mission READ ONLY
---@field isOperating boolean @ is unit is operational, not landed or docked READ ONLY
---This is wrong this only returns true when units status is one of the following  
---Underway,RTB,ManoeuveringToRefuel,Replenishing,ProvidingUNREP,RechargingBatteries,SettlingForCargoTransfer.
---@field IsMine boolean @ Applies to Weapon units - is weapon a mine READ ONLY
---@field IsUnguidedBallisticWeapon boolean @ is weapon a Unguided Ballistic Weapon READ ONLY
---@field IsBallisticMissile boolean @ is weapon a Ballistic Weapon READ ONLY
---@field IsDecoy boolean @ is weapon a decoy READ ONLY
---@field IsNuke boolean @ is weapon a nuke READ ONLY
---@field outOfComms boolean @ is unit connected to side comms network (false = connected) READ ONLY
---@field AI_EvaluateTargets_enabled boolean @ AI evaluates targets.
---@field AI_DeterminePrimaryTarget_enabled boolean @ AI determines primary target
---@field obeyEMCON boolean @ Unit obeys EMCON. Turn off to manually set sensors
---@field category number @ The unit category code for the Aircraft, Facility, Ship, Submarine or Satellite.
---@field sensors CMO__TableOfSensorComponents @ table of Unit sensor information
---@field WasPickedUp boolean @ Has the unit been picked up as cargo yet?
---@field SAR_enabled boolean @ Special Search and Rescue enabled on the unit? todo: See recent release notes for what this is about 1147.25-30ish
---Must use SetUnit(unassign=true|false)
---@field unassign boolean @ _SE_ONLY unassign unit (performs basic actions of hotkey 'u')
---oldDamagePercent see: https://www.matrixgames.com/forums/tm.asp?m=5035888 for details on why this exists.
---@field oldDamagePercent number @ _SE_ONLY used to change\reset the unit damage percent vs current used in relation to advanced damage trigger work.
---@field jammed boolean @ true if the unit is flagged as being jammed. (Thanks michael!)
---@field jammer boolean @ true if the unit is flagged as emitting jamming signals. 
---@field pitch number @ the current pitch of the unit as a floating point number (aircraft or munition).
---@field roll number @The unit roll as a floating point number (aircraft)
---@field groundspeed number @ the current groundspeed of the unit as a float.
---@type CMO__Unit

---@class CMO_Unit
local CMO__Unit = {} ----dummy entry to attach funcs
---Trigger the unit to return to base, or cancel an RTB.
---@param bool boolean @  true to trigger it, false to cancel.
function CMO__Unit:RTB(bool) end
---Immediately removes unit object. I believe this does not trigger it as a loss.
function CMO__Unit:delete() end
---Trigger the unit to launch from base (true) or abort launch (false).
---@param bool boolean @ true to launch, false to abort.
function CMO__Unit:Launch(bool) end
---Calculate flat distance to a contact location.
---@param contactid string @ contact guid of the contact to calculate range too.
---@return number @ range in nmi.
function CMO__Unit:rangetotarget(contactid) end
---Filters unit on type of component and returns a Component table.
---@param type string @ name of the component type. (Sensor,Mount,CommDevice,Engine,Cargo,etc..)
---@param dbid? number @ interger of the dbid to sub-filter upon (OPTIONAL - defaults to 0 aka no filtering)
---@return CMO__TableOfUnitComponents @ table of components.
function CMO__Unit:filterOnComponent(type,dbid) end
---Returns the angle from this units bow to the unit submitted.
---@param unitguid string @ guid of the unit to calculate to.
---@return number @ float in degrees.
function CMO__Unit:angleOnBowToUnit(unitguid) end
---Returns the CMO__DeviceMagazine wrapper object for the matching the specified *mag guid contained on this unit.
---@param magguid string @ guid of the unit to calculate to.
---@return CMO__DeviceMagazine|nil @ Magazine Wrapper object (contains specific mag data) or nil.
function CMO__Unit:getUnitMagazine(magguid) end
---Returns the CMO__DeviceMagazine wrapper object for the matching the specified *mount guid contained on this unit.
---function reuses devicemagazine inserting mount data instead.
---@param mountguid string @ guid of the unit to calculate to.
---@return CMO__DeviceMagazine|nil @ Magazine Wrapper object for the mountguid specified (contains mount data) or nil.
function CMO__Unit:getUnitMountMagazine(mountguid) end
    ---Is unit in the 'area' defined by table of RPs (true/false);
---@param area table @ table of rps names or entries that contain latitude=,longitude= entries.
---@return boolean @ true if unit is inside this area, false if not.
function CMO__Unit:inArea(area) end
---Update the orbit for a satellite by specifying a TLE. See below for a complete usage example.
---@param TLE table @ table containing TLE formated data {TLE='tle data here'}.
function CMO__Unit:updateorbit(TLE) end
---theSat = ScenEdit_GetUnit({guid='56f830c1-d0e2-430a-985e-0e301cc01eff'})  
---theTLE = 'Resurs P1\n1 39186U 13030A 17013.12537468 .00000446 00000-0 16942-4 0 9992\n2 39186 97.3847 79.3911 0015157 247.7411 195.8488 15.31966970198820'  
---theSat:updateorbit({TLE=theTLE})
---Deletes a unit
function CMO__Unit:delete() end

---CMO__ActiveUnitTypeEnum:  
---None=0, Aircraft=1,Ship=2,Submarine=3,Facility=4,Aimpoint=5,Weapon=6,Satellite=7
---@class CMO__ActiveUnitTypeEnum:table @ type of unit name=number 0-7

---@class CMO__FuelState:table @ fuel entry either in total or per-specific tank when using 'unit.fuels'.
---@field current number @ The current fuel level of the type
---@field max number @How much can be stored for the type
---@field name string @Name of the fuel type.
---@field type number @The type code of the fuel type. 2001 for example is AviationFuel.
--- a table of CMO__FuelState records.
--- if using unit.fuels then table returned is ipairs compatible 100% of time otherwise if using fuel avoid ipairs.
---@class CMO__TableOfFuelStates:table @<number,CMO__FuelState>.
---@field current number @ The current fuel level of the type
---@field max number @How much can be stored for the type
---@field name string @Name of the fuel type.
---@field type number @The type code of the fuel type. 2001 for example is AviationFuel.


---Note: if comp_type is cargo the entries  
---comp_name will be the name of the cargo &  
---comp_dbid will be the dbid of the cargo mount. as i recall anyway?
---@class CMO__UnitComponent:table @ a unit component.
---@field comp_dbid number @ dbid of the component. See notes for cargo case.
---@field comp_guid string @ guid of the instance of the component.
---@field comp_name string @ name of the component. See notes for cargo case.
---@field comp_type string @ type code of component (CommDevice,Sensor,Engine etc).
---@field comp_status string @ status code of the component."Operational" | "Damaged" | "Destroyed".
---@field comp_damage? string @ "Light"|"Medium"|"Heavy".
---@field comp_statusR? string @ "None"| various status text messages for state of the inoperative component.


---@class CMO__UnitComponent_Return:table @ Same as CMO_UnitComponent except with no comp_ infront (returned from SetUnitDamage).
---@field dbid number @ dbid of the component. See notes for cargo case.
---@field guid string @ guid of the instance of the component.
---@field name string @ name of the component. See notes for cargo case.
---@field type string @ type code of component (CommDevice,Sensor,Engine etc).
---@field status string @ status code of the component."Operational" | "Damaged" | "Destroyed".
---@field damage? string @ "Light"|"Medium"|"Heavy".
---@field statusR? string @ "None"| various status text messages for state of the inoperative component.

---@alias CMO__TableOfUnitComponent_Returns table<integer,CMO__UnitComponent_Return> @ returned with SetUnitDamage.

---@class CMO__SensorComponent:table @ A sensor component.
---@field sensor_dbid number @ dbid of the sensor.
---@field sensor_guid string @ guid of the instance of the sensor.
---@field sensor_name string @ name of the sensor.
---@field sensor_type number @ db type code of sensor. Sensor types can be found in _enumTable_.sensorType
---@field sensor_role number @ db role code of the sensor. Sensor roles can be found in _enumTable_.sensorRole
---@field sensor_maxrange number @ db entry for maxrange for the sensor.
---@field sensor_status string @ "Operational" | "Damaged" | "Destroyed"
---@field sensor_isactive boolean @ true if active, false if inactive.
---@field sensor_statusR? string @ "None"| various status text messages for state of the inoperative sensor.
---@field sensor_damage? string @ "Light"|"Medium"|"Heavy"

--- a table of CMO__UnitComponents.
---@class CMO__TableOfUnitComponents:table @<number,CMO__UnitComponent>.
--- a table of CMO__SensorComponents.
---@class CMO__TableOfSensorComponents:table @<number,CMO__SensorComponent>.


---@class CMO__Cargo:table @Cargo in a ship|air|dock| unit
---@field GUID string @GUID
---@field dbid number @Database ID
---@field name string @Name
---@field type number @Type
---@field status string @Status "Operational" | "Damaged" | "Destroyed"
---@field area number @Cargo unit area
---@field crew number @Cargo unit crew
---@field mass number @Cargo unit mass
---@field quantity number @Items present
---@field damage? string @Damage "Light"|"Medium"|"Heavy"
---@field statusR? string @Inoperative reason "None"| various status text messages for state of the inoperative cargo.

--- a table of CMO_Cargo entries.
---@class CMO__TableOfCargo:table @<number, CMO__Cargo>.


---@class CMO__Explosion:table @ A CMO Explosion table.
---@field warheadid number @The ID of the warhead to detonate
---@field latitude number @Latitude The latitude of the detonation
---@field longitude number @Longitude The longitude of the detonation
---@field altitude number @ Altitude The altitude of the detonation

---@class CMO__LoadoutInfo:table @ A CMO Loadout information table used both in querying and setting loadout related or aircraft status data.
---@field unitname string @The name/GUID of the unit to change the loadout on
---@field LoadoutID number ? @The ID of the new loadout; 0 = use the current loadout <-- use that when just adjusting other entries like TTR.
---@field TimeToReady_Minutes ? number @How many minutes until the loadout is ready (default = database loadout time) (_optional_)
---@field IgnoreMagazines ? boolean @If the new loadout should rely on the magazines having the right weapons ready (default = false) (_optional_)
---@field ExcludeOptionalWeapons ? boolean @Exclude optional weapons from loadout (default = false) (_optional_)
---@field Wpn_DBID ? number @Weapon DB number - required if WPN_GUID is not supplied
---@field Wpn_GUID ? string @Actual weapon entry to update - DBID is not required as this take precedence (_optional_) You can obtain this via scanning the mounts.
---@field Number ? number @Number to change current weapon load by (sign ignored)
---@field Remove ? boolean @Deduct 'number' rather than add.

---@class CMO__Loadout:table @ table of information about a loadout - returned by ScenEdit_GetLoadout()
---@field dbid integer @ ID from database
---@field name string @ Name of loadout stored in the database
---@field roles table @ Table of loadout usage {LoadoutRole, LoadoutTimeOfDay, LoadoutWeather}
---@field weapons CMO__TableOfWeaponLoads @Table of CMO__WeaponLoaded entries, ie weapons in the loadout.
local CMO__Loadout={}; --dummy value so we can attach functions to it.
---function that sets the exact quantity for a specified weapon entry (by entry guid);
---@param guid string @ the guid of the specific weapon entry in this loadout to modify.
---@param quantity number @ the integer to set the quantity to exactly. (still cant exceed maxcap etc though) 
---@return number @ returns 0 or the number of changed value of the found entry.
function CMO__Loadout:setExactWeaponQuantity(guid,quantity) end


---@class CMO__Magazine:table @ CMO Magazine table
---@field mag_capacity string @ Capacity|Storage ie MAX amount of weapons that can be stored. Unless you have modded the DB this will never be more than 10k. READONLY
---@field mag_dbid string @ Database ID in the database store in DataMagazine dbtable. READONLY
---@field mag_GUID string @ GUID, the guid generated for this specific entry in the scene. READONLY
---@field mag_name string @ Name, the generic READONLY.
---@field mag_weapons CMO__TableOfWeaponLoads @ Table of weapon loads in magazine.

---An ipairs compatiable list of magazine entries.
---what you get from say a print(unit.magazines[1].mag_weapons[1])
---@class CMO__TableOfMagazines:table @ <number,CMO__Magazine>

---@class CMO__DeviceMagazine:table @ CMO Magazine Wrapper
---@field armor number @
---@field capacity number @
---@field dbid number @ 
---@field guid string @ 
---@field fields table @ table of fields on the object
---@field isaviationmagazine boolean @ true|false if aviation mag.
---@field name string @ dbname of the mag.
---@field parentunitguid string @ guid of the containing unit?
---@field rof number @ rate of fire\resupply for the unit in 1 round per this timeperiod; 0 = unlimited.
---@field weapons CMO__TableOfDeviceWeaponLoads @ table of CMO__Device_WeaponsLoaded entries. 
local CMO__DeviceMagazine = {}; --Dummy var so we can attach functions to CMO__DeviceMagazine.
---Function to set the exact quantity of a specific weapon that exists already in this magazine.
---@param guid string @ guid of the specific weapon entry on this mag.
---@param quantity number @ integer number to set the quantity too
---@return number @ returns the current quanity after changed or 0 if error or not found.
function CMO__DeviceMagazine:setExactWeaponQuantity(guid,quantity) end

---@class CMO__DeviceMount:table @ CMO Mount Wrapper
---@field dbid number @ database id # of the mount.
---@field fields table @ fields of the mount.
---@field name string @ name of the mount.



---@class CMO__WeaponLoaded:table @ An entry stored inside a magazine or mounts mag_weapons|mount_weapons tables.
---@field wpn_GUID string @GUID READONLY  The guid of this particular entry, used in a loadout info or updateunit call when modifying.
---@field wpn_current number @Current number of weapons
---@field wpn_maxcap number @Maximum number of weapon that can be stored in this record READONLY
---@field wpn_default number @Default loads (to fill out) READONLY, so if you add a 4/6 type record the default would read 4.
---@field wpn_name string @Name of the weapon as stored in the database. READONLY
---@field wpn_dbid string @Database ID of weapon READONLY (This is not the weapon record dbid, but that of the weapon.)
---@field wpn_type string @Type code of weapon READONLY ie 2001 (guided missile,etc.)


---@class CMO__Device_WeaponLoaded:table @ A weapon entry stored inside a magazine object from getMagazine(guidhere) or mounts mag_weapons|mount_weapons tables.
---@field wpn_guid string @GUID READONLY  The guid of this particular entry, used in a loadout info or updateunit call when modifying.
---@field wpn_current number @Current number of weapons
---@field wpn_maxcap number @Maximum number of weapon that can be stored in this record READONLY
---@field wpn_default number @Default loads (to fill out) READONLY, so if you add a 4/6 type record the default would read 4.
---@field wpn_name string @Name of the weapon as stored in the database. READONLY
---@field wpn_dbid number @Database ID of weapon READONLY (This is not the weapon record dbid, but that of the weapon.)

---An ipairs compatiable list of magazine entries.
---what you get from say a print(unit.magazines[1].mag_weapons[1] or mounts[1].mag_weapons[1])
---@class CMO__TableOfWeaponLoads:table @ <number,CMO__WeaponLoaded>

---An ipairs compatiable list of magazine entries.
---what you get from Unit:getUnitMagazine(magguid).weapons)
---@alias CMO__TableOfDeviceWeaponLoads table<number,CMO__Device_WeaponLoaded> @ table of CMO__Device_WeaponLoaded entries.


---@class CMO__Waypoint:table @ A waypoint entry. for instance a units.course property would return a table of these if it had a course.
---@field longitude number @ decimal
---@field latitude number @ decimal
---@field description string @ The description displayed in the gui for this entry.
---@field presetAltitude string
---@field presetDepth string
---@field presetThrottle string
---@field desiredAltitude number
---@field desiredSpeed number
---@field desiredAltitudeTF number @Enter desired altitude AGL to set altitude as terrain-following
---@field TF boolean @ undocumented - enable\disable Terrain Following.
---The following are the undocumented but known values for TypeOf - note some of these only may be seen in professional.
---ManualPlottedCourseWaypoint, PatrolStation, TerminalPoint, LocalizationRun, PathfindingPoint, Assemble,  
---TurningPoint, InitialPoint, Split, Formate, Target, LandingMarshal, StrikeIngress, StrikeEgress, Refuel, TakeOff,  
---Marshal, WeaponLaunch, Land, WeaponTarget, StationStart_Racetrack, StationStart_FigureEight, StationStart_Area,
---StationStart_RaceTrackRandom, StationEnd, PickupPoint, HoldStart, HoldEnd, Launch, Activation, Termination  
--- Any entry you create via Lua will be flagged ManualPlottedCourseWaypoint and there is nothing you can do about it.
---@field TypeOf string @ READONLY tells you what 'type' of waypoint it is. There are half a dozen.


---Typical cmo unit course table. You may copy them, modify them and then set your copy to replace the old.  
---Just makes sure you leave important ones defined by the pathfinder like TerminalPoints which may not re-generate.
---@class CMO__TableOfWaypoints @ Course table <number,CMO__Waypoint>


---If nil then weapon record doesn't exist on the unit.  Each field if nil means it's using inherited values.  
---When 'setting' all 4 values must be provided, 'inherit'. can be used to set\reset a particular value to inherited.
---They also must be in specific order {["1"] qty_salvo,["2"] shooter_salvo ["3"]firing_range ["4"] self_defense}
---When using a number in setting these fields they can be a enum value for that number or quanity. ie -99 is same as max,0=none,-1=system etc.
---@class CMO__WRA:table @ A WRA record table.
---@field qty_salvo? string|integer @Weapons per salvo ('system','max','none','inherit' or a number)
---@field shooter_salvo? string|integer @Shooters per salvo ('system','max','inherit' or a number)
---@field firing_range? string @Firing range ('max','none','inherit' or a number)
---@field self_defence? string @Self-defence range ('system','max','none','inherit') or a number)


---If nil then weapon record doesn't exist on the unit.  Each field if nil means it's using inherited values.  
---When 'setting' all 4 values must be provided, 'inherit'. can be used to set\reset a particular value to inherited.
---They also must be in specific order {["1"] qty_salvo,["2"] shooter_salvo ["3"]firing_range ["4"] self_defense}
---When using a number in setting these fields they can be a enum value for that number or quanity. ie -99 is same as max,0=none,-1=system etc.
---@class CMO__WRA_Ordered:table @ A WRA record table.
---@field [1] string|integer @ qty_salvo? string|integer Weapons per salvo ('system','max','none','inherit' or a number)
---@field [2] string|integer @ shooter_salvo? string|integer Shooters per salvo ('system','max','inherit' or a number)
---@field [3] string|integer @ firing_range? string Firing range ('max','none','inherit' or a number)
---@field [4] string|integer @ self_defence? string Self-defence range ('system','max','none','inherit') or a number)


---@class CMO__SpecialAction:table @ Special action entries
---@field guid string @The special actions GUID. READ ONLY
---@field name string @The actual name of the special action.
---@field description string @The Special Action textual description (unlike events this is actually a description.).
---@field isActive boolean @Indicates the Special Actions is active.
---@field isRepeatable boolean @Indicates the Special Action can be used more than once.
---@field side string @ The side name of the side hosting the Special Action
---@field ScriptText string @ The Lua script. Reminder be careful to properly string-escape all strings when manually setting this.

---@class CMO__SpecialActionUpdate:table @ special action update table.
---@field ActionNameOrID string @The special actions name or guid used as the selector.
---@field side string @ The side name of the side hosting the Special Action used as part of the selector.
---@field NewName? string @ use this to change the the actual name of the special action. [SetSpecialAction Only]
---@field mode? string @ ONLY needed when removing 'remove', though you can use 'add' when adding or 'list' when getting harmlessly.
---@field description? string @The Special Action textual description (unlike events this is actually a description.).
---@field isActive? boolean @Indicates the Special Actions is active.
---@field isRepeatable? boolean @Indicates the Special Action can be used more than once.
---@field ScriptText? string @ The Lua script. Reminder be careful to properly string-escape all strings when manually setting this.



---None of the root entries in a CMO event table will 'print' by default as they aren't properies just fields they do exist though if you acces them specifically.
---But things like name and description are always empty in the root for some reason. access that data via details sub-table. Annoying as hell.
---@class CMO__Event:table @ A cmo Event Wrapper table
---@field name string @The event name. WRONG this is blank at the root level use details.name.
---@field guid string @The event GUID. READ ONLY
---@field description string @The textual name of the event. WRONG this is blank at the root level use details.description.
---This is where most the real data about an event is stored and where real data for name guid description are.
---@field details ? table @The details of the event with tables for triggers/conditions/actions. READ ONLY
---@field isActive ? boolean @ Indicates if the event is active or not.
---@field isRepeatable ? boolean @Indicates if the event repeats
---@field isShown ? boolean @Indicates if the event triggering shows in log
---@field probability ? string @ The events chance to occur (0-100)
---@field actions ? table @ a table of zero or more actions associated to the event READ ONLY (ipairs enumerable). Entry format is actionTypeString=CMO__ActionUpdate sub table.
---@field conditions ? table @ a table of zero or more conditions associated to the event READ ONLY (ipairs enumerable). Entry format is conditionTypeString=CMO__ConditionUpdate sub table.
---@field triggers ? table @ a table of zero or more triggers associated to the event READ ONLY (ipairs enumerable). Entry format is triggerTypeString=CMO__TriggerUpdate sub table.


---Contains the obtions available when creating,updating or removing and event with ScenEdit_SetEvent()
---@class CMO__EventUpdate:table @ A cmo EventUpdate table
---@field description? string @The event GUID. WRONG this is blank at the root level use details.description.
---@field mode? string @ the update mode of 'add','remove' 'update' (defauls to update) 'list' is not available use GetEvent().
---@field isActive ? boolean @ Indicates if the event is active or not.
---@field isRepeatable? boolean @Indicates if the event repeats
---@field isShown? boolean @Indicates if the event triggering shows in log
---@field probability? string @ The events chance to occur (0-100)
---@field newName? string @ changes the description to this new value. why this isnt newDescription is beyond me probably backward compat reasons.

---Doctrine options you get back|set via GetDoctrine() SetDoctrine().   
---For each field, there is an added version with the suffix "_player_editable", of type boolean which determines if the player can alter the setting.  
---Not applicable to the Withdraw/Deploy options.  
---When setting the option, the indicated value or it's enum number can usually be used.
---@class CMO__Doctrine:table @
---@field use_nuclear_weapons ? boolean @True if the unit should be able to employ nuclear weapons
---@field engage_non_hostile_targets ? boolean @True if the unit should attempt hostile action against units that are not hostile
---@field rtb_when_winchester ? boolean @(obsolete, see the new doctrine options) True if the unit should return to base when out of weapons
---@field ignore_plotted_course ? boolean @True if the unit should ignore plotted course
---@field engaging_ambiguous_targets ? string @Ignore(0), Optimistic(1), or Pessimistic(2)
---@field automatic_evasion ? boolean @True if the unit should automatically evade
---@field maintain_standoff ? boolean @True if the unit should try to avoid approaching its target, only valid for ships
---@field use_refuel_unrep ? string @Always_ExceptTankersRefuellingTankers(0), Never(1), Always_IncludingTankersRefuellingTankers(2)
---@field engage_opportunity_targets ? boolean @True if the unit should take opportunistic shots
---@field use_sams_in_anti_surface_mode ? boolean @True if SAMs should be used to engage surface targets
---@field ignore_emcon_while_under_attack ? boolean @True if EMCON should be ignored and all systems should go active when engaged
---@field quick_turnaround_for_aircraft ? string @Yes(0), FightersAndASW(1), No(2)
---@field air_operations_tempo ? string @Surge(0), Sustained(1)
---@field kinematic_range_for_torpedoes ? string @AutomaticAndManualFire(0), ManualFireOnly(1), No(2)
---@field weapon_control_status_air ? string|integer @Free(0), Tight(1), Hold(2)
---@field weapon_control_status_surface ? string|integer @Free(0), Tight(1), Hold(2)
---@field weapon_control_status_subsurface ? string|integer @Free(0), Tight(1), Hold(2)
---@field weapon_control_status_land ? string|integer @Free(0), Tight(1), Hold(2)
---@field refuel_unrep_allied ? string @Yes(0), Yes_ReceiveOnly(1), Yes_DeliverOnly(2), No(3)
---@field fuel_state_planned ? string|integer @ CMO__Constants.WRAFuelState See _enumTable_:Doctrine("fuelstate"), Bingo(0), Joker10Percent(1), Joker20Percent(2), Joker25Percent(3), Joker30Percent(4), Joker40Percent(5), Joker50Percent(6), Joker60Percent(7), Joker70Percent(8), Joker75Percent(9), Joker80Percent(10), Joker90Percent(11)
---@field fuel_state_rtb ? string @No(0), YesLastUnit(1), YesFirstUnit(2), YesLeaveGroup(3)
---@field weapon_state_planned ? string|integer @ CMO__Constants.WRAWeaponState @See _enumTable_:Doctrine("weaponstate")
---@field weapon_state_rtb ? string @No(0), YesLastUnit(1), YesFirstUnit(2), YesLeaveGroup(3)
---@field gun_strafing ? string @No(0), Yes(1)
---@field jettison_ordnance ? string @No(0), Yes(1)
---@field avoid_contact ? string @No(0), Yes_ExceptSelfDefence(1), Yes_Always(2)
---@field dive_on_threat ? string @Yes(0), Yes_ESM_Only(1), Yes_Ships20nm_Aircraft30nm(2), No(3)
---@field recharge_on_patrol ? string @Recharge_Empty(0), Recharge_10_Percent(10), Recharge_20_Percent(20), Recharge_30_Percent(30), Recharge_40_Percent(40), Recharge_50_Percent(50), Recharge_60_Percent(60), Recharge_70_Percent(70), Recharge_80_Percent(80), Recharge_90_Percent(90)
---@field recharge_on_attack ? string @Recharge_Empty(0), Recharge_10_Percent(10), Recharge_20_Percent(20), Recharge_30_Percent(30), Recharge_40_Percent(40), Recharge_50_Percent(50), Recharge_60_Percent(60), Recharge_70_Percent(70), Recharge_80_Percent(80), Recharge_90_Percent(90)
---@field use_aip ? string @No(0), Yes_AttackOnly(1), Yes_Always(2)
---@field dipping_sonar ? string @Automatically_HoverAnd150ft(0), ManualAndMissionOnly(1)
---@field bvr_logic ? string @StraightIn(0), Crank(1), Drag(2)
---@field withdraw_on_damage ? string @Ignore(0), Percent5(1), Percent25(2), Percent50(3), Percent75(4)
---@field withdraw_on_fuel ? string @Ignore(0), Bingo(1), Percent25(2), Percent50(3), Percent75(4), Percent100(5)
---@field withdraw_on_attack ? string @Ignore(0), Exhausted(1), Percent25(2), Percent50(3), Percent75(4), Percent100(5), LoadFullWeapons(6)
---@field withdraw_on_defence ? string @Ignore(0), Exhausted(1), Percent25(2), Percent50(3), Percent75(4), Percent100(5), LoadFullWeapons(6)
---@field deploy_on_damage ? string @Ignore(0), Percent5(1), Percent25(2), Percent50(3), Percent75(4)
---@field deploy_on_fuel ? string @Ignore(0) Bingo(1), Percent25(2), Percent50(3), Percent75(4), Percent100(5)
---@field deploy_on_attack ? string @Ignore(0), Exhausted(1), Percent25(2), Percent50(3), Percent75(4), Percent100(5), LoadFullWeapons(6)
---@field deploy_on_defence ? string @Ignore(0), Exhausted(1), Percent25(2), Percent50(3), Percent75(4), Percent100(5), LoadFullWeapons(6)

---A WRA Doctrine entry. Obtained\set via GetDoctrineWRA(selector) | SetDoctrineWRA(selector,WRA)
---When getting if .WRA is nil then it's using inherited options.  
---When setting a WRA, weapon_dbid, and target_type act as selectors.
---@class CMO__DoctrineWRA:table @ WRA Doctrine options. 
---@field WEAPON_DBID string @Weapon number [info] can also be WEAPON_ID when setting. (readonly)
---@field WEAPON_NAME string @Weapon name [info] (readonly)
---@field TARGET_TYPE integer @ TargetTypeWRA code# @Type of target [info] can look these up in CMO__Constants.TargetTypeWRA.name=value or _enumTable_:Doctrine("wratargettype")
---@field LEVEL string @The doctrine selected (at unit/mission/side) - useful Is just using GUIDs [info] ('UNIT','MISSION','SIDE' - group=='UNIT')
---@field WRA? CMO__WRA @The WRA doctrine table for the single weapon, or wra_# for each weapon against a specific target_type


---Unit damage.  
---The component table list consists of entries for each component you want damanged\changed, identified using the following:
---if the entry is in the format {'someguidhere',damagelevelnumber} then component will be matched by component guid and set the the damagelevel.  
---if the entry is in the format of {'type',Type='Sensor',damagelevelnumer} then provided one or more components of that type exist on the unit.  
---It will randomly select one of that type to do the specified damagelevel upon.  
---Special Cases:  
--- if damageLevel is 'none', then the component will be repaired.  
--- if damageLevel is 'destroyed', then the component will be destroyed.  
--- Specific type names ( 'Sensor','CommDevice','Engine','RUDDER','CIC','CARGO','PRESSUREHULL' etc) full list in CMO__Constants.ComponentType.  
---@class CMO__DamageOptions @ used by ScenEdit_SetUnitDamage()
---@field guid? string @ guid of the unit to use to select the unit.
---@field side? string @ side or guid of the side to use to select the unit
---@field unitname? string @ name of the unit to use to select the unit.
---@field fires? string|number @ string code for the fire or number 0-4 CMO__Constants.FireIntensityLevels
---@field flood? string|number @ string code for the fire or number 0-4 CMO__Constants.FloodingIntensityLevel
---(AS of 1147.30 this takes a integer request has been put in for it to change to single prior version were hard ints)
---https://www.matrixgames.com/forums/tm.asp?m=5035836 logged as #14602
---@field dp number @ the number of DPs to remove from the units present number. If you want to add dps back use negative numbers. 
---If a generic name is used ie (Sensors or Engine) then if there is more than one of that type a random one is chosen to inflict the damage on.  
---For a list of damagelevel codes and generic names see CMO__Constants.ComponentDamageLevel and CMO__Constants.ComponentType for hints.
---@field components table @ Table of component damage settings{ { componentsguid or genericname, damageLevel }, {Type='typenamehere',damagelevel}}


---@class CMO__Constants:table @
---@field TargetTypeWRA table @ table of target codes [stringname]=integer value.
---@field WRAWeaponState table @ table of WRA Doctrine codes [stringname]=integer value.
---@field WRAFuelState table @ table of WRA fuel state codes [stringname]=integer value
---@field WRARechargeBattery table @ table of WRA recharge battery code [stringname]=integer value.
---@field FuelTypes table @ table FuelType.



---@class CMO__GetCircleOfPoints_Params:table
---@field latitude number @ the latitude to use as center of the circle.
---@field longitude number @ the longitude to use as center of the circle.
---@field numpoints integer @ the number of points in the circle desired.
---@field radius number @ radius in nmi. if used must be > 0.0

---@class CMO__LandCoverData:table
---@field text string @ text name
---@field value number @ enum value

---@class CMO__CZ_DataTable:table
---@field ["1"] number @zone 1
---@field ["2"] number @zone 2
---@field ["3"] number @zone 3
---@field ["4"] number @zone 4

---@class CMO__LayerData:table
---@field ceiling number
---@field floor number
---@field strength number

---@class CMO__LocationData @ returned from World_GetLoction
---@field altitude number @ the altitude or the depth if negative (in meters).
---@field layer? CMO__LayerData @ if water the layer data for the location.
---@field cz? CMO__CZ_DataTable @ if location is water a CZ data table containing cz data.
---@field slope? number @ If land, The slope/angle of the location.
---@field cover? CMO__LandCoverData @If on land present and a text=value table of cover data.


---@class CMO__GetPointFromBearing_Params:table
---@field latitude number|string @ the starting latitude, can use depricated "Lat" as well
---@field longitude number|string @ the starting longitude, can use depriceated "Lon" as well 
---@field bearing number @ the bearing to use, decimal from 0.0-359.99
---@field distance number @ the distance to get the point at in nmi.

---@class CMO__SetUnitDescriptor:table @ field available when creating a unit or using SetUnit.
---@field type string @The type of unit (Ship, Submarine|Sub, Aircraft|Air, Facility|Land, Satellite, Weapon)
---@field name string @The name of the unit
---@field side string @The side name or GUID to add unit to
---@field dbid number @The database id of the unit
---@field latitude? number|string @ Not required if abase is defined
---@field longitude? number|string @Not required if abase is defined
---@field base? string @Unit base name or GUID where the unit will be 'hosted' (applicable to AIR, SHIP, SUB)
---@field loadoutid? number @Aircraft database loadout id (applicable to AIR)
---@field altitude? number @Unit altitude (applicable to AIR)
---@field depth? number @Unit depth (applicable to SUBMARINE - note no sign)
---@field orbit? number @Orbit index (applicable to SATELLITE)
---@field guid? string @Optional custom GUID to override auto one
---@field heading? number @optional heading in degrees to set the unit too now.
---@field desiredheading? number @ optional heading in degrees to set unit to turn-to.
---@field group? string @ group name to add the unit to.
---@field mission? string @ name or guid of mission on the units side to add it to after creation.
---@field course? CMO__TableOfWaypoints @ table of waypoint data to add to the unit after creation.
---@field speed? number @ speed to set the unit too mutual exclusive with throttle.
---@field throttle? string @ throttle pre-set name to se the unit too, mutually exclusive with speed.
---@field launch? boolean @ set to true to launch the aircraft or boat immediately
---@field rtb? boolean @ set this to true to rtb the unit after creation.
---@field refuel? string @ true|false set this to true to force the unit to refuel or false to cancel a current refuel.
---@field moveto? boolean @ true|false to enable the unit to 'move to' the desired speed\altitude over time vs doing it immediately. (when false thing of this as desired X being used.)
---@field autodetectable? boolean @ true to make this unit visiable immedately to all other sides. (can in some instances take upto the next 1 minute marker to take full effect.)
---@field outofcomms? boolean @ true to set this unit to out-of-comms state.
---@field holdposition? boolean @ ??true to basically pause this unit?????
---@field holdfire? boolean @ set to true to automatically set all four major doctrine settings to "Hold", false I believe sets these to tight.
---@field Proficiency? string|number @ set to 0-4 lowest to highest or preset strings "Novice|Cadet|Regular|Veteran|Ace".
---@field manualthrottle? string|number @ if "CURRENT|DESIRED|OFF" determines how to use the throttle setting. If a preset-speed string|eum number sets the speed. Complicated and finiky ask in forums
---@field manualspeed? string|number @ if "CURRENT|DESIRED|OFF" determines how to use the speed setting. If a number sets the speed to that number.
---@field manualaltitude? string|number @ if "CURRENT|DESIRED|OFF" determines how to use the altitude setting. If a number sets the altitude\depth to that number, if string parses it for a preset-altitude or depth codeword or enum value.
---@field fuel? CMO__TableOfFuelStates @ if used modifies the units fuel according ot the table of fuel states feed to it.
---@field SprintDrift? boolean @ enables|disables sprint and drift option on a unit or group object.
---@field unassign? boolean @ if being set to true triggers an 'unassign' action similar to pressing "u" in the gui, unit disengages from any current actions,drops targets (temporarly), and is unassigned from current mission.


---@class CMO__AttackOptions @ attack options table to use with AttackContact()
---@field mode string|number @Targeting mode "AutoTargeted"|"0", "ManualWeaponAlloc"|"1","ManualTargeted"|"2"   (Defaults to AutoTageted.) Use 2 for BOL, and|or mount options.
---@field mount number @If used The attackers mount DBID or 0 for loadout mount. (default to loadout if not specified)
---@field weapon number @The attackers weapon DBID (ai choses weapon if not specified, typically based on WRA.)
---@field qty number @How many to allocate (ai choses number based on WRA if not specified )
---@field latitude number @ If BOL used, the latitude to attack.
---@field longitude number @ If BOL used, the longitude to attack.
---@field course CMO__TableOfWaypoints @ If BOL use, a table of waypoints representing the course the weapon should use IF the weapon is course programable. Limited to the number of course entries allowed for the weapon in the database, typically at least 20.


---@An entry in the custom loss table(s) used in AddCustomLoss and SideWrapper.losses.
---@class CMO__CustomLossTable:table
---@field ['somename'] string @ somename= the name you give to the entry, the value is what you set this field too.
---@alias CMO__TableOfCustomLosses table<string,number> @ a table of one or more Custom Loss Entries.

---@class CMO__ContactSelector @ a side contact selector table.
---@field side string @ the sidename or guid of the side to search within.
---@field guid? string @ the guid of the contact wrapper to select|get from this specific side, can also be a string name of the contact on that side.
---@field unitname? string @ if used the name of the unit to select + side

---@class CMO__RefuelOptions:table
---@field side? string @ if used the side of the unit being selected + name
---@field unitname? string @ if used the name of the unit to select + side
---@field guid? string @ if used the guid of the unit to select.
---@field tanker? string @ tanker defined by its unitname (side is assumed to be the same as unit) or tankers guid.
---@field mission? string @ mission defined by its name or guid.


---Used when creating updating or removing an Action.
---@class CMO__ActionUpdate:table
---@field ID ? string @ The guid of the action [READONLY]
---@field name ? string @ The name of the action 
---@field Description ? string @ Description or GUID of action (You can actually use 'Name' as well and it will be auto converted to Description.)
---@field NewName? string @ If specified, the new name of the action (technically updates 'Description').
---@field Mode? string @ Operation to do - 'list', 'add', 'remove', 'update' ('update' is the default if not specified).
---@field Type? string @ Type of action string code [required only for 'add' option]  'TeleportInArea|Points|Message|LuaScript|ChangeMissionStatus|EndScenario'
---@field UnitIDs? table @ table of unit guid [TeleportInArea]
---@field Area? table @ table of RPs [TeleportInArea]
---@field SideID? string @guid of a side [Points and Message]
---@field text? string @ text of a message (this iterpeted\expects HTML4.0 with ie 8-9x compatibility) [Message]
---@field PointChange? number @ amount to add to side (use negative to result in subtraction) [Points]
---@field ScriptText? string @ escaped text of the LuaScript [LuaScript]
---@field MissionID? string @ guid of the missions [ChangeMissionStatus]
---@field NewStatus? number @ 1 for active and 2 for inactive [ChangeMissionStatus]


---Used when creating updating or removing a Condition.
---@class CMO__ConditionUpdate:table
---@field ID ? string @ The GUID of the action [READONLY]
---@field name  string @ The name of the condition
---@field Description string @ Description or GUID of action (You can actually use 'Name' as well and it will be auto converted to Description.)
---@field NewName? string @ If specified, the new name of the action (technically updates 'Description').
---@field Mode? string @ Operation to do - 'list', 'add', 'remove', 'update' ('update' is the default if not specified).
---@field Type? string @ Type of Condition string code [required only for 'add' option]  'LuaScript|SidePosture|ScenHasStarted'
---@field ScriptText? string @ escaped text of the LuaScript [LuaScript]
---@field NOT? boolean @ the opposite of the condition. (same as checking 'not' checkbox in the editor) [ScenHasStarted|SidePosture]
---@field ObserverSideID? string @ guid of the Observer side. 'blueguid'
---@field TargetSideID? string @ guid of the side to interogate relative to the observer. 'redguid'
---@field TargetPosture? string @ posture of the target to the observer. 'blue considers red hostile?'


---Used when creating updating or removing a Trigger.
---@class CMO__TriggerUpdate:table
---@field ID ? string @ The GUID of the action [READONLY]
---@field name ? string @ The name of the trigger
---@field Description ? string @ Description or GUID of action (You can actually use 'Name' as well and it will be auto converted to Description.)
---@field NewName? string @ If specified, the new name of the action (technically updates 'Description').
---@field Mode? string @ Operation to do - 'list', 'add', 'remove', 'update' ('update' is the default if not specified).
---Type string codes: Points| RandomTime| RegularTime| ScenEnded| ScenLoaded| Time| UnitDamaged| UnitDestroyed| UnitDetected| UnitEmissions|
--- UnitEntersArea| UnitRemainsInArea| UnitBaseStatus| UnitCargoMoved
---@field Type? string @ Type of Trigger string code [required only for 'add' option]
---@field SideID? string @ guid of side involved.
---@field PointValue? number @ point value [Points]
---@field ReachDirection? any @ ?? [Points]
---@field EarliestTime? number @ .netticktime [RandomTime]
---@field LatestTime? number @ .netticktime [RandomTime]
---@field Interval? number @ enumcode 0-11 if I recall right [RegularTime] see CMO__Constants.EventTimeInterval.
---@field Time? string|osdate @ .netticktime [Time]
---@field DamagePercent? number @ [UnitDamaged]
---@field TargetFilter? CMO__TargetFilter-UnitsInArea @ table of targetfilter options [UnitDamaged, UnitDestroyed, UnitDetected, UnitEmissions, UnitEntersArea, UnitRemainsInArea, UnitBaseStatus]
---@field Area? table @ [UnitDetected, UnitEmissions, UnitEntersArea, UnitRemainsInArea]
---@field DetectorSideID? string @ guid of detecting side.[UnitDetected, UnitEmissions]
---@field MCL? any @ detection classification level [UnitDetected, UnitEmissions]
---@field NOT? boolean @ invoke opposite of the set parameters. [UnitEntersArea]
---@field ETOA? number @ .netticktime? entertime limits related [UnitEntersArea]
---@field LTOA? number @ .netticktime? leavetime limits related [UnitEntersArea]
---@field ExitArea? boolean @ treat trigger as unit Exits area instead of entering. [UnitEntersArea]
---@field TD? any @ Target Duration in the area?  [UnitRemainsInArea]
---@field TargetCondition? any @ Condition of the base. [UnitBaseStatus]
---@field BaseUnit? string @ the guid of the base unit? [UnitCargoMoved]
---@field CargoFilter? table @ cargo filter table [UnitCargoMoved]


---Table returned from successful SetTrigger,SetCondition, or SetAction call  
---When doing and ADD,UPDATE or REMOVE.  
---Example structure: retTable{ actions={xml='', mode='', Message={} } }  
---Example: retTable.actions.Message.ID  
---When doing a LIST the table does not contain xml\mode etc in the root but each extry has it's own index\entry ie...
---Example structure: retTable={ actions[i]={xml='', mode='', Message={} } }  
---so here you would do retTable.actions[1].Message.ID (or loop though them if more than one which there never should be in typical TCA)  
---But I think this format is reused when doing something like a GetEvents(2) for example. Which explains why it is the way it is.
---@class CMO__TCA_ReturnTable:table
---@field actions? table @ actions table with fields  xml=,mode= and the TheTypeCode={[action key\value pairs are actually here]}
---@field conditions? table @ contains table with fields xml=,mode=, and the TheTypeCode={[action key\value pairs are actually here]}
---@field triggers? table @ triggers table xml=,mode=, and the TheTypeCode={[action key\value pairs are actually here]}


---Used to do add,remove,replace, and update on an event's collection of actions, conditions and triggers.
---@class CMO__EventTCAUpdate:table @ a table of options for doing a trigger, condition or action update on an Event.
---@field guid? string @ the guid of the trigger,condition, or action object involved. can be used instead of description directly (faster).
---@field mode? string @ either one of 'add','replace','remove'. (defaults to 'update'- an invalid operation wtf even though there is code to treat it like replace?)
---@field name string @ name or ID (guid by other identifier) of the trigger,condition,or action involved. 
---@field ReplacedBy? string @ name or ID (guid by other identifier) of the trigger,condition,or action replacing the existing one. (undocumented)



--[[  END CLASS AND ALIAS DEFS  --]]



--[[  BEGIN SCENEDIT FUNCTION DEFS  --]]



---@return string @ returns the current build number of the cmo runtime ie 1147.30
function GetBuildNumber() end


---@return string @ returns the title of the currently loaded scenario
function GetScenarioTitle() end


---Add entries to the loss list so it can displyed. It wil also show up in the wrapper side.losses.  
---The additional entries replace any existing ones. To remove an entry, use a numeric value of 0 for an existing entry.
---@param theside string @ The name or guid of the side to add the custom loss too.
---@param thetable CMO__TableOfCustomLosses @ The table of entries you want to add or remove.
---ScenEdit_AddCustomLoss( 'Blue', { {'removethis',0},{'Casualties', 10000} } ) 
function ScenEdit_AddCustomLoss(theside,thetable) end


---Detonates a warhead at a specified location.   
---@param ExplosionTable CMO__Explosion @ The table of explosion details {lat,lon,warheadid,alitude}
---ScenEdit_AddExplosion({warheadid=253, latitude=unit.latitude, longitude=unit.longitude, altitude=unit.altitude})
function ScenEdit_AddExplosion(ExplosionTable) end


---Attempt to lay a minefield 
---@param theside string @ the side name or guid to lay the mines on.
---@param thedbid number @ The database id of the mine to use.
---@param thenumber number @ The number to try to lay.
---@param thedelay number @ The arming delay in seconds.
---@param thearea table @ The area (as table of RP points, either names | lat and lon combos) to lay mines in.
---@return number @ the number of mines laid.
---Example:  
---ScenEdit_AddMinefield ( { side='Blue', dbid=2345, number=100, delay=60000, area={'rp-1','rp-2','rp-3','rp-4'} } )
function ScenEdit_AddMinefield(theside,thedbid,thenumber,thedelay,thearea) end


---Add a new mission
---@param SideNameOrId string @The mission side
---@param MissionNameOrId string @The mission name
---@param MissionType string @The mission type (Strike, Ferry, Patrol, etc)
---@param MissionOptions CMO__Mission @The mission specific options as a table
---@return CMO__Mission  @A mission wrapper of the added mission or nil on failure (such as mission already exists by that name on that side).
---Example:  
---local mission = ScenEdit_AddMission('USA','Marker strike','strike',{type='land'})
function ScenEdit_AddMission(SideNameOrId,MissionNameOrId,MissionType,MissionOptions) end


---Add new reference point(s).
---This function adds new reference point(s) as defined by a descriptor.As this function also calls ScenEdit_SetReferencePoint() at the end,
---those parameters can also be passed in this function. It can take a new reference point, or a table of new reference points.
---The descriptor must contain at least a side, and one set of latitude and longitude, or an area defined by one or more latitude and longitude values.  
---Points can also be relative to a unit based on bearing and distence.This applies to ALL bearing type rp(s) in the function. 
---The field  RelativeTo is The unit name/GUID that the RP(s) are relative to.  
---  
---Parameter: CMO__ReferencePointDescriptor or {CMO__ReferencePoint} - The reference point details to be created.  
---Field 'area' can be  
---(a) Table of reference points {name, longitude, latitude} if 'RelativeTo' not used, or  
---(b) table of reference points {name, bearing, distance} if 'RelativeTo' used.  
---Leaving out name will default it to noraml 'RP-..'
---@param CMO__ReferencePointDescriptor CMO__ReferencePointDescriptor @ The reference point details to be created.
---@return CMO__ReferencePoint @ The reference point wrapper for the new reference point, or the first one in an area.
---Example:  
---ScenEdit_AddReferencePoint( {side="United States", name="Downed Pilot", lat=0.1, lon=4, highlighted=true})  
---ScenEdit_AddReferencePoint( {side='sidea', RelativeTo='USN Dewey', bearing=45 ,distance=20, clear=true })
function ScenEdit_AddReferencePoint(CMO__ReferencePointDescriptor) end


---Adds weapons into a mount.  
---@param CMO__Weapon2MountDescriptor CMO__Weapon2MountDescriptor @ table describing the unit, optional mount, weapons and other options.
---@return number; @ number of items successfully added to the mount.
---Example: ScenEdit_AddReloadsToUnit({unitname='Mech Inf #1', wpn_dbid=773, number=1, number=10})
function ScenEdit_AddReloadsToUnit(CMO__Weapon2MountDescriptor) end


---Adds a new side to the scene  
---@param tbl table @ A simple table with the 'name' key set to the string of the new side name. {name="MyNewSide"};  
---@return CMO__Side @ the side wrapper for the new side, or nil on failure (such as a side with that name exists already)
---Example: ScenEdit_AddSide({name='OPFOR'})
function ScenEdit_AddSide(tbl) end


---Adds a new special action to the side specified, with specified details.  
---@param CMO__SpecialActionUpdate CMO__SpecialActionUpdate  @ table of details of the special action to add
---@return CMO__SpecialAction @ the special action table\wrapper of the newly created SA.
---@Example: ScenEdit_AddSpecialAction({side="Blue",ActionNameorId="SayHello",Description="This action says hello", ScriptText="ScenEdit_MsgBox('Hello World');\r\n"})
function ScenEdit_AddSpecialAction(CMO__SpecialActionUpdate) end


---Adds a new unit to the scene on the specified side, with the specified details.  
---Absolute minimum required is basically {side,type,name,dbid and lat|lon or base, if aircraft a loadoutid even if it's 0}.
---Also nearly all if not all 'set unit' options can be feed to AddUnit.  
---@param CMO__SetUnitDescriptor CMO__SetUnitDescriptor
---@return CMO__Unit|nil @ Unit wrapper of the created new unit on success, nil on error.
---Examples:  
---ScenEdit_AddUnit({side ='NATO', type ='Aircraft', name ='F-15C Eagle', dbid=3500, loadoutid=16934, heading=0, Latitude="N46.00.00",Longitude="E25.00.00", altitude="5000 ft",autodetectable="false",holdfire="true",proficiency=4})  
---local u = ScenEdit_AddUnit({side ='NATO', type ='Aircraft', name ='F-15C Eagle #2', dbid=3500, loadoutid=16934, base="MyAirbaseName",proficiency=4});  
---if u~=nil then print(u.name .. ' ' u.guid); end  
---ScenEdit_AddUnit({side ='NATO', type ='Ship', name ='USS KH', heading=90, dbid=341, Latitude=1.0,Longitude=1.0, holdfire=true,proficiency=5,speed=12})
function ScenEdit_AddUnit(CMO__SetUnitDescriptor) end

---comment
---@param CMO__LoadoutAvailable CMO__LoadoutAvailable any
function ScenEdit_SetLoadoutAvailable(CMO__LoadoutAvailable) end

--- DEPRICATED: Use ScenEdit_AddUnit type='Ship' instead.
---@deprecated
function ScenEdit_AddShip() end
--- DEPRICATED: Use ScenEdit_AddUnit type='Submarine' instead.
---@deprecated
function ScenEdit_AddSubmarine() end
--- DEPRICATED: Use ScenEdit_AddUnit type='Aircraft' instead.
---@deprecated
function ScenEdit_AddAircraft() end
--- DEPRICATED: Use ScenEdit_AddUnit type='Facility' instead.
---@deprecated
function ScenEdit_AddFacility() end


---Adds weapons into a magazine.  
---If mag_guid not used will attempt to stick the weapons into the first found available max with some space.
---@param CMO__Weapon2MountDescriptor CMO__Weapon2MountDescriptor @ table describing the unit, optional mount, weapons and other options.
---@return number; @ number of items successfully added to the magazine.
---  
---Example: ScenEdit_AddWeaponToUnitMagazine({side='Blue', unitname='Ammo Unit #1', wpn_dbid=773, number=5, max_cap=10}))
function ScenEdit_AddWeaponToUnitMagazine(CMO__Weapon2MountDescriptor) end


---Add no-nav or exclusion zone.  
---The RPs are normally visible to the side. They can start out 'hidden' by adding hidden=true to the table.  
---@param sideName string @ Side name/GUID
---@param zoneType integer @ Use 0 for 'NoNavZone', 1 for 'ExclusionZone' - Docs say string but they are wrong.
---@param CMO__Zone CMO__Zone @ Table of Zone details to use while adding the new zone. At a minimum description is required.
---@return CMO__Zone|nil @ The created zone wrapper if successful otherwise nil.
---Example1: local z = ScenEdit_AddZone("blue",0,{description="myNoNavZone",isactive=true, affects={'Ship','Submarine'}, Area={rp-1,rp-2,rp-3}, locked=true})  
---Example2: local z = ScenEdit_AddZone("blue",1,{description="myExclusionAroundAUnit",isactive=true, affects={'Aircraft'}, Area={rp-1,rp-2,rp-3}, relativeto="SomeBlueUnit", markas="Unfriendly"})
function ScenEdit_AddZone(sideName,zoneType,CMO__Zone) end


---Assigns targets to a Strike mission.  
---'UnitX' can be used as a unit descriptor. Contacts can also be assigned.  
---@param AUNameOrIDOrTable string @ Name or guid of the unit, or simple table containing the of names/GUIDs to add to target list
---@param MissionNameOrID string @ The mission to update
---@return  table @ table of guids added as targets to the strike mission.
---Example: ScenEdit_AssignUnitAsTarget({'target1','target2'},'My strike Mission');  
---Example2: ScenEdit_AssignUnitAsTarget('UnitX','Land strike');
function ScenEdit_AssignUnitAsTarget(AUNameOrIDOrTable,MissionNameOrID) end


---Assigns the specified unit to a mission.
---@param AUNameOrID string @ The unit name or guid. (since there is no side this is a good example of why you want to have unique names for units or use guids most places.)
---@param MissionNameOrID string @ The name of the mission or guid of the mission (since there is no side this is a good example of why you want unique mission names or use guids.)
---@param Escort? boolean @ If supplied and set to True indicates the unit is too be added as an escort.
---@param MissionPlanner? boolean @ defaults to false, undocumented pro? If true it may invoke the missionplanner immediately create the flight plan for the unit?
---@return boolean @ true on success, false on failure.
function ScenEdit_AssignUnitToMission(AUNameOrID,MissionNameOrID,Escort,MissionPlanner) end


---Attack a contact as an auto-target or manual target with weapon allocation.
---For a BOL attack, use "BOL" as the contactId.
---@param attackerID string @The unit attacking as GUID or Name
---@param contactId string @The contact being attacked as GUID or Name (GUID is better as the name can change as its classification changes) or "BOL"
---@param options CMO__AttackOptions @ a CMO__AttackOptions table which contains type of attack and weapon allocation details if required)
---@return boolean @ true if successfully assigned otherwise false.
---Example (alloc 10 gunfire from mount):  
---ScenEdit_AttackContact(attackerID, contactId ,{mode='1', mount=438, weapon=1413, qty=10});  
---Example (bol from loadout):  
---ScenEdit_AttackContact(attackerID, "BOL" ,{mode='2', latitude=1.0,longitude=1.0 weapon=2378, course={{latitude=1.0,latitude=1.5}, {latitude=1.0,latitude=1.0},{latitude=1.0,latitude=1.5}}, qty=1});
function ScenEdit_AttackContact(attackerID, contactId, options) end


--- Clears\Empties all weapon reacords from the magazines on a unit, or all member units of a group object.
--- @param CMO__UnitSelector CMO__UnitSelector  @ side+name or guid of the unit or group to operate on.;
--- @return nil @ void - does not return anything.
function ScenEdit_ClearAllMagazines(CMO__UnitSelector) end


--- Clears a key value from the scenario save file's persistant key-store.
--- *warning* if key to clear is unspecified or empty all keys from the persistent key store.
---@param keyName string @The key to clear or empty for all
---@param forCampaign? boolean @ if included clears the key-store for passing data to the next scenario in a campaign. (defaults to false)
---@return boolean @ true on Success, otherwise false on failure.
---Example:  ScenEdit_ClearKeyValue("SomeKeyName");
function ScenEdit_ClearKeyValue(keyName,forCampaign) end


---Get the current scenario local time.
---@return string @ The local time as HH:MM:SS.
function ScenEdit_CurrentLocalTime() end


---Get the current scenario time.
---@return integer The UTC Unix timestamp of the current time in-game.
---If you need the .netTickTime used in events you can multiply this by 10,000,000 and then add 621355968000000000 (number of ticks since jan 1 0000 to unix epoc) to it.
function ScenEdit_CurrentTime() end


---Deletes a specific mine
---@param sidename string @Side name or guid
---@param mineguid string @Mine guid
---@return boolean @ true on success otherwise false
---Example: local a = ScenEdit_DeleteMine({side='Blue', guid='cccccccc'} );
function ScenEdit_DeleteMine(sidename,mineguid) end


---Delete a minefield
---@param sideName string @Side name or guid
---@param areaTable CMO__TableOfReferencePoints @ The area (as table of RP points) to remove mines from
---@return number @number of mines removed
---Example: local a = ScenEdit_DeleteMinefield({side='Blue', area={'rp-1','rp-2','rp-3','rp-4'} } );
function ScenEdit_DeleteMinefield(sideName,areaTable) end


---Deletes a mission... and unassigns any units attached to it.
---@param SideNameOrId string @The mission side
---@param MissionNameOrId string @The mission name
---@return boolean @ True if mission has been removed.
---Example: local mission = ScenEdit_DeleteMission('USA','Marker strike');
function ScenEdit_DeleteMission(SideNameOrId,MissionNameOrId) end


---Deletes a reference point.
---Given a reference point selector, this function will remove it.
---@param CMO__ReferencePointSelector CMO__ReferencePointDescriptor @Specifying the side+name or guid of The reference point to delete.
---@return boolean @ True if deleted otherwise false.
---Example: local retval = ScenEdit_DeleteReferencePoint({side="Blue",name="BlueRP-1"});
function ScenEdit_DeleteReferencePoint(CMO__ReferencePointSelector) end


---Deletes unit... WITHOUT triggering any event triggers or scoring\loss issues.
---This serves as a way to quietly remove a unit vs ScenEdit_KillUnit which will kill\destroy the unit invoking events and such.  
---@param CMO__UnitSelector CMO__UnitSelector @ The side+name or guid of the unit or group object to delete.
---@param includeMembers? boolean @ Set to true to also delete attached units with-in a group. (defaults to false - does not delete group members)
---@return boolean @ true on success false on errors.
---Example: ScenEdit_DeleteUnit({side="United States", unitname="USS Abcd"}); --deletes a named unit. 
---Example: ScenEdit_DeleteUnit({guid="SomeGroupObjectsGuidHere"},true);  --deletes a group AND all members of that group.
function ScenEdit_DeleteUnit(CMO__UnitSelector,includeMembers) end


--- Function attempts to distribute a weapon entry across a grouped set of other unit that contain at least 2 weapon magazines.
--- This is generally a function for use by authors during development.
---@param ParamTable table @ {unitname,side,guid, WPN_DBID, NUMBER} typical unitselector fields pluse wpn_dbid for what weapon to add, number for amount to add to each mag.
---@return nil @ void - Does not retun anything ever
---@Example: ScenEdit_DistributeWeaponAtAirbase({guid="someairbasegroupguid",WPN_DBID="2378","32"}) --add 32 agm158c to one mag on each unit that has one if room.
function ScenEdit_DistributeWeaponAtAirbase(ParamTable) end


---Ends the current scenario and triggers any End_Scenario related events (should work properly in 1147.27+).
function ScenEdit_EndScenario() end


---Active Event .. that has been triggered.Otherwise, anil is returned.
---Note that EventX() can also be used as a shortcut for ScenEdit_EventX()   0
---*** Either shortcut are only available accurately during an event's execution cycle. ***
---@return CMO__Event|nil @ The triggering events Event wrapper/table/object or nil if Outside executing event.
---Example: local someEvent = ScenEdit_EventX()   
---print( tostring(someEvent.details.description) );
function ScenEdit_EventX() end


---Executes an existing event Action.
---** Only works for LuaScript Actions as of build 1147.30 **.
---@param EventActionNameorGuid string @ The name/description field of the LuaScript Action that will be invoked. (note Action name lookups are case insensive and lowercase is used.)
---@return string|nil @ will be nil on error, "" empty string upon doing nothing but not erroring, and "Ok" upon success.
---Example: ScenEdit_ExecuteEventAction("NameOfSomeLuaScriptAction");
function ScenEdit_ExecuteEventAction(EventActionNameorGuid) end

---Executes an existing event Action.
---** Only works for LuaScript Actions as of build 1147.30 **.
---@param SpecialActionNameorGuid string @ The name field of the Special Action that will be invoked. (note SA name lookups are case insensive and lowercase is used.)
---@return string|nil @ will be nil on error, "" empty string upon doing nothing but not erroring, and "Ok" upon success.
---Example: ScenEdit_ExecuteSpecialAction("NameOfSomeSpecialAction");
function ScenEdit_ExecuteSpecialAction(SpecialActionNameorGuid) end


---Export unit(s) to an inst file.
---Allows you to export one or more customized units for later re-import. using ScenEdit_ImportInst()
---Files will be saved to \<\<CMOGamePathRoot\>\> \\ImportExport\\YourFileNameOrPathHere.inst as of 1147.30 this can not be changed with .. trickery.
---@param sidename string @The name or GUID of the side owning the exported units
---@param unitList table @list of GUIDs of units to be written to INST file
---@param fileData table @Table of {filename=string, name=string, comment=string} for the INST file. Filename is mandatory.
---@return boolean @ true if success false otherwise.
---Example: ScenEdit_ExportInst('Russia', {'ABCDEF-0123456789ABC'}, {filename='ssbn_patrol.inst',name='SSBN on Patrol',comment='Russian SSBN on patrol in Barents'});
function ScenEdit_ExportInst(sidename,unitList,fileData) end


---Exports mission parameters... as a XML file in folder \<\<CMOGamePathRoot\>\>\\Defaults\\SomeMissionNameOrGuid.xml  
---** [Experimental as this should really be treated like an attachment so can be imported with Scenario]  
---Does not allow file name or path changing as of build 1147.30, filename will be the name of the mission or the guid depending on what you feed it.
---@param SideNameOrId string @The mission side name or guid
---@param MissionNameOrId string @The mission name or guid
---@return string|nil @ the Mission GUID exported or nil on failure.
---Example: local mission = ScenEdit_ExportMission('USA','Some Strike Mission'}); --exports to Some Defaults\'Strike Mission.xml'
function ScenEdit_ExportMission(SideNameOrId,MissionNameOrId) end


---Professional Only [sad face]
---Exports the entire scenario in XML format. This is the native format of the save file, however normally when saved it is compressed and encrypted.  
---This can be useful at times both for debugging, scripted changes to existing scenes by external tools, and other creative uses.
---@return string @ returns the entire scenario graph as uncompressed and unencrypted XML.
---Example: local theXML = ScenEdit_ExportScenarioToXML()
function ScenEdit_ExportScenarioToXML() end



---Fill a unit's magazine(s) with aircraft stores for a specified loadout ID.
---@param CMO_FillMags CMO__FillMagClass @ The unit to select (unitname+side or guid of the unit).
---@return table @ List of reports for successful (or not)additions the table consists of entries per-mag with text messages indicating success or failure.
---Example: local retTable = ScenEdit_FillMagsForLoadout('{side="Blue", name='RAF Lakenheath', loadoutid=5407, quantity=12}');
function ScenEdit_FillMagsForLoadout(CMO_FillMags) end


---Fetches a contact based on a selector.
---This function is mostly identical to ScenEdit_GetUnit except that if returns a contact, from a particular side,
---@param  CMO__ContactSelector CMO__ContactSelector @ The contact to select. Must be defined by a side and contact GUID *for that side*.
---@return CMO__Contact|nil @ A contact wrapper on success or nil on failure.
---Example:  local c = ScenEdit_GetContact({side="United States", guid="SAMPLE-CONTACTGUID01"});
function ScenEdit_GetContact(CMO__ContactSelector) end


---Returns a full table of Contact Wrappers for all contacts on a side.
---Where as a sidewrapper.contacts or :contactsBy contains the name and contact guid, this returns the actual wrappers for all.
---Be careful calling this often when you don't need too as it's performance heavy.
---@param theside string @The name/guid of the side to grab all contacts from.
---@return CMO__TableOfContacts|nil @ a table of Contacts wrappers or nil.
---Example: local listOfContacts = ScenEdit_GetContacts('south korea');  
--- for _,v in ipairs(listOfContacts) do print( tostring(v.age) ); end --print age of all contacts.
function ScenEdit_GetContacts(theside) end


---Gets the doctrine of the designated object.
---This function looks up the doctrine of the object selected by selector, and throws an exception if the unit does not exist.
---@param CMO__DoctrineSelector CMO__DoctrineSelector The selector for the object to look up
---@return CMO__Doctrine @ a table containing all the Doctrine entries including if asked for the actual and _player_editable variants.
---Example: ScenEdit_GetDoctrine({side="Blue"}).use_nuclear_weapons
---Example: local d = ScenEdit_GetDoctrine({mission="Blue_Missionname"},actual=true,player_editable=true);  
---for k,v in pairs(d) do print(k .. '=' .. tostring(v) ) end --dump ALL doctrine values for the mission.
function ScenEdit_GetDoctrine(CMO__DoctrineSelector) end


---Gets the WRA doctrine.  
---This function looks up the doctrine WRA of the object selected by selector.
---It returns the WRA setting In a table For the selected side/mission/unit based On the target type.
---Nothing returned Or empty values means that the weapon Is Not For the target type.
---@param CMO__DoctrineWRASelector CMO__DoctrineWRASelector The selector for the object to look up
---@return CMO__DoctrineWRA|nil @ a table containing the WRA doctrine of the selected object, nil if there are no entries that match the selector.
---Example: local d = ScenEdit_GetDoctrineWRA({guid ='SAMPLE-GUIDHERE12345', contact_id='Boeing 747-8F #610', weapon_dbid=1575});
---Example2: local d = ScenEdit_GetDoctrineWRA({guid ='SAMPLE-GUIDHERE12345', contact_id='SAMPLE-GUIDHERE54321', weapon_dbid=1575});
---Example3: local d = ScenEdit_GetDoctrineWRA({side='sidea', target_type='Surface_Contact_Unknown_Type', weapon_dbid=1575});
---Example4: local d = ScenEdit_GetDoctrineWRA({mission='somemission', target_type=2999, weapon_dbid=1575});
function ScenEdit_GetDoctrineWRA(CMO__DoctrineWRASelector) end


---Gets the properties of an event.
---@param EventDescriptionOrID string @ The name or guid/id of the event to retrieve
---@param level? integer @ The detail required: 0 - full event, (limit return to 1 - triggers, 2 - conditions, 3 - actions, 4 - event) defaults to 0.
---@return CMO__Event|nil @ The event wrapper for the event, or nil if not found.
---Example: local ev = ScenEdit_GetEVent('MyEventName',4) --get the event data but don't bother returning other details.  
---Using the level can save a little performance in extrmely large and complex scenes when you don't need the extra data.
function ScenEdit_GetEvent(EventDescriptionOrID,level) end


---Gets a table of all events in the scene.  
---Last I checked level wasn't working properly with this option.
---@param level? integer @ The detail required: 0 - full event, (limit return to 1 - triggers, 2 - conditions, 3 - actions, 4 - event) defaults to 0.
---@return CMO__Event|nil @ The event wrapper for the event, or nil if not found.
---Example: local ev = ScenEdit_GetEVents();  
---for _,v in pairs(ev) do print( tostring(v.details.description) ); end --print all event names.
---Using the level can save a little performance in extrmely large and complex scenes when you don't need the extra data.
function ScenEdit_GetEvents(level) end


---Gets formation data from a 'group' unit data.  
---Table data that is returned by this is string numeric indexed and is not ipairs compatible ie table["1"] is how it comes back not table[1].  
--- Function is undocumented.
---@param CMO__UnitSelector CMO__UnitSelector @ name and side or guid of the unit.
---@return CMO__TableOfFormations|nil  @ table of formation unit entries or nil on failure.
function ScenEdit_GetFormation(CMO__UnitSelector) end


---Gets the value of a key from the scenario file's persistent key-store.
---This function retrieves a value put into the store by ScenEdit_SetKeyValue.The key names must be identical.
---@param keyname string @The keyname to fetch the associated value from
---@param forCampaign? boolean @Read from the store being passed to next scenario in campaign. Optional, default = false
---@return string @ The value associated with the key. "" empty string if none exists. If you store an int remember to convert it back with tonumber();
---Example: ScenEdit_SetKeyValue("MyKeyName_A",2)  
---ScenEdit_GetKeyValue("MyKeyName_A") -- returns "2"
---@return string|nil @ the value from the key if found, or empty string if not found, or nil on error.
function ScenEdit_GetKeyValue(keyname,forCampaign) end


---@param CMO__LoadoutInfo CMO__LoadoutInfo @ LoadoutInfo detail table as a selector, all that is really needed is Unitname and optionally Loadoutid.
---@return CMO__Loadout|nil @ CMO__Loadout detail table or nil if could not find the unit or loadout.
function ScenEdit_GetLoadout(CMO__LoadoutInfo) end


---Gets the minutes from a defined area (retieve a minefield)
---@param sideNameorGuid string @ Side name or guid
---@param areaTable table @ The area (as table of RP points) to obtain mines objects from
---@return CMO__TableOfMines|nil @ table of mines in the area defined by the rps (including empty table - so check count if needed) or nil.
---Example local minestbl = ScenEdit_GetMinefield({side='Blue', area={'rp-1','rp-2','rp-3','rp-4'} } );
function ScenEdit_GetMinefield(sideNameorGuid,areaTable) end


---Gets a Mission wrapper for the specfied mission name or guid.
---@param SideNameOrGuid string @ The name of the side or its guid.
---@param missionNameOrGuid string @ the name or guid of the mission.
---@return CMO__Mission|nil @ The associated mission wrapper or nil on failure.
---Example: local m = ScenEdit_GetMission('Blue','some missionname');
function ScenEdit_GetMission(SideNameOrGuid,missionNameOrGuid) end

---This function retrieves the mission details of a side
---@param SideNameOrGuid string The side identificator to retrieve the missions
---@return table|nil @ The mission wrapper if the it exists or nil otherwise.
function ScenEdit_GetMissions(SideNameOrGuid) end


---Gets a single reference point wrapper by name or guid.  
---Search order is first a side generic rp's, then no-navzone-rps then exlcusionzone rps, returns on first matching name or guid.
---@param CMO__ReferencePointSelector CMO__ReferencePointDescriptor @  side + name or side + guid, of the reference point to get.
---@return CMO__ReferencePoint|nil @ a singular referene point or nil on failure.
---Example: local refpoint = ScenEdit_GetReferencePoint({side="Blue",name="RP-1"});
---Example2: local refpoint = ScenEdit_GetReferencePoint({side="SAMPLE-GuidForSideBlue",guid="SAMPLE-GuidForTheRP3"});
function ScenEdit_GetReferencePoint(CMO__ReferencePointSelector) end


---@Used to obtain one or more reference points objects.  
---Search order is first a side generic rp's, then no-navzone-rps then exlcusionzone rps, returns on first matching name or guid.  
---The area param will attempt to find and return all the specified rp's, it functions as the list of RP to go get.
---@param CMO__ReferencePointSelector CMO__ReferencePointDescriptor @ side + name or side + guid or side + area={}, of reference points to get.
---@return CMO__TableOfReferencePoints|nil @ an ipair compatible table of reference points or nil on error or no matches.
---Example: local refpoints = ScenEdit_GetReferencePoints({side="United States", area={"rp-100","rp-101","rp-102","rp-103","rp-104"})
function ScenEdit_GetReferencePoints(CMO__ReferencePointSelector) end


---Allows checking if the scene as 'Started' (moved at least 1 second forward from it's original start time).  
---@return boolean @ true if the scene has started.
function ScenEdit_GetScenHasStarted() end


---Returns the current score for the side.
---Like in some other functions 'PlayerSide' can be used as a special code-word to represent the current Human player side.
---@param SideNameOrGuid string @ The name of hte side or its guid or 'PlayerSide' keyword string.
---@return number @ The numeric score for the side.
---Example: if ScenEdit_GetScore("United States") > 10000 then ScenEdit_MsgBox('you have more than 10000 points.'); end
function ScenEdit_GetScore(SideNameOrGuid) end


---Checks if a give side is designated the Human player.
---@param sideNameOrGuid string @ The name or guid of the side to check.
---@return boolean @ true if the side submitted is currently the human player.
---Example: if ScenEdit_GetSideIsHuman("Goofball") then print('You are the leader of the goofballs.'); end
function ScenEdit_GetSideIsHuman(sideNameOrGuid) end


---@Gets the CMO__SideOptions table for the specified side.
---@param CMO__SideSelector CMO__SideSelector @ {sidename | side ='theNameOrGuidOfSide'} is all that is needed.
---@return CMO__SideOptions|nil @ a table of side options.
function ScenEdit_GetSideOptions(CMO__SideSelector) end


---Checks if a give side is designated the Human player.
---@param sideA_NameOrGuid string @ The name or guid of the side to check.
---@param sideB_NameOrGuid string @ The name or guid of the side to check against.
---@return string|nil @ string code for the posture of sideA to target sideB. 'N'=neutral,'F'=friendly,'U'=unfriendly,'H'=hostile, "" empty on odd error, nil when issue with finding one of the sides.
---Example: if ScenEdit_GetSidePosture('Blue','Red') == 'H' then print('Side Blue sees side Red as hostile.'); end
function ScenEdit_GetSidePosture(sideA_NameOrGuid,sideB_NameOrGuid) end


---Get the properties of a special action
---Use SetSpecialAction to make changes.
---@param CMO__SpecialActionUpdate CMO__SpecialActionUpdate @ {ActionNameOrID=,side?=} for better performance and more specific a search please include side when you have/know it.
---@return CMO__SpecialAction|nil @ the special action detail table/wrapper requested or nil if not found or error.
---Example: if ScenEdit_GetSpecialAction({side="Blue",ActionNameOrID="MySpecialAction"}).IsActive == false then print('the action is disabled.'); end
function ScenEdit_GetSpecialAction(CMO__SpecialActionUpdate) end


---Gets a time-of-day data table given a location or a unit.
---Return table format spec is as follows:
---TheTable['tod'] = contains the integer values for the time of day, 3=Dawn|0=Day|4=Dusk|2=Night.  
---TheTable['TOD'] = contains the string values for  the time of day, 'dawn'|'day'|'dusk'|'night'  
---TheTable['localtime'] = a shortdatetime string of the local time at the location (HH:MM AM|PM)  
---TheTable['zulutime'] = a formated string of the zulu time at the location (HH:MM:SS) in 24 format.   
---Why these are inconsistant is unknown.
---undocumented paramTable options {Date='12:24:1975'},{Time='05:45:00'}  
---the undocumented options Date and Time can use either a "." or ":" delimiter.  
---if included I believe it will use that as zulu time to determine what to return for the give location\unit data instead of the current time in that location.
---@param paramTable CMO__UnitSelector | CMO__Location table @ this 'table' can either be a unit selector (unitname and side, or guid) or a table containing a latitude and longitude. 
---@return table @ the time-of-day table formated as mentioned in the description.
function ScenEdit_GetTimeOfDay(paramTable) end


---Returns a Unit wrapper using a UnitSelector.  
---This function returns the properties of a specified unit. If no unit is found the function returns nil if run non-interactively,
--- and raises an exception if run from the console (see note below for a technique to bypass this behaviour if desired).  
---This function can also be called by the alias SE_GetUnit().  
---Note: When run interactively (i.e. in the console) ScenEdit_GetUnit() will raise an exception if the selected unit is not found.
--- This can be prevented using Tool_EmulateNoConsole().
---@param CMO__UnitSelector CMO__UnitSelector @ The UnitSelector accepts either a name and side, or a guid to return a unit.
---@return CMO__Unit|nil @ returns unit wrapper or nil on error or not found.
---Example: local u = ScenEdit_GetUnit({guid='SAMPLE-GUIDHERE12345'});  
---Example: local u = ScenEdit_GetUnit({side='Blue',name='KnightHawk #6'});
function ScenEdit_GetUnit(CMO__UnitSelector) end


---This is a shorthand alias for ScenEdit_GetUnit, which is actually called.
---@param CMO__UnitSelector CMO__UnitSelector @ The UnitSelector accepts either a name and side, or a guid to return a unit.
---@return CMO__Unit|nil @ returns unit wrapper or nil on error or not found.
function SE_GetUnit(CMO__UnitSelector) end


---Gets the current weather settings table.
---Function is undocumented.
---@return CMO__Weather @ table of weather details.
---Example: local theWeather = ScenEdit_GetWeather();  
---for k,v in pairs(theWeather) do print(k .. '=' .. tostring(v) ); end
function ScenEdit_GetWeather() end


---Moves a unit into the storage facilities of another unit.  
---Ie insert a aircraft into a boat or air-facility group or SUA or a boat into a port group or SUP.  
---HostedUnitNameOrID is the unit to be hosted\re-hosted. The unit will be moved from any location,including flying,to the new location.  
---SelectedHostNameOrID is the unit to host the unit into.
---@param CMO__HostUnit CMO__HostUnit @ the table containing the HostedUnitNameOrID and SelectedHostNameOrID.
---@return boolean @true on success otherwise false - can fail if there is no more room or units are not found.
---Example: ScenEdit_HostUnitToParent({HostedUnitNameOrID='SomeUnitNameOnBlue #3',SelectedHostNameOrID='SomeAirBaseGroup Name here'})
function ScenEdit_HostUnitToParent(CMO__HostUnit) end


---Imports an inst file.  
---The reverse of ScenEdit_ExportInst  
---Make sure the sidename or side guid actually exists, as this function lack the usual protection against missing or mistyped side name.
---@param SideNameOrGuid string @ the name or guid of the side to apply the inst file too.
---@param InstFilename string @ the path and file name to import from \<\<CMOPATHROOT\>\>\\ImportExport as the base folder
---@param skipDeltaLoad? boolean @ optional (undocumented), defaults to false, if included and set to true will instruct the parser to ignore Delta/SBR elements of the Inst contents.
---@return integer @ the number of units operated on/imported, returns 0 on error as well as actually 0 operated on successfully.
---Example: local numOfSuccesses = ScenEdit_ImportInst('Blue','\\KH\\MyInstFileForBlue123.inst');
---Example: local numOfSuccesses = ScenEdit_ImportInst('Blue','\\KH\\MyInstFileForBlue123.inst',true);
function ScenEdit_ImportInst(SideNameOrGuid,InstFilename,skipDeltaLoad) end


----Imports a mission xml file to the side and mission specified.  
---The XML file must be stored in folder \<\<CMOGamePathRoot\>\>\\Defaults folder and must be named exactly the name of the mission or guid that you feed in the parameters.
---** [Experimental as this should really be treated like an attachment so can be imported with Scenario]  
---Does not allow path changing as of build 1147.30.  
---The opposite of ScenEdit_ExportMission. (though in theory you could hand code the file too.)
---If you hand edit the XML file, make sure it's properly formatted XML still when you're done.
---@param SideNameOrId string @ the mission side to import to.
---@param MissionNameOrId string @ the mission name to import the file to.
---@return string|nil @ the guid of the newly imported mission.
---Example: local mission = ScenEdit_ImportMission('USA','Some Strike Mission'}) --spaces will need to be in filename too.
function ScenEdit_ImportMission(SideNameOrId,MissionNameOrId) end


---Professional Only [sad face]
---Imports the entire scenario in from an XML string. This imports from the native format of the save file, it expects it uncompressed and unencrypted.  
---So if using an external tool to mod file make sure you export it as such  
---This can be useful at times both for debugging, auditing, scripted changes to existing scenes by external tools, and other creative uses.  
---(be careful this overwrites the current loaded scene)
---@param  paramTable table @ Where the lone field is {XML='the long arse string here'};
---@return boolean @ returns the true if the entire scenario import succeeds otherwise false. 
---Example: local theXML = IOFuncToLoadSomeStringFromFile() ...  
---if ScenEdit_ExportScenarioToXML({XML=theXML}}) == false then ScenEdit_MsgBox("FUBAR'd xml try again."); end
function ScenEdit_ImportScenarioFromXML(paramTable) end


---Gets user input in the form of popup string input box.  
---If running headless I believe these are surpressed.
---@param text string @ the string to display to the user remember to use \\r\\n where needed for cr lf or both, before the textbox is drawn.
---@return string @the string if available, or empty string on none or error.
---Example: if ScenEdit_InputBox("Type the 80's band who sang Once Bitten Twice Shy:") == 'Great White' then ScenEdit_MsgBox('You win.'); end
function ScenEdit_InputBox(text) end


---Destroys a unit - With events and losses for the side it's on.
---If you want to silently remove a unit use ScenEdit_DeleteUnit();
---@param CMO__UnitSelector CMO__UnitSelector @ name + side or guid of the unit or group to kill.
---@return boolean @ true on success otherwise false.
---Example: local retval = ScenEdit_KillUnit({side='Yaz',name="Situation #2"});
function ScenEdit_KillUnit(CMO__UnitSelector) end


---Displays a modal dialog box to the player.  
---If running headless I believe these are surpressed.  
---Can use CMO__Constants.MsgBoxResult and CMO__Constants.MsgBoxType in the editor to look the right code if you forget, but not at runtime.  
---Recommendation: DO NOT plan on showing too much more then ~512 characters.
---@param text string @ The string to display to the user, you can use \\r\\n etc where needed for some light formatting control.
---@param MsgBoxButtonTypeCode? integer @ default to 0=OKOnly, 1=OkCancelCMO, 2=AbortRetryIgnore, 3=YesNoCancel, 4=YesNoOnly, 5=RetryCancel.
---@return string @ the MsgBoxResultStringCode "OK","Yes","No","Cancel","Ignore","Retry"
---Example 1: ScenEdit_MsgBox("I come from the land down under.");
---Example 2: if ScenEdit_MsgBox("Do you want to dance with somebody?",4) == 'Yes' then print('Whitney Houston'); else print('Wallflower detected.'); end
function ScenEdit_MsgBox(text,MsgBoxButtonTypeCode) end


---Returns the side name that the human player is presently on.
---@return string @ the name of the side.
---Example: local u = SE_GetUnit(name="StacyQ #2",side=ScenEdit_PlayerSide() );
function ScenEdit_PlayerSide() end


---Plays a sound file. (mp3,wav,wma)  
---I believe windows media player must be installed for this to work. ie may not work for 'N' versions of windows or for those that removed it.  
---If you are looking to play and 'attachment' sound, use ScenEdit_UseAttachment()
---@param filename string @The name of the file. Assumed to be in the Sounds\\Effects folder
---@param delay? number @Delay before playing in seconds. (game time I think)
---@return boolean @ false is file can not be found, otherwise true.
---Example: ScenEdit_PlaySound("contact_air.mp3",5)
function ScenEdit_PlaySound(filename,delay) end


---Plays a vidoe file. (mp4 or avi or wmv)  
---I believe windows media player must be installed for this to work. ie may not work for 'N' versions of windows or for those that removed it.  
---If you are looking to play and 'attachment' video, use ScenEdit_UseAttachment()
---Function assumes by default the video file is in /</<CMOPATH/>/>\\Video\\Yourfilenamehere.mp4 which doesn't exist by default.
---Path can be escaped as of build 1147.30 thank god.
---@param filename string @The name of the file. Assumed to be in the Video folder
---@param fullscreen? boolean @Shown in full screen
---@param delay? number @Delay to showing video in seconds (game time I think)
---@return string|nil @ string "" on success, "N" on fail, nil on exception error.
---Example: ScenEdit_PlayVideo("Tpau-HheartAndSoul.mp4",false,5); 
function ScenEdit_PlayVideo(filename,fullscreen,delay) end


---Prints a string to the log.  
---this is no different than using the already replaced lua print keyword which actually calls this. But if you want you can call it directly i guess.
---@param thestring string @the string to print.
function ScenEdit_Print(thestring) end


---Prints a string to the log after ecaping it for quotes and doublequotes.
---@param thestring string @the string to print in quote escaped form
function ScenEdit_PrintEscaped(thestring) end


--TODO TODO TODO
--- for the implemented types it's basically a select * from DB_TABLE where dbid= xyz and result returned in a Lua table.
---@param objectType string @ weapon,mount,sensor implemented. facility,aircraft,submarine, ship, satellite, maybe groundfacility eventually etc
---@param DBID integer @ the dbid of the object to query.
---@return table @ special wrappers where if you dump the contants its all the fields in the database for the type.
function ScenEdit_QueryDB(objectType,DBID) end


---Trigger the specified unit to attempt to refuel.  
---The unit should follow it's AAR doctrine configuration. You can force it use a specific tanker or ones from a set of missions.  
---** Note to self: report that this does not allow triggering a refuel from an allied side.
---@param CMO__RefuelOptions CMO__RefuelOptions @ The unit and refueling options.
---@return string @ If successful,then empty string. Else message showing why it failed.
---Examples: ScenEdit_RefuelUnit({side="United States", unitname="USS Test"});  
---ScenEdit_RefuelUnit({side="United States", unitname="USS Test", tanker="Hose #1"});  
---ScenEdit_RefuelUnit({side="United States", unitname="USS Test", missions={"Pitstop"}});  
function ScenEdit_RefuelUnit(CMO__RefuelOptions) end


---Removes all Units, Contacts and weapons from a side.  
---Nearly certain this also removes the side itself as well.
---@param side CMO__Side @ The name or guid of the side to remove.
---@return CMO__Side|nil @ a copy of side wrapper of the side before it was acted upon, or nil on failure.
---Example: local deletedSide = ScenEdit_RemoveSide("Blue");
function ScenEdit_RemoveSide(side) end


--- Removes a unit or contact as a target from a strike mission.  
---@param AUNameOrIDOrTable string|table @ name or guid of table of guids of the units or contacts to remove from the target list. 
---@param MissionNameOrID string @ the name or guid of the strike mission.
---@return table|nil @ a table of the contacts removed (including empty table on say a mission not found) or nil
---Example:  ScenEdit_RemoveUnitAsTarget("Show Me Love","Robin B Stike Mission");
---Example:  ScenEdit_RemoveUnitAsTarget({"Talking #1","In #2","Your #3","Sleep #4"},"Romantics Stike Mission");
function ScenEdit_RemoveUnitAsTarget(AUNameOrIDOrTable,MissionNameOrID) end


---Removes a no-nav or exclusion zone from the scenerio.  
---Note that this will remove both the zone and any attached/associated RPs it contains. 
---So if you want to remove a zone without removing the RP's, first update the zone to replace the area table entries. Then after that remove the zone.
---@param sideName string @ Side name/GUID of which side the zone is hosted on.
---@param zoneType string @ Type of zone to remove:0 =no-nav,1 =exclusion
---@param paramTable table @ table that at least includes {Description='NameOfTheZoneOrGuid'};
---@return CMO__Zone @ copy of the zone that was just removed
---Example: ScenEdit_RemoveZone("Blue_MurrayHead",0,{Description='One Night in Bangkok Zone'}); --remove a no-nav zone  
function ScenEdit_RemoveZone(sideName,zoneType,paramTable) end


---Runs a script from a file.  
---The file scriptmust be inside the [Command base directory]\\Lua directory,or else the game will not be able to load it.
---You can make the file point to files within a sub-directory of this such as in 'gKHApi\\bootstrap-gKH.lua'.
---The file to find will be of the form [Command base directory]\\Lua\\[filePathName].  
---You can use basic window path minipulation to override the above behavior. see Examples.  
---A file can also be loaded indirectly from an attachment ScenEdit_UseAttachment
---@param filePathName string @ file name including any additional or reductive path elements
---Example: ScenEdit_RunScript('Madonna\\GetIntoTheGroove.lua') --runs script cmopath\\Lua\\Madonna\\GetIntoTheGrove.lua
---Example2: ScenEdit_RunScript('..\\Scenarios\\SomeFolderHere\\SomeOtherFolder\\Lua\\myscript.lua')  
---In #2 the actual path executed is something like "e:\\Games\\CMO\\Lua\\..\\Scenarios\\SomeFolderHere\\SomeOtherFolder\\Lua\\myscript.lua"
function ScenEdit_RunScript(filePathName) end


---Returns a table of selected units and or contacts currently selected in the gui buy the player.  
---The table returned is structured as such:  
---TheTable['units'] = {{name='thename',guid='theunitguid'}, ...}.  (can not exist as well)  
---TheTable['contacts'] = {{name='thename',guid='thesidecontactguid'}, ...}. (can not exist as well)
---@return table @ table of unit guids contained as sub tables in the fields 'units'and 'contacts' in the top level table returned.
---Example (change any selected aircraft units alt to 36k feet): local sunits = ScenEdit_SelectedUnit();  
---if sunits.units ~= nil then  
--- &nbsp; for _,v in pairs(sunits.units) do  
--- &nbsp; &nbsp; local u = SE_GetUnit({guid=v.guid}); if u.type == 'Aircraft' then u.altitude='36000 FT'; end  
--- &nbsp; end  
---end
function ScenEdit_SelectedUnits() end


---Used to create, update details of, or delete an event Action itself.  
---Note a CMO__ActionUpdate is effectively same as the Action itself for the most part minus a few fields.
---Recommend when doing anything serious to wrap these calls in a pcall and check for failures.  
---Recommend when doing a 'remove' advised you make sure you have FIRST removed it from any events list of actions. 
---Note The examples in the raw definition file may contain extra escapting to make them display right in an mouseover overlay window inside vscode.
---@param CMO__ActionUpdate CMO__ActionUpdate @ a action update table of parameters. Best to define a var first and type is as CMO__ActionUpdate because of option variance.
---@return CMO__TCA_ReturnTable|nil @ returns as table of the update or created CMO_ActionUpdate in the subtable 'actions' in another subtable according to Type name.
---Example 1(create Message): local a = ScenEdit_SetAction({mode="add", Description="My Message Action", Type="Message", text="\<body bgcolor=#005500> \<p> some text on green background. \<p> \</body>"});  
---Example 2(now update side on Message): a = ScenEdit_SetAction({Description=a.actions.Message.ID, SideID = VP_GetSide({side='PlayerSide'}).guid});  --set SideID to guid of current playerside.  
---Example 3(now remove it): a = ScenEdit_SetAction({mode="remove", Description=a.actions.Message.ID});  
---Example 4(create LuaScript): a = ScenEdit_SetAction({mode="add", Description="My Lua Script Action", Type="LuaScript", ScriptText="ScenEdit_MsgBox('Hungry Eyes');\r\n "})  
function ScenEdit_SetAction(CMO__ActionUpdate) end


---Used to create, update details of, or delete an event Condition itself.  
---Note a CMO__ConditionUpdate is effectively same as the Condition itself for the most part minus a few fields.
---Recommend when doing anything serious to wrap these calls in a pcall and check for failures.  
---Recommend when doing a 'remove' advised you make sure you have FIRST removed it from any events list of conditions. 
---@param CMO__ConditionUpdate CMO__ConditionUpdate @ a action update table of parameters. Best to define a var first and type is as CMO__ConditionUpdate because of option variance.
---@return CMO__TCA_ReturnTable|nil @ returns as table of the update or created CMO_ActionUpdate in the subtable 'conditions' in another subtable according to Type name.
---Example 1 (create Message): local c = ScenEdit_SetCondition({mode="add",Description="Is Blue at War with Red", Type="SidePosture", ObserverSideID=VP_GetSide({side='Blue'}).guid, TargetSideID=VP_GetSide({side='Red'}).guid, TargetPosture="Hostile"});  
---Example 2 (create LuaScript): local c = ScenEdit_SetCondition({mode="add",Description="My Lua Script Condition",Type="LuaScript",ScriptText="if UnitX().name == 'TakeMyBreathAway' then return true;end\r\n"})
function ScenEdit_SetCondition(CMO__ConditionUpdate) end


---Set the doctrine of the designated object.  
---This function uses selector to find the thing to modify,then modifies the doctrine of that object based on the given object.
---Can be used to affect doctrine for Side,Mission,Unit/Group. Remember that 'inherit' can be used in most if not all fields
--- to reset the unit to take on the settings upstream as long as your not dealing with the top tier 'Side' level.
---@param CMO__DoctrineSelector CMO__DoctrineSelector @ The selector for which doctrine object to modify.
---@param CMO__Doctrine CMO__Doctrine @ A table of doctrines that are to be updates, only include what you want touched.
---@return CMO__Doctrine|nil @ the updated Doctrine on success or nil
---Example 1: ScenEdit_SetDoctrine({side="Heart"}, {kinematic_range_for_torpedoes ="AutomaticAndManualFire",use_nuclear_weapons="yes" })  
---Example 2: ScenEdit_SetDoctrine({side="GunsnRoses", mission="WelcomeToTheJungle ASW PATROL"}, {kinematic_range_for_torpedoes ="AutomaticAndManualFire",use_nuclear_weapons="yes" })  
---Example 3: ScenEdit_SetDoctrine({side="Expose", unitname="Come Go with Me"}, {use_nuclear_weapons="yes",use_nuclear_weapons_player_editable="yes"})
function ScenEdit_SetDoctrine(CMO__DoctrineSelector,CMO__Doctrine) end


---Set the doctrine of the designated object.  
---This function uses selector to find the thing to modify,then modifies the doctrine of that object based on the given object.
---Can be used to affect doctrine for Side,Mission,Unit/Group.  Remember that 'inherit' can be used in most if not all fields
--- to reset the unit to take on the settings upstream as long as your not dealing with the top tier 'Side' level.
--- Additionally WRA also has 'system' keyword available to use the database level default. system is not available for firing_range.
--- 'none' and 'max' are also available, respectively they are for disabling a weaon for target type, and max will use maximum appropriate level.
---@param CMO__DoctrineWRASelector CMO__DoctrineWRASelector @ The selector for which doctrine WRA object to modify.
---@param CMO__WRA CMO__WRA @ A table of WRA entries in the specified order required. See CMO_WRA type mouse-over for proper order.
---@return CMO__DoctrineWRA|nil @ the updated DoctrineWRA or nil.
---Example 1: ScenEdit_SetDoctrineWRA({guid='SAMPLE-UNITGUIDHEREX', target_type='Surface_Contact_Unknown_Type', weapon_dbid=1575}, {'inherit','inherit','system','inherit'})
---Example 2: ScenEdit_SetDoctrineWRA({mission='A View To A Kill', target_type='Surface_Contact_Unknown_Type', weapon_dbid=1575}, {'max','inherit',90,'inherit'}) 
function ScenEdit_SetDoctrineWRA(CMO__DoctrineWRASelector,CMO__WRA) end



---Sets the EMCON of the selected object.  
---Select the object by specifying the type and the object's name. 
---objType is the type of object to set the EMCON on. It can be one of 4 values:  
--- Side - Set an entire side's EMCON (e.g. United States using active radar)  
--- Mission - Set the EMCON for a mission (e.g. Minesweepers active sonar)  
--- Group - Set the EMCON for an entire group (e.g Package #20 active radar)  
--- Unit - Set the EMCON for a single group (e.g. Hornet #14 passive radar)  
--- emcon is a compound structure.The string follows the following grammar,with each clause separated by a semicolon (;)  
---Inherit indicates that the output EMCON should be at least the parent's EMCON. Inherit must come first.  
---A transmitter "set" statement. Each is of the form type=status, where type can be any one of Radar, Sonar, and OECM, and status can be any one of Passive or Active.
---@param objType string @ The type of the thing to set the EMCON on. (Side,Mission,Group, or Unit)
---@param name string @ The name or GUID of the object to select.
---@param emcon string @ The compound string representing the EMCON changes for the object.
---@return boolean @ true if there was an apparent success, false on error or exception.
---Examples:  
---ScenEdit_SetEMCON('Side','NATO','Radar=Active;Sonar=Passive');  
---ScenEdit_SetEMCON('Mission','ASW Patrol #1','Inherit;Sonar=Active');  
---local retval = ScenEdit_SetEMCON('Unit','Camel 2','OECM=Active');
function ScenEdit_SetEMCON(objType,name,emcon) end

---The function's purpose is to configure the specified Alert Level for Intermittent Emissions. There are several Alert levels availbale under the Intermittent Emissions view, and each one can have a different configuration. 
---@param AUNameOrID string @ name or guid of the unit
---@param PresetAlertID string @ Green, blue, yellow, orange, red, custom, all
---@param ConfigurationTable CMO__ConfigTable
---@return boolean @ True/false if sucessful
function ScenEdit_SetUnitIntermittentEmissionConfig(AUNameOrID, PresetAlertID, ConfigurationTable) end

---The function's purpose is to turn off/on the Intermittent Emission for the specified Alert Level 
---@param AUNameOrID string @ The name or GUID of the unit. As no Side is supplied, the unit name would need to be unique across the scenario.
---@param PresetAlertID string @ The Alert level: GREEN, BLUE, YELLOW, ORANGE, RED, CUSTOM, ALL
---@param Switch integer @ Use 0 to turn off the Emission interval, 1 to turn on the Emission interval (USEEMISSIONINTERVAL)
---@return boolean @ True if successful
---EX:  ScenEdit_SwitchUnitIntermittentEmission ( 'USS Ulysess', 'Green', 1 ) -- turn on interval for Alert level Green for the unit
function ScenEdit_SwitchUnitIntermittentEmission(AUNameOrID, PresetAlertID, Switch) end


---Used to create, update details of and event or remove an Event.  
---@param EventDescriptionOrID string @ the name or guid of the event to create,update or remove.
---@param EventUpdateOptions CMO__EventUpdate @ the table of EventUpdate options.
---@return CMO__Event|string|nil @ the resulting CMO_Event table on sucessful create or modification or copy before removal. or string message on why if failed or nil if non interactive.
---Example (add event): local evt = ScenEdit_SetEvent("MyEventName",{mode="add", Description="MyEventName", isRepeatable=true, isActive=false});  
---Example (update event): local evt = ScenEdit_SetEvent("MyEventName",{Description="MyEventName",isActive=true,isShown=false});  
---Example (remove event): local evt = ScenEdit_SetEvent("MyEventName",{mode="remove",Description="MyEventName"});  
--- print(evt.details); --for the meat
function ScenEdit_SetEvent(EventDescriptionOrID,EventUpdateOptions) end


---Used to create, replace or delete a member in the Events collection of Actions.  
---@param EventDescriptionOrID string @ The name or guid of the event that will be acted upon.
---@param CMO__EventTCAUpdate CMO__EventTCAUpdate @ the table of options indicating what to do and what specific Action entry to operate on.
---@return CMO__TCA_ReturnTable @ returns table with subtable 'actions' that includes the action entry.
---Example: Adds an event, adds 3 actions, then removes the first, then swaps the last with the one that was removed.  
---local evt = ScenEdit_SetEvent("MyEventName",{mode="add", Description="MyEventName", isRepeatable=true, isActive=false});  
---local retval = ScenEdit_SetEventAction('MyEventName',{mode="add",description="Test1"})  
---local retval = ScenEdit_SetEventAction('MyEventName',{mode="add",description="Test2"})  
---local retval = ScenEdit_SetEventAction('MyEventName',{mode="add",description="Test3"})  
---local retval = ScenEdit_SetEventAction('MyEventName',{mode="remove",description="Test1"})  
---local retval = ScenEdit_SetEventAction('MyEventName',{mode="replace",description="Test3",ReplacedBy='Test1'})
function ScenEdit_SetEventAction(EventDescriptionOrID,CMO__EventTCAUpdate) end


---Used to create, replace or delete a member in the Events collection of Conditions.  
---@param EventDescriptionOrID string @ The name or guid of the event that will be acted upon.
---@param CMO__EventTCAUpdate CMO__EventTCAUpdate @ the table of options indicating what to do and what specific Condition entry to operate on.
---@return CMO__TCA_ReturnTable @ returns table with subtable 'conditions' that includes the action entry.
---Example: Adds an event, adds 3 conditions, then removes the first, then swaps the last with the one that was removed.  
---local evt = ScenEdit_SetEvent("MyEventName",{mode="add", Description="MyEventName", isRepeatable=true, isActive=false});  
---local retval = ScenEdit_SetEventCondition('MyEventName',{mode="add",description="Test1"})  
---local retval = ScenEdit_SetEventCondition('MyEventName',{mode="add",description="Test2"})  
---local retval = ScenEdit_SetEventCondition('MyEventName',{mode="add",description="Test3"})  
---local retval = ScenEdit_SetEventCondition('MyEventName',{mode="remove",description="Test1"})  
---local retval = ScenEdit_SetEventCondition('MyEventName',{mode="replace",description="Test3",ReplacedBy='Test1'})
function ScenEdit_SetEventCondition(EventDescriptionOrID,CMO__EventTCAUpdate) end


---Used to create, replace or delete a member in the Events collection of Triggers.  
---@param EventDescriptionOrID string @ The name or guid of the event that will be acted upon.
---@param CMO__EventTCAUpdate CMO__EventTCAUpdate @ the table of options indicating what to do and what specific Trigger entry to operate on.
---@return CMO__TCA_ReturnTable @ returns table with subtable 'triggers' that includes the action entry.
---Example: Adds an event, adds 3 triggers, then removes the first, then swaps the last with the one that was removed.  
---local evt = ScenEdit_SetEvent("MyEventName",{mode="add", Description="MyEventName", isRepeatable=true, isActive=false});  
---local retval = ScenEdit_SetEventTrigger('MyEventName',{mode="add",description="Test1"})  
---local retval = ScenEdit_SetEventTrigger('MyEventName',{mode="add",description="Test2"})  
---local retval = ScenEdit_SetEventTrigger('MyEventName',{mode="add",description="Test3"})  
---local retval = ScenEdit_SetEventTrigger('MyEventName',{mode="remove",description="Test1"})  
---local retval = ScenEdit_SetEventTrigger('MyEventName',{mode="replace",description="Test3",ReplacedBy='Test1'})
function ScenEdit_SetEventTrigger(EventDescriptionOrID,CMO__EventTCAUpdate) end


---Sets the value of a key in the scenario file's persistent key-store for later retieval.  
---This function stores a value in a named key in the key-store that will be saved with a users save file. 
---It's available to be accessed later by ScenEdit_GetKeyValue. The key names must be identical (case matters).
---nil values will not be saved, and must be strings (or Inherently convertable ie basic number will be auto converted etc).  
---Key names must conform to xml element character restrictions, basically keep it alphanumeric plus it must start with a letter,
---can not start with XML or xml, no spaces, generally don't use special chars, but underscore(_) dash(-) and period(.) maybe used.
---@param keyname string @ The keyname to set the associated value to.
---@param value string|number @ The string/number value to save to the key.
---@param forCampaign? boolean @Set the store being passed to next scenario in campaign. Optional, default = false
---@return string @ "saved" if successful otherwise a nil, there is almost no way this could fail short of maybe using invalid keyname;
---Example: ScenEdit_SetKeyValue("MyKeyName_A",2) --now save the file and reload it then run...  
---print(ScenEdit_GetKeyValue("MyKeyName_A")) -- returns "2"
function ScenEdit_SetKeyValue(keyname,value,forCampaign) end


---Sets the loadout for an Aircraft unit.  
---Reminder LoadoutID = 0 means use\update current loadout.  
---Certain Changes are only available when airborne (Number\Remove), other only available when on the ground (such as TTR,ExcludeOptional\change loadout).
---@param CMO__LoadoutInfo CMO__LoadoutInfo @ The loadout information to apply.
---@return boolean @ true if successful, otherwise false.
---Example(update TTR): ScenEdit_SetLoadout({UnitName="Def Leppard #80",LoadoutID=0,TimeToReady_Minutes=0})  
---Example(change loadout): ScenEdit_SetLoadout({UnitName="Def Leppard #80",LoadoutID=19336,ExcludeOptionalWeapons=true}); --f-22 sdb-longrange no 120s  
---Example(airbone change): ScenEdit_SetLoadout({UnitName="SAMPLE-XXGUIDHEREXXX",LoadoutID=0,Number=2,Wpn_DBID=2780,remove=true}); --remove aim-9xs
function ScenEdit_SetLoadout(CMO__LoadoutInfo) end


---Updates the properties on a mine.  
--- currently only setting the delay is the only property.  
--- TODO: (I need to back through the last couple builds and release notes and see if this has changed since ~1147.22'ish)
---@param theSide string @ Side name or guid
---@param mineGuid string @ Mine guid
---@param delay? number @ The arming delay in seconds [optional]
---@return boolean @ true if successful otherwise false
---Example: local retval = ScenEdit_SetMine({side='Blue', guid='SAMPLE-GUIDACEOFBASE',delay=86400}); -- 
function ScenEdit_SetMine(theSide,mineGuid,delay) end


---Set or update details for a mission.
---@param SideName string @The name or guid of side the mission is on.
---@param MissionNameOrId string @The nae or guid of the mission to modify.
---@param CMO__Mission CMO__Mission @ The mission options to change as a table.
---@return CMO__Mission|nil @ The updated mission wrapper or nil on failure.
---Example 1:  local m = ScenEdit_SetMission('USA','CV CAP Left',{TankerUsage=1,OnStation=2}) 
---Example 1:  local m = ScenEdit_SetMission('USA','CV CAP Left',{NewName="Circle In The Sand" StartDate="9/1/2021",StartTime"00:00:00"});
function ScenEdit_SetMission(SideName,MissionNameOrId,CMO__Mission) end


---Update a reference point(s) with new values.  
---Given a valid ReferencePointSelector as part of the descriptor, the function wil update the values contained in the descriptor.
---Values may be omitted from the descriptor if they are intended to remain unmodified.
---The 'area' field of the selector is useful for changing some common attribute,like locking or highlighting,in bulk. 
---It acts a list of what to select in addition to the side field when included.
---Reminders (see CMO__ReferencePointDescriptor for all options):  
---NEWNAME='string' to rename a reference point  
---CLEAR =True to remove the 'relative to' of the reference point(s)  
---@param CMO__ReferencePointDescriptor CMO__ReferencePointDescriptor;
---@return CMO__ReferencePoint|nil @ The reference point descriptor for the reference point, or first one in the area.
---Example 1: ScenEdit_SetReferencePoint({side="United States", name="Downed Pilot", lat=0.5})  
---Example 2: ScenEdit_SetReferencePoint({side="United States", name="Downed Pilot", lat=0.5, lon="N50.50.50", highlighted =true})  
---Example 3: ScenEdit_SetReferencePoint({side="United States", name="Downed Pilot", NewName="Borderline-1984",bearingType='fixed',bearing=45,distance=8.0,relativeto="SAMPLE-OTHERUNITGUID"});
---Example 4: ScenEdit_SetReferencePoint({side="United States", area={"rp-100","rp-101","rp-102","rp-103","rp-104"}, highlighted =true})
function ScenEdit_SetReferencePoint(CMO__ReferencePointDescriptor) end


--- Sets the score of a desired side to the specified value.
--- Use ScenEdit_GetScore() to first get current value.
---@param SideOrGuid string @The name/GUID of the side
---@param newScore integer @The new score for the side as a positve or negative integer.
---@param reason? string @Optional - The reason for the score to change 
---@return integer @ The new value of the score for that side.
---Example:  
---local newScore = ScenEdit_SetScore("PlayerSide", tonumber( ScenEdit_GetScore("PlayerSide") ) -1000,"Wham") --remove 1000 points from the current side of the player.
function ScenEdit_SetScore(SideOrGuid,newScore,reason) end


---Sets the options for specific side.  
---Used for changing things such as a side's awareness, proficiency, or to force a side switch upon the player (SwitchTo).
--- To change a side's name use VP_GetSide() to grab the side wrapper and use the  .newName property.
--- To chane a side's postures use ScenEdit_SetSidePosture().
---@param CMO_SideOptions CMO__SideOptions @ the table of options you want to change.
---@return CMO__SideOptions @ the table of settings for the side post change.
---Example: local _ = ScenEdit_SetSideOptions({side="Salt-N-Pepa",awareness=-1}) -- Salt-n-Pepa are not blind.
---Example: local _ = ScenEdit_SetSideOptions({side="nu shooz", SwitchTo=true}) -- playerside has been switched to nu shooz.
function ScenEdit_SetSideOptions(CMO_SideOptions) end


---Set the posture of one side toward another side to a destired level.  
---Posture codes:  
---F - Friendly  
---H - Hostile  
---N - Neutral  
---U - Unfriendly  
---X - Unknown (you can't set this but it comes into play with actual states when dealing with Contacts.)
---@param sideAName string @ Side A name or GUID
---@param sideBName string @ Side B name or GUID
---@param postureTowardSideB string @ string The posture of side A towards side B
---@return boolean @ True/False for Successful/Failure
---Example: ScenEdit_SetSidePosture("Motley Crue","Poison","U") --side Motley Crue now considers side Poison Hostile.
function ScenEdit_SetSidePosture(sideAName,sideBName,postureTowardSideB) end


---Update or remove a special actions.  
---To add or get a special action use ScenEdit_AddSpecialAction() and ScenEdit_GetSpecialAction()
---Set works similar to ScenEdit_SetEvent except different properties and return values and mode is only required when doing a 'remove'.
---@param CMO__SpecialActionUpdate CMO__SpecialActionUpdate @ the table of options containing the mode and specifics to change.
---@return boolean |nil @ true on success otherwise false, could be nil total failure.
---Example 1: ScenEdit_SetSpecialAction({Side="Blue",ActionNameOrID="Belinda Carlisle",description="Heaven is a place on earth ... somewhere"});  
---Example 2: ScenEdit_SetSpecialAction({Side="Blue",ActionNameOrID="GnR", isActive=false,ScriptText="print('Welcome to the jungle, we got fun and games...')"});
function ScenEdit_SetSpecialAction(CMO__SpecialActionUpdate) end


---Set the Scenario Start time.  
---Undocumented. Probably cause it doesn't work right (changes current time not start time at least as far as gui is concerned.);
-- Reported this years ago I don't think it was ever addressed at least not in the gui.  
---The desired UTC datetime as a table in MM:DD:YYYY & HH:MM:SS or MM.DD.YYYY & HH.MM.SS format
---@param dateTimeTable table @ table formated as {Date='mm:dd:yyyy',Time='hh:mm:ss'}
---@return number @ 0.0 on exception, or number of seconds since 1/1/1970 up till the new time. 
---However that is broke too as is returns a value based on current windows timezone adjustment. ie 1630368000 for the below time which is wrong should be 1630382400.
---so don't use the return value for anything other than checking not 0.0 for success.  
---Example: local n = ScenEdit_SetStartTime(Date="8:31:2021",Time="00:00:00");
function ScenEdit_SetStartTime(dateTimeTable) end


---Set the Current in-game time.  
---The desired UTC/Zulu datetime as a table in MM:DD:YYYY & HH:MM:SS or MM.DD.YYYY & HH.MM.SS format
---@param dateTimeTable table @ table formated as {Date='mm:dd:yyyy',Time='hh:mm:ss'}
---@return number @ 0.0 on exception, or number of seconds since 1/1/1970 up till the new time. 
---However the return is wrong as is returns a value based on current windows timezone adjustment. ie 1630368000 for the below time which is wrong should be 1630382400.
---actual time gets set in-game correctly though. So just don't use the return value for anything other then checking ~= 0.0 for success.  
---Example: local n = ScenEdit_SetTime(Date="8:31:2021",Time="00:00:00");
function ScenEdit_SetTime(dateTimeTable) end


---Used to create, update details of, or delete an event Trigger itself.  
---Note a CMO__TriggerUpdateUpdate is effectively same as the Trigger itself for the most part +/- a few fields.
---Recommend when doing anything serious to wrap these calls in a pcall and check for failures.  
---Recommend when doing a 'remove' advised you make sure you have FIRST removed it from any events list of triggers. 
---@param CMO__TriggerUpdate CMO__TriggerUpdate @ a action update table of parameters. Best to define a var first and type is as CMO__TriggerUpdate because of option variance.
---@return table @ returns as table of the update or created CMO_TriggerUpdate in the subtable 'triggers' in another subtable according to Type name.
---Examples: There are simply too many and too many various options but here is one example that shows off the basics.  
---It creates a 'Unit Enters Area' trigger, the area is Kenny Loggings Ranch defined by rp's KLR-1 though KLR-4. The trigger is specfic to ANY Blue f-22 with the dbid #4875.
--- Later it is updated to be specifc down to an individual f-22 with a specific guid (names can not be used).  
---  
---Example 1 (create ): local tgFilter = { TARGETSIDE=VP_GetSide({side='Blue'}).guid, TARGETTYPE='Aircraft', TARGETSUBTYPE=2002, SPECIFICUNITCLASS=4875};  
---local t = ScenEdit_SetTrigger({mode="add",Description="Unit Enters Kenny Loggins Ranch", Type="UnitEntersArea", TargetFilter=tgFilter, Area={'KLR-1','KLR-2','KLR-3','KLR-4'} });  
---  
---Example 2 (update it): tgFilter.SPECIFICUNIT='XBLUEX-F22GUIDHEREXX'; --assumes prior tgFitler var still exists when run, just adds another field.  
---local t = ScenEdit_SetTrigger({Description="Unit Enters Kenny Loggins Ranch", TargetFilter=tgFilter});
---print(t.triggers.UnitEntersArea.TargetFilter); --verify it's been added.
---  
---Example 3 (create regular time): local t = ScenEdit_SetTrigger( {mode="add", Description="Every 15 seconds Safety Dance", Type="RegularTime", Interval=2})
function ScenEdit_SetTrigger(CMO__TriggerUpdate) end


---Sets and Updates a existing unit's properties
--- This function is also aliased as SE_SetUnit() for convience.
---@param CMO__UnitUpdate CMO__UnitUpdate @ CMO__UnitUpdate options table containing but the selector and options to edit.
---@return CMO__Unit  @ Complete unit wrapper for the modified unit
---@Examples:  
---ScenEdit_SetUnit({side="United States", unitname="USS Test", lat =5});  
---ScenEdit_SetUnit({side="United States", unitname="USS Test", lat =5, lon ="N50.20.10"});  
---ScenEdit_SetUnit({side="United States", unitname="USS Test", newname="USS MAGA"});  
---ScenEdit_SetUnit({guid="SAMPLE-UNITGUIDHEREX", heading=0, Proficiency="Ace", Launch=true, OutOfComms=true});  
---ScenEdit_SetUnit({side="Rockwell", unitname="Watcher #!", fuel={{2001,60000}}, RTB=false});
function ScenEdit_SetUnit(CMO__UnitUpdate) end
---Sets and Updates a existing unit's properties
--- This function is also aliased as SE_SetUnit() for convience.
---@param CMO__UnitUpdate CMO__UnitUpdate @ CMO__UnitUpdate options table containing but the selector and options to edit.
---@return CMO__Unit  @ Complete unit wrapper for the modified unit
---@Examples:  
---ScenEdit_SetUnit({side="United States", unitname="USS Test", lat =5});  
---ScenEdit_SetUnit({side="United States", unitname="USS Test", lat =5, lon ="N50.20.10"});  
---ScenEdit_SetUnit({side="United States", unitname="USS Test", newname="USS MAGA"});  
---ScenEdit_SetUnit({guid="SAMPLE-UNITGUIDHEREX", heading=0, Proficiency="Ace", Launch=true, OutOfComms=true});  
---ScenEdit_SetUnit({side="Rockwell", unitname="Watcher #!", fuel={{2001,60000}}, RTB=false});
function SE_SetUnit(CMO__UnitUpdate) end

-- ---Sets and updates an existing units properties.  
-- ---Short hand alias for ScenEdit_SetUnit(); see that function name for full listing with examples. 
-- ---@param CMO__UnitUpdate CMO__UnitUpdate @ CMO__UnitUpdate options table containing but the selector and options to edit.
-- ---@return CMO__Unit  @ Complete unit wrapper for the modified unit
-- function SE_SetUnit(CMO__UnitUpdate) end


---Set unit damage....for components on unit.
---See extensive mouse overnotes for CMO_DamageOptions class/type when dealing with components field/options
---
---@param CMO__DamageOptions CMO__DamageOptions @ 
---CMO__TableOfUnitComponent_Returns is a numberic indexed table of CMO_UnitComponent_Return tables, it only exists while there is still damage.
---@return CMO__TableOfUnitComponent_Returns|nil @ a table with the units damaged component. nil when there is no current damage or error.
---Example 1 (rnd dmg to rudder and sensor): local dmgtbl = ScenEdit_SetUnitDamage({side='Blue', unitname='MyShip', fires=1, components={ {'rudder','Medium'}, {'type',type='sensor',1} } });  
---Example 2 (dmg specific sensor, and rnd mount): local dmgtbl = ScenEdit_SetUnitDamage({side='Blue', unitname='MyF-22', components={ {'SAMPLE-COMPGUID4SENSOR','Light'}, {'type',type='mount',1} } });  
---Example 3 (repair specific sensor) local dmgtbl = ScenEdit_SetUnitDamage({side='Blue', unitname='MyF-22', components={ {'SAMPLE-COMPGUID4SENSOR','none'} }});  
---Example 4 (chk nil) if ScenEdit_SetUnitDamage({side='Blue', unitname='MyF-22', components={ {'SAMPLE-COMPGUID4SENSOR','none'} }}) == nil then print('unit fully repaired.'); end
function ScenEdit_SetUnitDamage(CMO__DamageOptions) end


--- Changes a units side from one to another.
---@param CMO__SideDescription CMO__SideDescription @ the selector table that includes the newside= option.
---@return boolean @ true if units side was successfully changed, otherwise false.
---Example: ScenEdit_SetUnitSide() 
function ScenEdit_SetUnitSide(CMO__SideDescription) end


---Set the current weather conditions.  
---This function takes four numbers that describe the desired weather conditions.These conditions are applied globally.
    
---@param temperature number @ The current baseline temperature (in deg C). Varies by latitude.
---@param rainfall number @ The rainfall rate, 0-50.
---@param undercloud number @ The amount of sky that is covered in cloud, 0.0-1.0
---@param seastate number @ The current sea state 0-9.
---@return boolean @ True/False for Successful/Failure
---Example: ScenEdit_SetWeather(math.random(0,25),math.random(0,50),math.random(0,10)/10.0,math.random(0,9)) 
function ScenEdit_SetWeather(temperature,rainfall,undercloud,seastate) end


---update no-nav or exclusion zone.  
---Only need to pass the parts to update
---@param sideName string @Side name/GUID
---@param zoneType integer @ Type of zone to update: 0 = no-nav, 1 = exclusion
---@param CMO__Zone CMO__Zone @ table containing options to update Description, Isactive, Area { of RPs }, Affects { of UnitTypes }, MarkAs (exc only), Locked (non only)
---@return CMO__Zone|nil @ the changed zone wrapper Zone or nil on error.
---Example 1: local changedzone = ScenEdit_SetZone('Bangles',0,{description="ManicMonday", area={'newrp-1','newrp-2','newrp-3','newrp-4'}}) --repace no-nav area rp's with some other ones
---Example 2: ScenEdit_SetZone('Bangles'.1,{description="EternalFlame", isActive=true, Affects={'Aircraft'}}) --set excl zone to active and update who it effects.
function ScenEdit_SetZone(sideName,zoneType,CMO__Zone) end


---Displays a special message consisting of the HTML text message to the side specified by side. 
---An optional parameter location allows the player to jump to the specified map position by clicking a button in a pop-up window.
---@param side string @The side name/guid to display the message to, or 'playerside'. 
---@param message string @The HTML 4.x text to display to the player. Plain text is also accepted. (html and css support is generally that of ie8-9 level)
---@param locationPoint? CMO__Location @ [Optional] The table of a position that the 'Jump to Location' button takes the player to if clicked.
---@return number @ 1 if successful, raises an error if unsuccessful.
---Example 1: ScenEdit_SpecialMessage('playerside','Here\'s a message!',{latitude = 1.2,longitude = 3.4});  
---Example 2: ScenEdit_SpecialMessage("Shannon","\<body bgcolor=#005500> \<P> Give me tonight. \</body>");
function ScenEdit_SpecialMessage(side,message,locationPoint) end


---Transfers a list of cargo from source unit to destination unit.  
---cargolist format is as follows.  
--- option 1: A simple flat list of guids of cargo objects to move. {guid1000,guid0002,guid0003};  
--- option 2: A table of tables. each subtable containing {integerHere,DBIDHERE} or just {DBID}.  
--- What's the differnce? just the DBID alone means move 1 of matching DBID's.  integerhere means move that many of that dbid.  
--- You can't mix and match the flat guid format and the table-of-tables formats in the same call.
---@param fromUnit CMO__UnitSelector @ The unit with cargo
---@param toUnit CMO__UnitSelector @ The unit to get cargo
---@param cargoList table @ Cargo List of cargo to transfer: table of {guids}, or { {number,DBID}, [{DBID}]}
---@return boolean @ true on Success or false if not.
---Example 1: ScenEdit_TransferCargo('Eurythmics','Taylor Dayne',{SAMPLE-CARGOGUID0001, SAMPLE-CARGOGUID0002, SAMPLE-CARGOGUID0003})--transfer 3 specific guids.  
---Example 2: ScenEdit_TransferCargo('Eurythmics','Taylor Dayne',{ {357},{4,757},{7,555},{420} }) --move 1 dbid357, 1 dbid420, 4 of dbid757, 7 of dbid555.
function ScenEdit_TransferCargo(fromUnit,toUnit,cargoList) end

---Gets the Detected Contact Wrapper related to an triggered event.  
--- ...from a Unit Detected event trigger. Otherwise, a nil is returned.  
--- Note that UnitC() can also be used as a shortcut for ScenEdit_UnitC()
---@return CMO__Contact|nil @ a contact wrapper for the detected contact or nil
---Example (inside an event action): print(ScenEdit_UnitC().name);
function ScenEdit_UnitC() end

---Gets the Detected Contact Wrapper related to an triggered event.  
--- ...from a Unit Detected event trigger. Otherwise, a nil is returned.  
--- Note that UnitC() can also be used as a shortcut for ScenEdit_UnitC()
---@return CMO__Contact|nil @ a contact wrapper for the detected contact or nil
---Example (inside an event action): print(ScenEdit_UnitC().name);
function UnitC() end

---Get the Activating Unit related to a triggered event.  
--- ...that triggered the current Event. Otherwise,a nil is returned.  
---Note that UnitX() can also be used as a shortcut for ScenEdit_UnitX()
---@return CMO__Unit|nil @ a unit wrapper for the detected contact or nil
---Example (inside an event action): print(ScenEdit_UnitX().name);
function ScenEdit_UnitX() end

---Get the Activating Unit related to a triggered event.  
--- ...that triggered the current Event. Otherwise,a nil is returned.  
---Note that UnitX() can also be used as a shortcut for ScenEdit_UnitX()
---@return CMO__Unit|nil @ a unit wrapper for the detected contact or nil
---Example (inside an event action): print(ScenEdit_UnitX().name);
function UnitX() end

---Get the Detecting Unit related to a triggered event.  
--- ...that triggered the current Event .Otherwise,a nil is returned.  
---Note that UnitY() can also be used as a shortcut for ScenEdit_UnitY()
---@return table @ a unit wrapper for the detected contact or nil
---Example (inside an event action): print(ScenEdit_UnitX().name);
function ScenEdit_UnitY() end

---Get the Detecting Unit related to a triggered event.  
--- ...that triggered the current Event .Otherwise,a nil is returned.  
---Note that UnitY() can also be used as a shortcut for ScenEdit_UnitY()
---@return table @ a unit wrapper for the detected contact or nil
---Example (inside an event action): print(ScenEdit_UnitX().name);
function UnitY() end

---Unload cargo  
---basically disembark cargo from the unit.
---cargolist format is as follows.  
--- option 1: A simple flat list of guids of cargo objects to move. {guid1000,guid0002,guid0003};  
--- option 2: A table of tables. each subtable containing {integerHere,DBIDHERE} or just {DBID}.  
--- What's the differnce? just the DBID alone means move 1 of matching DBID's.  integerhere means move that many of that dbid.  
--- You can't mix and match the flat guid format and the table-of-tables formats in the same call.
---@param fromUnit CMO__UnitSelector @ The unit with cargo
---@param cargoList table @ List of cargo to unload: table of {guids}, or { { number, DBID}}
---@return boolean @ true if Successful or false if not
---Example 1: ScenEdit_UnloadCargo('Eurythmics',{SAMPLE-CARGOGUID0001, SAMPLE-CARGOGUID0002, SAMPLE-CARGOGUID0003}); --unload 3 specific guids.  
---Example 2: ScenEdit_UnloadCargo('Eurythmics',{ {357},{4,757},{7,555},{420} }); --unload 1 dbid357, 1 dbid420, 4 of dbid757, 7 of dbid555.
function ScenEdit_UnloadCargo(fromUnit,cargoList) end


---**TOTALLY DEPRICATED*  
--- Use ScenEdit_SetEventAction() ScenEdit_SetEventCondition() ScenEdit_SetEventTrigger() instead
--- Pretty sure this is unregistered function now, pretty sure even late in CMANO release it was depricated.
---@deprecated
---Type field represents mode ADD_TRIGGER, REMOVE_TRIGGER, REPLACE_TRIGGER, ADD_CONDITION, REMOVE_CONDITION, REPLACE_CONDITION,
---ADD_ACTION, REMOVE_ACTION, REPLACE_ACTION.
---@param EventNameOrID string @ name of the event to add or remove things too.
---@param paramTable table @ {Type="themodestring",Description="NameOrIDOfTCA"}
function ScenEdit__UpdateEvent(EventNameOrID,paramTable) end


---Adds,removes, or updates items on a unit.
---Item that can be modified: sensor, mount, weapon,commdevice,magazine, or special delta import file mode. see CMO__UpdateUnit .mode for details.  
---Undocumented note: add_magazine_only mode will add the magazine without loading it's default components, very handy thanks michael.
---@param CMO__UpdateUnit CMO__UpdateUnit @ The table containing the selector element and the unit sensor/mount/weapon/comms/magazine details to update
---@return CMO__Unit  @ The updated unit wrapper.
---Examples:  local uguid = SE_GetUnit({side="Roxette",unitname="Joyride"});  
---ScenEdit_UpdateUnit({guid=uguid,mode='add_sensor',dbid=581}) --add apy-2 RISP radar sensor using default arcs  
---ScenEdit_UpdateUnit({guid=uguid,mode='add_sensor',dbid=581, arc_detect{'360'}, arc_track={'360'}}) --add a second apy-2 RISP radar sensor with our own arcs  
---ScenEdit_UpdateUnit({guid=uguid,mode='add_mount',dbid=3017}, arc_detect{'360'}, arc_track={'360'}, arc_mount={'360'}}) --add a hot-reload capable+2s firerate vls-64cap mount.  
---ScenEdit_UpdateUnit({guid=uguid,mode='add_comms',dbid=134}) --add Tomahawk control comms  
---ScenEdit_UpdateUnit({guid=uguid,mode='add_weapon',dbid=8962,mountid={'GUID44-MOUNT3017BE4'}}) --add 12pack of aim-260's NOTE THE DBID is the WeaponRecord # not weapon dbid.  
---ScenEdit_UpdateUnit({guid=uguid,mode='update_sensor_arc',sensorId='GUIDOF-FIRSTSENSORADDED',arc_track={'PB1','PB2','SB1','SB2','SMF1','SMF2'}}) -- update detection arcs.  
---ScenEdit_UpdateUnit({guid=uguid,mode='remove_sensor',dbid=581, sensorId='GUIDOF-FIRSTSENSORADDED'}) -- remove a specific instance of the apy-2 RISP.  
---ScenEdit_UpdateUnit({guid=uguid,mode='remove_sensor',dbid=581}) -- remove first located instance of apy2-RISP.  
---ScenEdit_UpdateUnit({guid=uguid,mode='remove_weapon',dbid=8962, mountid={'GUID44-MOUNT3017BE4'}}) --remove first 12pack of aim-260's found.  
---ScenEdit_UpdateUnit({guid=uguid,mode='remove_weapon',dbid=8962, mountid={'GUID44-MOUNT3017BE4'}, weaponid={'GUID4A-WEAPONRECONMNT'}}) --remove a specifc weapon record guid on a specific mount.  
---ScenEdit_UpdateUnit({guid=uguid,mode='delta',file='\\MyDemoScene\\Marie.ini'}) --default path addition is (CMOPATH\\Scenarios\\file)
---ScenEdit_UpdateUnit({guid=uguid,mode='add_magazine',dbid=}) --default path addition is (CMOPATH\\Scenarios\\file)
function ScenEdit_UpdateUnit(CMO__UpdateUnit) end


---Add or remove cargo from a unit.  
---Original documenation is entirely wrong for this.  This is the correct documention. Also see CMO__UpdateUnitCargo for field details.
---@param CMO__UpdateUnitCargo CMO__UpdateUnitCargo @ the table of options to determine what to change. including the guid selector.
---@return CMO__Unit|nil @ A Unit WrapperSE when successful, or nil upon an error.
---Example: local u = ScenEdit_UpdateUnitCargo({guid='SAMPLE-UNITGUIDXHERE',mode="add_cargo" cargo={ {6,855},{6,851} } }) --add 6 sas-sabo and 6 spec ops  
---Example: local u = ScenEdit_UpdateUnitCargo({guid='SAMPLE-UNITGUIDXHERE',mode="add_cargo" cargo={ 855,855,855,851,851,581} } }) --add 3 sas-sabo and 3 spec ops  
---Example: local u = ScenEdit_UpdateUnitCargo({guid='SAMPLE-UNITGUIDXHERE',mode="add_remove" cargo={ {1,855}, {851} } }) --remove 1 sas-sabo and 1 spec ops
function ScenEdit_UpdateUnitCargo(CMO__UpdateUnitCargo) end


---Use an attachment in the scene.
---@param attachmentNameOrGuid string @ Either the name of the attachment (as shown in the properties section when created/added) or the GUID of the attachment
---@return boolean @ true on success, otherwise false.
---@example ScenEdit_UseAttachment('ATTACH-MENTGUIDHERE');
---@example ScenEdit_UseAttachment('LocalSound: Debarge - Rythm_Of_The_Night.mp3');
function ScenEdit_UseAttachment(attachmentNameOrGuid) end


---Use an attachment in the scene on a specified side.  
---Use an attachment on a side (used for .inst files as attachments).
--- Last I checked this returned true but always threw a 'not implemented exception in the log'
---@param attachmentNameOrGuid string @ Either the name of the attachment (as shown in the properties section when created/added) or the GUID of the attachment
---@param sidename? string @ the sidename to 'use' the attachment on, must be a name and not a guid.
---@return boolean @ true on success, otherwise false.
---@example ScenEdit_UseAttachment('ATTACH-MENTGUIDHERE', "Blue");
---@example if(ScenEdit_UseAttachment('LocalSound: Roxette - The_Look.mp3',"Side-Roxette"));
function ScenEdit_UseAttachmentOnSide(attachmentNameOrGuid,sidename) end



--[[ END SCENEDIT FUNCS --]]

--[[ BEGIN World Tools and VP FUNCS --]]


---@Generates a table of points around a circle with the specified number of points.
---The number of points must be 3 or more.
---@param CMO__GetCircleOfPoints_Params CMO__GetCircleOfPoints_Params@ For use with World_GetCircleFromPoint. {lat,lon,numpoints,radius}
---@return CMO__TableOfLocations @ table of {latitude=,longitude=} representing the various points.
function World_GetCircleFromPoint(CMO__GetCircleOfPoints_Params) end

---Gets the elevation or depth for a lat and lon point on the map.
---@param location CMO__Location @ lat and lon table of the location to get the elevation from. {lat,lon}
---@return number @ returns approximate evelvation in meters.
function World_GetElevation(location) end

---Gets a location data for a given lat and lon point on the map.
---@param location CMO__Location @ lat and lon table of the location to get the location data from. {lat,lon}
---@return CMO__LocationData @ returns a table of location data see CMO__LocationData.
function World_GetLocation(location) end

---Gets a location based on starting a bearing and a distance.
---@param CMO__GetPointFromBearing_Params CMO__GetPointFromBearing_Params {lat,lon,bearing,distance}
---@return CMO__Location @ returns simple location lat and lon table.
function World_GetPointFromBearing(CMO__GetPointFromBearing_Params) end

---Get bearing between points in numerical degrees.
---@param startLocation CMO__Location|string @ from here. Can be table of lat & lon or unit|contact guid.
---@param endLocation CMO__Location|string @ to here. Can be table of lat & lon or unit|contact guid.
---@return number @ the bearing in numerical degrees
function Tool_Bearing(startLocation,endLocation) end

---Dump scenario events to XML string ...useful for debugging or investigating detailed options.  
--- Also writes a file to the scenario folder()
---@return string @ xml string and fileoutput.
function Tool_DumpEvents() end

---Simulates 'Event' environment in the lua console and in special events.  
---Off by default. Set to true to enable and false to disable.
---@param thevalue ? boolean @ Default true, 
---@return boolean @ the current value of the setting (if interactive);
function Tool_EmulateNoConsole(thevalue) end

---Given a start and end location returns the distance between to points or units in nmi.
---@param startLocation CMO__Location|string @ from here. Can be table of lat & lon or unit|contact guid.
---@param endLocation CMO__Location|string @ to here. Can be table of lat & lon or unit|contact guid.
---@return number @ the horizontal distance in nmi
function Tool_Range(startLocation,endLocation) end

---Creates a new scenario. Equivalent to Menu File -> Create New Scenario. If not DB is provided it will use the actual DB.
---@param db string ?@The DB filename to create the new scenario
function Tool_BuildBlankScenario(db) end

--- completely undocumented. Internal Appears to be related to resetting error conditions or managing in-game LUA editor environment??
--- hard to follow the what the delegate is actually doing.
---@param windowName string @ 
---@param mode boolean @ 
---@return boolean @ true on success false if it did nothing.
function Tool_UIWindow(windowName,mode)end


---Export unit details to a file for later import parameters filename,filter by unit type,side
---@param filtertable CMO__TargetFilter-UnitsInArea @ -Table of Filters: TARGETSIDE, TARGETTYPE, TARGETSUBTYPE, SPECIFICUNITCLASS, SPECIFICUNIT.  
---The values are like the Event Target triigers, but can take multiple ones. As in {TargetType={'aircraft','submarine'}}
---@param filename string @ filename string of exported file
---@return boolean @ true on success otherwise false
--- VP_ExportUnits({TargetSide="Blue",TargetType={'aircraft','submarine'},'somepath\\myexportedunits.xml')
function VP_ExportUnits(filtertable,filename) end

---Get contact details This will get the information about a contact unit  
---This view is a 'side independent' view of the data, so it's possible less fields will contain data then using ScenEdit_GetContact.
---@param CMO__VPContactSelector CMO__VPContactSelector @ table containing the contact guid {guid=contactguidhere};
---@return CMO__Contact|nil
---local a_contact = VP_GetContact({guid="SomeContacGuidHere"});
function VP_GetContact(CMO__VPContactSelector) end

---Exposes current scenario information.  
---@return CMO__Scenario
---local sceneFileName = VP_GetScenario().FileName;
function VP_GetScenario() end

---@Gets a side object from the perspective of the player.  
--- Reminder: inplace of a side name the keyword 'PlayerSide' can be used to automatically insert the sidename of side player in currently on/switched too.
---@param CMO__SideSelector CMO__SideSelector @ the selector table indicating what side to grab {side= or guid=}; name= can also be use but is converted to side=
---@return CMO__Side|nil @ a CMO Side wrapper/object. nil and err if side name not found.
---local s = VP_GetSide{side="SomeSideName"});
function VP_GetSide(CMO__SideSelector) end

---Generates an ordered table of side wrappers
---@return CMO__TableOfSides
--- local s = VP_GetSides();
function VP_GetSides() end

---Get unit details This will get the information about an active unit or a contact unit
---Similar to SE_GetUnit but can be used with contactguid?  
---Most imporantly this returns an ActiveUnit version of the wrapper not an ActiveUnit_SE version.
---What the means is some of the 'set' options and method are not available on the wrapper returned.
---@param CMO__UnitSelector CMO__UnitSelector
---@return CMO__Unit| CMO__Contact|nil @ either returns the requested unit or contact wrapper or nil on failure to locate.
--- local u = VP_GetUnit({guid=SomeGuidHere});
function VP_GetUnit(CMO__UnitSelector) end 

--- @param UnitNameOrID string @The unit name or GUID. As no side is specified, GUID is more reliable
---@param text table @ of multiple string Text to show
---@param R number The 'Red' component of the color (0-255) to show the text in
---@param G number The 'Green' component of the color (0-255)
---@param B number The 'Blue' component of the color (0-255)
---@param moveUpward? boolean [Optional] Default is True. This will move the text upwards
---@param fade? boolean [Optional] Default is True. This controls the fading out of the text
---@param lifeTime? number [Optional] Default is 1 second. This controls how long the text stays visible
---@param fontSize? number @[Optional] Default is 18. This controls the fonst size of the text 
function ScenEdit_CreateBarkNotification_Unit_Bulk(UnitNameOrID,text,R,G,B,moveUpward,fade,lifeTime,fontSize) end

--- @param UnitNameOrID string @The unit name or GUID. As no side is specified, GUID is more reliable
---@param text string @ Text to show
---@param R number The 'Red' component of the color (0-255) to show the text in
---@param G number The 'Green' component of the color (0-255)
---@param B number The 'Blue' component of the color (0-255)
---@param moveUpward? boolean [Optional] Default is True. This will move the text upwards
---@param fade? boolean [Optional] Default is True. This controls the fading out of the text
---@param lifeTime? number [Optional] Default is 1 second. This controls how long the text stays visible
---@param fontSize? number @[Optional] Default is 18. This controls the fonst size of the text 
function ScenEdit_CreateBarkNotification_Unit(UnitNameOrID,text,R,G,B,moveUpward,fade,lifeTime,fontSize) end
---comment
---@param latitude number
---@param longitude number 
---@param text string @ Text to show
---@param R number The 'Red' component of the color (0-255) to show the text in
---@param G number The 'Green' component of the color (0-255)
---@param B number The 'Blue' component of the color (0-255)
---@param moveUpward? boolean [Optional] Default is True. This will move the text upwards
---@param fade? boolean [Optional] Default is True. This controls the fading out of the text
---@param lifeTime? number [Optional] Default is 1 second. This controls how long the text stays visible
---@param fontSize? number @[Optional] Default is 18. This controls the fonst size of the text 
function ScenEdit_CreateBarkNotification_Geo(latitude,longitude,text,R,G,B,moveUpward,fade,lifeTime,fontSize) end
---Save the scen in the folder passed
---@param path string @The absolute path to the folder
function Command_SaveScen(path) end

---Set the simulation fidelity
---@param fidelity number @0.1, 1, 5 
function ScenEdit_SetSimulationFidelity(fidelity) end

---Creates a window with an HTML message to allow input data from a custom HTML Form. See https://commandlua.github.io/assets/Function_UI_CallAdvancedHTMLDialog.html
---@param title string @Title of the document
---@param html_message string @HTML message to display
---@param buttons table @Buttons to display and interact
---@return table @Table with all the items from the HTML form and button pressed in key 'pressed'
function UI_CallAdvancedHTMLDialog(title, html_message, buttons) end

---comment
---@param text string @Text to print to Exception Log
function print_exc(text) end

---comment
---@param Latitude number @Latitude
---@param Longitude number @Longitude
---@param Altitude number ?@Altitude of the camera in meters
function UI_SetCameraView(Latitude, Longitude,Altitude) end