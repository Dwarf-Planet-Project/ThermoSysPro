within ThermoSysPro.Examples.SimpleExamples;
model TestSingularPressureLoss

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1
                                          annotation (Placement(transformation(
          extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss(                                                          fluid=1)
                                          annotation (Placement(transformation(
          extent={{-20,20},{0,40}}, rotation=0)));
equation
  connect(singularPressureLoss.C2, PuitsP1.C)
    annotation (Line(points={{0,30},{60,30}}, color={0,0,255}));
  connect(SourceP1.C, singularPressureLoss.C1)
    annotation (Line(points={{-80,30},{-20,30}}, color={0,0,255}));
  annotation (experiment(StopTime=1000),
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestSingularPressureLoss;
