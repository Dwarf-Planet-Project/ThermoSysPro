within ThermoSysPro.Examples.SimpleExamples;
model TestCentrifugalPump7

  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Pulse Pulse1(
                                          width=200, period=400)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}}, rotation
          =0)));
  ThermoSysPro.ElectroMechanics.Machines.SynchronousMotor Motor1(Im(start=
          2251.78))                        annotation (Placement(transformation(
          extent={{-40,-80},{-20,-60}}, rotation=0)));
  ThermoSysPro.WaterSteam.Machines.CentrifugalPump centrifugalPump(mode_car_hn=
        1, mode_car_Cr=1,
    mode_car=1,
    dynamic_energy_balance=true,
    w_a(start=1),
    Qv_a(start=0.8649),
    Q(start=862.736),
    Pm(start=304161),
    h(start=100067),
    C2(h_vol(start=100134), h(start=100134)))
    annotation (Placement(transformation(extent={{40,-40},{20,-20}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.Tank Tank(
    ze2=10,
    zs2=10,
    P(start=248019))
    annotation (Placement(transformation(extent={{20,20},{40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Valve(
    Q(start=368.66),
    Pm(start=200650),
    h(start=100134))
    annotation (Placement(transformation(extent={{-80,20},{-60,40}}, rotation=0)));
  ThermoSysPro.ElectroMechanics.Machines.Shaft Shaft1
    annotation (Placement(transformation(extent={{0,-80},{20,-60}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe(
    Starttime=200,
    Duration=100,
    Initialvalue=0.5,
    Finalvalue=0) annotation (Placement(transformation(extent={{-100,60},{-80,
            80}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.DynamicReliefValve dynamicReliefValve(
    Cmin=1.e-20,
    dPOuvert=2.2e5,
    dPFerme=2.1e5,
    h(start=100134))              annotation (Placement(transformation(extent={
            {-20,-10},{0,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeA volumeA(P(start=311770), h(start=
          100134))
    annotation (Placement(transformation(extent={{0,-20},{-20,-40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP
    annotation (Placement(transformation(extent={{20,-10},{40,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Valve1(Pm(start=200650),
      Q(start=0.0000001))
    annotation (Placement(transformation(extent={{-20,32},{0,52}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP
    annotation (Placement(transformation(extent={{-60,26},{-40,46}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=
        15) annotation (Placement(transformation(extent={{-60,80},{-40,100}},
          rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-20,80},{0,100}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PIsat pIsat
    annotation (Placement(transformation(extent={{20,80},{40,100}}, rotation=0)));
equation
  connect(Pulse1.yL, Motor1.marche)
    annotation (Line(points={{-39,-50},{-30,-50},{-30,-65.6}}));
  connect(Motor1.C, Shaft1.C1)
    annotation (Line(points={{-19.8,-70},{-1,-70}}));
  connect(centrifugalPump.M, Shaft1.C2)
    annotation (Line(points={{30,-41},{30,-70},{21,-70}}));
  connect(rampe.y, Valve.Ouv) annotation (Line(points={{-79,70},{-70,70},{-70,
          41}}));
  connect(centrifugalPump.C2, volumeA.Ce1)         annotation (Line(points={{20,
          -30},{0,-30}}, color={0,0,255}));
  connect(dynamicReliefValve.C1, volumeA.Cs2)
    annotation (Line(points={{-10,-9.8},{-10,-20}}));
  connect(dynamicReliefValve.C2, sinkP.C) annotation (Line(points={{0,-0.2},{10,
          -0.2},{10,0},{20,0}}, color={0,0,255}));
  connect(volumeA.Cs1, Valve.C1) annotation (Line(points={{-20,-30},{-100,-30},
          {-100,24},{-80,24}}, color={0,0,255}));
  connect(Valve.C2, Tank.Ce2)
    annotation (Line(points={{-60,24},{20,24}}, color={0,0,255}));
  connect(Valve1.C2, Tank.Ce1)
    annotation (Line(points={{0,36},{20,36}}, color={0,0,255}));
  connect(sourceP.C, Valve1.C1)
    annotation (Line(points={{-40,36},{-20,36}}, color={0,0,255}));
  connect(constante.y, feedback.u1) annotation (Line(points={{-39,90},{-21,90}}));
  connect(Tank.yLevel, feedback.u2)
    annotation (Line(points={{41,32},{60,32},{60,70},{-10,70},{-10,79}}));
  connect(feedback.y, pIsat.u) annotation (Line(points={{1,90},{19,90}}));
  connect(pIsat.y, Valve1.Ouv)
    annotation (Line(points={{41,90},{80,90},{80,60},{-10,60},{-10,53}}));
  connect(centrifugalPump.C1, Tank.Cs2)
    annotation (Line(points={{40,-30},{80,-30},{80,24},{40,24}}));
  annotation (experiment(StopTime=1000),
    Window(
      x=0.32,
      y=0.02,
      width=0.39,
      height=0.47),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestCentrifugalPump7;
