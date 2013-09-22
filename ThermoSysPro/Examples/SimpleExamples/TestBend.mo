within ThermoSysPro.Examples.SimpleExamples;
model TestBend

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,26},{-80,46}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP SinkP1
                                          annotation (Placement(transformation(
          extent={{60,0},{80,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.Bend Bend   annotation (Placement(
        transformation(extent={{-20,26},{0,46}}, rotation=0)));
equation
  connect(Bend.C2, SinkP1.C)
    annotation (Line(points={{-10,26},{-10,10},{60,10}}, color={0,0,255}));
  connect(SourceP1.C, Bend.C1)
    annotation (Line(points={{-80,36},{-20,36}}, color={0,0,255}));
  annotation (             Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram(experiment(stopTime=1000),coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestBend;
