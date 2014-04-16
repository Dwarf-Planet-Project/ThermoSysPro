within ThermoSysPro.Examples.SimpleExamples;
model TestLumpedStraightPipe

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1
                                          annotation (Placement(transformation(
          extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe
                                          annotation (Placement(transformation(
          extent={{-20,20},{0,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.Tank tank annotation (Placement(
        transformation(extent={{-60,-40},{-40,-20}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.Tank tank1(z0=10) annotation (Placement(
        transformation(extent={{20,-40},{40,-20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe1(inertia=
        true, lambda_fixed=false)         annotation (Placement(transformation(
          extent={{-20,-80},{0,-60}}, rotation=0)));
equation
  connect(lumpedStraightPipe.C2, PuitsP1.C)
    annotation (Line(points={{0,30},{60,30}}, color={0,0,255}));
  connect(SourceP1.C, lumpedStraightPipe.C1)
    annotation (Line(points={{-80,30},{-20,30}}, color={0,0,255}));
  connect(tank.Cs2, lumpedStraightPipe1.C1) annotation (Line(points={{-40,-36},
          {-30,-36},{-30,-70},{-20,-70}}, color={0,0,255}));
  connect(lumpedStraightPipe1.C2, tank1.Ce2) annotation (Line(points={{0,-70},{
          10,-70},{10,-36},{20,-36}}, color={0,0,255}));
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
end TestLumpedStraightPipe;
