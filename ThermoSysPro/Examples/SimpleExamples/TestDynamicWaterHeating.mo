within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicWaterHeating

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    option_temperature=2,
    mode=0,
    h0=2750.e3,
    P0=40e5)
            annotation (Placement(transformation(extent={{-192,110},{-150,150}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP Puit_condenseur1(
      option_temperature=2, P0(fixed=true) = 10e5)
             annotation (Placement(transformation(extent={{124,-202},{160,-162}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve ControlValve_eau(
    Q(fixed=false, start=56),
    Cvmax(fixed=false) = 354.534,
    mode_caract=0,
    Cv(start=70, fixed=false))
                          annotation (Placement(transformation(extent={{88,-186},
            {108,-166}}, rotation=0)));

  ThermoSysPro.WaterSteam.HeatExchangers.DynamicWaterHeating WaterHeating(
    ec=2e-3,
    Ns=10,
    P0c=40e5,
    Rv=1.2,
    Lc=2.5,
    PasL=0.028,
    PasT=0.024,
    ntubes3=1500,
    Dc=0.018,
    pipe_3(
      steady_state=true,
      mode=1,
      dynamic_mass_balance=true,
      simplified_dynamic_energy_balance=false,
      inertia=false,
      advection=false,
      z2=1),
    ntubes1=400,
    ntubes2=400,
    L1=11,
    L2=11,
    L3=22,
    pipe_1(
      mode=1,
      dynamic_mass_balance=true,
      simplified_dynamic_energy_balance=false,
      advection=false,
      z2=0.4),
    pipe_2(
      z2=0.4,
      mode=1,
      dynamic_mass_balance=true,
      simplified_dynamic_energy_balance=false,
      advection=false),
    WaterHeating(
      steady_state=true,
      Vertical=false,
      step_square=true,
      Kvl=1,
      Klp=1500,
      Kvp=1200,
      Kpa=0.2,
      V=70,
      Mp=50000,
      zl(fixed=true, start=0.5),
      P(fixed=true, start=39.5e5),
      Cv(Q(fixed=false, start=35), P(fixed=false, start=39.5e5))),
    C2ex(P(start=3900000)))
    annotation (Placement(transformation(extent={{-58,-90},{162,96}}, rotation=
            0)));

  ThermoSysPro.WaterSteam.BoundaryConditions.Sink Puit_condenseur2
             annotation (Placement(transformation(extent={{-150,22},{-192,66}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLossWaterIn(                           K=35, Q(fixed=false,
        start=250),
    Pm(start=20000000))      annotation (Placement(transformation(extent={{-99,
            -48},{-79,-28}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLossWaterOut(                           K=30, Q(fixed=false,
        start=250),
    Pm(start=20000000))        annotation (Placement(transformation(extent={{
            -80,34},{-100,54}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(
    option_temperature=1,
    P0=220e5,
    h0=900e3,
    T0=482.87)
    annotation (Placement(transformation(extent={{-192,-16},{-150,-60}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.RefQ refQ(Q0=53)
    annotation (Placement(transformation(extent={{-115,34},{-135,54}}, rotation
          =0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps Debit_eauA(
      Table=[0,260; 378,260; 390,238; 438,275; 507,135; 936,65; 1404,50; 1872,
        50])       annotation (Placement(transformation(extent={{-195,78},{-175,
            98}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Level(k=0.50)
                          annotation (Placement(transformation(extent={{135,
            -152},{113,-130}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.IdealCheckValve checkValve
    annotation (Placement(transformation(extent={{-100,122},{-84,138}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss
    singularPressureLossPurge(                          K=1e-3,
    T(fixed=false, start=461.56),
    Q(fixed=false, start=35),
    Pm(start=3900000))   annotation (Placement(transformation(
        origin={54,-138},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps
    Pression_purge(Table=[0,10e5; 378,10e5; 418,7e5; 1145,3.9e5; 2000,3.9e5])
                   annotation (Placement(transformation(extent={{162,-178},{182,
            -158}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe PressureLoss_Steam(
    lambda(fixed=false) = 0.03,
    Q(fixed=false, start=35),
    L=10,
    D=0.1)               annotation (Placement(transformation(extent={{-48,162},
            {30,98}}, rotation=0)));
  InstrumentationAndControl.Blocks.Tables.Table1DTemps Pression_Turbine1(Table=
        [0,41.19e5; 378,41.19e5; 418,21.e5; 1145,5.e5; 2000,5.e5])
                   annotation (Placement(transformation(extent={{-195,160},{
            -175,180}}, rotation=0)));
  InstrumentationAndControl.Blocks.Tables.Table1DTemps Pression_eauA2(
                  Table=[0,222.72e5; 378,222.72e5; 438,230e5; 597,217e5; 1000,
        216e5; 1533,214e5; 1863,213.5e5; 2340,213e5; 2500,213e5])
                   annotation (Placement(transformation(extent={{-195,-8},{-175,
            12}}, rotation=0)));
  InstrumentationAndControl.Blocks.Tables.Table1DTemps Temperature_eauA1(Table=
        [0,462; 448,462; 1155,420.0; 2000,420.0])
                   annotation (Placement(transformation(extent={{-196,-84},{
            -176,-64}}, rotation=0)));
equation
  connect(ControlValve_eau.C2, Puit_condenseur1.C)
    annotation (Line(points={{108,-182},{124,-182}}, color={0,0,255}));
  connect(Puit_condenseur2.C,refQ. C2) annotation (Line(
      points={{-150,44},{-135,44}},
      color={255,0,0},
      thickness=0.5));
  connect(refQ.C1, singularPressureLossWaterOut.C2)
    annotation (Line(
      points={{-115,44},{-100,44}},
      color={255,0,0},
      thickness=0.5));
  connect(sourceP1.C, singularPressureLossWaterIn.C1)
                                                annotation (Line(
      points={{-150,-38},{-99,-38}},
      color={0,0,255},
      thickness=0.5));
  connect(singularPressureLossWaterOut.C1, WaterHeating.Ce2)
    annotation (Line(
      points={{-80,44},{-64,44},{-64,43.92},{-58,43.92}},
      color={255,0,0},
      thickness=0.5));
  connect(singularPressureLossWaterIn.C2, WaterHeating.Ce1)
                                                      annotation (Line(
      points={{-79,-38},{-58,-38},{-58,-38.85}},
      color={0,0,255},
      thickness=0.5));
  connect(sourceP.C, checkValve.C1) annotation (Line(
      points={{-150,130},{-100,130}},
      color={127,0,0},
      thickness=1));
  connect(singularPressureLossPurge.C1, WaterHeating.C2ex)
    annotation (Line(points={{54,-128},{54,-90},{52,-90}}));
  connect(Pression_purge.y, Puit_condenseur1.IPressure)
    annotation (Line(points={{183,-168},{196,-168},{196,-182},{151,-182}}));
  connect(checkValve.C2, PressureLoss_Steam.C1)         annotation (Line(
      points={{-84,130},{-48,130}},
      color={127,0,0},
      thickness=1));
  connect(WaterHeating.C1vap, PressureLoss_Steam.C2) annotation (Line(
      points={{52,96},{52,130},{30,130}},
      color={127,0,0},
      thickness=1));
  connect(singularPressureLossPurge.C2, ControlValve_eau.C1) annotation (Line(
        points={{54,-148},{54,-182},{88,-182}}, color={0,0,255}));
  connect(Pression_Turbine1.y, sourceP.IPressure) annotation (Line(points={{
          -174,170},{-174,152},{-190,152},{-190,130},{-181.5,130}}));
  connect(Pression_eauA2.y, sourceP1.IPressure) annotation (Line(points={{-174,
          2},{-174,-10},{-194,-10},{-194,-38},{-181.5,-38}}));
  connect(Temperature_eauA1.y, sourceP1.ITemperature)
    annotation (Line(points={{-175,-74},{-171,-74},{-171,-49}}));
  connect(Debit_eauA.y, refQ.IMassFlow)
    annotation (Line(points={{-174,88},{-125,88},{-125,55}}));
  connect(Level.y, ControlValve_eau.Ouv)
    annotation (Line(points={{111.9,-141},{98,-141},{98,-165}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -200},{200,200}}), graphics={
        Text(
          extent={{-124,222},{130,162}},
          lineColor={0,0,255},
          textString=
               "1 Ouv et 1 Cvmax =false  , Qvap et niveau=true ou P cavite"),
        Text(
          extent={{-90,-188},{102,-220}},
          lineColor={0,0,255},
          textString=
               "COP0l_coef_h =false  , T_Dp_purge=true"),
        Text(
          extent={{-202,-196},{-100,-210}},
          lineColor={0,0,255},
          textString=
               "Qvap=true  ==> Erreur")}));
end TestDynamicWaterHeating;