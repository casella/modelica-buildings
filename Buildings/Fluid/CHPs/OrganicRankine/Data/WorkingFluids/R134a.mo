within Buildings.Fluid.CHPs.OrganicRankine.Data.WorkingFluids;
record R134a "Data record for R134a"
  extends Generic(
    T = {263.15      ,274.37888889,285.60777778,296.83666667,308.06555556,
 319.29444444,330.52333333,341.75222222,352.98111111,364.21      },
    p = { 200603.3074727 , 306065.14405573, 449719.91507415, 639730.09451473,
  884904.58881735,1194757.01196791,1579685.73880854,2051381.78734306,
 2623740.84777845,3315235.24207904},
    rhoLiq = {1327.12616344,1290.70617726,1252.38421574,1211.66078864,1167.8466073 ,
 1119.9469017 ,1066.43367865,1004.71418935, 929.52922316, 825.7675279 },
    dTRef = 30,
    sSatLiq = { 950.6476909 ,1006.00070497,1060.27083954,1113.71209354,1166.61133872,
 1219.31970995,1272.31230021,1326.32489681,1382.75864476,1445.49325885},
    sSatVap = {1733.35079726,1726.41287556,1721.04156562,1716.69246039,1712.81640804,
 1708.79575006,1703.83561688,1696.73105652,1685.22132982,1663.25418697},
    sRef = {1825.65178277,1819.26336679,1814.85739922,1811.97039136,1810.19440634,
 1809.1576283 ,1808.50662669,1807.88896593,1806.93261727,1805.20047809},
    hSatLiq = {186696.59112921,201653.01559932,216960.44593755,232677.40284867,
 248882.67909085,265687.28929108,283257.90743293,301870.71885207,
 322069.17690473,345362.1773219 },
    hSatVap = {392664.91356786,399318.90650809,405681.70463457,411664.0850098 ,
 417149.64721685,421974.26958749,425886.43246862,428457.8470584 ,
 428832.79154489,424672.88495278},
    hRef = {418317.03512831,426163.58740221,433855.47347418,441342.3717017 ,
 448569.58675948,455475.41246616,461988.0435114 ,468022.07159694,
 473474.18934682,478212.63998069});
  annotation (
  defaultComponentPrefixes = "parameter",
  defaultComponentName = "pro",
  Documentation(info="<html>
<p>
Record containing properties of R134a.
Its name in CoolProp is \"R134a\".
A figure in the documentation of
<a href=\"Modelica://Buildings.Fluid.CHPs.OrganicRankine.Cycle\">
Buildings.Fluid.CHPs.OrganicRankine.Cycle</a>
shows which lines these arrays represent.
</p>
</html>"));
end R134a;