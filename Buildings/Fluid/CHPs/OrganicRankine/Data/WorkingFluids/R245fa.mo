within Buildings.Fluid.CHPs.OrganicRankine.Data.WorkingFluids;
record R245fa "Data record for R245fa"
  extends Generic(
    T = {263.15      ,280.24555556,297.34111111,314.43666667,331.53222222,
 348.62777778,365.72333333,382.81888889,399.91444444,417.01      },
    p = {  33074.45526958,  72887.36670179, 144193.124204  , 261432.95536402,
  441494.10134334, 703414.19847415,1068359.342463  ,1560145.84843175,
 2206880.48519247,3045794.17123294},
    rhoLiq = {1428.97046492,1385.76660556,1340.65562986,1293.01283556,1241.96829885,
 1186.23988838,1123.76759281,1050.81390283, 959.21659367, 822.82846056},
    dTRef = 30,
    sSatLiq = { 956.19311248,1035.36441752,1111.94463085,1186.43583886,1259.29359638,
 1330.98629933,1402.08297905,1473.43381771,1546.69236916,1626.93823523},
    sSatVap = {1753.33948075,1752.70155768,1756.61081491,1763.70576296,1772.82890499,
 1782.87632953,1792.61095702,1800.32057386,1802.87890515,1791.34887167},
    sRef = {1843.30191447,1841.68294262,1845.06888325,1852.1255712 ,1861.77847556,
 1873.11987887,1885.33651185,1897.65340915,1909.29631025,1919.46837684},
    hSatLiq = {188217.13552309,209752.05042818,231916.97324153,254789.50812722,
 278461.65875916,303057.59406145,328767.54169158,355926.03745774,
 385245.53075419,418981.07526756},
    hSatVap = {397986.20233238,410782.59579442,423602.73270663,436304.3388265 ,
 448715.16081112,460599.01108982,471592.73555578,481064.46223928,
 487698.2269716 ,487541.9547717 },
    hRef = {422999.19392937,437043.34863761,451220.08643301,465419.51090374,
 479522.71650364,493393.2925759 ,506866.89822981,519740.66701196,
 531767.47525367,542662.05043694});
  annotation (
  defaultComponentPrefixes = "parameter",
  defaultComponentName = "pro",
  Documentation(info="<html>
<p>
Record containing properties of R245fa.
Its name in CoolProp is \"R245fa\".
A figure in the documentation of
<a href=\"Modelica://Buildings.Fluid.CHPs.OrganicRankine.Cycle\">
Buildings.Fluid.CHPs.OrganicRankine.Cycle</a>
shows which lines these arrays represent.
</p>
</html>"));
end R245fa;