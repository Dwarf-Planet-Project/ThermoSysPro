within ThermoSysPro.Examples.SimpleExamples;
model TestCentrifugalPump10

  ThermoSysPro.WaterSteam.Machines.CentrifugalPump centrifugalPump(
    continuous_flow_reversal=false,
    hn_nom_p=10,
    mode_car_hn=2,
    mode_car_Cr=2,
    mode_car=2)
    annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(P0=300000)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP
    annotation (Placement(transformation(extent={{60,20},{80,40}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe2(
    Duration=100,
    Starttime=100,
    Initialvalue=400000,
    Finalvalue=600000)                         annotation (Placement(
        transformation(extent={{0,60},{20,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump centrifugalPump1(
    continuous_flow_reversal=false, b3=0)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(
                                                             P0=300000)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}}, rotation
          =0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP1
    annotation (Placement(transformation(extent={{60,-60},{80,-40}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe1(
    Duration=100,
    Starttime=100,
    Initialvalue=400000,
    Finalvalue=600000)                         annotation (Placement(
        transformation(extent={{0,-20},{20,0}}, rotation=0)));
equation
  connect(sourceP.C, centrifugalPump.C1)
    annotation (Line(points={{-40,30},{0,30}}, color={0,0,255}));
  connect(rampe2.y, sinkP.IPressure)
    annotation (Line(points={{21,70},{80,70},{80,30},{75,30}}));
  connect(centrifugalPump.C2, sinkP.C)
    annotation (Line(points={{20,30},{60,30}}, color={0,0,255}));
  connect(sourceP1.C, centrifugalPump1.C1)
    annotation (Line(points={{-40,-50},{0,-50}}, color={0,0,255}));
  connect(rampe1.y, sinkP1.IPressure)
    annotation (Line(points={{21,-10},{80,-10},{80,-50},{75,-50}}));
  connect(centrifugalPump1.C2, sinkP1.C)
    annotation (Line(points={{20,-50},{60,-50}}, color={0,0,255}));
  annotation (Diagram(graphics));
end TestCentrifugalPump10;
