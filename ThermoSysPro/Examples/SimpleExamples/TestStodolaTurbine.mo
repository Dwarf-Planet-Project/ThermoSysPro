within ThermoSysPro.Examples.SimpleExamples;
model TestStodolaTurbine

  ThermoSysPro.WaterSteam.Machines.StodolaTurbine stodolaTurbine(fluid=1)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(                 mode=0, P0=45e5)
    annotation (Placement(transformation(extent={{-20,60},{0,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=48.e5) annotation (Placement(transformation(extent={{-100,60},{-80,80}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.DynamicCentrifugalPump
    DynamicCentrifugalPump1
    annotation (Placement(transformation(extent={{20,-40},{0,-20}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.Tank Bache1(
                                        ze2=10, zs2=10)
    annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve VanneReglante1
    annotation (Placement(transformation(extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Constante1(
                                                  k=0.5) annotation (Placement(
        transformation(extent={{20,60},{40,80}}, rotation=0)));
equation
  connect(DynamicCentrifugalPump1.C2,Bache1. Ce2)
    annotation (Line(points={{0,-30.2},{-10,-30},{-20,-30},{-20,24},{0,24}},
        color={0,0,255}));
  connect(Bache1.Cs2,VanneReglante1. C1)
    annotation (Line(points={{20,24},{60,24}}, color={0,0,255}));
  connect(VanneReglante1.C2,DynamicCentrifugalPump1. C1)
    annotation (Line(points={{80,24},{100,24},{100,-30},{20,-30}}, color={0,0,
          255}));
  connect(Constante1.y,VanneReglante1. Ouv)
    annotation (Line(points={{41,70},{70,70},{70,41}}, color={0,0,255}));
  connect(sourceP.C, stodolaTurbine.Ce)
    annotation (Line(points={{-80,70},{-60.1,70}}, color={0,0,255}));
  connect(stodolaTurbine.Cs, puitsP.C)
    annotation (Line(points={{-39.9,70},{-20,70}}, color={0,0,255}));
  connect(stodolaTurbine.M, DynamicCentrifugalPump1.M)
    annotation (Line(points={{-50,60},{-50,-60},{10,-60},{10,-41}}, smooth=
          Smooth.None));
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
end TestStodolaTurbine;
