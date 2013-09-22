within ThermoSysPro.Examples.SimpleExamples;
model TestSteamDryer2

  ThermoSysPro.WaterSteam.Junctions.SteamDryer steamDryer(
    P(start=100e5),
    eta=0.9)                annotation (Placement(transformation(extent={{-20,
            20},{0,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourceQ(P0=100e5, h0=
        2400000)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss2 annotation (Placement(transformation(extent={{-60,20},
            {-40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkP
    annotation (Placement(transformation(extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss1 annotation (Placement(transformation(extent={{20,20},
            {40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss3(K=2.e-3)
                          annotation (Placement(transformation(extent={{0,-20},
            {20,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink
    annotation (Placement(transformation(extent={{40,-20},{60,0}}, rotation=0)));
equation
  connect(sourceQ.C,singularPressureLoss2. C1) annotation (Line(points={{-80,30},
          {-60,30}}, color={0,0,255}));
  connect(singularPressureLoss1.C2,sinkP. C)
    annotation (Line(points={{40,30},{60,30}}, color={0,0,255}));
  connect(singularPressureLoss3.C2,sink. C)
    annotation (Line(points={{20,-10},{40,-10}}, color={0,0,255}));
  connect(singularPressureLoss2.C2, steamDryer.Cev) annotation (Line(points={{
          -40,30},{-30,30},{-30,34},{-19.9,34}}, color={0,0,255}));
  connect(steamDryer.Csv, singularPressureLoss1.C1) annotation (Line(points={{
          -0.1,34},{10,34},{10,30},{20,30}}, color={0,0,255}));
  connect(steamDryer.Csl, singularPressureLoss3.C1) annotation (Line(points={{
          -9.9,20},{-10,20},{-10,-10},{0,-10}}, color={0,0,255}));
  annotation (experiment(StopTime=1000), Diagram(graphics));
end TestSteamDryer2;
