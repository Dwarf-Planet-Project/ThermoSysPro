within ThermoSysPro.Examples.SimpleExamples;
model TestSteamEngine

  ThermoSysPro.WaterSteam.Machines.SteamEngine steamEngine1
    annotation (Placement(transformation(extent={{-60,60},{-40,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(                 mode=0, P0=100000)
    annotation (Placement(transformation(extent={{-20,60},{0,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=16e5) annotation (Placement(transformation(extent={{-100,60},{-80,80}},
          rotation=0)));
equation
  connect(sourceP.C, steamEngine1.C1)
    annotation (Line(points={{-80,70},{-57,70}}, color={0,0,255}));
  connect(steamEngine1.C2, puitsP.C)
    annotation (Line(points={{-43,70},{-31.5,70},{-31.5,70},{-20,70}}, color={0,
          0,255}));
  annotation (experiment(StopTime=1000), 
    Window(
      x=0.32,
      y=0.02,
      width=0.39,
      height=0.47),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestSteamEngine;
