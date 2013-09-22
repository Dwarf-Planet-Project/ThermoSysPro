within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicDrum

  ThermoSysPro.WaterSteam.Volumes.DynamicDrum Drum(
    Vv(start=39),
    Vertical=false,
    zl(fixed=true, start=1.05),
    hl(start=1400000),
    hv(start=2689980),
    Tp(start=500),
    P0=130e5,
    P(start=13000000, fixed=true))
                     annotation (Placement(transformation(extent={{-61,16},{1,
            78}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve FeedwaterValve(
    Cv(start=100),
    C1(
      P(start=130e5),
      h_vol(start=1400e3),
      Q(start=75),
      h(start=1400e3)),
    Cvmax(fixed=false) = 200)
                     annotation (Placement(transformation(extent={{-120,74},{
            -100,94}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve SteamValve(
    Pm(start=132e5),
    Cvmax(fixed=true) = 50000,
    Cv(start=25000))
    annotation (Placement(transformation(extent={{40,74},{60,94}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauBallon(k(fixed=true) = 0.5)
    annotation (Placement(transformation(extent={{-160,120},{-140,140}},
          rotation=0)));
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicTwoPhaseFlowPipe
    TubeEcranBoucleEvaporatoire(
    T0=fill(400, 10),
    heb(start={10409,10268,10127,9985,9842,9698,9552,9406,9258,9111}),
    advection=false,
    z2=10,
    simplified_dynamic_energy_balance=false,
    P(start={13000000,13000000,13000000,13000000,13000000,13000000,13000000,
          13000000,13000000,13000000,13000000,13000000}),
    D=0.03,
    ntubes=1400,
    h(start={1400e3,1400e3,1400e3,1400e3,1400e3,1400e3,1400e3,1400e3,1400e3,
          1400e3,1400e3,1400e3}),
    L=20,
    Q(start=fill(150, 11)))
                     annotation (Placement(transformation(
        origin={6,-28},
        extent={{-10,10},{10,-10}},
        rotation=90)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource SourceC3(
    option_temperature=2,
    T0={290,290,290,290,290,290,290,290,290,290},
    W0={1e7,1e7,1e7,1e7,1e7,1e7,1e7,1e7,1e7,1e7})
    annotation (Placement(transformation(
        origin={36,-28},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.Thermal.HeatTransfer.HeatExchangerWall heatExchangerWall(Ns=10, L=20)
    annotation (Placement(transformation(
        origin={18,-28},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe(
    L=20,
    z1=20,
    lambda(fixed=false) = 0.03,
    C1(P(start=130e5)),
    mode=1,
    Q(fixed=true, start=130))
             annotation (Placement(transformation(
        origin={-66,-28},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauBallon1(k(fixed=true) = 0.5)
    annotation (Placement(transformation(extent={{0,120},{20,140}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(h0=1400000,
    P0(fixed=true) = 13200000,
    option_temperature=2)
           annotation (Placement(transformation(extent={{-196,68},{-176,88}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkQ(Q0(fixed=false) = 75)
    annotation (Placement(transformation(extent={{126,68},{146,88}}, rotation=0)));
equation
  connect(Drum.Cv, SteamValve.C1)
    annotation (Line(points={{1,78},{40,78}}, color={0,0,255}));
  connect(FeedwaterValve.C2, Drum.Ce1)
    annotation (Line(points={{-100,78},{-61,78}}, color={0,0,255}));
  connect(Drum.Cd, lumpedStraightPipe.C1) annotation (Line(points={{-61,16},{
          -66,16},{-66,-18}}, color={0,0,255}));
  connect(heatExchangerWall.WT1, SourceC3.C) annotation (Line(points={{20,-28},
          {26.2,-28}}, color={191,95,0}));
  connect(Drum.Cm, TubeEcranBoucleEvaporatoire.C2)
    annotation (Line(points={{1,16},{6,16},{6,-18}}));
  connect(TubeEcranBoucleEvaporatoire.CTh, heatExchangerWall.WT2) annotation (Line(
        points={{9,-28},{16,-28}}, color={191,95,0}));
  connect(ConsigneNiveauBallon.y, FeedwaterValve.Ouv)
    annotation (Line(points={{-139,130},{-110,130},{-110,95}}, smooth=Smooth.None));
  connect(sourceP.C, FeedwaterValve.C1)  annotation (Line(
      points={{-176,78},{-120,78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SteamValve.C2, sinkQ.C) annotation (Line(
      points={{60,78},{126,78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TubeEcranBoucleEvaporatoire.C1, lumpedStraightPipe.C2)
    annotation (Line(points={{6,-38},{6,-70},{-66,-70},{-66,-38}}));
  connect(ConsigneNiveauBallon1.y, SteamValve.Ouv)
    annotation (Line(points={{21,130},{50,130},{50,95}}, smooth=Smooth.None));
  annotation (experiment(stopTime=1000),
    Window(
      x=0.43,
      y=0,
      width=0.57,
      height=0.63),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-200,-100},{140,200}},
        grid={2,2}), graphics));
end TestDynamicDrum;
