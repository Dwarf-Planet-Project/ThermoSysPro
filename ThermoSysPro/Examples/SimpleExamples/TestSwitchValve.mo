within ThermoSysPro.Examples.SimpleExamples;
model TestSwitchValve

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1
                                          annotation (Placement(transformation(
          extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SwitchValve SwitchValve
                                          annotation (Placement(transformation(
          extent={{-20,26},{0,46}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Pulse pulse(
                                         width=10, period=20)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}}, rotation=0)));
equation
  connect(SwitchValve.C2, PuitsP1.C)
    annotation (Line(points={{0,30.2},{40,30.2},{40,30},{60,30}}, color={0,0,
          255}));
  connect(SourceP1.C, SwitchValve.C1)
    annotation (Line(points={{-80,30},{-20,30}}, color={0,0,255}));
  connect(pulse.yL, SwitchValve.Ouv) annotation (Line(points={{-39,70},{-10,70},
          {-10,43.2}}));
  annotation (experiment(stopTime=1000), 
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestSwitchValve;
