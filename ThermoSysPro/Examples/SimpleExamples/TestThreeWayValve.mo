within ThermoSysPro.Examples.SimpleExamples;
model TestThreeWayValve

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1
                                          annotation (Placement(transformation(
          extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ThreeWayValve threeWayValve
    annotation (Placement(transformation(extent={{-20,24},{0,44}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP2
                                          annotation (Placement(transformation(
          extent={{60,-20},{80,0}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe
                                         annotation (Placement(transformation(
          extent={{-60,60},{-40,80}}, rotation=0)));
equation
  connect(SourceP1.C, threeWayValve.C1)
    annotation (Line(points={{-80,30},{-20,30}}, color={0,0,255}));
  connect(threeWayValve.C2, PuitsP1.C)
    annotation (Line(points={{0,30},{60,30}}, color={255,0,0}));
  connect(threeWayValve.C3, PuitsP2.C) annotation (Line(points={{-10,24},{-10,
          -10},{60,-10}}, color={255,0,0}));
  connect(rampe.y, threeWayValve.Ouv)
    annotation (Line(points={{-39,70},{-10,70},{-10,45}}));
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
end TestThreeWayValve;
