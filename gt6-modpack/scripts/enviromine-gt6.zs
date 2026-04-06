var freezer = <enviromine:freezer>;
var esky = <enviromine:esky>;
var airFilter = <enviromine:airFilter>;
var gasMask = <enviromine:gasMask>;

var wrench = <ore:craftingToolWrench>;
var hammer = <ore:craftingToolHardHammer>;
var scissors = <ore:craftingToolScissors>;
var knife = <ore:craftingToolKnife>;
var screwDriver = <ore:craftingToolScrewdriver>;

var ironPlate = <ore:plateAnyIronOrSteel>;
var galvanizedSteelPlate = <gregtech:gt.meta.plate:8651>;
var curvedIronPlate = <ore:plateCurvedAnyIronOrSteel>;
var coalCarbonDust = <ore:dustAnyCoalCarbon>;
var ironStick = <ore:stickAnyIronOrSteel>;
var ironScrew = <ore:screwAnyIronOrSteel>;

var ice = <minecraft:ice>;
var packedIce = <minecraft:packed_ice>;
var snow = <minecraft:snow>;
var wool = <minecraft:wool:*>;
var chest = <ore:craftingChest>;
var paper = <minecraft:paper>;
var glassPane = <ore:paneGlass>;
var leather = <ore:craftingLeather>;

recipes.remove(freezer);
recipes.remove(esky);
recipes.remove(airFilter);
recipes.remove(gasMask);

recipes.addShaped(esky,
  [
    [scissors, wool, hammer],
    [ironPlate, chest, ironPlate],
    [ironPlate, snow, ironPlate]
  ]
);

recipes.addShaped(esky,
  [
    [knife, wool, hammer],
    [ironPlate, chest, ironPlate],
    [ironPlate, snow, ironPlate]
  ]
);

recipes.addShaped(freezer,
  [
    [wrench, galvanizedSteelPlate, hammer],
    [galvanizedSteelPlate, esky, galvanizedSteelPlate],
    [galvanizedSteelPlate, ice, galvanizedSteelPlate]
  ]
);

recipes.addShaped(freezer,
  [
    [wrench, galvanizedSteelPlate, hammer],
    [galvanizedSteelPlate, esky, galvanizedSteelPlate],
    [galvanizedSteelPlate, packedIce, galvanizedSteelPlate]
  ]
);

recipes.addShaped(airFilter,
  [
    [hammer, paper, null],
    [curvedIronPlate, coalCarbonDust, curvedIronPlate],
    [null, paper, null]
  ]
);

recipes.addShaped(airFilter,
  [
    [hammer, wool, null],
    [curvedIronPlate, coalCarbonDust, curvedIronPlate],
    [null, paper, null]
  ]
);

recipes.addShaped(airFilter,
  [
    [hammer, paper, null],
    [curvedIronPlate, coalCarbonDust, curvedIronPlate],
    [null, wool, null]
  ]
);

recipes.addShaped(airFilter,
  [
    [hammer, wool, null],
    [curvedIronPlate, coalCarbonDust, curvedIronPlate],
    [null, wool, null]
  ]
);

recipes.addShaped(gasMask,
  [
    [screwDriver, leather, scissors],
    [ironStick, glassPane, ironStick],
    [airFilter, ironScrew, airFilter]
  ]
);
