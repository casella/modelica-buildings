within Buildings.Controls.OBC.ASHRAE.G36.VentilationZones.Title24.SetPoints.Validation;
model ZoneAbsoluteMinimumOutdoorAirflow
  "Validates zone absolute outdoor airflow setpoint"

equation

annotation (
  experiment(StopTime=1200.0, Tolerance=1e-06),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Controls/OBC/ASHRAE/G36_PR1/AHUs/SingleZone/VAV/SetPoints/Validation/ExhaustDamper.mos"
    "Simulate and plot"),
  Documentation(info="<html>
<p>
This example validates
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.SingleZone.VAV.SetPoints.ExhaustDamper\">
Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.SingleZone.VAV.SetPoints.ExhaustDamper</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
Jun 20, 2020, by Milica Grahovac:<br/>
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
end ZoneAbsoluteMinimumOutdoorAirflow;
