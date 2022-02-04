within Buildings.Templates.ChilledWaterPlant.Validation;
model RP1711_6_4
  "Series Chillers, Constant Primary CHW, Constant CW, Headered Pumps"
  extends
    Buildings.Templates.ChilledWaterPlant.Validation.BaseChilledWaterPlant(
    redeclare Buildings.Templates.ChilledWaterPlant.Validation.UserProject.RP1711_6_4 chw);
  annotation (experiment(Tolerance=1e-6, StopTime=1));
end RP1711_6_4;