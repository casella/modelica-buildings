within Buildings.Templates.AHUs.Economizers;
model CommonDamperTandem
  extends Interfaces.Economizer(
    final typ=Types.Economizer.CommonDamperTandem);

  Fluid.Actuators.Dampers.MixingBox mix(
    redeclare final package Medium = Medium,
    final mOut_flow_nominal=dat.mOut_flow_nominal,
    final mRec_flow_nominal=dat.mRec_flow_nominal,
    final mExh_flow_nominal=dat.mExh_flow_nominal,
    final dpDamExh_nominal=dat.dpDamExh_nominal,
    final dpDamOut_nominal=dat.dpDamOut_nominal,
    final dpDamRec_nominal=dat.dpDamRec_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation
  connect(port_Out, mix.port_Out) annotation (Line(points={{-100,-60},{-20,-60},
          {-20,6},{-10,6}}, color={0,127,255}));
  connect(mix.port_Sup, port_Sup) annotation (Line(points={{10,6},{20,6},{20,-60},
          {100,-60}}, color={0,127,255}));
  connect(mix.port_Ret, port_Ret) annotation (Line(points={{10,-6},{40,-6},{40,60},
          {100,60}},     color={0,127,255}));
  connect(port_Exh, mix.port_Exh) annotation (Line(points={{-100,60},{-40,60},{-40,
          -6},{-10,-6}}, color={0,127,255}));
  connect(ahuBus.ahuO.yEcoOut, mix.y) annotation (Line(
      points={{0.1,100.1},{0.1,56},{0,56},{0,12}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (
  defaultComponentName="eco",
  Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CommonDamperTandem;
