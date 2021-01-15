within Buildings.Experimental.Templates.AHUs.Coils.Data;
record CoolingWater
  extends None;

  // FIXME: Dummy default values fo testing purposes only.
  parameter Modelica.SIunits.MassFlowRate m1_flow_nominal(min=0)=1
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.MassFlowRate m2_flow_nominal(min=0)=1
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.PressureDifference dp1_nominal(
    displayUnit="Pa")=3e4
    "Nominal pressure drop"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.PressureDifference dp2_nominal(
    displayUnit="Pa")=200
    "Nominal pressure drop"
    annotation(Dialog(group = "Nominal condition"));

  annotation (
    defaultComponentName="datCoi",
    defaultComponentPrefixes="outer parameter",
    Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CoolingWater;