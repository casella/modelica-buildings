within Buildings.Templates.Components.Fans;
model SingleConstant "Single fan - Constant speed"
  extends Buildings.Templates.Components.Fans.Interfaces.PartialFan(
    final typ=Buildings.Templates.Components.Types.Fan.SingleConstant);

  Buildings.Fluid.Movers.SpeedControlled_y fan(
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare final package Medium =Medium,
    final inputType=Buildings.Fluid.Types.InputType.Continuous,
    final per=per)
    "Fan"
    annotation (
      Placement(transformation(extent={{-10,-10},{10,10}})));

  Buildings.Controls.OBC.CDL.Conversions.BooleanToReal sigSta
    "Start/stop signal" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,50})));
  Buildings.Controls.OBC.CDL.Continuous.GreaterThreshold evaSta(
    t=1E-2,
    h=0.5E-2)
    "Evaluate fan status" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-50})));
equation
  connect(sigSta.y, fan.y)
    annotation (Line(points={{-2.22045e-15,38},{0,12}}, color={0,0,127}));
  connect(port_a, fan.port_a)
    annotation (Line(points={{-100,0},{-10,0}}, color={0,127,255}));
  connect(fan.port_b, port_b)
    annotation (Line(points={{10,0},{100,0}}, color={0,127,255}));
  connect(fan.y_actual, evaSta.u) annotation (Line(points={{11,7},{20,7},{20,-20},
          {2.22045e-15,-20},{2.22045e-15,-38}},
                                 color={0,0,127}));
  connect(bus.y, sigSta.u) annotation (Line(
      points={{0,100},{2.22045e-15,62}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(evaSta.y, bus.y_actual) annotation (Line(points={{0,-62},{0,-80},{40,
          -80},{40,100},{0,100}},           color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Placement(transformation(extent={{-10,-10},{10,10}})),
     Icon(
     coordinateSystem(preserveAspectRatio=false), graphics={
                Bitmap(
        extent={{-92,-90},{92,90}},
        fileName="modelica://Buildings/Resources/Images/Templates/Components/Fans/SingleVariable.svg")}),
                                                   Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SingleConstant;