within ThermoSysPro.Examples.SimpleExamples;
model TestAirHumidity

  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ sourceFlueGasesPQ(P0=1.e5,
      T0=293) annotation (Placement(transformation(extent={{-80,0},{-60,20}},
          rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.AirHumidity airHumidity(hum0=0.9)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLoss(K=1.e-5) annotation (Placement(transformation(extent={
            {0,0},{20,20}}, rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.Sink sinkFlueGases
    annotation (Placement(transformation(extent={{40,0},{60,20}}, rotation=0)));
equation
  connect(sourceFlueGasesPQ.C, airHumidity.C1) annotation (Line(
      points={{-60,10},{-40,10}},
      color={0,0,0},
      thickness=1));
  connect(airHumidity.C2, singularPressureLoss.C1) annotation (Line(
      points={{-20,10},{0,10}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLoss.C2, sinkFlueGases.C) annotation (Line(
      points={{20,10},{40.2,10}},
      color={0,0,0},
      thickness=1));
  annotation (experiment(stopTime=1000), Diagram(graphics));
end TestAirHumidity;
