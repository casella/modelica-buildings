within Buildings.Templates.AirHandlersFans.Interfaces;
expandable connector Bus "Main control bus"
  extends Modelica.Icons.SignalBus;

  BusInput inp
    "Input points"
    annotation (HideResult=false);
  BusOutput out
    "Output points"
    annotation (HideResult=false);
  BusSoftware sof
    "Software points"
    annotation (HideResult=false);

   Templates.Components.Interfaces.Bus fanSup
     "Supply fan points"
     annotation (HideResult=false);

  Templates.Components.Interfaces.Bus fanRet
    "Return fan points"
    annotation (HideResult=false);

  annotation (
    defaultComponentName="bus");
end Bus;
