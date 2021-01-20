within Buildings.Experimental.Templates.AHUs.Validation;
model NoEquipment_outer
  extends Modelica.Icons.Example;
  replaceable package MediumAir=Buildings.Media.Air
    constrainedby Modelica.Media.Interfaces.PartialMedium
    "Air medium";
  replaceable package MediumCoo=Buildings.Media.Water
    constrainedby Modelica.Media.Interfaces.PartialMedium
    "Cooling medium (such as CHW)";

  Main.VAVSingleDuct_outer ahu
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Fluid.Sources.Boundary_pT bou(
    redeclare final package Medium=MediumAir,
    nPorts=2)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Fluid.Sources.Boundary_pT bou1(
    redeclare final package Medium=MediumAir,
    nPorts=2)
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));
equation
  connect(bou.ports[1], ahu.port_Out) annotation (Line(points={{-60,2},{-40,2},
          {-40,-10},{-20,-10}},color={0,127,255}));
  connect(ahu.port_Sup, bou1.ports[1]) annotation (Line(points={{20,-10},{40,
          -10},{40,2},{60,2}},
                          color={0,127,255}));
  connect(bou.ports[2], ahu.port_Exh) annotation (Line(points={{-60,-2},{-40,-2},
          {-40,10},{-20,10}}, color={0,127,255}));
  connect(ahu.port_Ret, bou1.ports[2]) annotation (Line(points={{20,10},{40,10},
          {40,-2},{60,-2}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end NoEquipment_outer;
