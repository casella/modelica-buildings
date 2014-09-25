within Buildings.Electrical.AC.ThreePhasesBalanced.Lines;
model TwoPortRL
  "Model of a resistive-inductive element with two electrical ports"
  extends Buildings.Electrical.AC.OnePhase.Lines.TwoPortRL(
    redeclare Interfaces.Terminal_n terminal_n,
    redeclare Interfaces.Terminal_p terminal_p,
    V_nominal(start=480));
  annotation (
    defaultComponentName="lineRL",
    Diagram(graphics), Icon(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(revisions="<html>
<ul>
<li>
August 25, 2014, by Marco Bonvini:<br/>
Revised documentation.
</li>
</ul>
</html>", info="<html>
<p>
Resistive-inductive impedance that connects two AC three phases 
balanced interfaces. This model can be used to represent a
cable in a three phases balanced AC system.
</p>
<p>
See model
<a href=\"modelica://Buildings.Electrical.AC.OnePhase.Lines.TwoPortRL\">
Buildings.Electrical.AC.OnePhase.Lines.TwoPortRL</a> for more 
information.
</p>
</html>"));
end TwoPortRL;
