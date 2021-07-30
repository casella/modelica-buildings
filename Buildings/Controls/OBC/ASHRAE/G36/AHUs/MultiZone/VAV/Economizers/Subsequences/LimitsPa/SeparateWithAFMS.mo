within Buildings.Controls.OBC.ASHRAE.G36.AHUs.MultiZone.VAV.Economizers.Subsequences.LimitsPa;
block SeparateWithAFMS
  "Outdoor air and return air damper position limits for units with separated minimum outdoor air damper and airflow measurement"

  parameter Real minSpe(
     final unit="1",
     final min=0,
     final max=1)
     "Minimum supply fan speed";
  parameter Buildings.Controls.OBC.CDL.Types.SimpleController minOAConTyp=
    Buildings.Controls.OBC.CDL.Types.SimpleController.PI
    "Type of minimum outdoor air controller"
    annotation (Dialog(group="Minimum OA control"));
  parameter Real kMinOA(
    final unit="1")=1 "Gain of controller"
    annotation (Dialog(group="Minimum OA control"));
  parameter Real TiMinOA(
    final unit="s",
    final quantity="Time")=0.5 "Time constant of integrator block"
    annotation (Dialog(group="Minimum OA control",
      enable=minOAConTyp == Buildings.Controls.OBC.CDL.Types.SimpleController.PI or
             minOAConTyp == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));
  parameter Real TdMinOA(
    final unit="s",
    final quantity="Time")=0.1 "Time constant of derivative block"
    annotation (Dialog(group="Minimum OA control",
      enable=minOAConTyp == Buildings.Controls.OBC.CDL.Types.SimpleController.PD or
             minOAConTyp == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

  parameter Real retDamPhyPosMax(
    final min=0,
    final max=1,
    final unit="1") = 1 "Physically fixed maximum position of the return air damper"
    annotation (Dialog(tab="Commissioning", group="Physical damper position limits"));
  parameter Real retDamPhyPosMin(
    final min=0,
    final max=1,
    final unit="1") = 0
    "Physically fixed minimum position of the return air damper"
    annotation (Dialog(tab="Commissioning", group="Physical damper position limits"));
  parameter Real outDamPhyPosMax(
    final min=0,
    final max=1,
    final unit="1") = 1
    "Physically fixed maximum position of the outdoor air damper"
    annotation (Dialog(tab="Commissioning", group="Physical damper position limits"));
  parameter Real outDamPhyPosMin(
    final min=0,
    final max=1,
    final unit="1") = 0
    "Physically fixed minimum position of the outdoor air damper"
    annotation (Dialog(tab="Commissioning", group="Physical damper position limits"));
  parameter Real minOutDamPhyPosMax(
    final min=0,
    final max=1,
    final unit="1") = 1
    "Physically fixed maximum position of the minimum outdoor air damper"
    annotation (Dialog(tab="Commissioning", group="Physical damper position limits"));
  parameter Real minOutDamPhyPosMin(
    final min=0,
    final max=1,
    final unit="1") = 0
    "Physically fixed minimum position of the minimum outdoor air damper"
    annotation (Dialog(tab="Commissioning", group="Physical damper position limits"));

  Buildings.Controls.OBC.CDL.Interfaces.RealInput VOutMinSet_flow_normalized(
    final unit="1")
    "Effective minimum outdoor airflow setpoint, normalized by design minimum outdoor airflow rate"
    annotation (Placement(transformation(extent={{-260,220},{-220,260}}),
        iconTransformation(extent={{-140,70},{-100,110}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput VOut_flow_normalized(
    final unit="1")
    "Measured outdoor volumetric airflow rate, normalized by design minimum outdoor airflow rate"
    annotation (Placement(transformation(extent={{-260,180},{-220,220}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput uSupFan
    "Supply fan status signal"
    annotation (Placement(transformation(extent={{-260,140},{-220,180}}),
        iconTransformation(extent={{-140,10},{-100,50}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerInput uFreProSta
    "Freeze protection status signal"
    annotation (Placement(transformation(extent={{-260,100},{-220,140}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerInput uOpeMod
    "AHU operation mode status signal"
    annotation (Placement(transformation(extent={{-260,60},{-220,100}}),
        iconTransformation(extent={{-140,-50},{-100,-10}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput uOutDamPos(
    final min=0,
    final max=1,
    final unit="1") "Economizer outdoor air damper position"
    annotation (Placement(transformation(extent={{-260,0},{-220,40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput uSupFanSpe(
    final min=0,
    final max=1,
    final unit="1") "Supply fan speed"
    annotation (Placement(transformation(extent={{-260,-60},{-220,-20}}),
        iconTransformation(extent={{-140,-110},{-100,-70}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yMinOutDamPos(
    final min=0,
    final max=1,
    final unit="1") "Minimum outdoor air damper position"
    annotation (Placement(transformation(extent={{220,220},{260,260}}),
        iconTransformation(extent={{100,70},{140,110}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yOutDamPosMin(
    final min=outDamPhyPosMin,
    final max=outDamPhyPosMax,
    final unit="1")
    "Minimum outdoor air damper position limit"
    annotation (Placement(transformation(extent={{220,-140},{260,-100}}),
        iconTransformation(extent={{100,30},{140,70}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yOutDamPosMax(
    final min=outDamPhyPosMin,
    final max=outDamPhyPosMax,
    final unit="1")
    "Maximum outdoor air damper position limit"
    annotation (Placement(transformation(extent={{220,-180},{260,-140}}),
        iconTransformation(extent={{100,10},{140,50}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yRetDamPosMin(
    final min=retDamPhyPosMin,
    final max=retDamPhyPosMax,
    final unit="1")
    "Minimum return air damper position limit"
    annotation (Placement(transformation(extent={{220,-220},{260,-180}}),
        iconTransformation(extent={{100,-50},{140,-10}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yRetDamPosMax(
    final min=retDamPhyPosMin,
    final max=retDamPhyPosMax,
    final unit="1")
    "Maximum return air damper position limit"
    annotation (Placement(transformation(extent={{220,-270},{260,-230}}),
        iconTransformation(extent={{100,-70},{140,-30}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yRetDamPhyPosMax(
    final min=0,
    final max=1,
    final unit="1")
    "Physical maximum return air damper position limit. Required as an input for the economizer enable disable sequence"
    annotation (Placement(transformation(extent={{220,-310},{260,-270}}),
        iconTransformation(extent={{100,-110},{140,-70}})));

protected
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant conInt(
    final k=Buildings.Controls.OBC.ASHRAE.G36.Types.FreezeProtectionStages.stage1)
    "Freeze protection stage 1"
    annotation (Placement(transformation(extent={{-200,90},{-180,110}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant conInt1(
    final k=Buildings.Controls.OBC.ASHRAE.G36.Types.OperationModes.occupied)
    "Occupied mode index"
    annotation (Placement(transformation(extent={{-200,50},{-180,70}})));
  Buildings.Controls.OBC.CDL.Integers.Equal intEqu
    "Check if operation mode is occupied"
    annotation (Placement(transformation(extent={{-160,70},{-140,90}})));
  Buildings.Controls.OBC.CDL.Integers.LessEqual intLesEqu
    "Check if freeze protection stage is stage 0"
    annotation (Placement(transformation(extent={{-160,110},{-140,130}})));
  Buildings.Controls.OBC.CDL.Logical.And and2 "Logical and"
    annotation (Placement(transformation(extent={{-120,150},{-100,170}})));
  Buildings.Controls.OBC.CDL.Logical.And enaMinCon
    "Check if the minimum outdoor air control loop should be enabled"
    annotation (Placement(transformation(extent={{-80,150},{-60,170}})));
  Buildings.Controls.OBC.CDL.Continuous.PIDWithReset minOACon(
    final controllerType=minOAConTyp,
    final k=kMinOA,
    Ti=TiMinOA,
    Td=TdMinOA,
    final yMax=minOutDamPhyPosMax,
    final yMin=minOutDamPhyPosMin)
    "Minimum outdoor air flow control"
    annotation (Placement(transformation(extent={{-38,230},{-18,250}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant zer(
    final k=0) "Constant"
    annotation (Placement(transformation(extent={{120,260},{140,280}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con(
    final k=0.5) "Constant"
    annotation (Placement(transformation(extent={{80,200},{100,220}})));
  Buildings.Controls.OBC.CDL.Continuous.Line minOutDamPos(
    final limitBelow=true,
    final limitAbove=true)
    "Minimum outdoor air damper position"
    annotation (Placement(transformation(extent={{160,230},{180,250}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant minOutDamPhyPosMinSig(
    final k=minOutDamPhyPosMin)
    "Physically fixed minimum position of the minimum outdoor air damper. This is the initial position of the economizer damper"
    annotation (Placement(transformation(extent={{80,260},{100,280}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant minOutDamPhyPosMaxSig(
    final k=minOutDamPhyPosMax)
    "Physically fixed maximum position of the minimum outdoor air damper"
    annotation (Placement(transformation(extent={{120,200},{140,220}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant one(
    final k=1) "Constant one"
    annotation (Placement(transformation(extent={{-200,-80},{-180,-60}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con1(
    final k=0.05) "Constant"
    annotation (Placement(transformation(extent={{-160,-80},{-140,-60}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con2(
    final k=0.8) "Constant"
    annotation (Placement(transformation(extent={{-200,-20},{-180,0}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant minFanSpe(
    final k=minSpe) "Minimum fan speed"
    annotation (Placement(transformation(extent={{-160,-20},{-140,0}})));
  Buildings.Controls.OBC.CDL.Continuous.Line moaP(
    final limitBelow=true,
    final limitAbove=true)
    "Linear mapping of the supply fan speed to the control signal"
    annotation (Placement(transformation(extent={{-120,-50},{-100,-30}})));
  Buildings.Controls.OBC.CDL.Continuous.Less les(
    final h=0.05)
    "Check if economizer outdoor air damper is less than projected position"
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Buildings.Controls.OBC.CDL.Continuous.GreaterThreshold greThr(
    final t=0.98,
    final h=0.01)
    "Check if the minimum outdoor air damper position is fully open"
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  Buildings.Controls.OBC.CDL.Continuous.Gain gai(
    final k=1.1)
    "Projected position with a gain factor"
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Buildings.Controls.OBC.CDL.Continuous.Greater gre(
    final h=0.05)
    "Check if the economizer outdoor air damper is greater than threshold"
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Buildings.Controls.OBC.CDL.Logical.And enaRetDamMin
    "Enable return air damper minimum outdoor air control"
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Buildings.Controls.OBC.CDL.Logical.Latch enaDis
    "Enable or disable return air damper minimum outdoor air control"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Buildings.Controls.OBC.CDL.Logical.Not cloMinDam
    "Check if the minimum outdoor air damper is closed"
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Buildings.Controls.OBC.CDL.Logical.Or disRetDamMin
    "Disable return air damper minimum outdoor air control"
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant outDamPhyPosMinSig(
    final k=outDamPhyPosMin)
    "Physically fixed minimum position of the outdoor air damper. This is the initial position of the economizer damper"
    annotation (Placement(transformation(extent={{-200,-130},{-180,-110}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant outDamPhyPosMaxSig(
    final k=outDamPhyPosMax)
    "Physically fixed maximum position of the outdoor air damper."
    annotation (Placement(transformation(extent={{-200,-170},{-180,-150}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant retDamPhyPosMinSig(
    final k=retDamPhyPosMin)
    "Physically fixed minimum position of the return air damper"
    annotation (Placement(transformation(extent={{-200,-210},{-180,-190}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant retDamPhyPosMaxSig(
    final k=retDamPhyPosMax)
    "Physically fixed maximum position of the return air damper. This is the initial condition of the return air damper"
    annotation (Placement(transformation(extent={{-200,-250},{-180,-230}})));
  Buildings.Controls.OBC.CDL.Logical.Switch retDamPosMinSwi
    "A switch to deactivate the return air damper minimal outdoor airflow control"
    annotation (Placement(transformation(extent={{180,-210},{200,-190}})));
  Buildings.Controls.OBC.CDL.Logical.Switch retDamPosMaxSwi
    "A switch to deactivate the return air damper minimal outdoor airflow control"
    annotation (Placement(transformation(extent={{180,-260},{200,-240}})));
  Buildings.Controls.OBC.CDL.Continuous.Line maxRetDamPos(
    final limitBelow=true,
    final limitAbove=true)
    "Maximum return air damper position"
    annotation (Placement(transformation(extent={{100,-110},{120,-90}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con3(
    final k=0.5) "Constant"
    annotation (Placement(transformation(extent={{60,-90},{80,-70}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con4(
    final k=1) "Constant"
    annotation (Placement(transformation(extent={{0,-90},{20,-70}})));

equation
  connect(uSupFan, and2.u1)
    annotation (Line(points={{-240,160},{-122,160}}, color={255,0,255}));
  connect(uFreProSta, intLesEqu.u1)
    annotation (Line(points={{-240,120},{-162,120}}, color={255,127,0}));
  connect(conInt.y, intLesEqu.u2) annotation (Line(points={{-178,100},{-170,100},
          {-170,112},{-162,112}}, color={255,127,0}));
  connect(uOpeMod, intEqu.u1)
    annotation (Line(points={{-240,80},{-162,80}}, color={255,127,0}));
  connect(conInt1.y, intEqu.u2) annotation (Line(points={{-178,60},{-170,60},{-170,
          72},{-162,72}}, color={255,127,0}));
  connect(intLesEqu.y, and2.u2) annotation (Line(points={{-138,120},{-130,120},{
          -130,152},{-122,152}}, color={255,0,255}));
  connect(and2.y, enaMinCon.u1)
    annotation (Line(points={{-98,160},{-82,160}}, color={255,0,255}));
  connect(intEqu.y, enaMinCon.u2) annotation (Line(points={{-138,80},{-90,80},{-90,
          152},{-82,152}}, color={255,0,255}));
  connect(VOutMinSet_flow_normalized, minOACon.u_s)
    annotation (Line(points={{-240,240},{-40,240}}, color={0,0,127}));
  connect(VOut_flow_normalized, minOACon.u_m) annotation (Line(points={{-240,200},
          {-28,200},{-28,228}}, color={0,0,127}));
  connect(enaMinCon.y, minOACon.trigger) annotation (Line(points={{-58,160},{-34,
          160},{-34,228}}, color={255,0,255}));
  connect(zer.y, minOutDamPos.x1) annotation (Line(points={{142,270},{150,270},{
          150,248},{158,248}}, color={0,0,127}));
  connect(minOACon.y, minOutDamPos.u)
    annotation (Line(points={{-16,240},{158,240}},color={0,0,127}));
  connect(minOutDamPhyPosMinSig.y, minOutDamPos.f1) annotation (Line(points={{102,270},
          {110,270},{110,244},{158,244}},   color={0,0,127}));
  connect(con.y, minOutDamPos.x2) annotation (Line(points={{102,210},{110,210},{
          110,236},{158,236}}, color={0,0,127}));
  connect(minOutDamPhyPosMaxSig.y, minOutDamPos.f2) annotation (Line(points={{142,210},
          {150,210},{150,232},{158,232}},   color={0,0,127}));
  connect(minFanSpe.y, moaP.x1) annotation (Line(points={{-138,-10},{-130,-10},{
          -130,-32},{-122,-32}}, color={0,0,127}));
  connect(con2.y, moaP.f1) annotation (Line(points={{-178,-10},{-170,-10},{-170,
          -36},{-122,-36}}, color={0,0,127}));
  connect(uSupFanSpe, moaP.u)
    annotation (Line(points={{-240,-40},{-122,-40}}, color={0,0,127}));
  connect(con1.y, moaP.f2) annotation (Line(points={{-138,-70},{-130,-70},{-130,
          -48},{-122,-48}}, color={0,0,127}));
  connect(one.y, moaP.x2) annotation (Line(points={{-178,-70},{-170,-70},{-170,-44},
          {-122,-44}}, color={0,0,127}));
  connect(uOutDamPos, les.u1)
    annotation (Line(points={{-240,20},{-42,20}}, color={0,0,127}));
  connect(moaP.y, les.u2) annotation (Line(points={{-98,-40},{-90,-40},{-90,12},
          {-42,12}}, color={0,0,127}));
  connect(moaP.y, gai.u) annotation (Line(points={{-98,-40},{-90,-40},{-90,-70},
          {-42,-70}}, color={0,0,127}));
  connect(uOutDamPos, gre.u1) annotation (Line(points={{-240,20},{-80,20},{-80,-40},
          {-2,-40}}, color={0,0,127}));
  connect(gai.y, gre.u2) annotation (Line(points={{-18,-70},{-10,-70},{-10,-48},
          {-2,-48}}, color={0,0,127}));
  connect(minOutDamPos.y, greThr.u) annotation (Line(points={{182,240},{200,240},
          {200,120},{-60,120},{-60,80},{-42,80}}, color={0,0,127}));
  connect(les.y, enaRetDamMin.u2) annotation (Line(points={{-18,20},{40,20},{40,
          32},{58,32}}, color={255,0,255}));
  connect(greThr.y, enaRetDamMin.u1) annotation (Line(points={{-18,80},{-10,80},
          {-10,40},{58,40}}, color={255,0,255}));
  connect(greThr.y, cloMinDam.u) annotation (Line(points={{-18,80},{-10,80},{-10,
          -10},{-2,-10}}, color={255,0,255}));
  connect(cloMinDam.y, disRetDamMin.u1)
    annotation (Line(points={{22,-10},{58,-10}}, color={255,0,255}));
  connect(gre.y, disRetDamMin.u2) annotation (Line(points={{22,-40},{40,-40},{40,
          -18},{58,-18}}, color={255,0,255}));
  connect(enaRetDamMin.y, enaDis.u)
    annotation (Line(points={{82,40},{98,40}}, color={255,0,255}));
  connect(disRetDamMin.y, enaDis.clr) annotation (Line(points={{82,-10},{90,-10},
          {90,34},{98,34}}, color={255,0,255}));
  connect(outDamPhyPosMinSig.y, yOutDamPosMin)
    annotation (Line(points={{-178,-120},{240,-120}}, color={0,0,127}));
  connect(outDamPhyPosMaxSig.y, yOutDamPosMax)
    annotation (Line(points={{-178,-160},{240,-160}}, color={0,0,127}));
  connect(retDamPhyPosMaxSig.y, yRetDamPhyPosMax) annotation (Line(points={{-178,
          -240},{90,-240},{90,-290},{240,-290}}, color={0,0,127}));
  connect(retDamPosMinSwi.y, yRetDamPosMin)
    annotation (Line(points={{202,-200},{240,-200}}, color={0,0,127}));
  connect(con3.y, maxRetDamPos.x1) annotation (Line(points={{82,-80},{90,-80},{90,
          -92},{98,-92}}, color={0,0,127}));
  connect(con4.y, maxRetDamPos.x2) annotation (Line(points={{22,-80},{30,-80},{30,
          -104},{98,-104}}, color={0,0,127}));
  connect(retDamPhyPosMinSig.y, maxRetDamPos.f2) annotation (Line(points={{-178,
          -200},{30,-200},{30,-108},{98,-108}}, color={0,0,127}));
  connect(enaDis.y, retDamPosMaxSwi.u2) annotation (Line(points={{122,40},{140,40},
          {140,-250},{178,-250}}, color={255,0,255}));
  connect(maxRetDamPos.y, retDamPosMaxSwi.u1) annotation (Line(points={{122,-100},
          {160,-100},{160,-242},{178,-242}}, color={0,0,127}));
  connect(retDamPhyPosMinSig.y, retDamPosMaxSwi.u3) annotation (Line(points={{-178,
          -200},{30,-200},{30,-258},{178,-258}}, color={0,0,127}));
  connect(retDamPosMaxSwi.y, yRetDamPosMax)
    annotation (Line(points={{202,-250},{240,-250}}, color={0,0,127}));
  connect(enaDis.y, retDamPosMinSwi.u2) annotation (Line(points={{122,40},{140,40},
          {140,-200},{178,-200}}, color={255,0,255}));
  connect(retDamPhyPosMinSig.y, retDamPosMinSwi.u1) annotation (Line(points={{-178,
          -200},{30,-200},{30,-192},{178,-192}}, color={0,0,127}));
  connect(retDamPhyPosMaxSig.y, maxRetDamPos.f1) annotation (Line(points={{-178,
          -240},{90,-240},{90,-96},{98,-96}}, color={0,0,127}));
  connect(retDamPhyPosMaxSig.y, retDamPosMinSwi.u3) annotation (Line(points={{-178,
          -240},{90,-240},{90,-208},{178,-208}}, color={0,0,127}));
  connect(minOACon.y, maxRetDamPos.u) annotation (Line(points={{-16,240},{50,240},
          {50,-100},{98,-100}}, color={0,0,127}));
  connect(minOutDamPos.y, yMinOutDamPos)
    annotation (Line(points={{182,240},{240,240}}, color={0,0,127}));

annotation (
  defaultComponentName="ecoLim",
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,140},{100,100}},
          lineColor={0,0,255},
          textString="%name")}),
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},{220,300}})),
  Documentation(info="<html>
<p>
Block that outputs the position limits of the return and outdoor air damper for units
with a separated minimum outdoor air damper and airflow measurement.
It is implemented according to Section 5.16.5 of the ASHRAE Guideline 36, May 2020.
</p>
<h4>Minimum outdoor air set point</h4>
<p>
Calculate the outdoor air set point with
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.AHU\">
Buildings.Controls.OBC.ASHRAE.G36.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.AHU</a>.
</p>
<h4>Minimum outdoor air control loop</h4>
<p>
Minimum outdoor air control loop is enabled when the supply fan is proven ON
(<code>uSupFan=true</code>)and in occupied mode, and disabled and output set to
zero otherwise
</p>
<p>
The minimum outdoor airflow rate shall be maintained at the minimum outdoor air
set point by a reverse-acting control loop whose output is 0% to 100%.
From 0% to 50% loop output, the minimum outdoor air damper is opened from 0%
(<code>minOutDamPhyPosMin</code>) to 100% (<code>minOutDamPhyPosMax</code>).
</p>
<h4>Return air damper</h4>
<ul>
<li>
Return air damper minimum outdoor air control is enabled when the minimum outdoor
air damper is fully open and the economizer outdoor air damper is less than a projected
position limit, which is 5% when supply fan speed is at 100% design speed proportionally
up to 80% when the fan is at minimum speed.
</li>
<li>
Return air damper minimum outdoor air control is disabled when the minimum outdoor
air damper is not fully open or the economizer outdoor air damper is 10% above the projected
position limit as determined above.
</li>
<li>
When enabled, the maximum return air damper set point is reduced from 100%
(<code>retDamPhyPosMax</code>) to 0% (<code>retDamPhyPosMin</code>)
as the minimum outdoor air loop output rises from 50% to 100%.
</li>
</ul>
</html>",
revisions="<html>
<ul>
<li>
August 1, 2020, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>
</html>"));
end SeparateWithAFMS;