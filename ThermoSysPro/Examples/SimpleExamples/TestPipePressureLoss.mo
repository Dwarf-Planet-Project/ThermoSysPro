within ThermoSysPro.Examples.SimpleExamples;
model TestPipePressureLoss

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1
                                          annotation (Placement(transformation(
          extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss pipePressureLoss
                                          annotation (Placement(transformation(
          extent={{-20,20},{0,40}}, rotation=0)));
equation
  connect(pipePressureLoss.C2, PuitsP1.C)
    annotation (Line(points={{0,30},{60,30}}, color={0,0,255}));
  connect(SourceP1.C, pipePressureLoss.C1)
    annotation (Line(points={{-80,30},{-20,30}}, color={0,0,255}));
  annotation (             Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestPipePressureLoss;
