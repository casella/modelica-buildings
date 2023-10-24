within Buildings.Fluid.CHPs.OrganicRankine.Data.WorkingFluids;
record R123 "Data record for R123"
  extends Generic(
    T = {263.15 ,283.559,303.968,324.377,344.786,365.195,385.604,406.013,426.422,
 446.831},
    p = {  20246.95066193,  51440.14631405, 112811.73985857, 220592.87790875,
  394048.86724557, 654989.10306142,1027610.7668949 ,1539001.4589505 ,
 2221087.04699128,3117580.03638346},
    dTSup = 50,
    sSatLiq = { 963.29121172,1037.2353566 ,1107.65287274,1175.07719878,1240.00676935,
 1302.97149577,1364.61683022,1425.87463191,1488.48804548,1558.19777898},
    sSatVap = {1667.45379084,1662.60160517,1663.37365215,1667.94733391,1674.89592509,
 1683.00895072,1691.10127718,1697.69913848,1700.17891725,1689.91202332},
    sSupVap = {1782.78435869,1775.32393592,1774.04169783,1777.13460839,1783.24363854,
 1791.31958737,1800.52362176,1810.14928535,1819.55395224,1828.04481949},
    hSatLiq = {190149.27136568,210376.22741801,231098.48911094,252352.62519338,
 274200.26709977,296749.55018263,320190.92359975,344878.26719107,
 371581.94622093,402995.86553719},
    hSatVap = {375449.65406105,387704.45549446,400019.8229857 ,412228.36101818,
 424143.95954861,435537.32854304,446084.63228277,455242.55057824,
 461851.59114217,461849.87305061},
    hSupVap = {408641.55037034,422444.87179123,436383.21286053,450329.7455879 ,
 464157.94377713,477739.36586387,490938.35735562,503604.43567005,
 515562.95839668,526591.3500848 });
  annotation (
  defaultComponentPrefixes = "parameter",
  defaultComponentName = "pro",
  Documentation(info="<html>
<p>
Record containing properties of R123.
Its name in CoolProp is \"R123\".
A figure in the documentation of
<a href=\"Modelica://Buildings.Fluid.CHPs.OrganicRankine.BottomingCycle\">
Buildings.Fluid.CHPs.OrganicRankine.BottomingCycle</a>
shows which lines these arrays represent.
</p>
</html>"));
end R123;