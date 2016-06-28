within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicReliefValve

  ThermoSysPro.WaterSteam.PressureLosses.DynamicReliefValve ReliefValve(
    dPOuvert=2.e5,
    dPFerme=1.9e5,
    Cmin=0,
    Cvmax=1000,
    D=1,
    m=1) annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation
          =0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe Pipe2(Pm(start=
          199283), continuous_flow_reversal=true)
                                         annotation (Placement(transformation(
          extent={{40,-20},{60,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP Sink2
                                   annotation (Placement(transformation(extent=
            {{80,-20},{100,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.Tank Tank(z0=70,
    P(start=443678),
    BQ(start=-799.7))                              annotation (Placement(
        transformation(extent={{-100,0},{-80,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe Pipe1(Pm(start=
          542151), continuous_flow_reversal=true)
                                         annotation (Placement(transformation(
          extent={{-40,-20},{-20,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeD VolumeD1(P(start=298566))
                                     annotation (Placement(transformation(
          extent={{0,-20},{20,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP Sink1
                                   annotation (Placement(transformation(extent=
            {{40,20},{60,40}}, rotation=0)));
equation
  connect(Pipe2.C2, Sink2.C)
    annotation (Line(points={{60,-10},{80,-10}}, color={0,0,255}));
  connect(Tank.Cs2, Pipe1.C1)
    annotation (Line(points={{-80,4},{-60,4},{-60,-10},{-40,-10}}, color={0,0,
          255}));
  connect(Pipe1.C2, VolumeD1.Ce)
    annotation (Line(points={{-20,-10},{0,-10}}, color={0,0,255}));
  connect(VolumeD1.Cs3, Pipe2.C1)
    annotation (Line(points={{20,-10},{40,-10}}, color={0,0,255}));
  connect(ReliefValve.C1, VolumeD1.Cs1)
                                     annotation (Line(points={{10,20.2},{10,0}}));
  connect(ReliefValve.C2, Sink1.C)
    annotation (Line(points={{20,29.8},{30,29.8},{30,30},{40,30}}, color={0,0,
          255}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics),
    Window(
      x=0.1,
      y=0.08,
      width=0.5,
      height=0.6));
end TestDynamicReliefValve;
