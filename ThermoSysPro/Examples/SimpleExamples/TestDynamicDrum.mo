within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicDrum
  parameter Modelica.SIunits.MassFlowRate Qin(fixed=false,start=80)
    "Mass flow rate";
  parameter ThermoSysPro.Units.Cv CvmaxWater(fixed=false,start=670)
    "Maximum CV (active if mode_caract=0)";
  parameter Real LambdaPipe(fixed=false,start=0.085)
    "Friction pressure loss coefficient (active if lambda_fixed=true)";

  ThermoSysPro.WaterSteam.Volumes.DynamicDrum Drum(
    Vv(start=39),
    Vertical=false,
    hl(start=1454400),
    hv(start=2.658e6),
    xv(start=0.01),
    rhol(start=670),
    rhov(start=78),
    P0=13000000,
    P(start=13000000, fixed=true),
    Tp(start=592.6),
    zl(fixed=true, start=1.05))
                     annotation (Placement(transformation(extent={{-61,16},{1,
            78}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve FeedwaterValve(
    Cv(start=335),
    C1(
      h_vol(start=1400e3),
      h(start=1400e3),
      P(start=13300000),
      Q(start=79.5)),
    Q(start=79.5),
    rho(start=888),
    h(start=1400000),
    Cvmax=CvmaxWater,
    Pm(start=13100000))
                     annotation (Placement(transformation(extent={{-120,74},{
            -100,94}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve SteamValve(
    Cvmax(fixed=true) = 50000,
    Cv(start=25000),
    Q(start=79.5),
    rho(start=78.5),
    Pm(start=12900000),
    h(start=2657930))
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
    P(start={13007000,13006600,13006000,13005500,13005000,13004500,13004000,13003000,
          13002000,13001000,13000000,12999990}),
    D=0.03,
    ntubes=1400,
    h(start={1400e3,1450e3,1500e3,1550e3,1600e3,1650e3,1700e3,1750e3,1800e3,1850e3,
          1900e3,1950e3}),
    L=20,
    Q(start=fill(130, 11)))
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
    C1(P(start=130e5)),
    mode=1,
    Q(fixed=true, start=130),
    lambda=LambdaPipe)
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
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkQ(Q0=75)
    annotation (Placement(transformation(extent={{126,68},{146,88}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    SteamMassFlowRate(k=Qin)
    annotation (Placement(transformation(extent={{100,120},{120,140}}, rotation
          =0)));
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
  connect(SteamMassFlowRate.y, sinkQ.IMassFlow)
    annotation (Line(points={{121,130},{136,130},{136,83}}));
  annotation (
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
