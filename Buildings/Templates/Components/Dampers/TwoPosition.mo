within Buildings.Templates.Components.Dampers;
model TwoPosition "Two-position damper"
  extends Buildings.Templates.Components.Interfaces.Damper(final typ=Types.Damper.TwoPosition);

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=
    if loc==Types.Location.OutdoorAir           then
      dat.getReal(varName=id + ".Mechanical.Supply air mass flow rate.value")
    elseif loc==Types.Location.MinimumOutdoorAir            then
      dat.getReal(varName=id + ".Mechanical.Economizer.Minimum outdoor air mass flow rate.value")
    elseif loc==Types.Location.Return           then
      dat.getReal(varName=id + ".Mechanical.Return air mass flow rate.value")
    elseif loc==Types.Location.Relief           then
      dat.getReal(varName=id + ".Mechanical.Return air mass flow rate.value")
    else 0
    "Mass flow rate"
    annotation (Dialog(group="Nominal condition"), Evaluate=true);
  parameter Modelica.SIunits.PressureDifference dpDamper_nominal(
    min=0, displayUnit="Pa")=
    if loc==Types.Location.OutdoorAir           then
      dat.getReal(varName=id + ".Mechanical.Economizer.Outdoor air damper pressure drop.value")
    elseif loc==Types.Location.MinimumOutdoorAir            then
      dat.getReal(varName=id + ".Mechanical.Economizer.Minimum outdoor air damper pressure drop.value")
    elseif loc==Types.Location.Return           then
      dat.getReal(varName=id + ".Mechanical.Economizer.Return air damper pressure drop.value")
    elseif loc==Types.Location.Relief           then
      dat.getReal(varName=id + ".Mechanical.Economizer.Relief air damper pressure drop.value")
    else 0
    "Pressure drop of open damper"
    annotation (Dialog(group="Nominal condition"));

  Fluid.Actuators.Dampers.Exponential damExp(
    redeclare final package Medium=Medium,
    final m_flow_nominal=m_flow_nominal,
    final dpDamper_nominal=dpDamper_nominal)
    "Exponential damper"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Routing.BooleanPassThrough yDamOutMin
    if loc == Types.Location.MinimumOutdoorAir
    "Pass through to connect with specific control signal" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-40,70})));
  Modelica.Blocks.Routing.BooleanPassThrough yDamRel
    if loc == Types.Location.Relief
    "Pass through to connect with specific control signal" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,70})));
  Buildings.Controls.OBC.CDL.Conversions.BooleanToReal booToRea
    "Signal conversion" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,30})));
  .Buildings.Controls.OBC.CDL.Continuous.GreaterThreshold evaSta(t=0.99, h=0.5E-2)
    "Evaluate damper status" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-30})));
  Modelica.Blocks.Routing.BooleanPassThrough yDamOutMin_actual
    if loc == Types.Location.MinimumOutdoorAir
    "Pass through to connect with specific control signal" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-40,-70})));
  Modelica.Blocks.Routing.BooleanPassThrough yDamRel_actual
    if loc == Types.Location.Relief
    "Pass through to connect with specific control signal" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-70})));
  Modelica.Blocks.Routing.BooleanPassThrough yDamOut
    if loc == Types.Location.OutdoorAir
    "Pass through to connect with specific control signal" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,70})));
  Modelica.Blocks.Routing.BooleanPassThrough yDamOut_actual
    if loc == Types.Location.OutdoorAir
    "Pass through to connect with specific control signal" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-70})));
equation
  connect(port_a, damExp.port_a) annotation (Line(points={{-100,0},{-56,0},{-56,
          0},{-10,0}}, color={0,127,255}));
  connect(damExp.port_b, port_b)
    annotation (Line(points={{10,0},{100,0}}, color={0,127,255}));
  connect(booToRea.y, damExp.y)
    annotation (Line(points={{0,18},{0,12}}, color={0,0,127}));
  connect(yDamOutMin.y, booToRea.u) annotation (Line(points={{-40,59},{-40,50},
          {0,50},{0,42}}, color={255,0,255}));
  connect(yDamRel.y, booToRea.u) annotation (Line(points={{40,59},{40,50},{0,
          50},{0,42}}, color={255,0,255}));
  connect(damExp.y_actual, evaSta.u) annotation (Line(points={{5,7},{20,7},{
          20,-10},{0,-10},{0,-18}}, color={0,0,127}));
  connect(evaSta.y, yDamOutMin_actual.u) annotation (Line(points={{0,-42},{0,
          -50},{-40,-50},{-40,-58}}, color={255,0,255}));
  connect(evaSta.y, yDamRel_actual.u) annotation (Line(points={{0,-42},{0,-50},
          {40,-50},{40,-58}}, color={255,0,255}));
  connect(yDamOutMin_actual.y, bus.inp.yDamOutMin_actual) annotation (Line(
        points={{-40,-81},{-40,-90},{-60,-90},{-60,88},{0.1,88},{0.1,100.1}},
        color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(yDamRel_actual.y, bus.inp.yDamRel_actual) annotation (Line(points={{
          40,-81},{40,-90},{80,-90},{80,88},{0.1,88},{0.1,100.1}}, color={255,0,
          255}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(bus.out.yDamOutMin, yDamOutMin.u) annotation (Line(
      points={{0.1,100.1},{0.1,96},{-40,96},{-40,82}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(bus.out.yDamRel, yDamRel.u) annotation (Line(
      points={{0.1,100.1},{2,100.1},{2,100},{4,100},{4,96},{40,96},{40,82}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(yDamOut.y, booToRea.u)
    annotation (Line(points={{0,59},{0,42}}, color={255,0,255}));
  connect(bus.out.yDamOut, yDamOut.u) annotation (Line(
      points={{0.1,100.1},{0.1,92},{0,92},{0,82}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(evaSta.y, yDamOut_actual.u)
    annotation (Line(points={{0,-42},{0,-58}}, color={255,0,255}));
  connect(yDamOut_actual.y, bus.inp.yDamOut_actual) annotation (Line(points={{0,
          -81},{0,-92},{82,-92},{82,90},{0.1,90},{0.1,100.1}}, color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
end TwoPosition;
