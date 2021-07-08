within Buildings.Experimental.DHC.CentralPlants.Cooling.Examples;
model Plant
  "Example to test the chiller cooling plant"
  extends Modelica.Icons.Example;
  package Medium=Buildings.Media.Water
    "Medium model for water";
  // chiller and cooling tower
  parameter Buildings.Fluid.Chillers.Data.ElectricEIR.ElectricEIRChiller_York_YT_1055kW_5_96COP_Vanes perChi
    "Performance data of chiller";
  parameter Modelica.SIunits.MassFlowRate mCHW_flow_nominal=18.3
    "Nominal chilled water mass flow rate";
  parameter Modelica.SIunits.MassFlowRate mCW_flow_nominal=34.7
    "Nominal condenser water mass flow rate";
  parameter Modelica.SIunits.PressureDifference dpCHW_nominal=44.8*1000
    "Nominal chilled water side pressure";
  parameter Modelica.SIunits.PressureDifference dpCW_nominal=46.2*1000
    "Nominal condenser water side pressure";
  parameter Modelica.SIunits.Power QChi_nominal=mCHW_flow_nominal*4200*(6.67-18.56)
    "Nominal cooling capaciaty (Negative means cooling)";
  parameter Modelica.SIunits.MassFlowRate mMin_flow=0.03
    "Minimum mass flow rate of single chiller";
  // control settings
  parameter Modelica.SIunits.Pressure dpSetPoi=68900
    "Differential pressure setpoint";
  parameter Modelica.SIunits.Temperature TCHWSet=273.15+8
    "Chilled water temperature setpoint";
  parameter Modelica.SIunits.Time tWai=30
    "Waiting time";
  // pumps
  parameter Buildings.Fluid.Movers.Data.Generic perCHWPum(
    pressure=Buildings.Fluid.Movers.BaseClasses.Characteristics.flowParameters(
      V_flow=mCHW_flow_nominal/1000*{0.2,0.6,0.8,1.0},
      dp=(dpCHW_nominal+dpSetPoi+18000+30000)*{1.5,1.3,1.0,0.6}))
    "Performance data for chilled water pumps";
  parameter Buildings.Fluid.Movers.Data.Generic perCWPum(
    pressure=Buildings.Fluid.Movers.BaseClasses.Characteristics.flowParameters(
      V_flow=mCW_flow_nominal/1000*{0.2,0.6,1.0,1.2},
      dp=(dpCW_nominal+60000+6000)*{1.2,1.1,1.0,0.6}))
    "Performance data for condenser water pumps";
  parameter Modelica.SIunits.Pressure dpCHWPumVal_nominal=6000
    "Nominal pressure drop of chilled water pump valve";
  parameter Modelica.SIunits.Pressure dpCWPumVal_nominal=6000
    "Nominal pressure drop of chilled water pump valve";
  Buildings.Experimental.DHC.CentralPlants.Cooling.Plant pla(
    perChi=perChi,
    dTApp=3,
    perCHWPum=perCHWPum,
    perCWPum=perCWPum,
    mCHW_flow_nominal=mCHW_flow_nominal,
    dpCHW_nominal=dpCHW_nominal,
    QChi_nominal=QChi_nominal,
    mMin_flow=mMin_flow,
    mCW_flow_nominal=mCW_flow_nominal,
    dpCW_nominal=dpCW_nominal,
    TAirInWB_nominal=298.7,
    TCW_nominal=308.15,
    dT_nominal=5.56,
    TMin=288.15,
    PFan_nominal=5000,
    dpCHWPumVal_nominal=dpCHWPumVal_nominal,
    dpCWPumVal_nominal=dpCWPumVal_nominal,
    tWai=tWai,
    dpSetPoi=dpSetPoi,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "District cooling plant"
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    final computeWetBulbTemperature=true,
    filNam=Modelica.Utilities.Files.loadResource(
      "modelica://Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos"))
    "Weather data"
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Modelica.Blocks.Sources.BooleanConstant on
    "On signal of the plant"
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Constant TCHWSupSet(
    k=TCHWSet)
    "Chilled water supply temperature setpoint"
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Ramp dpMea(
    offset=0.5*dpSetPoi,
    height=0.4*dpSetPoi,
    startTime=21600,
    duration=21600)
    "Measured pressure difference"
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Fluid.MixingVolumes.MixingVolume vol(
    nPorts=2,
    redeclare package Medium=Medium,
    m_flow_nominal=pla.numChi*mCHW_flow_nominal,
    V=0.5,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Mixing volume"
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixHeaFlo(
    Q_flow=pla.numChi*mCHW_flow_nominal*4200*10,
    T_ref=293.15)
    "Fixed heat flow rate"
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium=Medium,
    m_flow_nominal=pla.numChi*mCHW_flow_nominal,
    dp_nominal=6000)
    "Flow resistance"
    annotation (Placement(transformation(extent={{60,-20},{40,0}})));
equation
  connect(dpMea.y,pla.dpMea)
    annotation (Line(points={{-39,-50},{-20,-50},{-20,13.2667},{-10.6667,
          13.2667}},                                                               color={0,0,127}));
  connect(TCHWSupSet.y,pla.TCHWSupSet)
    annotation (Line(points={{-39,-10},{-32,-10},{-32,15.2667},{-10.6667,
          15.2667}},                                                               color={0,0,127}));
  connect(fixHeaFlo.port,vol.heatPort)
    annotation (Line(points={{20,50},{26,50},{26,30},{40,30}},color={191,0,0}));
  connect(pla.port_bSerCoo,vol.ports[1])
    annotation (Line(points={{10,8.66667},{20,8.66667},{20,20},{48,20}},color={0,127,255}));
  connect(vol.ports[2],res.port_a)
    annotation (Line(points={{52,20},{70,20},{70,-10},{60,-10}},color={0,127,255}));
  connect(res.port_b,pla.port_aSerCoo)
    annotation (Line(points={{40,-10},{-14,-10},{-14,8.66667},{-10,8.66667}},color={0,127,255}));
  connect(on.y,pla.on)
    annotation (Line(points={{-39,30},{-32,30},{-32,17.4},{-10.7333,17.4}},color={255,0,255}));
  connect(weaDat.weaBus,pla.weaBus)
    annotation (Line(points={{-40,70},{-20,70},{-20,24},{0.0333333,24},{
          0.0333333,18.8667}},                                                              color={255,204,51}));
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false)),
    Diagram(
      coordinateSystem(
        preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      Tolerance=1e-06),
    Documentation(
      info="<html>
<p>This model validates the district central cooling plant implemented in 
<a href=\"modelica://Buildings.Experimental.DHC.CentralPlants.Cooling.Plant\">
Buildings.Experimental.DHC.CentralPlants.Cooling.Plant</a>.
</p>
</html>",
      revisions="<html>
<ul>
<li>
August 6, 2020 by Jing Wang:<br/>
First implementation. 
</li>
</ul>
</html>"),
    __Dymola_Commands(
      file="Resources/Scripts/Dymola/Experimental/DHC/CentralPlants/Cooling/Examples/Plant.mos" "Simulate and Plot"));
end Plant;
