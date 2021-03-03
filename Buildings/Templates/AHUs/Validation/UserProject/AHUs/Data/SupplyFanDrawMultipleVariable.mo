within Buildings.Templates.AHUs.Validation.UserProject.AHUs.Data;
record SupplyFanDrawMultipleVariable =
  Buildings.Templates.AHUs.Data.VAVSingleDuct (
    typEco=Types.Economizer.None,
    typCoiCoo=Types.Coil.None,
    typFanSup=Types.Fan.MultipleVariable,
    redeclare replaceable record RecordFanSup=Fans.Data.MultipleVariable)
  annotation (
  defaultComponentName="datAhu");
