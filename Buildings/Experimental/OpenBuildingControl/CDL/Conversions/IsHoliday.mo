within Buildings.Experimental.OpenBuildingControl.CDL.Conversions;
block IsHoliday
  "Block to output true/false by checking if it is holiday"

  Interfaces.DayTypeInput u "Connector of DayType input signal"
    annotation ( Placement(transformation(extent={{-140,-20},{-100,20}})));
  Interfaces.BooleanOutput y "Connector of Boolean output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  y = if u==CDL.Types.Day.Holiday then true else false;

annotation (
defaultComponentName="isHoliday",
Documentation(info="<html>
<p>
Block that outputs the <code>Boolean</code> value by checking if 
it is holiday.
</p>
<pre>
y = if u==CDL.Types.Day.Holiday then true else false;
</pre>
<p>
where <code>u</code> is of <code>Day</code> type and <code>y</code> is 
<code>Boolean</code> type.
</p>
</html>", revisions="<html>
<ul>
<li>
July 17, 2017, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>
</html>"),
Diagram(coordinateSystem(preserveAspectRatio=false)),
  Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={210,210,210},
          lineThickness=5.0,
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised),
        Text(
          extent={{-82,46},{82,-44}},
          lineColor={0,127,0},
          textString="isHoliday"),
        Text(
          extent={{-140,148},{160,108}},
          textString="%name",
          lineColor={0,0,255})}));
end IsHoliday;
