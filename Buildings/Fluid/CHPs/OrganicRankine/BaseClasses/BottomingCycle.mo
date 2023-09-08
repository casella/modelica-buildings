within Buildings.Fluid.CHPs.OrganicRankine.BaseClasses;
model BottomingCycle "Organic Rankine cycle as a bottoming"

  Buildings.Fluid.CHPs.OrganicRankine.BaseClasses.Equations equ(
    final pro=pro,
    final TEva=TEva,
    final TCon=TCon,
    final dTSup=dTSup,
    final etaExp=etaExp) "Core equations for the Rankine cycle"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Interfaces.RealOutput P(
    min=0,
    final quantity="Power",
    final unit="W") "Power output of the expander"
                                   annotation (Placement(transformation(extent={{100,40},
            {120,60}}),            iconTransformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput etaThe(
    min=0,
    final unit="1") "Thermal efficiency"
    annotation (Placement(
        transformation(extent={{100,-6},{120,14}}),   iconTransformation(extent={{100,-10},
            {120,10}})));
  Modelica.Blocks.Interfaces.RealOutput QCon_flow(
    final quantity="Power",
    final unit="W") "Heat rejected through condensation"
    annotation (Placement(transformation(extent={{100,-60},{120,-40}}),
        iconTransformation(extent={{100,-70},{120,-50}})));
  parameter Buildings.Fluid.CHPs.OrganicRankine.Data.Generic pro
    "Property records of the working fluid"
    annotation(choicesAllMatching = true);
  parameter Modelica.Units.SI.Temperature TEva
    "Evaporator temperature";
  parameter Modelica.Units.SI.Temperature TCon
    "Condenser temperature";
  parameter Modelica.Units.SI.TemperatureDifference dTSup = 0
    "Superheating differential temperature ";
  parameter Real etaExp "Expander efficiency";

  Buildings.Controls.OBC.CDL.Interfaces.RealInput QEva_flow(
    final quantity="Power",
    final unit="W")
    "Heat flow into the evaporator" annotation (Placement(transformation(extent={{-140,36},
            {-100,76}}),            iconTransformation(extent={{-140,40},{-100,80}})));
protected
  Buildings.Controls.OBC.CDL.Continuous.Multiply mulExp "Expander work"
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Buildings.Controls.OBC.CDL.Continuous.Multiply mulCon "Condenser heat flow"
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Blocks.Math.Gain gai(k(final unit="W") = -1, y(final unit="W"))
    "Sign reversal" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,50})));
equation
  connect(equ.etaThe,mulExp. u2)
    annotation (Line(points={{-19,4},{10,4},{10,44},{18,44}},color={0,0,127}));
  connect(equ.etaThe,etaThe)  annotation (Line(points={{-19,4},{110,4}},
                 color={0,0,127}));
  connect(mulCon.u1, equ.rConEva) annotation (Line(points={{18,-44},{0,-44},{0,-4},
          {-19,-4}},        color={0,0,127}));
  connect(mulCon.y, QCon_flow)
    annotation (Line(points={{42,-50},{110,-50}}, color={0,0,127}));
  connect(mulExp.y, gai.u)
    annotation (Line(points={{42,50},{58,50}},   color={0,0,127}));
  connect(gai.y, P) annotation (Line(points={{81,50},{110,50}},
                 color={0,0,127}));
  connect(QEva_flow, mulExp.u1)
    annotation (Line(points={{-120,56},{18,56}},   color={0,0,127}));
  connect(mulCon.u2, QEva_flow) annotation (Line(points={{18,-56},{-60,-56},{-60,
          56},{-120,56}},   color={0,0,127}));
annotation (defaultComponentName="ORC",
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-67},{57,-67}}, color={0,0,0}),
        Line(
          points={{-60,-60},{-28,-20},{16,32},{40,60},{52,60},{54,30},{48,2},{52,
              -38},{58,-58}},
          color={0,0,0},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{6,20},{52,20},{66,-6},{50,-18},{-26,-18}},
          color={0,0,0},
          thickness=0.5,
          pattern=LinePattern.Dash),
        Line(points={{-66,61},{-66,-78}}, color={0,0,0}),
        Polygon(
          points={{-66,73},{-74,51},{-58,51},{-66,73}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{63,-67},{41,-59},{41,-75},{63,-67}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,100},{-64,58}},
          textColor={0,0,0},
          textString="T"),
        Text(
          extent={{64,-58},{100,-100}},
          textColor={0,0,0},
          textString="s"),
        Text(
          extent={{-149,-114},{151,-154}},
          textColor={0,0,255},
          textString="%name")}),                               Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
This model uses the organic Rankine cycle as a bottoming cycle.
The heat input is interfaced via the heat port.
</p>
<p>
The thermodynamic equations are implemented in
<a href=\"Modelica://Buildings.Fluid.CHPs.OrganicRankine.BaseClasses.Equations\">
Buildings.Fluid.CHPs.OrganicRankine.BaseClasses.Equations</a>.
The cycle is determined through the input of
the evaporator temperature <code>TEva</code>,
the condenser temperature <code>TCon</code>,
the expander efficiency <code>etaExp</code>,
and optionally the superheating temperature differential <code>dTSup</code>.
The model neglects the enthalpy difference between the pump inlet and outlet
or the pressure loss along any pipe of the cycle components.
While the model considers potential superheating before the expander inlet,
it does not consider subcooling before the pump inlet.
</p>
<p><img src=\"modelica://Buildings/Resources/Images/Fluid/CHPs/OrganicRankine/cycle.png\"
alt=\"Cycle\"/></p>
<p>
The property queries of the working fluid are not performed by medium models,
but by interpolating data records in
<a href=\"Modelica://Buildings.Fluid.CHPs.OrganicRankine.Data\">
Buildings.Fluid.CHPs.OrganicRankine.Data</a>.
Specific enthalpy and specific entropy values are provided as support points
on the saturated liquid line, the saturated vapour line,
and a superheated vapour line. Support points on all three lines correspond
with the same pressures. The points on the superheated vapour line have a
constant temperature differential at the same pressure
from their corresponding points on the saturated vapour line.
</p>
<p>
Important state points in the Rankine cycle are determined by various schemes
of inter-/extrapolation along isobaric lines (assumed near linear):
</p>
<ul>
<li>
The pump inlet <code>Pum</code> and expander inlet <code>ExpInl</code>
are both located on a saturation line. They are determined simply by
smooth interpolation.
</li>
<li>
When there is superheating (determined by <code>dTSup > 0.1</code>),
<code>ExpInl</code> is elevated. Its specific enthaply and specific entropy
are then found by linear inter-/extrapolation between the saturated and
superheated (\"ref\") vapour lines along the isobaric line:<br/>
<p align=\"center\" style=\"font-style:italic;\">
(s<sub>ExpInl</sub> - s<sub>SatVap</sub>)
&frasl; &Delta;T<sub>Sup</sub>
= (s<sub>SupVap,ref</sub> - s<sub>SatVap</sub>)
&frasl; &Delta;T<sub>Sup,ref</sub>)<br/>
(h<sub>ExpInl</sub> - h<sub>SatVap</sub>)
&frasl; &Delta;T<sub>Sup</sub>
= (h<sub>SupVap,ref</sub> - h<sub>SatVap</sub>)
&frasl; &Delta;T<sub>Sup,ref</sub>)
</p>
</li>
<li>
The isentropic expander outlet <code>ExpOut_i</code> is found also by linear
inter-/extrapolation, but with entropy instead of temperature.
<ul>
<li>
If <code>ExpOut_i</code> lands outside of the dome, the inter-/extrapolation
is performed between the saturated and superheated (\"ref\") lines:<br/>
<p align=\"center\" style=\"font-style:italic;\">
(h<sub>ExpOut_i</sub> - h<sub>SatVap</sub>)
&frasl; (s<sub>ExpInl</sub> - s<sub>SatVap</sub>)
= (h<sub>SupVap,ref</sub> - h<sub>SatVap</sub>)
&frasl; (s<sub>SupVap,ref</sub> - s<sub>SatVap</sub>)
</p>
</li>
<li>
If it lands inside the dome, interpolation is performed between
the two saturation lines:<br/>
<p align=\"center\" style=\"font-style:italic;\">
(h<sub>ExpOut_i</sub> - h<sub>Pum</sub>)
&frasl; (s<sub>ExpInl</sub> - s<sub>Pum</sub>)
= (h<sub>SatVap</sub> - h<sub>Pum</sub>)
&frasl; (s<sub>SatVap</sub> - s<sub>Pum</sub>)
</p>
In this case the results are accurate.
</li>
</ul>
</li>
</ul>
</html>", revisions="<html>
<ul>
<li>
June 13, 2023, by Hongxiang Fu:<br/>
First implementation. This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/3433\">#3433</a>.
</li>
</ul>
</html>"));
end BottomingCycle;
