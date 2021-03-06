within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicCheckValve

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1
                                     annotation (Placement(transformation(
          extent={{-40,40},{-20,60}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1(
                                   P0=6e5) annotation (Placement(transformation(
          extent={{40,40},{60,60}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Pulse pulse(
    amplitude=6e5,
    width=50,
    period=100,
    offset=3e5) annotation (Placement(transformation(extent={{-80,40},{-60,60}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.DynamicCheckValve checkValve3(J=10)
    annotation (Placement(transformation(extent={{0,40},{20,60}}, rotation=0)));
equation
  connect(sourceP1.C,checkValve3. C1)
    annotation (Line(points={{-20,50},{0,50}}, color={0,0,255}));
  connect(checkValve3.C2,puitsP1. C)
    annotation (Line(points={{20,49.8},{30,49.8},{30,50},{40,50}}, color={0,0,
          255}));
  connect(pulse.y, sourceP1.IPressure) annotation (Line(points={{-59,50},{-35,
          50}}));
  annotation (experiment(StopTime=1000),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics),
    Window(
      x=0.28,
      y=0.03,
      width=0.5,
      height=0.6));
end TestDynamicCheckValve;
