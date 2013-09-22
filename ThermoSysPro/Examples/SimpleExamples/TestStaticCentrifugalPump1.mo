within ThermoSysPro.Examples.SimpleExamples;
model TestStaticCentrifugalPump1

  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump StaticCentrifugalPump1(
      fixed_rot_or_power=2, MPower=0.15e6)
    annotation (Placement(transformation(extent={{-20,20},{0,40}}, rotation=0)));
  WaterSteam.BoundaryConditions.SourceP sourceP
    annotation (Placement(transformation(extent={{-80,20},{-60,40}}, rotation=0)));
  WaterSteam.BoundaryConditions.SinkP sinkP(P0=600000)
    annotation (Placement(transformation(extent={{40,20},{60,40}}, rotation=0)));
equation
  connect(sourceP.C, StaticCentrifugalPump1.C1) annotation (Line(
      points={{-60,30},{-20,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(StaticCentrifugalPump1.C2, sinkP.C) annotation (Line(
      points={{0,30},{40,30}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (experiment(stopTime=1000), 
    Window(
      x=0.32,
      y=0.02,
      width=0.39,
      height=0.47),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestStaticCentrifugalPump1;
