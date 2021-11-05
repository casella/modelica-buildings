within Buildings.Templates.ChilledWaterPlant.Components.PrimaryPumpGroup;
model Headered
  extends
    Buildings.Templates.ChilledWaterPlant.Components.PrimaryPumpGroup.Interfaces.PrimaryPumpGroup(
    final typ=Buildings.Templates.ChilledWaterPlant.Components.Types.PrimaryPumpGroup.Headered);

  Fluid.Delays.DelayFirstOrder     del(
    redeclare final package Medium = Medium,
    final m_flow_nominal = m_flow_nominal*nPum,
    nPorts=nPorVol) "Inlet node mixing volume"
    annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
  Fluid.FixedResistances.Junction splByp(
    redeclare package Medium = Medium,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Common leg or bypass splitter" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,0})));
  Fluid.Actuators.Valves.TwoWayLinear valByp(
    redeclare final package Medium = Medium)
      if has_byp "Bypass valve"
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-60})));
  Buildings.Templates.ChilledWaterPlant.Components.BaseClasses.ParallelPumps pum(
    redeclare final package Medium = Medium,
    final nPum=nPum,
    final m_flow_nominal=m_flow_nominal,
    final dp_nominal=dp_nominal,
    final dpValve_nominal=dpValve_nominal,
    final rhoStd=Medium.density_pTX(101325, 273.15+4, Medium.X_default))
    "Primary pumps"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Fluid.Actuators.Valves.TwoWayLinear valWSEByp(
    redeclare final package Medium = Medium) if has_WSEByp
    "Waterside Economizer bypass valve" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-60})));
  Buildings.Templates.Components.Sensors.VolumeFlowRate V_flow(
    redeclare final package Medium = Medium,
    have_sen=has_floSen)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));

protected
  parameter Integer nPorWSE = if has_WSEByp then 1 else 0;
  parameter Integer nPorChi = if has_ParChi then nChi else 1;
  parameter Integer nPorVol = nPorWSE + nPorChi + 1;
equation
  connect(splByp.port_2, port_b)
    annotation (Line(points={{90,0},{100,0}}, color={0,127,255}));
  connect(splByp.port_3, valByp.port_a) annotation (Line(points={{80,-10},{80,-40},
          {1.77636e-15,-40},{1.77636e-15,-50}}, color={0,127,255}));
  connect(valByp.port_b, port_byp)
    annotation (Line(points={{-1.83187e-15,-70},{0,-100}}, color={0,127,255}));
  connect(port_series,del. ports[1]) annotation (Line(points={{-100,60},{-60,60},
          {-60,20},{-40,20},{-40,40},{-40,40}}, color={0,127,255}));
  connect(del.ports[2], pum.port_a) annotation (Line(points={{-40,40},{-40,40},{
          -40,0},{-10,0}}, color={0,127,255}));
  connect(busCon.ySpePumPri, pum.y) annotation (Line(
      points={{0,100},{0,56},{0,56},{0,12}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(pum.y_actual, busCon.uStaPumPri) annotation (Line(points={{11,8},{20,8},
          {20,80},{0,80},{0,100}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(busCon.yValByp, valByp.y) annotation (Line(
      points={{0,100},{0,80},{20,80},{20,-60},{12,-60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(ports_parallel,del. ports[3:3]) annotation (Line(points={{-100,0},{-40,
          0},{-40,40},{-40,40}}, color={0,127,255}));
  connect(port_WSEByp, valWSEByp.port_a)
    annotation (Line(points={{-100,-60},{-80,-60}}, color={0,127,255}));
  connect(valWSEByp.port_b,del. ports[4]) annotation (Line(points={{-60,-60},{-40,
          -60},{-40,40},{-40,40}},
                          color={0,127,255}));
  connect(busCon.yValWSEByp, valWSEByp.y) annotation (Line(
      points={{0,100},{0,80},{-70,80},{-70,-48}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(pum.port_b, V_flow.port_a)
    annotation (Line(points={{10,0},{40,0}}, color={0,127,255}));
  connect(V_flow.port_b, splByp.port_1)
    annotation (Line(points={{60,0},{70,0}}, color={0,127,255}));
  connect(V_flow.y, busCon.V_flow) annotation (Line(points={{50,12},{50,80},{0,80},
          {0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                    Bitmap(
        extent={{-40,0},{40,80}},
        fileName="modelica://Buildings/Resources/Images/Templates/BaseClasses/Fans/SingleVariable.svg"),
                    Bitmap(
        extent={{-40,-80},{40,0}},
        fileName="modelica://Buildings/Resources/Images/Templates/BaseClasses/Fans/SingleVariable.svg"),
        Line(
          points={{40,60},{60,60},{60,-20},{40,-20}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{60,0},{100,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-8,40},{-60,40},{-60,-40},{-8,-40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,0},{-100,0}},
          color={28,108,200},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Headered;
