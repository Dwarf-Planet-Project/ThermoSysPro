within ThermoSysPro.Examples.SimpleExamples;
model TestFlueGasesVolumes

  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ Source_Fumees(
    Xso2=0,
    Xco2=0.0,
    Xh2o=0.006,
    Xo2=0.23,
    Q0=2,
    T0=300,
    P0=1.3e5)
    annotation (Placement(transformation(extent={{-120,0},{-100,20}}, rotation=
            0)));
  ThermoSysPro.FlueGases.BoundaryConditions.Sink Puits_Fumees
    annotation (Placement(transformation(
        origin={130,10},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.FlueGases.Volumes.VolumeDTh dynamicExchanger
    annotation (Placement(transformation(extent={{-40,0},{-20,20}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(
      option_temperature=2, W0={2e4})
                            annotation (Placement(transformation(extent={{-80,
            42},{-60,62}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases(K(fixed=true) = 10, Q(fixed=false, start=10))
                                  annotation (Placement(transformation(extent={
            {0,0},{20,20}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases1(K(fixed=true) = 0.01, Q(fixed=false, start=
          11))                    annotation (Placement(transformation(extent={
            {-80,0},{-60,20}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe(
    Starttime=50,
    Duration=50,
    Initialvalue=1e4,
    Finalvalue=2e4) annotation (Placement(transformation(extent={{-20,60},{-40,
            80}}, rotation=0)));
  ThermoSysPro.FlueGases.Machines.StaticFan staticFan(
    VRotn=2700,
    rm=1,
    VRot=3000,
    a1=45.876,
    a2=-50,
    b1=-3.0752)
               annotation (Placement(transformation(extent={{40,0},{60,20}},
          rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases2(
                                  K(fixed=true) = 10, Q(fixed=false, start=10))
                                  annotation (Placement(transformation(extent={
            {80,0},{100,20}}, rotation=0)));
equation
  connect(Source_Fumees.C, singularPressureLossFlueGases1.C1) annotation (Line(
      points={{-100,10},{-80,10}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases.C2, staticFan.C1) annotation (Line(
      points={{20,10},{40,10}},
      color={0,0,0},
      thickness=1));
  connect(staticFan.C2, singularPressureLossFlueGases2.C1) annotation (Line(
      points={{60,10},{80,10}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases1.C2, dynamicExchanger.Ce) annotation (Line(
      points={{-60,10},{-40,10}},
      color={0,0,0},
      thickness=1));
  connect(dynamicExchanger.Cs3, singularPressureLossFlueGases.C1) annotation (Line(
      points={{-20,10},{0,10}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases2.C2, Puits_Fumees.C) annotation (Line(
      points={{100,10},{110.1,10},{110.1,10},{120.2,10}},
      color={0,0,0},
      thickness=1));
  connect(rampe.y, heatSource.ISignal) annotation (Line(points={{-41,70},{-70,
          70},{-70,57}}));
  connect(heatSource.C[1], dynamicExchanger.Cth) annotation (Line(points={{-70,
          42.2},{-30,10}}, color={191,95,0}));
  annotation (experiment(stopTime=200), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-200,-150},{200,150}},
        initialScale=0.1), graphics));
end TestFlueGasesVolumes;
