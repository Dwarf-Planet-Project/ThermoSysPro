within ThermoSysPro.Examples.SimpleExamples;
model TestNTUWaterHeating2

  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ Source_condenseur(
    P0=79e5,
    Q0=1780,
    h0=760e3)
          annotation (Placement(transformation(extent={{-201,-10},{-181,10}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink Puit_condenseur
             annotation (Placement(transformation(extent={{182,-10},{202,10}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    option_temperature=2,
    mode=0,
    h0=2.6e6,
    P0=27e5)
            annotation (Placement(transformation(extent={{-201,90},{-181,110}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss2(C2(
      P(start=80e5),
      h_vol(start=750e3),
      Q(start=1800),
      h(start=750e3)), K=1e-4)
                          annotation (Placement(transformation(extent={{-160,
            -10},{-140,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss3(K=1e-4)
                          annotation (Placement(transformation(extent={{-100,90},
            {-80,110}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink Puit_condenseur1
             annotation (Placement(transformation(extent={{178,-100},{198,-80}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss4(K=1e-4, C1(
      P(start=70e5),
      h_vol(start=9e5),
      Q(start=1800),
      h(start=9e5)))      annotation (Placement(transformation(extent={{142,-10},
            {162,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss5(K=1e-4)
                          annotation (Placement(transformation(extent={{140,
            -100},{160,-80}}, rotation=0)));

  ThermoSysPro.WaterSteam.HeatExchangers.NTUWaterHeating nTUWaterHeating(
    SCondDes=6314,
    SPurge=656,
    HeiF(start=900000),
    HDesF(start=900000),
    Ee(h_vol(start=880000), Q(start=1800), h(start=880000), P(start=80e5)),
    Ev(h_vol(start=3500000), P(start=27e5)),
    Ep(Q(start=10)),
    Se(P(start=80e5)),
    h(start=910000),
    Hep(start=910000),
    lambdaE=97,
    KCond=3260.23,
    KPurge=1767.8)    annotation (Placement(transformation(extent={{22,-42},{
            100,42}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss1(K=1e-4)
                          annotation (Placement(transformation(extent={{18,68},
            {38,88}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ Source_condenseur1(
    h0=1000e3,
    P0=28e5,
    Q0=0) annotation (Placement(transformation(extent={{-43,68},{-23,88}},
          rotation=0)));
  ThermoSysPro.WaterSteam.HeatExchangers.NTUWaterHeating nTUWaterHeating1(
    HeiF(start=900000),
    HDesF(start=900000),
    Ev(h_vol(start=3500000), P(start=27e5)),
    lambdaE=70,
    SCondDes=5750,
    KCond=7200,
    Ee(
      h_vol(start=880000),
      Q(start=1800),
      P(start=80e5),
      h(start=750000)),
    h(start=9e5),
    Hep(start=890000),
    Se(
      P(start=80e5),
      h_vol(start=8.9e5),
      h(start=8.9e5)),
    Ep(Q(start=10), P(start=18e5)),
    SPurge=1458,
    KPurge=2048)      annotation (Placement(transformation(extent={{-118,-42},{
            -40,42}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(
    option_temperature=2,
    mode=0,
    P0=16.5e5,
    h0=2.4e6)
            annotation (Placement(transformation(extent={{-201,70},{-181,90}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss6(K=1e-4)
                          annotation (Placement(transformation(extent={{-100,70},
            {-80,90}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLoss7(Q(start=100), K=1e-4)
                          annotation (Placement(transformation(extent={{-10,-54},
            {-30,-34}}, rotation=0)));
equation
  connect(Source_condenseur.C, singularPressureLoss2.C1)
    annotation (Line(points={{-181,0},{-160,0}}, color={0,0,255}));
  connect(sourceP.C, singularPressureLoss3.C1)
    annotation (Line(points={{-181,100},{-100,100}}, color={0,0,255}));
  connect(singularPressureLoss4.C2, Puit_condenseur.C)
    annotation (Line(points={{162,0},{182,0}}, color={0,0,255}));
  connect(singularPressureLoss5.C2, Puit_condenseur1.C)
    annotation (Line(points={{160,-90},{178,-90}}, color={0,0,255}));
  connect(singularPressureLoss3.C2, nTUWaterHeating.Ev) annotation (Line(points
        ={{-80,100},{84.4,100},{84.4,13.44}}, color={0,0,255}));
  connect(nTUWaterHeating.Se, singularPressureLoss4.C1)
    annotation (Line(points={{100,0},{142,0}}, color={0,0,255}));
  connect(Source_condenseur1.C, singularPressureLoss1.C1)
    annotation (Line(points={{-23,78},{18,78}}, color={0,0,255}));
  connect(nTUWaterHeating1.Se, nTUWaterHeating.Ee)
    annotation (Line(points={{-40,0},{21.22,0}}, color={0,0,255}));
  connect(singularPressureLoss2.C2, nTUWaterHeating1.Ee) annotation (Line(
        points={{-140,0},{-118.78,0}}, color={0,0,255}));
  connect(sourceP1.C, singularPressureLoss6.C1)
    annotation (Line(points={{-181,80},{-100,80}}, color={0,0,255}));
  connect(singularPressureLoss6.C2, nTUWaterHeating1.Ev) annotation (Line(
        points={{-80,80},{-55.6,80},{-55.6,13.44}}, color={0,0,255}));
  connect(nTUWaterHeating.Sp, singularPressureLoss7.C1) annotation (Line(points
        ={{37.6,-13.86},{37.6,-44},{-10,-44}}, color={0,0,255}));
  connect(singularPressureLoss7.C2, nTUWaterHeating1.Ep) annotation (Line(
        points={{-30,-44},{-132,-44},{-132,38},{-102.4,38},{-102.4,14.28}},
        color={0,0,255}));
  connect(nTUWaterHeating1.Sp, singularPressureLoss5.C1) annotation (Line(
        points={{-102.4,-13.86},{-102.4,-90},{140,-90}}, color={0,0,255}));
  connect(singularPressureLoss1.C2, nTUWaterHeating.Ep) annotation (Line(points
        ={{38,78},{37.6,78},{37.6,14.28}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -200},{200,200}}), graphics));
end TestNTUWaterHeating2;
