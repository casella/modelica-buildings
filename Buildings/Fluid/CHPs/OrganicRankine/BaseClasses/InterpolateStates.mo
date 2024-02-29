within Buildings.Fluid.CHPs.OrganicRankine.BaseClasses;
model InterpolateStates "Interpolate states of a working fluid"

  // Input properties
  replaceable parameter Buildings.Fluid.CHPs.OrganicRankine.Data.Generic pro
    "Property records of the working fluid"
    annotation(Dialog(group="ORC inputs"),choicesAllMatching = true);

  input Modelica.Units.SI.ThermodynamicTemperature TEva
    "Evaporating temperature";
  input Modelica.Units.SI.ThermodynamicTemperature TCon
    "Condensing temperature";

  parameter Modelica.Units.SI.TemperatureDifference dTSup = 0
    "Superheating differential temperature"
    annotation(Dialog(group="ORC inputs"));
  parameter Modelica.Units.SI.Efficiency etaExp "Expander efficiency"
    annotation(Dialog(group="ORC inputs"));

  // Once-interpolated properties
  Modelica.Units.SI.AbsolutePressure pEva(
    displayUnit = "kPa") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TEva,
      xd = pro.T,
      yd = pro.p,
      d = pDer_T)
    "Evaporating pressure";
  Modelica.Units.SI.AbsolutePressure pCon(
    displayUnit = "kPa") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TCon,
      xd = pro.T,
      yd = pro.p,
      d = pDer_T)
    "Condensing pressure";
  Modelica.Units.SI.SpecificEntropy sPum =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TCon,
      xd = pro.T,
      yd = pro.sSatLiq,
      d = sSatLiqDer_T)
    "Specific entropy at pump, neglecting difference between inlet and outlet";
  Modelica.Units.SI.SpecificEnthalpy hPum(
    displayUnit = "kJ/kg") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TCon,
      xd = pro.T,
      yd = pro.hSatLiq,
      d = hSatLiqDer_T)
    "Specific enthalpy at pump, neglecting difference between inlet and outlet";
  Modelica.Units.SI.SpecificEnthalpy hPinEva(
    displayUnit = "kJ/kg") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TEva,
      xd = pro.T,
      yd = pro.hSatLiq,
      d = hSatLiqDer_T)
    "Specific enthalpy on evaporator-side pinch point";
  Modelica.Units.SI.SpecificEnthalpy hPinCon(
    displayUnit = "kJ/kg") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TCon,
      xd = pro.T,
      yd = pro.hSatVap,
      d = hSatVapDer_T)
    "Specific enthalpy on condenser-side pinch point";
  Modelica.Units.SI.SpecificEntropy sSatVapCon =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TCon,
      xd = pro.T,
      yd = pro.sSatVap,
      d = sSatVapDer_T)
    "Specific entropy of saturated vapour at the condenser";
  Modelica.Units.SI.SpecificEntropy sRefCon =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = pCon,
      xd = pro.p,
      yd = pro.sRef,
      d = sRefDer_p)
    "Specific entropy of reference line on condenser side";
  Modelica.Units.SI.SpecificEntropy sSatVapEva =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TEva,
      xd = pro.T,
      yd = pro.sSatVap,
      d = sSatVapDer_T)
    "Specific entropy of saturated vapour in evaporator";
  Modelica.Units.SI.SpecificEntropy sRefEva =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = pEva,
      xd = pro.p,
      yd = pro.sRef,
      d = sRefDer_p)
    "Specific entropy of reference line on evaporator side";
  Modelica.Units.SI.SpecificEnthalpy hSatVapCon(
    displayUnit = "kJ/kg") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TCon,
      xd = pro.T,
      yd = pro.hSatVap,
      d = hSatVapDer_T)
    "Specific enthalpy of saturated vapour at the condenser as reference point";
  Modelica.Units.SI.SpecificEnthalpy hRefCon(
    displayUnit = "kJ/kg") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = pCon,
      xd = pro.p,
      yd = pro.hRef,
      d = hRefDer_p)
    "Specific enthalpy of reference line on condenser side";
  Modelica.Units.SI.SpecificEnthalpy hSatVapEva(
    displayUnit = "kJ/kg") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = TEva,
      xd = pro.T,
      yd = pro.hSatVap,
      d = hSatVapDer_T)
    "Specific enthalpy of saturated vapour in evaporator";
  Modelica.Units.SI.SpecificEnthalpy hRefEva(
    displayUnit = "kJ/kg") =
    Buildings.Airflow.Multizone.BaseClasses.interpolate(
      u = pEva,
      xd = pro.p,
      yd = pro.hRef,
      d = hRefDer_p)
    "Specific enthalpy of reference line on evaporator side";

  // Computed properties not interpolated
  Modelica.Units.SI.SpecificEntropy sExpInl
    "Specific entropy at expander inlet";
  Modelica.Units.SI.SpecificEnthalpy hExpInl(displayUnit = "kJ/kg")
    "Specific enthalpy at expander inlet";
  Modelica.Units.SI.SpecificEnthalpy hExpOut_i(
      displayUnit = "kJ/kg",
      start = (max(pro.hSatVap)+min(pro.hSatVap))/2)
    "Estimated specific enthalpy at expander outlet assuming isentropic";
  Modelica.Units.SI.SpecificEnthalpy hExpOut(
    displayUnit = "kJ/kg") = hExpInl - (hExpInl - hExpOut_i) * etaExp
    "Specific enthalpy at expander outlet";
  Modelica.Units.SI.ThermodynamicTemperature TExpOut
    "Temperature at expander outlet";

  // Enthalpy differentials,
  //   taking positive sign when flowing into the cycle
  Modelica.Units.SI.SpecificEnthalpy dhEva = hExpInl - hPum
    "Enthalpy differential at the evaporator (positive)";
  Modelica.Units.SI.SpecificEnthalpy dhExp =
    (hExpOut_i - hExpInl) * etaExp
    "Enthalpy differential at the expander (negative)";
  Modelica.Units.SI.SpecificEnthalpy dhCon = -dhEva - dhExp
    "Enthalpy differential at the condenser (negative)";

  Modelica.Units.SI.Efficiency etaThe(min=0) = -dhExp/dhEva
    "Thermal efficiency";
  Modelica.Units.SI.Efficiency etaExpLim =
    (hExpInl - hSatVapCon)/(hExpInl - hExpOut_i)
    "Upper limit of expander efficiency to prevent condensation, dry fluids have >1";

  // Derivatives
protected
  final parameter Real pDer_T[pro.n]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
      x = pro.T,
      y = pro.p,
      ensureMonotonicity = true)
  "Derivative of saturation pressure vs. saturation temperature for cubic spline";
  final parameter Real sSatLiqDer_T[pro.n]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
      x = pro.T,
      y = pro.sSatLiq,
      ensureMonotonicity = true)
  "Derivative of saturated liquid entropy vs. temperature for cubic spline";
  final parameter Real sSatVapDer_T[pro.n]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
      x = pro.T,
      y = pro.sSatVap,
      ensureMonotonicity = false)
  "Derivative of saturated vapour entropy vs. temperature for cubic spline";
  final parameter Real sRefDer_p[pro.n]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
      x = pro.p,
      y = pro.sRef,
      ensureMonotonicity = false)
  "Derivative of reference entropy vs. pressure for cubic spline";
  final parameter Real hSatLiqDer_T[pro.n]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
      x = pro.T,
      y = pro.hSatLiq,
      ensureMonotonicity = true)
  "Derivative of saturated liquid enthalpy vs. temperature for cubic spline";
  final parameter Real hSatVapDer_T[pro.n]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
      x = pro.T,
      y = pro.hSatVap,
      ensureMonotonicity = false)
  "Derivative of saturated vapour enthalpy vs. temperature for cubic spline";
  final parameter Real hRefDer_p[pro.n]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
      x = pro.p,
      y = pro.hRef,
      ensureMonotonicity = false)
  "Derivative of reference enthaly vs. pressure for cubic spline";

initial equation
  assert(etaExp < etaExpLim,
"Expander outlet state is under the dome! Based on the input parameters,
the expander effciency can be assumed at maximum to be " + String(etaExpLim) + ".
Or use a higher superheating differential temperature.");

equation
  // Estimate the overheated expander inlet state
  if dTSup > 0.1 then
    (sExpInl - sSatVapEva) / dTSup = (sRefEva - sSatVapEva) / pro.dTRef;
    (hExpInl - hSatVapEva) / dTSup = (hRefEva - hSatVapEva) / pro.dTRef;
  else
    sExpInl = sSatVapEva;
    hExpInl = hSatVapEva;
  end if;

  // Estimate the isentropic expander outlet state
  if sExpInl > sSatVapCon then
    (hExpOut_i - hSatVapCon) / (sExpInl - sSatVapCon)
      =  (hRefCon - hSatVapCon) / (sRefCon - sSatVapCon);
  else
    (hExpOut_i - hPum) / (sExpInl - sPum)
      = (hSatVapCon - hPum) / (sSatVapCon - sPum);
  end if;

  // Estimate temperature at expander outlet
  (TExpOut - TCon) / pro.dTRef
    = (hExpOut - hSatVapCon) / (hRefCon - hSatVapCon);

  annotation (defaultComponentName="intSta",
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                               Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          points={{-60,-60},{-28,-20},{16,32},{40,60},{52,60},{54,30},{48,2},{52,
              -38},{58,-58}},
          color={255,255,255},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{6,20},{52,20},{66,-6},{50,-18},{-26,-18}},
          color={255,255,255},
          thickness=0.5,
          pattern=LinePattern.Dash),
        Line(points={{-66,61},{-66,-78}}, color={255,255,255}),
        Polygon(
          points={{-66,73},{-74,51},{-58,51},{-66,73}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{63,-67},{41,-59},{41,-75},{63,-67}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-67},{57,-67}}, color={255,255,255}),
        Text(
          extent={{-100,100},{-64,58}},
          textColor={255,255,255},
          textString="T"),
        Text(
          extent={{64,-58},{100,-100}},
          textColor={255,255,255},
          textString="s"),
        Text(
          extent={{-151,-100},{149,-140}},
          textColor={0,0,255},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p>
This model performs the property interpolations of a given working fluid.
See the documentation of
<a href=\"Modelica://Buildings.Fluid.CHPs.OrganicRankine.Cycle\">
Buildings.Fluid.CHPs.OrganicRankine.Cycle</a>
for more details.
</html>", revisions="<html>
<ul>
<li>
June 13, 2023, by Hongxiang Fu:<br/>
First implementation. This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/3433\">#3433</a>.
</li>
</ul>
</html>"));
end InterpolateStates;
