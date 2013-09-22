within ThermoSysPro.Examples.SimpleExamples;
model TestFan

  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ Source_Fumees(
    Xso2=0,
    Xco2=0.0,
    Xh2o=0.006,
    Xo2=0.23,
    T0=300,
    Q0=4,
    P0=1.3e5)
    annotation (Placement(transformation(extent={{-180,0},{-160,20}}, rotation=
            0)));
  ThermoSysPro.FlueGases.BoundaryConditions.Sink Puits_Fumees
    annotation (Placement(transformation(
        origin={190,10},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.FlueGases.Volumes.VolumeATh dynamicExchanger
    annotation (Placement(transformation(extent={{-60,60},{-40,80}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(
      option_temperature=2, W0={2e5})
                            annotation (Placement(transformation(extent={{-40,
            100},{-20,120}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases(K(fixed=true) = 10, Q(fixed=false, start=10))
                                  annotation (Placement(transformation(extent={
            {20,60},{40,80}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases1(K(fixed=true) = 0.01, Q(fixed=false, start=
          11))                    annotation (Placement(transformation(extent={
            {-100,60},{-80,80}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe(
    Starttime=50,
    Duration=50,
    Initialvalue=1e4,
    Finalvalue=2e5) annotation (Placement(transformation(extent={{0,120},{-20,
            140}}, rotation=0)));
  ThermoSysPro.FlueGases.Machines.StaticFan staticFan(
    VRotn=2700,
    rm=1,
    VRot=3000,
    a1=45.876,
    a2=-50,
    b1=-3.0752)
               annotation (Placement(transformation(extent={{60,60},{80,80}},
          rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.CheckValve
    singularPressureLossFlueGases2(                   Q(fixed=false, start=10))
                                  annotation (Placement(transformation(extent={
            {100,60},{120,80}}, rotation=0)));
  ThermoSysPro.FlueGases.Volumes.VolumeDTh dynamicExchanger1
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}}, rotation
          =0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource1(
      option_temperature=2, W0={2e5})
                            annotation (Placement(transformation(extent={{-40,
            -80},{-20,-100}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases3(
                                  K(fixed=true) = 10, Q(fixed=false, start=10))
                                  annotation (Placement(transformation(extent={
            {20,-60},{40,-40}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases4(K(fixed=true) = 0.01, Q(fixed=false, start=
          11))                    annotation (Placement(transformation(extent={
            {-100,-60},{-80,-40}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe1(
    Starttime=50,
    Duration=50,
    Initialvalue=1e4,
    Finalvalue=2e5) annotation (Placement(transformation(extent={{0,-120},{-20,
            -100}}, rotation=0)));
  ThermoSysPro.FlueGases.Machines.StaticFan staticFan1(
    VRotn=2700,
    rm=1,
    VRot=3000,
    a1=45.876,
    a2=-50,
    b1=-3.0752)
               annotation (Placement(transformation(extent={{60,-60},{80,-40}},
          rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.CheckValve
    singularPressureLossFlueGases5(                   Q(fixed=false, start=10))
                                  annotation (Placement(transformation(extent={
            {100,-60},{120,-40}}, rotation=0)));
  ThermoSysPro.FlueGases.Junctions.Mixer2 mixerFlueGases2_1
    annotation (Placement(transformation(extent={{140,0},{160,20}}, rotation=0)));
  ThermoSysPro.FlueGases.Volumes.VolumeDTh volume2S
    annotation (Placement(transformation(extent={{-140,0},{-120,20}}, rotation=
            0)));
  ThermoSysPro.FlueGases.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{-20,68},{0,88}}, rotation=0)));
  ThermoSysPro.FlueGases.Sensors.TemperatureSensor temperatureSensor1
    annotation (Placement(transformation(extent={{-20,-52},{0,-32}}, rotation=0)));
equation
  connect(singularPressureLossFlueGases.C2, staticFan.C1) annotation (Line(
      points={{40,70},{60,70}},
      color={0,0,0},
      thickness=1));
  connect(staticFan.C2, singularPressureLossFlueGases2.C1) annotation (Line(
      points={{80,70},{99,70}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases3.C2, staticFan1.C1) annotation (Line(
      points={{40,-50},{60,-50}},
      color={0,0,0},
      thickness=1));
  connect(staticFan1.C2, singularPressureLossFlueGases5.C1) annotation (Line(
      points={{80,-50},{99,-50}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases2.C2, mixerFlueGases2_1.Ce1) annotation (Line(
      points={{121,70},{146,70},{146,20}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases5.C2, mixerFlueGases2_1.Ce2) annotation (Line(
      points={{121,-50},{146,-50},{146,0}},
      color={0,0,0},
      thickness=1));
  connect(temperatureSensor1.C2, singularPressureLossFlueGases3.C1) annotation (Line(
      points={{0,-50},{20,-50}},
      color={0,0,0},
      thickness=1));
  connect(temperatureSensor.C2, singularPressureLossFlueGases.C1) annotation (Line(
      points={{0,70},{20,70}},
      color={0,0,0},
      thickness=1));
  connect(Source_Fumees.C, volume2S.Ce) annotation (Line(
      points={{-160,10},{-140,10}},
      color={0,0,0},
      thickness=1));
  connect(volume2S.Cs1, singularPressureLossFlueGases1.C1) annotation (Line(
      points={{-130,20},{-130,70},{-100,70}},
      color={0,0,0},
      thickness=1));
  connect(volume2S.Cs2, singularPressureLossFlueGases4.C1) annotation (Line(
      points={{-130,0},{-130,-50},{-100,-50}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases4.C2, dynamicExchanger1.Ce) annotation (Line(
      points={{-80,-50},{-60,-50}},
      color={0,0,0},
      thickness=1));
  connect(dynamicExchanger1.Cs3, temperatureSensor1.C1) annotation (Line(
      points={{-40,-50},{-20,-50}},
      color={0,0,0},
      thickness=1));
  connect(heatSource.ISignal, rampe.y)
    annotation (Line(points={{-30,115},{-30,130},{-21,130}}));
  connect(heatSource1.ISignal, rampe1.y)
    annotation (Line(points={{-30,-95},{-30,-110},{-21,-110}}));
  connect(heatSource.C[1], dynamicExchanger.Cth) annotation (Line(points={{-30,
          100.2},{-50,70}}, color={191,95,0}));
  connect(heatSource1.C[1], dynamicExchanger1.Cth) annotation (Line(points={{
          -30,-80.2},{-50,-50}}, color={191,95,0}));
  connect(mixerFlueGases2_1.Cs, Puits_Fumees.C) annotation (Line(
      points={{160,10},{169.7,10},{169.7,10},{180.2,10}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases1.C2, dynamicExchanger.Ce1) annotation (Line(
      points={{-80,70},{-60,70}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(dynamicExchanger.Cs1, temperatureSensor.C1) annotation (Line(
      points={{-40,70},{-20,70}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (experiment(stopTime=1000), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-200,-150},{200,150}},
        initialScale=0.1), graphics));
end TestFan;
