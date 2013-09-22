within ThermoSysPro.Examples.CombinedCyclePowerPlant;
model CombinedCycle_Load_100_50
  "CCPP model to simulate a load variation from 100% to 50%"

  ThermoSysPro.WaterSteam.Volumes.DynamicDrum BallonHP(
    L=16.27,
    Vertical=false,
    hl(fixed=false),
    hv(fixed=false),
    Vv(fixed=false),
    R=1.05,
    xmv(fixed=false),
    P(fixed=false, start=127.032e5),
    zl(start=1.05, fixed=true),
    Kvl=0,
    Mp=5000,
    Kpa=5)           annotation (Placement(transformation(extent={{38,10},{-2,
            50}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationHP(Cvmax(fixed=
          false) = 135)
                 annotation (Placement(transformation(extent={{78,46},{58,66}},
          rotation=0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_vanne_vapeurHP(                                                              k=0.5)
    annotation (Placement(transformation(extent={{-18,70},{-28,78}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurHP(
    Cvmax=47829.4,
    mode=0)      annotation (Placement(transformation(extent={{-22,46},{-42,66}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeHP(
    z2=0,
    mode=1,
    K(fixed=false) = 720.183,
    Q(start=150, fixed=true),
    z1=10.83)
            annotation (Placement(transformation(
        origin={28,-90},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapHP(mode=1, V=5)
                                           annotation (Placement(transformation(
          extent={{8,-100},{-12,-80}}, rotation=0)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EvaporateurHP(
    Dint=32.8e-3,
    Ntubes=1476,
    L=20.7,
    ExchangerWall(e=0.0026, lambda=47),
    Ns=3,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z2=10.83,
      option_temperature=2,
      continuous_flow_reversal=true,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=0.038,
      step_L=0.092,
      step_T=0.0869,
      St=1,
      Fa=1,
      K(fixed=true, start=37.69),
      CSailettes=11.86442072,
      p_rho=1.05))        annotation (Placement(transformation(
        origin={-14,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EconomiseurHP4(
    Ns=3,
    L=20.726,
    Dint=0.0266,
    Ntubes=246,
    ExchangerWall(e=0.0026, lambda=47),
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=10.83,
      z2=0,
      option_temperature=2,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=0.0318,
      step_L=0.111,
      step_T=0.0869,
      St=1,
      Fa=1,
      CSailettes=11.39069779,
      K(fixed=true, start=47.53),
      p_rho=1.06))        annotation (Placement(transformation(
        origin={86,-50},
        extent={{20,-20},{-20,20}},
        rotation=270)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    SurchauffeurHP1(
    Ns=3,
    L=20.4,
    Dint=0.0324,
    Ntubes=246,
    ExchangerWall(e=0.0028, lambda=37.61),
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=10.83,
      option_temperature=2,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=0.038,
      step_L=0.111,
      step_T=0.0869,
      St=1,
      Fa=1,
      CSailettes=10.25056,
      K(fixed=true, start=34.71),
      p_rho=1.04))        annotation (Placement(transformation(
        origin={-54,-50},
        extent={{-20,20},{20,-20}},
        rotation=270)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EconomiseurHP3(
    Dint=26.6e-3,
    Ntubes=1476,
    Ns=3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Dext=31.8e-3,
      step_L=74e-3,
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      CSailettes=12.451,
      K(fixed=true, start=36.03),
      p_rho=1.08))
                  annotation (Placement(transformation(
        origin={206,-50},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EconomiseurHP2(
    Dint=26.6e-3,
    Ns=3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.767,
    Ntubes=1107,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Dext=31.8e-3,
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      step_L=111e-3,
      CSailettes=2.76134577,
      K(fixed=true, start=65.53),
      p_rho=1.11))
                  annotation (Placement(transformation(
        origin={406,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EconomiseurHP1(
    Dint=26.6e-3,
    Ns=3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ntubes=1107,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Dext=31.8e-3,
      step_L=74e-3,
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      CSailettes=8.30057632,
      K(fixed=true, start=40.24),
      p_rho=1.13))
                  annotation (Placement(transformation(
        origin={526,-50},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    SurchauffeurHP2(
    Ns=3,
    L=20.4,
    Dint=32e-3,
    Ntubes=246,
    ExchangerWall(e=3e-3, lambda=27),
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.83,
      inertia=true),
    ExchangerFlueGasesMetal(
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      Dext=38e-3,
      step_L=111e-3,
      K(fixed=true, start=34.74),
      CSailettes=10.2505424803872,
      p_rho=1.02))
                  annotation (Placement(transformation(
        origin={-174,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    SurchauffeurHP3(
    Ns=3,
    L=20.4,
    Ntubes=246,
    ExchangerWall(lambda=27, e=5e-3),
    Dint=28e-3,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.726,
      inertia=true),
    ExchangerFlueGasesMetal(
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      Dext=38e-3,
      step_L=111e-3,
      K(fixed=true, start=49.33),
      CSailettes=6.59672842597229,
      p_rho=1))   annotation (Placement(transformation(
        origin={-294,-50},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.Volumes.DynamicDrum BallonMP(
    L=16.27,
    Vertical=false,
    P0=27.29e5,
    hl(fixed=false),
    hv(fixed=false),
    Vv(fixed=false),
    R=1.05,
    P(fixed=false, start=37.3341e5),
    zl(start=1.05, fixed=true),
    Kvl=0,
    Kpa=5,
    Mp=5000)         annotation (Placement(transformation(extent={{358,10},{320,
            50}}, rotation=0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_vanne_vapeurMP(                                                              k=0.5)
    annotation (Placement(transformation(extent={{304,70},{292,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationMP(Cvmax(fixed=
          false) = 70)
                 annotation (Placement(transformation(extent={{398,46},{378,66}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurMP(
    Pm(fixed=false),
    h(fixed=false),
    Cvmax=47829.4,
    mode=0)      annotation (Placement(transformation(extent={{298,46},{278,66}},
          rotation=0)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EvaporateurMP(
    Dint=32.8e-3,
    L=20.767,
    Ntubes=738,
    ExchangerWall(e=2.6e-3, lambda=47),
    Ns=3,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=0,
      z2=10.83,
      continuous_flow_reversal=true,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      K(fixed=true, start=30.22),
      Dext=38e-3,
      step_L=111e-3,
      step_T=86.9e-3,
      Fa=1,
      CSailettes=10.0676093,
      p_rho=1.1))         annotation (Placement(transformation(
        origin={306,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeMP(
    z2=0,
    z1=10.83,
    mode=1,
    K(fixed=false) = 1090.96,
    Q(start=150, fixed=true))
            annotation (Placement(transformation(
        origin={348,-90},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapMP(mode=1, V=5)
                                           annotation (Placement(transformation(
          extent={{328,-100},{308,-80}}, rotation=0)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EconomiseurMP(
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ns=3,
    Dint=26.6e-3,
    Ntubes=246,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=10.767,
      z2=0,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_L=111e-3,
      step_T=86.9e-3,
      Fa=1,
      Dext=31.8e-3,
      K(fixed=true, start=47.78),
      CSailettes=7.16188651,
      p_rho=1.12))        annotation (Placement(transformation(
        origin={466,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    SurchauffeurMP1(
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ns=3,
    Dint=32.8e-3,
    Ntubes=123,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z2=0,
      z1=10.77,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_L=111e-3,
      step_T=86.9e-3,
      Fa=1,
      Dext=31.8e-3,
      K(fixed=true, start=22.09),
      CSailettes=14.46509765,
      p_rho=1.07))        annotation (Placement(transformation(
        origin={146,-50},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.Volumes.VolumeB MelangeurHPMP
    annotation (Placement(transformation(
        origin={148,-110},
        extent={{-10,10},{10,-10}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    SurchauffeurMP2(
    Ns=3,
    L=20.4,
    Dint=39.3e-3,
    Ntubes=369,
    ExchangerWall(e=2.6e-3, lambda=36.86),
    TwoPhaseFlowPipe(
      advection=false,
      z2=0,
      z1=10.83,
      rugosrel=1e-5,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      Dext=44.5e-3,
      step_L=92e-3,
      K(fixed=true, start=45.22),
      CSailettes=5.814209831,
      p_rho=1.03))        annotation (Placement(transformation(
        origin={-114,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    SurchauffeurMP3(
    Ns=3,
    L=20.4,
    Ntubes=369,
    Dint=45.6e-3,
    ExchangerWall(e=2.6e-3, lambda=27),
    TwoPhaseFlowPipe(
      advection=false,
      z2=0,
      z1=10.83,
      rugosrel=1e-5,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      step_L=92e-3,
      Dext=50.8e-3,
      K(fixed=true, start=43.23),
      CSailettes=5.695842178,
      p_rho=1.01))        annotation (Placement(transformation(
        origin={-234,-50},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.Volumes.DynamicDrum BallonBP(
    Vertical=false,
    P0=5e5,
    Vv(fixed=false),
    L=8,
    hl(fixed=false),
    hv(fixed=false),
    R=2,
    P(fixed=false, start=539458),
    zl(start=1.75, fixed=true),
    Kvl=0,
    Kpa=5,
    Mp=5000)         annotation (Placement(transformation(extent={{618,10},{578,
            50}}, rotation=0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_vanne_vapeurBP(                                                              k=0.5)
    annotation (Placement(transformation(extent={{666,76},{654,86}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurBP(
    Cvmax(fixed=false) = 32000,
    p_rho=3)     annotation (Placement(transformation(extent={{558,46},{538,66}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationBP(
    h(fixed=false),
    Pm(fixed=false, start=5.0698e5),
    Cvmax=285)   annotation (Placement(transformation(extent={{650,44},{630,64}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeBP(
    z2=0,
    z1=10.767,
    Q(start=50, fixed=false),
    K=32766,
    mode=1) annotation (Placement(transformation(
        origin={610,-90},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapBP(h(start=642e3), mode=1,
    V=5)                                   annotation (Placement(transformation(
          extent={{592,-100},{572,-80}}, rotation=0)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EvaporateurBP(
    Dint=32.8e-3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ntubes=984,
    Ns=3,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=0,
      z2=10.767,
      continuous_flow_reversal=true,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=38e-3,
      step_T=86.9e-3,
      Fa=1,
      step_L=138e-3,
      K(fixed=true, start=30.62),
      CSailettes=11.07985,
      p_rho=1.14))        annotation (Placement(transformation(
        origin={566,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_ballonBP(                                                              k=1)
    annotation (Placement(transformation(extent={{742,6},{728,18}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931)
                 annotation (Placement(transformation(extent={{710,-14},{730,6}},
          rotation=0)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    SurchauffeurBP(
    Ns=3,
    L=20.726,
    Dint=39.3e-3,
    Ntubes=123,
    ExchangerWall(e=2.6e-3, lambda=47),
    TwoPhaseFlowPipe(
      advection=false,
      z2=0,
      rugosrel=1e-5,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      Dext=44.5e-3,
      step_L=222.1e-3,
      K(fixed=true, start=30.46),
      CSailettes=3.25763059984175,
      p_rho=1.09))        annotation (Placement(transformation(
        origin={266,-50},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP PuitsFumees(P0=1.013e5)
    annotation (Placement(transformation(
        origin={722,-50},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases
    EconomiseurBP(
    Ns=3,
    Dint=32.8e-3,
    ExchangerWall(e=2.6e-3, lambda=47),
    Ntubes=3444,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=0,
      z2=10.767,
      inertia=true),
    L=20.726,
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      Dext=38e-3,
      step_L=92e-3,
      K(fixed=true, start=31.53),
      CSailettes=11.673758598919,
      p_rho=1.15))        annotation (Placement(transformation(
        origin={680,-50},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineHP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 7618660.65374636,
    Pe(fixed=true, start=124.31e5),
    eta_stato=1,
    eta_is(start=0.88057),
    Qmax=140,
    eta_is_nom=0.88057,
    eta_is_min=0.75)
              annotation (Placement(transformation(extent={{-2,-250},{38,-210}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineMP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 278905.664031036,
    Pe(fixed=true, start=25.485e5),
    eta_stato=1,
    eta_is(start=0.9625),
    Qmax=150,
    eta_is_nom=0.9625,
    eta_is_min=0.75)
                annotation (Placement(transformation(extent={{318,-250},{358,
            -210}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPostTMP1
                                           annotation (Placement(transformation(
        origin={418,-230},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineBP(
    W_fric=1,
    Cst(fixed=false) = 13491.6445678148,
    Pe(fixed=true, start=4.768e5),
    eta_stato=1,
    eta_is(start=0.9538),
    Qmax=150,
    eta_is_nom=0.9538,
    eta_is_min=0.75)
                annotation (Placement(transformation(extent={{576,-250},{616,
            -210}}, rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitHP(
                                                    alpha=2)
    annotation (Placement(transformation(
        origin={-292,-100},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitMP(
                                                    alpha=2)
    annotation (Placement(transformation(
        origin={-232,-100},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitHP(
                                                    alpha=0.5)
    annotation (Placement(transformation(extent={{114,-180},{134,-160}},
          rotation=0)));
  ThermoSysPro.WaterSteam.HeatExchangers.SimpleDynamicCondenser Condenseur(
    D=0.018,
    V=1000,
    A=100,
    lambda=0.01,
    ntubes=28700,
    continuous_flow_reversal=true,
    P(fixed=false, start=6136),
    yNiveau(signal(fixed=false, start=1.5)),
    Vf0=0.15,
    steady_state=false)
    annotation (Placement(transformation(extent={{639,-384},{719,-304}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ SourceCaloporteur(
    h0=113.38e3, Q0=29804.5)     annotation (Placement(transformation(extent={{
            572,-377},{620,-329}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsCaloporteur
    annotation (Placement(transformation(extent={{736,-374},{780,-330}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK1(    K=1e-4)
    annotation (Placement(transformation(extent={{640,-240},{660,-220}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeCond1(mode=1)
    annotation (Placement(transformation(
        origin={902,-318},
        extent={{10,-10},{-10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeKCond1(    K=1e-4, mode=1)
    annotation (Placement(transformation(
        origin={902,-270},
        extent={{12,-12},{-12,12}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Volumes.VolumeA VolumeAlimMPHP(mode=1)
                                           annotation (Placement(transformation(
          extent={{742,-20},{762,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimMP(
    a3=350,
    b1(fixed=true) = -3.7751,
    a1=-244551,
    Q(fixed=false),
    mode=1) annotation (Placement(transformation(extent={{804,-20},{824,0}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimHP(
    a3=1600,
    a1=-28056.2,
    b1=-12.7952660447433,
    Q(fixed=false),
    mode=1)  annotation (Placement(transformation(extent={{804,-60},{824,-40}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitBP(
                                                    alpha=0.5)
    annotation (Placement(transformation(extent={{872,-328},{886,-308}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitBP(
                                                    alpha=2)
    annotation (Placement(transformation(
        origin={268,-100},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss PerteChargeZero2(
    z2=0,
    mode=0,
    z1=0,
    C1(P(fixed=true, start=5.0185e5)),
    K(fixed=false) = 1e-4)
            annotation (Placement(transformation(
        origin={344,-278},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK3(    K=1e-4, mode=1)
    annotation (Placement(transformation(
        origin={780,-50},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK8(    K=1e-4, mode=1)
    annotation (Placement(transformation(
        origin={780,-10},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Machines.Generator Alternateur
    annotation (Placement(transformation(extent={{402,-448},{522,-348}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK(
                                                         K=1e-4, mode=1)
    annotation (Placement(transformation(extent={{702,-446},{722,-426}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimBP(
    C2(P(fixed=false, start=22e5)),
    Qv(start=0.1),
    Q(start=194.502),
    mode=1,
    a1(fixed=true) = -6000,
    a3=400) annotation (Placement(transformation(extent={{742,-446},{762,-426}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK2(
                                                         K=1e-4, mode=1)
    annotation (Placement(transformation(extent={{840,-446},{860,-426}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_extraction(            mode=1, Cvmax=
        2000)    annotation (Placement(transformation(extent={{802,-440},{822,
            -420}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapHP
    annotation (Placement(transformation(
        origin={-58,8},
        extent={{-6,6},{6,-6}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauHP
    annotation (Placement(transformation(
        origin={91.5,32},
        extent={{6,-6.5},{-6,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauMP
    annotation (Placement(transformation(extent={{424,49},{409,63}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapMP
    annotation (Placement(transformation(
        origin={236,56},
        extent={{-8,8},{8,-8}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapBP
    annotation (Placement(transformation(
        origin={514,56},
        extent={{-8,8},{8,-8}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBP
    annotation (Placement(transformation(
        origin={663.5,34},
        extent={{6,-6.5},{-6,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBPsortie
    annotation (Placement(transformation(extent={{687,-11},{700,1}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauCondenseur
    annotation (Placement(transformation(
        origin={685.5,-412},
        extent={{-10,-6.5},{10,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapCondenseur
    annotation (Placement(transformation(
        origin={684.5,-264},
        extent={{-10,-6.5},{10,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss lumpedStraightPipeK2(  K(fixed=
          false) = 10, C1(P(fixed=true, start=27.267e5)))
    annotation (Placement(transformation(extent={{114,-120},{94,-100}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineHP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 8000,
    C1(P(fixed=true, start=126.81e5)))
                 annotation (Placement(transformation(extent={{-124,-234},{-104,
            -214}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauEauHP(                                                              k=1.05)
    annotation (Placement(transformation(extent={{-158,113},{-124,131}},
          rotation=0)));
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl
    regulation_Niveau_HP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500)
    annotation (Placement(transformation(extent={{-40,106},{-20,126}}, rotation
          =0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauEauMP(                                                              k=1.05)
    annotation (Placement(transformation(extent={{173,113},{207,131}}, rotation
          =0)));
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl
    regulation_Niveau_MP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500)
    annotation (Placement(transformation(extent={{262,106},{282,126}}, rotation
          =0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauEauBP(                                                              k=1.75)
    annotation (Placement(transformation(extent={{470,126},{504,144}}, rotation
          =0)));
  Control.Drum_LevelControl regulation_Niveau_BP(
                     add(k1=-1, k2=+1), pIsat(Ti=500),
    Ti=10)
    annotation (Placement(transformation(extent={{568,108},{588,128}}, rotation
          =0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauCondenseur1(                                 k=1.5)
    annotation (Placement(transformation(extent={{716,-246},{740,-230}},
          rotation=0)));
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Condenser_LevelControl
    regulation_Niveau_Condenseur(pIsat(Ti=500), add(k1=+1, k2=-1))
                                 annotation (Placement(transformation(extent={{
            758,-282},{778,-262}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps
    ConstantVanneTurbineHP(Table=[0,0.8; 10,0.8; 600,0.8; 650,0.8; 3000,0.8;
        3100,0.8]) annotation (Placement(transformation(extent={{-208,-216},{
            -138,-142}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp(
    Initialvalue=1400,
    Finalvalue=1000,
    Duration=1000,
    Starttime=200000)
                   annotation (Placement(transformation(extent={{944,-42},{906,
            -10}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP(
    Initialvalue=1400,
    Finalvalue=1000,
    Duration=1000,
    Starttime=200000)
                   annotation (Placement(transformation(extent={{945,-96},{907,
            -64}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesBP(
    Initialvalue=1400,
    Finalvalue=1000,
    Duration=1000,
    Starttime=200000)
                   annotation (Placement(transformation(extent={{945,-458},{907,
            -426}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP1_2(
    mode=1,
    V=1,
    h0=988332,
    h(start=988332),
    P0=70.1e5,
    P(start=70.1e5),
    dynamic_mass_balance=true)            annotation (Placement(transformation(
          extent={{456,-98},{436,-78}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP2_3(
    mode=1,
    V=1,
    h0=983786,
    h(start=983786),
    P0=70.0e5,
    P(start=70.0e5),
    dynamic_mass_balance=true)            annotation (Placement(transformation(
          extent={{252,-20},{232,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP1(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931)
                 annotation (Placement(transformation(extent={{754,-98},{730,
            -122}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP2(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931)
                 annotation (Placement(transformation(extent={{804,-138},{780,
            -162}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp1(
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000,
    Starttime=200000)
                     annotation (Placement(transformation(extent={{946,-150},{
            908,-118}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP1(
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000,
    Starttime=200000)
                     annotation (Placement(transformation(extent={{946,-194},{
            908,-162}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeD VolumePreTHP(
    P0=127e5,
    h0=3e6,
    P(start=127e5),
    h(start=3e6),
    dynamic_mass_balance=true)        annotation (Placement(transformation(
        origin={-52,-230},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPreTMP(
    h0=3523910,
    h(start=3523910),
    P0=24e5,
    P(start=24e5),
    dynamic_mass_balance=true)            annotation (Placement(transformation(
        origin={-50,-314},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineMP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 1500,
    C1(P(fixed=true, start=25.486e5)))
                 annotation (Placement(transformation(extent={{-124,-318},{-104,
            -298}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps
    ConstantVanneTurbineMP(Table=[0,0.8; 10,0.8; 600,0.8; 2000,0.8; 3000,0.8;
        3100,0.8]) annotation (Placement(transformation(extent={{-208,-300},{
            -138,-226}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(T0={303.16})
    annotation (Placement(transformation(extent={{5,68},{31,98}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource1(T0={303.16})
    annotation (Placement(transformation(extent={{326,68},{352,98}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource2(T0={303.16})
    annotation (Placement(transformation(extent={{585,64},{611,94}}, rotation=0)));
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ sourceCombustible(
    Cp=1282,
    Hum=0,
    Xo=0,
    Xn=0,
    Xs=0,
    Xc=0.7345402123,
    Xh=0.2265526676,
    rho=0.838,
    T0=454.058203125,
    LHV=47274523.4375,
    Q0=13.4368286133)
          annotation (Placement(transformation(extent={{-420,26},{-384,62}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourceEau(Q0=1e-4)
          annotation (Placement(transformation(extent={{-470,22},{-442,52}},
          rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Humidite(k=0.9231689453125)
    annotation (Placement(transformation(extent={{-504,-16},{-483,4}}, rotation
          =0)));
  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ SourceFumees(
    Xso2=0,
    T0=297.0679077148,
    Xco2=0,
    Xh2o=0,
    Xo2=0.20994,
    P0=1.013e5,
    Q0=600)
    annotation (Placement(transformation(extent={{-538,-73},{-494,-27}},
          rotation=0)));
  ThermoSysPro.FlueGases.TAC.GasTurbine GasTurbine(
    Wpth=1e6,
    comp_tau_n=13.784,
    comp_eff_n=0.87375,
    Kcham=1.114801,
    exp_tau_n=0.0816,
    TurbQred=0.01787,
    exp_eff_n=0.89)
    annotation (Placement(transformation(extent={{-468,-114},{-338,14}},
          rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampeQfuel(
    Initialvalue=13.4368286133,
    Starttime=200,
    Finalvalue=8.25,
    Duration=800)    annotation (Placement(transformation(extent={{-548,60},{
            -528,80}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampeIQair(
    Starttime=200,
    Duration=800,
    Initialvalue=594,
    Finalvalue=497.5)
                   annotation (Placement(transformation(extent={{-548,-16},{
            -528,4}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Gain Gain_2GasTurbine(Gain=
       2) annotation (Placement(transformation(extent={{-18,-448},{2,-428}},
          rotation=0)));
equation
  connect(SurchauffeurHP3.Cws1, SurchauffeurHP2.Cws2)
    annotation (Line(points={{-294,-30},{-294,-10},{-174,-10},{-174,-30}},
        color={255,0,0}));
  connect(SurchauffeurHP2.Cws1, SurchauffeurHP1.Cws2)
    annotation (Line(points={{-174,-70},{-174,-90},{-54,-90},{-54,-70}}, color=
          {255,0,0}));
  connect(constante_vanne_vapeurHP.y, vanne_vapeurHP.Ouv)
    annotation (Line(points={{-28.5,74},{-32,74},{-32,67}}));
  connect(vanne_vapeurHP.C1, BallonHP.Cv)
    annotation (Line(points={{-22,50},{-2,50}}, color={255,0,0}));
  connect(GainChargeHP.C1, BallonHP.Cd)
    annotation (Line(points={{38,-90},{48,-90},{48,10},{38,10}}, color={255,128,
          0}));
  connect(BallonHP.Cm, EvaporateurHP.Cws2)
    annotation (Line(points={{-2,10},{-14,10},{-14,-30}}));
  connect(VolumeEvapHP.Cs, EvaporateurHP.Cws1)
    annotation (Line(points={{-12,-90},{-12,-70},{-14,-70}}, color={255,128,0}));
  connect(VolumeEvapHP.Ce1, GainChargeHP.C2)
                                      annotation (Line(points={{8,-90},{18,-90}},
        color={255,128,0}));
  connect(EconomiseurHP4.Cws1, EconomiseurHP3.Cws2)
    annotation (Line(points={{86,-70},{86,-82},{206,-82},{206,-70}}));
  connect(BallonMP.Cm, EvaporateurMP.Cws2)
    annotation (Line(points={{320,10},{306,10},{306,-30}}));
  connect(EvaporateurMP.Cws1, VolumeEvapMP.Cs)
    annotation (Line(points={{306,-70},{306,-80},{308,-80},{308,-90}}, color={
          255,128,0}));
  connect(VolumeEvapMP.Ce1, GainChargeMP.C2)
    annotation (Line(points={{328,-90},{338,-90}}, color={255,128,0}));
  connect(constante_vanne_vapeurMP.y, vanne_vapeurMP.Ouv)
    annotation (Line(points={{291.4,75},{288,75},{288,67}}));
  connect(SurchauffeurHP1.Cfg2, EvaporateurHP.Cfg1)        annotation (Line(
      points={{-44,-50},{-24,-50}},
      color={0,0,0},
      thickness=1));
  connect(EvaporateurHP.Cfg2, EconomiseurHP4.Cfg1)        annotation (Line(
      points={{-4,-50},{76,-50}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP4.Cfg2, SurchauffeurMP1.Cfg1)          annotation (Line(
      points={{96,-50},{136,-50}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP1.Cfg2, EconomiseurHP3.Cfg1)           annotation (Line(
      points={{156,-50},{196,-50}},
      color={0,0,0},
      thickness=1));
  connect(EvaporateurMP.Cfg2, EconomiseurHP2.Cfg1)           annotation (Line(
      points={{316,-50},{396,-50}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP2.Cfg2, EconomiseurMP.Cfg1)           annotation (Line(
      points={{416,-50},{456,-50}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurMP.Cfg2, EconomiseurHP1.Cfg1)           annotation (Line(
      points={{476,-50},{516,-50}},
      color={0,0,0},
      thickness=1));
  connect(GainChargeMP.C1, BallonMP.Cd)
    annotation (Line(points={{358,-90},{368,-90},{368,10},{358,10}}, color={255,
          128,0}));
  connect(SurchauffeurMP2.Cfg2, SurchauffeurHP1.Cfg1)          annotation (Line(
      points={{-104,-50},{-64,-50}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP2.Cfg1, SurchauffeurHP2.Cfg2)           annotation (Line(
      points={{-124,-50},{-164,-50}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP3.Cfg2, SurchauffeurHP2.Cfg1)           annotation (Line(
      points={{-224,-50},{-184,-50}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurHP3.Cfg2, SurchauffeurMP3.Cfg1)           annotation (Line(
      points={{-284,-50},{-244,-50}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP3.Cws1,SurchauffeurMP2. Cws2)
    annotation (Line(points={{-234,-30},{-234,10},{-114,10},{-114,-30}}, color=
          {255,0,0}));
  connect(SurchauffeurMP1.Cws2, MelangeurHPMP.Ce2) annotation (Line(
      points={{146,-70},{146,-85},{148,-85},{148,-100}},
      color={255,0,0},
      pattern=LinePattern.None));
  connect(vanne_vapeurBP.C1, BallonBP.Cv)
    annotation (Line(points={{558,50},{578,50}}, color={255,0,0}));
  connect(EvaporateurBP.Cws1, VolumeEvapBP.Cs)  annotation (Line(points={{566,
          -70},{566,-90},{572,-90}}, color={255,128,0}));
  connect(VolumeEvapBP.Ce1, GainChargeBP.C2)
                                        annotation (Line(points={{592,-90},{600,
          -90}}, color={255,128,0}));
  connect(BallonBP.Cd, GainChargeBP.C1)
                                       annotation (Line(points={{618,10},{628,
          10},{628,-90},{620,-90}}, color={255,128,0}));
  connect(EconomiseurBP.Cfg2, PuitsFumees.C)     annotation (Line(
      points={{690,-50},{712.2,-50}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP3.Cfg2, SurchauffeurBP.Cfg1)  annotation (Line(
      points={{216,-50},{256,-50}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurBP.Cfg2, EvaporateurMP.Cfg1)  annotation (Line(
      points={{276,-50},{296,-50}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP1.Cfg2, EvaporateurBP.Cfg1) annotation (Line(
      points={{536,-50},{556,-50}},
      color={0,0,0},
      thickness=1));
  connect(EvaporateurBP.Cfg2, EconomiseurBP.Cfg1) annotation (Line(
      points={{576,-50},{670,-50}},
      color={0,0,0},
      thickness=1));
  connect(BallonBP.Cm, EvaporateurBP.Cws2)
    annotation (Line(points={{578,10},{566,10},{566,-30}}));
  connect(vanne_vapeurMP.C1, BallonMP.Cv)   annotation (Line(points={{298,50},{
          320,50}}, color={255,0,0}));
  connect(Vanne_alimentationMPHP.Ouv, constante_ballonBP.y)
    annotation (Line(points={{720,7},{720,12},{727.3,12}}));
  connect(SurchauffeurHP3.Cws2, DoubleDebitHP.Ce)
    annotation (Line(points={{-294,-70},{-294,-80},{-292,-80},{-292,-90}},
        color={255,0,0}));
  connect(SurchauffeurMP3.Cws2, DoubleDebitMP.Ce)
    annotation (Line(points={{-234,-70},{-234,-80},{-232,-80},{-232,-90}},
        color={255,0,0}));
  connect(VolumeCond1.Cs, perteChargeKCond1.C1) annotation (Line(points={{902,
          -308},{902,-282}}, color={0,0,255}));
  connect(Vanne_alimentationMPHP.C2, VolumeAlimMPHP.Ce1)
                                               annotation (Line(points={{730,
          -10},{742,-10}}, color={0,0,255}));
  connect(SurchauffeurBP.Cws2, DoubleDebitBP.Ce)
    annotation (Line(points={{266,-70},{266,-80},{268,-80},{268,-90}}, color={
          255,0,0}));
  connect(perteChargeK8.C2, PompeAlimMP.C1)
    annotation (Line(points={{790,-10},{797,-10},{797,-10},{804,-10}}, color={0,
          0,255}));
  connect(VolumeAlimMPHP.Cs1, perteChargeK8.C1)
    annotation (Line(points={{762,-10},{766,-10},{766,-10},{770,-10}}, color={0,
          0,255}));
  connect(VolumeAlimMPHP.Cs2, perteChargeK3.C1)
                                         annotation (Line(points={{752,-20},{
          752,-50},{770,-50}}, color={0,0,255}));
  connect(perteChargeK3.C2, PompeAlimHP.C1)
    annotation (Line(points={{790,-50},{804,-50}}, color={0,0,255}));
  connect(MelangeurPostTMP1.Ce2, PerteChargeZero2.C2) annotation (Line(points={
          {418,-239},{418,-278},{354,-278}}, color={255,0,0}));
  connect(perteChargeK.C2,PompeAlimBP. C1)
                                         annotation (Line(points={{722,-436},{
          742,-436}}, color={0,0,255}));
  connect(vanne_extraction.C2, perteChargeK2.C1) annotation (Line(points={{822,
          -436},{840,-436}}, color={0,0,255}));
  connect(vanne_alimentationHP.C1, CapteurDebitEauHP.C2)
    annotation (Line(points={{78,50},{86.3,50},{86.3,38.12}}));
  connect(vanne_vapeurHP.C2, CapteurDebitVapHP.C1) annotation (Line(points={{
          -42,50},{-53.2,50},{-53.2,14}}, color={255,0,0}));
  connect(CapteurDebitVapHP.C2, SurchauffeurHP1.Cws1) annotation (Line(points={
          {-53.2,1.88},{-53.2,-3.06},{-54,-3.06},{-54,-30}}, color={255,0,0}));
  connect(vanne_alimentationMP.C1, CapteurDebitEauMP.C2)
    annotation (Line(points={{398,50},{403.425,50},{403.425,50.4},{408.85,50.4}}));
  connect(CapteurDebitVapMP.C1, vanne_vapeurMP.C2) annotation (Line(points={{
          244,49.6},{260,49.6},{260,50},{278,50}}, color={255,0,0}));
  connect(CapteurDebitVapMP.C2, SurchauffeurMP1.Cws1) annotation (Line(points={
          {227.84,49.6},{146,49.6},{146,-30}}, color={255,0,0}));
  connect(CapteurDebitVapBP.C2, SurchauffeurBP.Cws1) annotation (Line(points={{
          505.84,49.6},{490,49.6},{490,-2},{266,-2},{266,-30}}, color={255,0,0}));
  connect(CapteurDebitVapBP.C1, vanne_vapeurBP.C2) annotation (Line(points={{
          522,49.6},{530,49.6},{530,50},{538,50}}, color={255,0,0}));
  connect(CapteurDebitEauBP.C2, vanne_alimentationBP.C1) annotation (Line(
        points={{658.3,40.12},{658.3,48},{650,48}}, color={0,0,255}));
  connect(CapteurDebitEauBPsortie.C2, Vanne_alimentationMPHP.C1) annotation (Line(
        points={{700.13,-9.8},{705.065,-9.8},{705.065,-10},{710,-10}}, color={0,
          0,255}));
  connect(CapteurDebitEauCondenseur.C2, perteChargeK.C1) annotation (Line(
        points={{680.3,-422.2},{680.3,-436},{702,-436}}, color={0,0,255}));
  connect(perteChargeK1.C2, CapteurDebitVapCondenseur.C1) annotation (Line(
        points={{660,-230},{679.3,-230},{679.3,-254}}, color={255,0,0}));
  connect(MelangeurHPMP.Ce1, MoitieDebitHP.Cs)
    annotation (Line(points={{148,-120},{148,-170},{134,-170}}, color={255,0,0}));
  connect(perteChargeK2.C2, MoitieDebitBP.Ce) annotation (Line(points={{860,
          -436},{862,-436},{862,-318},{872,-318}}, color={0,0,255}));
  connect(MoitieDebitBP.Cs, VolumeCond1.Ce3) annotation (Line(points={{886,-318},
          {892,-318}}, color={0,0,255}));
  connect(SurchauffeurMP2.Cws1, lumpedStraightPipeK2.C2)
    annotation (Line(points={{-114,-70},{-114,-110},{94,-110}}, color={255,0,0}));
  connect(lumpedStraightPipeK2.C1, MelangeurHPMP.Cs2)
    annotation (Line(points={{114,-110},{138.2,-110}}, color={255,0,0}));
  connect(DoubleDebitHP.Cs, vanne_entree_TurbineHP.C1) annotation (Line(points=
          {{-292,-110},{-292,-230},{-124,-230}}, color={255,0,0}));
  connect(DoubleDebitBP.Cs, PerteChargeZero2.C1) annotation (Line(points={{268,
          -110},{268,-278},{334,-278}}, color={255,0,0}));
  connect(PompeAlimBP.C2, vanne_extraction.C1) annotation (Line(points={{762,
          -436},{802,-436}}, color={0,0,255}));
  connect(BallonHP.yLevel,regulation_Niveau_HP. MesureNiveauEau)
    annotation (Line(points={{-4,30},{-68,30},{-68,125},{-40.5,125}}));
  connect(regulation_Niveau_HP.SortieReelle1, vanne_alimentationHP.Ouv)
    annotation (Line(points={{-19.5,107},{68,107},{68,67}}));
  connect(ConsigneNiveauEauMP.y,regulation_Niveau_MP. ConsigneNiveauEau)
    annotation (Line(points={{208.7,122},{234,122},{234,110},{261.5,110}}));
  connect(BallonMP.yLevel,regulation_Niveau_MP. MesureNiveauEau)
    annotation (Line(points={{318.1,30},{252,30},{252,125},{261.5,125}}));
  connect(regulation_Niveau_MP.SortieReelle1, vanne_alimentationMP.Ouv)
    annotation (Line(points={{282.5,107},{377.25,107},{377.25,67},{388,67}}));
  connect(ConsigneNiveauEauBP.y,regulation_Niveau_BP. ConsigneNiveauEau)
    annotation (Line(points={{505.7,135},{529.85,135},{529.85,112},{567.5,112}}));
  connect(BallonBP.yLevel,regulation_Niveau_BP. MesureNiveauEau)
    annotation (Line(points={{576,30},{518,30},{518,127},{567.5,127}}));
  connect(ConsigneNiveauCondenseur1.y, regulation_Niveau_Condenseur.ConsigneNiveauEau)
    annotation (Line(points={{741.2,-238},{752,-238},{752,-269},{757.5,-269}}));
  connect(regulation_Niveau_Condenseur.SortieReelle1, vanne_extraction.Ouv)
    annotation (Line(points={{778.5,-281},{812,-281},{812,-419}}));
  connect(CapteurDebitEauBP.C1, EconomiseurBP.Cws2)
    annotation (Line(points={{658.3,28},{660,28},{660,6},{680,6},{680,-30}}));
  connect(EconomiseurBP.Cws1, perteChargeKCond1.C2) annotation (Line(points={{
          680,-70},{680,-186},{902,-186},{902,-258}}));
  connect(CapteurDebitVapCondenseur.Measure, regulation_Niveau_Condenseur.MesureDebitVapeur)
    annotation (Line(points={{691.13,-264},{704,-264},{704,-280.9},{757.6,
          -280.9}}));
  connect(regulation_Niveau_Condenseur.MesureDebitEau,
    CapteurDebitEauCondenseur.Measure) annotation (Line(points={{757.45,-274.95},
          {750,-274.95},{750,-310},{792,-310},{792,-412},{692.13,-412}}));
  connect(ConstantVanneTurbineHP.y, vanne_entree_TurbineHP.Ouv)
    annotation (Line(points={{-134.5,-179},{-114,-179},{-114,-213}}));
  connect(regulation_Niveau_BP.SortieReelle1, vanne_vapeurBP.Ouv)
    annotation (Line(points={{588.5,109},{600,109},{600,90},{548,90},{548,67}}));
  connect(vanne_alimentationBP.Ouv, constante_vanne_vapeurBP.y)
    annotation (Line(points={{640,65},{640,81},{653.4,81}}));
  connect(EconomiseurHP1.Cws2, VolumeECO_HP1_2.Ce1) annotation (Line(points={{
          526,-70},{526,-88},{456,-88}}, color={0,0,255}));
  connect(VolumeECO_HP1_2.Cs, EconomiseurHP2.Cws1) annotation (Line(points={{
          436,-88},{406,-88},{406,-70}}, color={0,0,255}));
  connect(EconomiseurHP2.Cws2, VolumeECO_HP2_3.Ce1) annotation (Line(points={{
          406,-30},{406,-10},{252,-10}}, color={0,0,255}));
  connect(VolumeECO_HP2_3.Cs, EconomiseurHP3.Cws1) annotation (Line(points={{
          232,-10},{206,-10},{206,-30}}, color={0,0,255}));
  connect(Vanne_alimentationMPHP1.C1, PompeAlimHP.C2)
    annotation (Line(points={{754,-102.8},{842,-102.8},{842,-50},{824,-50}}));
  connect(PompeAlimMP.C2, Vanne_alimentationMPHP2.C1) annotation (Line(points={
          {824,-10},{870,-10},{870,-142.8},{804,-142.8}}, color={0,0,255}));
  connect(arretPomesMp1.y, Vanne_alimentationMPHP1.Ouv)
    annotation (Line(points={{906.1,-134},{856,-134},{856,-122},{742,-122},{742,
          -123.2}}));
  connect(arretPomesHP1.y, Vanne_alimentationMPHP2.Ouv)
    annotation (Line(points={{906.1,-178},{883.05,-178},{883.05,-163.2},{792,
          -163.2}}));
  connect(Vanne_alimentationMPHP1.C2, EconomiseurHP1.Cws1) annotation (Line(
        points={{730,-102.8},{636,-102.8},{636,-106},{548,-106},{548,-6},{526,
          -6},{526,-30}}, color={0,0,255}));
  connect(EconomiseurMP.Cws1, Vanne_alimentationMPHP2.C2)
    annotation (Line(points={{466,-70},{466,-142.8},{780,-142.8}}));
  connect(ConstantVanneTurbineMP.y, vanne_entree_TurbineMP.Ouv)
    annotation (Line(points={{-134.5,-263},{-114,-263},{-114,-297}}));
  connect(vanne_entree_TurbineHP.C2, VolumePreTHP.Ce) annotation (Line(points={
          {-104,-230},{-62,-230}}, color={255,0,0}));
  connect(DoubleDebitMP.Cs, vanne_entree_TurbineMP.C1) annotation (Line(points=
          {{-232,-110},{-232,-314},{-124,-314}}, color={255,0,0}));
  connect(vanne_entree_TurbineMP.C2, MelangeurPreTMP.Ce1) annotation (Line(
        points={{-104,-314},{-60,-314}}, color={255,0,0}));
  connect(SourceCaloporteur.C, Condenseur.Cee) annotation (Line(points={{620,
          -353},{638,-353},{638,-352},{639,-352.8}}, color={0,0,255}));
  connect(Condenseur.Cse, PuitsCaloporteur.C) annotation (Line(points={{719,
          -352},{736,-352}}, color={0,0,255}));
  connect(CapteurDebitVapCondenseur.C2, Condenseur.Cv) annotation (Line(points=
          {{679.3,-274.2},{679.3,-288.1},{679,-288.1},{679,-304}}, color={0,0,
          255}));
  connect(CapteurDebitEauCondenseur.C1, Condenseur.Cl)
    annotation (Line(points={{680.3,-402},{679.8,-402},{679.8,-384}}));
  connect(ConsigneNiveauEauHP.y, regulation_Niveau_HP.ConsigneNiveauEau)
    annotation (Line(points={{-122.3,122},{-100,122},{-100,110},{-40.5,110}}));
  connect(Condenseur.yNiveau, regulation_Niveau_Condenseur.MesureNiveauEau)
    annotation (Line(points={{723,-372.8},{780,-372.8},{780,-326},{732,-326},{
          732,-263},{757.5,-263}}));
  connect(BallonBP.Cs, CapteurDebitEauBPsortie.C1) annotation (Line(points={{
          578,22},{564,22},{564,16},{642,16},{642,-9.8},{687,-9.8}}, color={0,0,
          255}));
  connect(BallonBP.Ce1, vanne_alimentationBP.C2)
    annotation (Line(points={{618,50},{624,50},{624,48},{630,48}}));
  connect(BallonMP.Ce1, vanne_alimentationMP.C2)
    annotation (Line(points={{358,50},{378,50}}));
  connect(BallonHP.Ce1, vanne_alimentationHP.C2)
    annotation (Line(points={{38,50},{58,50}}));
  connect(TurbineHP.Cs, MoitieDebitHP.Ce) annotation (Line(points={{38.2,-230},
          {74,-230},{74,-170},{114,-170}}, color={255,0,0}));
  connect(VolumePreTHP.Cs3, TurbineHP.Ce) annotation (Line(points={{-42,-230},{
          -2.2,-230}}, color={255,0,0}));
  connect(MelangeurPreTMP.Cs, TurbineMP.Ce) annotation (Line(points={{-40,-314},
          {106,-314},{106,-230},{317.8,-230}}, color={255,0,0}));
  connect(TurbineMP.Cs, MelangeurPostTMP1.Ce1) annotation (Line(points={{358.2,
          -230},{408,-230}}, color={255,0,0}));
  connect(MelangeurPostTMP1.Cs, TurbineBP.Ce) annotation (Line(points={{428,
          -230},{575.8,-230}}, color={255,0,0}));
  connect(TurbineBP.Cs, perteChargeK1.C1) annotation (Line(points={{616.2,-230},
          {640,-230}}, color={255,0,0}));
  connect(EconomiseurMP.Cws2, CapteurDebitEauMP.C1) annotation (Line(points={{
          466,-30},{470,-30},{470,50.4},{424,50.4}}, color={0,0,255}));
  connect(TurbineMP.MechPower, Alternateur.Wmec2)
    annotation (Line(points={{360,-248},{368,-248},{368,-378},{402,-378}}));
  connect(TurbineBP.MechPower, Alternateur.Wmec1) annotation (Line(points={{618,
          -248},{628,-248},{628,-290},{388,-290},{388,-358},{402,-358}}));
  connect(TurbineHP.MechPower, Alternateur.Wmec3)
    annotation (Line(points={{40,-248},{48,-248},{48,-398},{402,-398}}));
  connect(heatSource.C[1], BallonHP.Cex) annotation (Line(points={{18,68.3},{18,
          50}}, color={191,95,0}));
  connect(heatSource1.C[1], BallonMP.Cex) annotation (Line(points={{339,68.3},{
          339,50}}, color={191,95,0}));
  connect(heatSource2.C[1], BallonBP.Cex) annotation (Line(points={{598,64.3},{
          598,50}}, color={191,95,0}));
  connect(SourceFumees.C, GasTurbine.Entree_air)
                                                annotation (Line(
      points={{-494,-50},{-468,-50}},
      color={0,0,0},
      thickness=1));
  connect(sourceCombustible.C, GasTurbine.Entree_combustible) annotation (Line(
        points={{-384,44},{-372,44},{-372,42},{-364,42},{-364,14}}, color={0,0,
          0}));
  connect(sourceEau.C, GasTurbine.Entree_eau_combustion)
    annotation (Line(points={{-442,37},{-442,14}}, color={0,0,255}));
  connect(sourceCombustible.IMassFlow, rampeQfuel.y)
    annotation (Line(points={{-402,53},{-402,70},{-527,70}}));
  connect(Humidite.y, GasTurbine.Huminide)
    annotation (Line(points={{-481.95,-6},{-470.6,-6},{-470.6,-11.6}}));
  connect(rampeIQair.y, SourceFumees.IMassFlow)
    annotation (Line(points={{-527,-6},{-516,-6},{-516,-38.5}}));
  connect(GasTurbine.Sortie_fumees, SurchauffeurHP3.Cfg1) annotation (Line(
      points={{-338,-50},{-304,-50}},
      color={0,0,0},
      thickness=1));
  connect(GasTurbine.PuissanceMeca, Gain_2GasTurbine.u)
    annotation (Line(points={{-335.4,-75.6},{-320,-75.6},{-320,-438},{-19,-438}}));
  connect(Gain_2GasTurbine.y, Alternateur.Wmec5)
    annotation (Line(points={{3,-438},{402,-438}}));
  connect(CapteurDebitEauHP.C1, EconomiseurHP4.Cws2)
    annotation (Line(points={{86.3,26},{86,26},{86,-30}}, smooth=Smooth.None));
  connect(PompeAlimMP.rpm_or_mpower, arretPomesMp.y)
    annotation (Line(points={{814,-21},{814,-26},{904.1,-26}}, smooth=Smooth.None));
  connect(PompeAlimHP.rpm_or_mpower, arretPomesHP.y)
    annotation (Line(points={{814,-61},{814,-80},{905.1,-80}}, smooth=Smooth.None));
  connect(PompeAlimBP.rpm_or_mpower, arretPomesBP.y) annotation (Line(points={{
          752,-447},{754,-447},{754,-460},{878,-460},{878,-442},{905.1,-442}},
        smooth=Smooth.None));
  annotation (experiment(StopTime=1000), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-550,-460},{950,150}},
        initialScale=0.1), graphics));
end CombinedCycle_Load_100_50;
