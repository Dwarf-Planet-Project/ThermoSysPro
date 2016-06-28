within ThermoSysPro.Examples.SimpleExamples;
model TestControlValve

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1
                                          annotation (Placement(transformation(
          extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve ControlValve(mode_caract=1, caract=[
        0,0; 0.5,3000; 0.75,7000; 1,8000])
                                          annotation (Placement(transformation(
          extent={{-20,26},{0,46}}, rotation=0)));
  InstrumentationAndControl.Blocks.Tables.Table1DTemps Constante1(           Table=[0,
        0.9; 5,0.9; 15,0.5; 25,0.5; 50,0.2; 100,0.2])
    annotation (Placement(transformation(extent={{-40,60},{-20,80}}, rotation=0)));
equation
  connect(ControlValve.C2, PuitsP1.C)
    annotation (Line(points={{0,30},{60,30}}, color={0,0,255}));
  connect(Constante1.y, ControlValve.Ouv)
    annotation (Line(points={{-19,70},{-10,70},{-10,47}}, color={0,0,255}));
  connect(SourceP1.C, ControlValve.C1)
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
end TestControlValve;
