within ThermoSysPro.Examples.SimpleExamples;
model TestIdealSwitchValve

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1
                                          annotation (Placement(transformation(
          extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.IdealSwitchValve SwitchValve
                                          annotation (Placement(transformation(
          extent={{-20,26},{0,46}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Pulse pulse(
                                         width=10, period=20)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP2
                                        annotation (Placement(transformation(
          extent={{-60,20},{-40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP1
                                        annotation (Placement(transformation(
          extent={{20,20},{40,40}}, rotation=0)));
equation
  connect(pulse.yL, SwitchValve.Ouv) annotation (Line(points={{-39,70},{-10,70},
          {-10,43}}));
  connect(SourceP1.C, perteDP2.C1) annotation (Line(points={{-80,30},{-60,30}},
        color={0,0,255}));
  connect(perteDP2.C2, SwitchValve.C1) annotation (Line(points={{-40,30},{-30,
          30},{-30,29.8},{-20,29.8}}, color={0,0,255}));
  connect(SwitchValve.C2, perteDP1.C1) annotation (Line(points={{0,30},{20,30}},
        color={0,0,255}));
  connect(perteDP1.C2, PuitsP1.C) annotation (Line(points={{40,30},{60,30}},
        color={0,0,255}));
  annotation (experiment(StopTime=100),
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestIdealSwitchValve;
