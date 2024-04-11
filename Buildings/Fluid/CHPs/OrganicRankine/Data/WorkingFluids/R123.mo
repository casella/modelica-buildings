within Buildings.Fluid.CHPs.OrganicRankine.Data.WorkingFluids;
record R123 "Data record for R123"
  extends Generic(
    T = {263.15 ,283.559,303.968,324.377,344.786,365.195,385.604,406.013,426.422,
 446.831},
    p = {  20246.95066193,  51440.14631405, 112811.73985857, 220592.87790875,
  394048.86724557, 654989.10306142,1027610.7668949 ,1539001.4589505 ,
 2221087.04699128,3117580.03638346},
    rhoLiq = {1550.14574712,1500.60589786,1448.89814966,1394.43597073,1336.35779191,
 1273.30471047,1202.9813059 ,1121.10814756,1018.10852222, 859.35313126},
    dTRef = 30,
    sSatLiq = { 963.29121172,1037.2353566 ,1107.65287274,1175.07719878,1240.00676935,
 1302.97149577,1364.61683022,1425.87463191,1488.48804548,1558.19777898},
    sSatVap = {1667.45379084,1662.60160517,1663.37365215,1667.94733391,1674.89592509,
 1683.00895072,1691.10127718,1697.69913848,1700.17891725,1689.91202332},
    sRef = {1737.81001688,1731.40403656,1730.99124944,1734.76553533,1741.35555982,
 1749.68249099,1758.84931422,1768.04520203,1776.45220874,1783.1163376 },
    hSatLiq = {190149.27136568,210376.22741801,231098.48911094,252352.62519338,
 274200.26709977,296749.55018263,320190.92359975,344878.26719107,
 371581.94622093,402995.86553719},
    hSatVap = {375449.65406105,387704.45549446,400019.8229857 ,412228.36101818,
 424143.95954861,435537.32854304,446084.63228277,455242.55057824,
 461851.59114217,461849.87305061},
    hRef = {395009.97504733,408236.58362893,421577.68410521,434894.0026416 ,
 448042.77920919,460871.33514811,473205.24870848,484829.99803927,
 495465.44351507,504727.63863062});
  annotation (
  defaultComponentPrefixes = "parameter",
  defaultComponentName = "pro",
  Documentation(info="<html>
<p>
Record containing properties of R123.
Its name in CoolProp is \"R123\".
A figure in the documentation of
<a href=\"Modelica://Buildings.Fluid.CHPs.OrganicRankine.Cycle\">
Buildings.Fluid.CHPs.OrganicRankine.Cycle</a>
shows which lines these arrays represent.
</p>
</html>"));
end R123;