within Buildings.Controls.OBC.ASHRAE.G36.AHUs.SingleZone.VAV.SetPoints.Validation;
model PlantRequests
  "Validate model for calculating the plant requests"

  Buildings.Controls.OBC.ASHRAE.G36.AHUs.SingleZone.VAV.SetPoints.PlantRequests plaReq
    "Calculate plant request"
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Buildings.Controls.OBC.ASHRAE.G36.AHUs.SingleZone.VAV.SetPoints.PlantRequests plaReq1(
    heaCoi=Buildings.Controls.OBC.ASHRAE.G36.Types.HeatingCoil.None)
    "Calculate plant request"
    annotation (Placement(transformation(extent={{60,-80},{80,-60}})));

  Buildings.Controls.OBC.CDL.Reals.Sources.Ramp supTem(
    final height=8,
    final offset=273.15 + 15,
    final duration=3600) "Supply air temperature"
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Ramp supTemSet(
    final height=6,
    final offset=273.15 + 14.5,
    final duration=3600) "Supply air temperature setpoint"
    annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Ramp cooCoi(
    final height=-0.3,
    final offset=0.96,
    final duration=3600,
    startTime=1000) "Cooling coil position"
    annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Ramp heaCoi(
    final height=-0.3,
    final offset=0.96,
    final duration=3600,
    startTime=1000) "Heating coil position"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Ramp supTem1(
    final height=8,
    final offset=273.15 + 12,
    final duration=3600) "Cooling supply air temperature"
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Ramp supTemSet1(
    final height=15,
    final offset=273.15 + 20,
    final duration=3600) "Supply air temperature setpoint"
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant cooCoi1(
    final k=0) "Cooling coil position"
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Ramp supTem2(
    final height=7,
    final offset=273.15 + 13,
    final duration=3600) "Supply air temperature"
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));

equation
  connect(supTem.y, plaReq1.TAirSup) annotation (Line(points={{-58,-40},{20,-40},
          {20,-61},{58,-61}}, color={0,0,127}));
  connect(cooCoi.y, plaReq1.uCooCoi_actual) annotation (Line(points={{-58,-80},
          {20,-80},{20,-70},{58,-70}}, color={0,0,127}));
  connect(supTem1.y, plaReq.TAirSup) annotation (Line(points={{-58,80},{0,80},{
          0,69},{58,69}}, color={0,0,127}));
  connect(cooCoi1.y, plaReq.uCooCoi_actual) annotation (Line(points={{-58,40},{
          10,40},{10,60},{58,60}}, color={0,0,127}));
  connect(heaCoi.y, plaReq.uHeaCoi_actual) annotation (Line(points={{-58,0},{30,
          0},{30,51},{58,51}}, color={0,0,127}));
  connect(supTemSet1.y, plaReq.TSupCoo) annotation (Line(points={{-18,60},{0,60},
          {0,65},{58,65}}, color={0,0,127}));
  connect(supTemSet.y, plaReq1.TSupCoo) annotation (Line(points={{-18,-60},{0,
          -60},{0,-65},{58,-65}},
                             color={0,0,127}));
  connect(supTem2.y, plaReq.TSupHeaEco) annotation (Line(points={{-18,20},{20,20},
          {20,55},{58,55}}, color={0,0,127}));

annotation (
  experiment(StopTime=3600, Tolerance=1e-6),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Controls/OBC/ASHRAE/G36/AHUs/SingleZone/VAV/SetPoints/Validation/PlantRequests.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This example validates
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36.AHUs.SingleZone.VAV.SetPoints.PlantRequests\">
Buildings.Controls.OBC.ASHRAE.G36.AHUs.SingleZone.VAV.SetPoints.PlantRequests</a>
for air handling unit serving single zone.
</p>
</html>", revisions="<html>
<ul>
<li>
February 6, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>
</html>"),
    Icon(graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent = {{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points = {{-36,60},{64,0},{-36,-60},{-36,60}})}));
end PlantRequests;
