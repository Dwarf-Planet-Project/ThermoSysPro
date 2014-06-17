within ThermoSysPro.Examples.CombinedCyclePowerPlant;
model CombinedCycle_TripTAC "CCPP model to simulate a combustion turbine trip"

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
    Kpa=5)           annotation (Placement(transformation(extent={{8,8},{-32,48}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationHP(Cvmax(fixed=
          false) = 135)
                 annotation (Placement(transformation(extent={{48,44},{28,64}},
          rotation=0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_vanne_vapeurHP(                                                              k=0.5)
    annotation (Placement(transformation(extent={{-48,68},{-58,76}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurHP(
    Cvmax=47829.4,
    mode=0)      annotation (Placement(transformation(extent={{-52,44},{-72,64}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeHP(
    z2=0,
    mode=1,
    K(fixed=false) = 720.183,
    Q(start=150, fixed=true),
    z1=10.83)
            annotation (Placement(transformation(
        origin={-2,-92},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapHP(mode=1, V=5)
                                           annotation (Placement(transformation(
          extent={{-22,-102},{-42,-82}}, rotation=0)));
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
        origin={-44,-52},
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
        origin={56,-52},
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
        origin={-84,-52},
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
        origin={176,-52},
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
        origin={376,-52},
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
        origin={496,-52},
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
        origin={-204,-52},
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
        origin={-324,-52},
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
    Mp=5000)         annotation (Placement(transformation(extent={{328,8},{290,
            48}}, rotation=0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_vanne_vapeurMP(                                                              k=0.5)
    annotation (Placement(transformation(extent={{274,68},{262,78}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationMP(Cvmax(fixed=
          false) = 70)
                 annotation (Placement(transformation(extent={{368,44},{348,64}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurMP(
    Pm(fixed=false),
    h(fixed=false),
    Cvmax=47829.4,
    mode=0)      annotation (Placement(transformation(extent={{268,44},{248,64}},
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
        origin={276,-52},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeMP(
    z2=0,
    z1=10.83,
    mode=1,
    K(fixed=false) = 1090.96,
    Q(start=150, fixed=true))
            annotation (Placement(transformation(
        origin={318,-92},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapMP(mode=1, V=5)
                                           annotation (Placement(transformation(
          extent={{298,-102},{278,-82}}, rotation=0)));
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
        origin={436,-52},
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
        origin={116,-52},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.Volumes.VolumeB MelangeurHPMP
    annotation (Placement(transformation(
        origin={118,-112},
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
        origin={-144,-52},
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
        origin={-264,-52},
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
    Mp=5000)         annotation (Placement(transformation(extent={{588,8},{548,
            48}}, rotation=0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_vanne_vapeurBP(                                                              k=0.5)
    annotation (Placement(transformation(extent={{636,74},{624,84}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurBP(
    Cvmax(fixed=false) = 32000,
    p_rho=3)     annotation (Placement(transformation(extent={{528,44},{508,64}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationBP(
    h(fixed=false),
    Pm(fixed=false, start=5.0698e5),
    Cvmax=285)   annotation (Placement(transformation(extent={{620,42},{600,62}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeBP(
    z2=0,
    z1=10.767,
    Q(start=50, fixed=false),
    K=32766,
    mode=1) annotation (Placement(transformation(
        origin={580,-92},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapBP(h(start=642e3), mode=1,
    V=5)                                   annotation (Placement(transformation(
          extent={{562,-102},{542,-82}}, rotation=0)));
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
        origin={536,-52},
        extent={{-20,-20},{20,20}},
        rotation=90)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    constante_ballonBP(                                                              k=1)
    annotation (Placement(transformation(extent={{712,4},{698,16}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931)
                 annotation (Placement(transformation(extent={{680,-16},{700,4}},
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
        origin={236,-52},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP PuitsFumees(
                P0=1.013e5)
    annotation (Placement(transformation(
        origin={692,-52},
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
        origin={650,-52},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineHP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 7618660.65374636,
    Pe(fixed=true, start=124.31e5),
    eta_stato=1,
    eta_is(start=0.88057),
    eta_is_nom=0.88057,
    Qmax=140,
    eta_is_min=0.75)
              annotation (Placement(transformation(extent={{-32,-252},{8,-212}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineMP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 278905.664031036,
    Pe(fixed=true, start=25.485e5),
    eta_stato=1,
    eta_is(start=0.9625),
    eta_is_nom=0.9625,
    Qmax=150,
    eta_is_min=0.75)
                annotation (Placement(transformation(extent={{288,-252},{328,
            -212}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPostTMP1
                                           annotation (Placement(transformation(
        origin={388,-232},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineBP(
    W_fric=1,
    Cst(fixed=false) = 13491.6445678148,
    eta_stato=1,
    eta_is(start=0.9538),
    eta_is_nom=0.9538,
    Pe(fixed=true, start=4.768e5),
    Qmax=155,
    eta_is_min=0.75)
                annotation (Placement(transformation(extent={{546,-252},{586,
            -212}}, rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitHP(
                                                    alpha=2)
    annotation (Placement(transformation(
        origin={-322,-102},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitMP(
                                                    alpha=2)
    annotation (Placement(transformation(
        origin={-262,-102},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitHP(
                                                    alpha=0.5)
    annotation (Placement(transformation(extent={{84,-182},{104,-162}},
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
    steady_state=false,
    Kvl=0,
    gravity_pressure=false,
    Vf0=0.15)
    annotation (Placement(transformation(extent={{609,-386},{689,-306}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ SourceCaloporteur(
    h0=113.38e3, Q0=29804.5)     annotation (Placement(transformation(extent={{
            542,-379},{590,-331}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsCaloporteur
    annotation (Placement(transformation(extent={{706,-376},{750,-332}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK1(    K=1e-4)
    annotation (Placement(transformation(extent={{610,-242},{630,-222}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeCond1(mode=1)
    annotation (Placement(transformation(
        origin={872,-320},
        extent={{10,-10},{-10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeKCond1(            mode=1, K=1e-4)
    annotation (Placement(transformation(
        origin={872,-272},
        extent={{12,-12},{-12,12}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Volumes.VolumeA VolumeAlimMPHP(mode=1)
                                           annotation (Placement(transformation(
          extent={{712,-22},{732,-2}}, rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimMP(
    a3=350,
    b1(fixed=true) = -3.7751,
    a1=-244551,
    Q(fixed=false),
    mode=1) annotation (Placement(transformation(extent={{774,-22},{794,-2}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimHP(
    a3=1600,
    a1=-28056.2,
    b1=-12.7952660447433,
    Q(fixed=false),
    mode=1)  annotation (Placement(transformation(extent={{774,-62},{794,-42}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitBP(
                                                    alpha=0.5)
    annotation (Placement(transformation(extent={{842,-330},{856,-310}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitBP(
                                                    alpha=2)
    annotation (Placement(transformation(
        origin={238,-102},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss PerteChargeZero2(
    z2=0,
    mode=0,
    z1=0,
    C1(P(fixed=true, start=5.0185e5)),
    K(fixed=false) = 1e-4)
            annotation (Placement(transformation(
        origin={314,-280},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK3(    K=1e-4, mode=1)
    annotation (Placement(transformation(
        origin={750,-52},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK8(    K=1e-4, mode=1)
    annotation (Placement(transformation(
        origin={750,-12},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Machines.Generator Alternateur
    annotation (Placement(transformation(extent={{372,-450},{492,-350}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK(
                                                         K=1e-4, mode=1)
    annotation (Placement(transformation(extent={{672,-448},{692,-428}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimBP(
    C2(P(fixed=false, start=22e5)),
    Qv(start=0.1),
    Q(start=194.502),
    mode=1,
    a1(fixed=true) = -6000,
    adiabatic_compression=false,
    a3=400) annotation (Placement(transformation(extent={{712,-448},{732,-428}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK2(
                                                         K=1e-4, mode=1)
    annotation (Placement(transformation(extent={{810,-448},{830,-428}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_extraction(            mode=1, Cvmax=
        1900)    annotation (Placement(transformation(extent={{772,-442},{792,
            -422}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapHP
    annotation (Placement(transformation(
        origin={-88,6},
        extent={{-6,6},{6,-6}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauHP
    annotation (Placement(transformation(
        origin={63.5,8},
        extent={{6,-6.5},{-6,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauMP
    annotation (Placement(transformation(extent={{394,47},{379,61}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapMP
    annotation (Placement(transformation(
        origin={206,54},
        extent={{-8,8},{8,-8}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapBP
    annotation (Placement(transformation(
        origin={484,54},
        extent={{-8,8},{8,-8}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBP
    annotation (Placement(transformation(
        origin={633.5,32},
        extent={{6,-6.5},{-6,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBPsortie
    annotation (Placement(transformation(extent={{657,-13},{670,-1}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauCondenseur
    annotation (Placement(transformation(
        origin={655.5,-414},
        extent={{-10,-6.5},{10,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapCondenseur
    annotation (Placement(transformation(
        origin={654.5,-266},
        extent={{-10,-6.5},{10,6.5}},
        rotation=270)));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss lumpedStraightPipeK2(  K(fixed=
          false) = 10, C1(P(fixed=true, start=27.267e5)))
    annotation (Placement(transformation(extent={{84,-122},{64,-102}}, rotation
          =0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineHP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 8000,
    C1(P(fixed=true, start=126.81e5)))
                 annotation (Placement(transformation(extent={{-154,-236},{-134,
            -216}}, rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceQ SourceFumees(
    Xco2=0.0613,
    Xso2=0,
    Xh2o=0.0706,
    T0=893.75,
    Xo2=0.1380,
    Q0=606.94)
    annotation (Placement(transformation(extent={{-478,-94},{-376,-10}},
          rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauEauHP(                                                              k=1.05)
    annotation (Placement(transformation(extent={{-188,111},{-154,129}},
          rotation=0)));
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl
    regulation_Niveau_HP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500)
    annotation (Placement(transformation(extent={{-70,104},{-50,124}}, rotation
          =0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauEauMP(                                                              k=1.05)
    annotation (Placement(transformation(extent={{143,111},{177,129}}, rotation
          =0)));
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl
    regulation_Niveau_MP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500)
    annotation (Placement(transformation(extent={{232,104},{252,124}}, rotation
          =0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauEauBP(                                                              k=1.75)
    annotation (Placement(transformation(extent={{440,124},{474,142}}, rotation
          =0)));
  Control.Drum_LevelControl regulation_Niveau_BP(
                     add(k1=-1, k2=+1), pIsat(Ti=500),
    Ti=10)
    annotation (Placement(transformation(extent={{538,106},{558,126}}, rotation
          =0)));
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante
    ConsigneNiveauCondenseur1(                                 k=1.5)
    annotation (Placement(transformation(extent={{686,-248},{710,-232}},
          rotation=0)));
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Condenser_LevelControl
    regulation_Niveau_Condenseur(pIsat(Ti=500), add(k1=+1, k2=-1))
                                 annotation (Placement(transformation(extent={{
            728,-284},{748,-264}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps Debit(Table=[0,606.94; 10,606.94; 600,
        50; 650,50])
                annotation (Placement(transformation(extent={{-532,-28},{-462,
            46}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps Temperature(
      Table=[0,893.75; 10,893.75; 600,423; 650,423])
                   annotation (Placement(transformation(extent={{-532,-166},{
            -462,-92}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps
    ConstantVanneTurbineHP(                                                                Table=[0,0.8;
        10,0.8; 600,0.8; 650,0.8; 3000,0.2; 3100,0.2])
                   annotation (Placement(transformation(extent={{-238,-218},{
            -168,-144}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp(
    Initialvalue=1400,
    Finalvalue=1000,
    Starttime=2000,
    Duration=1000) annotation (Placement(transformation(extent={{914,-44},{876,
            -12}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP(
    Initialvalue=1400,
    Finalvalue=1000,
    Starttime=2000,
    Duration=1000) annotation (Placement(transformation(extent={{915,-98},{877,
            -66}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesBP(
    Initialvalue=1400,
    Finalvalue=1000,
    Starttime=2000,
    Duration=1000) annotation (Placement(transformation(extent={{915,-460},{877,
            -428}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP1_2(
    mode=1,
    V=1,
    h0=988332,
    h(start=988332),
    P0=70.1e5,
    P(start=70.1e5),
    dynamic_mass_balance=true)            annotation (Placement(transformation(
          extent={{426,-100},{406,-80}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP2_3(
    mode=1,
    V=1,
    h0=983786,
    h(start=983786),
    P0=70.0e5,
    P(start=70.0e5),
    dynamic_mass_balance=true)            annotation (Placement(transformation(
          extent={{222,-22},{202,-2}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP1(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931)
                 annotation (Placement(transformation(extent={{724,-100},{700,
            -124}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP2(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931)
                 annotation (Placement(transformation(extent={{774,-140},{750,
            -164}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp1(
    Starttime=2000,
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000)   annotation (Placement(transformation(extent={{916,-152},{
            878,-120}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP1(
    Starttime=2000,
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000)   annotation (Placement(transformation(extent={{916,-196},{
            878,-164}}, rotation=0)));
  ThermoSysPro.WaterSteam.Volumes.VolumeD VolumePreTHP(
    P0=127e5,
    h0=3e6,
    P(start=127e5),
    h(start=3e6),
    dynamic_mass_balance=true)        annotation (Placement(transformation(
        origin={-82,-232},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPreTMP(
    h0=3523910,
    h(start=3523910),
    P0=24e5,
    P(start=24e5),
    dynamic_mass_balance=true)            annotation (Placement(transformation(
        origin={-80,-316},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineMP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 1500,
    C1(P(fixed=true, start=25.486e5)))
                 annotation (Placement(transformation(extent={{-154,-320},{-134,
            -300}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps
    ConstantVanneTurbineMP(                                                                Table=[0,0.8;
        10,0.8; 600,0.8; 2000,0.1; 3000,0.01; 3100,0.01])
                   annotation (Placement(transformation(extent={{-238,-302},{
            -168,-228}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(T0={303.16})
    annotation (Placement(transformation(extent={{-25,66},{1,96}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource1(T0={303.16})
    annotation (Placement(transformation(extent={{296,66},{322,96}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource2(T0={303.16})
    annotation (Placement(transformation(extent={{555,62},{581,92}}, rotation=0)));
equation
  connect(SurchauffeurHP3.Cws1, SurchauffeurHP2.Cws2)
    annotation (Line(points={{-324,-32},{-324,-12},{-204,-12},{-204,-32}},
        color={255,0,0}));
  connect(SurchauffeurHP2.Cws1, SurchauffeurHP1.Cws2)
    annotation (Line(points={{-204,-72},{-204,-92},{-84,-92},{-84,-72}}, color=
          {255,0,0}));
  connect(constante_vanne_vapeurHP.y, vanne_vapeurHP.Ouv)
    annotation (Line(points={{-58.5,72},{-62,72},{-62,65}}));
  connect(vanne_vapeurHP.C1, BallonHP.Cv)
    annotation (Line(points={{-52,48},{-32,48}}, color={255,0,0}));
  connect(GainChargeHP.C1, BallonHP.Cd)
    annotation (Line(points={{8,-92},{18,-92},{18,8},{8,8}}, color={255,128,0}));
  connect(BallonHP.Cm, EvaporateurHP.Cws2)
    annotation (Line(points={{-32,8},{-44,8},{-44,-32}}));
  connect(VolumeEvapHP.Cs, EvaporateurHP.Cws1)
    annotation (Line(points={{-42,-92},{-42,-72},{-44,-72}}, color={255,128,0}));
  connect(VolumeEvapHP.Ce1, GainChargeHP.C2)
                                      annotation (Line(points={{-22,-92},{-12,
          -92}}, color={255,128,0}));
  connect(EconomiseurHP4.Cws1, EconomiseurHP3.Cws2)
    annotation (Line(points={{56,-72},{56,-84},{176,-84},{176,-72}}));
  connect(BallonMP.Cm, EvaporateurMP.Cws2)
    annotation (Line(points={{290,8},{276,8},{276,-32}}));
  connect(EvaporateurMP.Cws1, VolumeEvapMP.Cs)
    annotation (Line(points={{276,-72},{276,-82},{278,-82},{278,-92}}, color={
          255,128,0}));
  connect(VolumeEvapMP.Ce1, GainChargeMP.C2)
    annotation (Line(points={{298,-92},{308,-92}}, color={255,128,0}));
  connect(constante_vanne_vapeurMP.y, vanne_vapeurMP.Ouv)
    annotation (Line(points={{261.4,73},{258,73},{258,65}}));
  connect(SurchauffeurHP1.Cfg2, EvaporateurHP.Cfg1)        annotation (Line(
      points={{-74,-52},{-54,-52}},
      color={0,0,0},
      thickness=1));
  connect(EvaporateurHP.Cfg2, EconomiseurHP4.Cfg1)        annotation (Line(
      points={{-34,-52},{46,-52}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP4.Cfg2, SurchauffeurMP1.Cfg1)          annotation (Line(
      points={{66,-52},{106,-52}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP1.Cfg2, EconomiseurHP3.Cfg1)           annotation (Line(
      points={{126,-52},{166,-52}},
      color={0,0,0},
      thickness=1));
  connect(EvaporateurMP.Cfg2, EconomiseurHP2.Cfg1)           annotation (Line(
      points={{286,-52},{366,-52}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP2.Cfg2, EconomiseurMP.Cfg1)           annotation (Line(
      points={{386,-52},{426,-52}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurMP.Cfg2, EconomiseurHP1.Cfg1)           annotation (Line(
      points={{446,-52},{486,-52}},
      color={0,0,0},
      thickness=1));
  connect(GainChargeMP.C1, BallonMP.Cd)
    annotation (Line(points={{328,-92},{338,-92},{338,8},{328,8}}, color={255,
          128,0}));
  connect(SurchauffeurMP2.Cfg2, SurchauffeurHP1.Cfg1)          annotation (Line(
      points={{-134,-52},{-94,-52}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP2.Cfg1, SurchauffeurHP2.Cfg2)           annotation (Line(
      points={{-154,-52},{-194,-52}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP3.Cfg2, SurchauffeurHP2.Cfg1)           annotation (Line(
      points={{-254,-52},{-214,-52}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurHP3.Cfg2, SurchauffeurMP3.Cfg1)           annotation (Line(
      points={{-314,-52},{-274,-52}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurMP3.Cws1,SurchauffeurMP2. Cws2)
    annotation (Line(points={{-264,-32},{-264,8},{-144,8},{-144,-32}}, color={
          255,0,0}));
  connect(SurchauffeurMP1.Cws2, MelangeurHPMP.Ce2) annotation (Line(
      points={{116,-72},{116,-87},{118,-87},{118,-102}},
      color={255,0,0},
      pattern=LinePattern.None));
  connect(vanne_vapeurBP.C1, BallonBP.Cv)
    annotation (Line(points={{528,48},{548,48}}, color={255,0,0}));
  connect(EvaporateurBP.Cws1, VolumeEvapBP.Cs)  annotation (Line(points={{536,
          -72},{536,-92},{542,-92}}, color={255,128,0}));
  connect(VolumeEvapBP.Ce1, GainChargeBP.C2)
                                        annotation (Line(points={{562,-92},{570,
          -92}}, color={255,128,0}));
  connect(BallonBP.Cd, GainChargeBP.C1)
                                       annotation (Line(points={{588,8},{598,8},
          {598,-92},{590,-92}}, color={255,128,0}));
  connect(EconomiseurBP.Cfg2, PuitsFumees.C)     annotation (Line(
      points={{660,-52},{682.2,-52}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP3.Cfg2, SurchauffeurBP.Cfg1)  annotation (Line(
      points={{186,-52},{226,-52}},
      color={0,0,0},
      thickness=1));
  connect(SurchauffeurBP.Cfg2, EvaporateurMP.Cfg1)  annotation (Line(
      points={{246,-52},{266,-52}},
      color={0,0,0},
      thickness=1));
  connect(EconomiseurHP1.Cfg2, EvaporateurBP.Cfg1) annotation (Line(
      points={{506,-52},{526,-52}},
      color={0,0,0},
      thickness=1));
  connect(EvaporateurBP.Cfg2, EconomiseurBP.Cfg1) annotation (Line(
      points={{546,-52},{640,-52}},
      color={0,0,0},
      thickness=1));
  connect(BallonBP.Cm, EvaporateurBP.Cws2)
    annotation (Line(points={{548,8},{536,8},{536,-32}}));
  connect(vanne_vapeurMP.C1, BallonMP.Cv)   annotation (Line(points={{268,48},{
          290,48}}, color={255,0,0}));
  connect(Vanne_alimentationMPHP.Ouv, constante_ballonBP.y)
    annotation (Line(points={{690,5},{690,10},{697.3,10}}));
  connect(SurchauffeurHP3.Cws2, DoubleDebitHP.Ce)
    annotation (Line(points={{-324,-72},{-324,-82},{-322,-82},{-322,-92}},
        color={255,0,0}));
  connect(SurchauffeurMP3.Cws2, DoubleDebitMP.Ce)
    annotation (Line(points={{-264,-72},{-264,-82},{-262,-82},{-262,-92}},
        color={255,0,0}));
  connect(VolumeCond1.Cs, perteChargeKCond1.C1) annotation (Line(points={{872,
          -310},{872,-284}}, color={0,0,255}));
  connect(Vanne_alimentationMPHP.C2, VolumeAlimMPHP.Ce1)
                                               annotation (Line(points={{700,
          -12},{712,-12}}, color={0,0,255}));
  connect(SurchauffeurBP.Cws2, DoubleDebitBP.Ce)
    annotation (Line(points={{236,-72},{236,-82},{238,-82},{238,-92}}, color={
          255,0,0}));
  connect(perteChargeK8.C2, PompeAlimMP.C1)
    annotation (Line(points={{760,-12},{767,-12},{767,-12},{774,-12}}, color={0,
          0,255}));
  connect(VolumeAlimMPHP.Cs1, perteChargeK8.C1)
    annotation (Line(points={{732,-12},{736,-12},{736,-12},{740,-12}}, color={0,
          0,255}));
  connect(VolumeAlimMPHP.Cs2, perteChargeK3.C1)
                                         annotation (Line(points={{722,-22},{
          722,-52},{740,-52}}, color={0,0,255}));
  connect(perteChargeK3.C2, PompeAlimHP.C1)
    annotation (Line(points={{760,-52},{774,-52}}, color={0,0,255}));
  connect(MelangeurPostTMP1.Ce2, PerteChargeZero2.C2) annotation (Line(points={
          {388,-241},{388,-280},{324,-280}}, color={255,0,0}));
  connect(perteChargeK.C2,PompeAlimBP. C1)
                                         annotation (Line(points={{692,-438},{
          712,-438}}, color={0,0,255}));
  connect(vanne_extraction.C2, perteChargeK2.C1) annotation (Line(points={{792,
          -438},{810,-438}}, color={0,0,255}));
  connect(vanne_alimentationHP.C1, CapteurDebitEauHP.C2)
    annotation (Line(points={{48,48},{58.3,48},{58.3,14.12}}));
  connect(CapteurDebitEauHP.C1, EconomiseurHP4.Cws2)
    annotation (Line(points={{58.3,2},{56,2},{56,-32}}));
  connect(vanne_vapeurHP.C2, CapteurDebitVapHP.C1) annotation (Line(points={{
          -72,48},{-83.2,48},{-83.2,12}}, color={255,0,0}));
  connect(CapteurDebitVapHP.C2, SurchauffeurHP1.Cws1) annotation (Line(points={
          {-83.2,-0.12},{-83.2,-5.06},{-84,-5.06},{-84,-32}}, color={255,0,0}));
  connect(vanne_alimentationMP.C1, CapteurDebitEauMP.C2)
    annotation (Line(points={{368,48},{373.425,48},{373.425,48.4},{378.85,48.4}}));
  connect(CapteurDebitVapMP.C1, vanne_vapeurMP.C2) annotation (Line(points={{
          214,47.6},{230,47.6},{230,48},{248,48}}, color={255,0,0}));
  connect(CapteurDebitVapMP.C2, SurchauffeurMP1.Cws1) annotation (Line(points={
          {197.84,47.6},{116,47.6},{116,-32}}, color={255,0,0}));
  connect(CapteurDebitVapBP.C2, SurchauffeurBP.Cws1) annotation (Line(points={{
          475.84,47.6},{460,47.6},{460,-4},{236,-4},{236,-32}}, color={255,0,0}));
  connect(CapteurDebitVapBP.C1, vanne_vapeurBP.C2) annotation (Line(points={{
          492,47.6},{500,47.6},{500,48},{508,48}}, color={255,0,0}));
  connect(CapteurDebitEauBP.C2, vanne_alimentationBP.C1) annotation (Line(
        points={{628.3,38.12},{628.3,46},{620,46}}, color={0,0,255}));
  connect(CapteurDebitEauBPsortie.C2, Vanne_alimentationMPHP.C1) annotation (Line(
        points={{670.13,-11.8},{675.065,-11.8},{675.065,-12},{680,-12}}, color=
          {0,0,255}));
  connect(CapteurDebitEauCondenseur.C2, perteChargeK.C1) annotation (Line(
        points={{650.3,-424.2},{650.3,-438},{672,-438}}, color={0,0,255}));
  connect(perteChargeK1.C2, CapteurDebitVapCondenseur.C1) annotation (Line(
        points={{630,-232},{649.3,-232},{649.3,-256}}, color={255,0,0}));
  connect(MelangeurHPMP.Ce1, MoitieDebitHP.Cs)
    annotation (Line(points={{118,-122},{118,-172},{104,-172}}, color={255,0,0}));
  connect(perteChargeK2.C2, MoitieDebitBP.Ce) annotation (Line(points={{830,
          -438},{832,-438},{832,-320},{842,-320}}, color={0,0,255}));
  connect(MoitieDebitBP.Cs, VolumeCond1.Ce3) annotation (Line(points={{856,-320},
          {862,-320}}, color={0,0,255}));
  connect(SurchauffeurMP2.Cws1, lumpedStraightPipeK2.C2)
    annotation (Line(points={{-144,-72},{-144,-112},{64,-112}}, color={255,0,0}));
  connect(lumpedStraightPipeK2.C1, MelangeurHPMP.Cs2)
    annotation (Line(points={{84,-112},{108.2,-112}}, color={255,0,0}));
  connect(DoubleDebitHP.Cs, vanne_entree_TurbineHP.C1) annotation (Line(points=
          {{-322,-112},{-322,-232},{-154,-232}}, color={255,0,0}));
  connect(DoubleDebitBP.Cs, PerteChargeZero2.C1) annotation (Line(points={{238,
          -112},{238,-280},{304,-280}}, color={255,0,0}));
  connect(PompeAlimBP.C2, vanne_extraction.C1) annotation (Line(points={{732,
          -438},{772,-438}}, color={0,0,255}));
  connect(SourceFumees.C, SurchauffeurHP3.Cfg1) annotation (Line(
      points={{-376,-52},{-334,-52}},
      color={0,0,0},
      thickness=1));
  connect(BallonHP.yLevel,regulation_Niveau_HP. MesureNiveauEau)
    annotation (Line(points={{-34,28},{-98,28},{-98,123},{-70.5,123}}));
  connect(regulation_Niveau_HP.SortieReelle1, vanne_alimentationHP.Ouv)
    annotation (Line(points={{-49.5,105},{38,105},{38,65}}));
  connect(ConsigneNiveauEauMP.y,regulation_Niveau_MP. ConsigneNiveauEau)
    annotation (Line(points={{178.7,120},{204,120},{204,108},{231.5,108}}));
  connect(BallonMP.yLevel,regulation_Niveau_MP. MesureNiveauEau)
    annotation (Line(points={{288.1,28},{222,28},{222,123},{231.5,123}}));
  connect(regulation_Niveau_MP.SortieReelle1, vanne_alimentationMP.Ouv)
    annotation (Line(points={{252.5,105},{347.25,105},{347.25,65},{358,65}}));
  connect(ConsigneNiveauEauBP.y,regulation_Niveau_BP. ConsigneNiveauEau)
    annotation (Line(points={{475.7,133},{499.85,133},{499.85,110},{537.5,110}}));
  connect(BallonBP.yLevel,regulation_Niveau_BP. MesureNiveauEau)
    annotation (Line(points={{546,28},{488,28},{488,125},{537.5,125}}));
  connect(ConsigneNiveauCondenseur1.y, regulation_Niveau_Condenseur.ConsigneNiveauEau)
    annotation (Line(points={{711.2,-240},{722,-240},{722,-271},{727.5,-271}}));
  connect(regulation_Niveau_Condenseur.SortieReelle1, vanne_extraction.Ouv)
    annotation (Line(points={{748.5,-283},{782,-283},{782,-421}}));
  connect(Temperature.y, SourceFumees.ITemperature)
    annotation (Line(points={{-458.5,-129},{-427,-129},{-427,-73}}));
  connect(CapteurDebitEauBP.C1, EconomiseurBP.Cws2)
    annotation (Line(points={{628.3,26},{630,26},{630,4},{650,4},{650,-32}}));
  connect(EconomiseurBP.Cws1, perteChargeKCond1.C2) annotation (Line(points={{
          650,-72},{650,-188},{872,-188},{872,-260}}));
  connect(CapteurDebitVapCondenseur.Measure, regulation_Niveau_Condenseur.MesureDebitVapeur)
    annotation (Line(points={{661.13,-266},{674,-266},{674,-282.9},{727.6,
          -282.9}}));
  connect(regulation_Niveau_Condenseur.MesureDebitEau,
    CapteurDebitEauCondenseur.Measure) annotation (Line(points={{727.45,-276.95},
          {720,-276.95},{720,-312},{762,-312},{762,-414},{662.13,-414}}));
  connect(ConstantVanneTurbineHP.y, vanne_entree_TurbineHP.Ouv)
    annotation (Line(points={{-164.5,-181},{-144,-181},{-144,-215}}));
  connect(regulation_Niveau_BP.SortieReelle1, vanne_vapeurBP.Ouv)
    annotation (Line(points={{558.5,107},{570,107},{570,88},{518,88},{518,65}}));
  connect(vanne_alimentationBP.Ouv, constante_vanne_vapeurBP.y)
    annotation (Line(points={{610,63},{610,79},{623.4,79}}));
  connect(EconomiseurHP1.Cws2, VolumeECO_HP1_2.Ce1) annotation (Line(points={{
          496,-72},{496,-90},{426,-90}}, color={0,0,255}));
  connect(VolumeECO_HP1_2.Cs, EconomiseurHP2.Cws1) annotation (Line(points={{
          406,-90},{376,-90},{376,-72}}, color={0,0,255}));
  connect(EconomiseurHP2.Cws2, VolumeECO_HP2_3.Ce1) annotation (Line(points={{
          376,-32},{376,-12},{222,-12}}, color={0,0,255}));
  connect(VolumeECO_HP2_3.Cs, EconomiseurHP3.Cws1) annotation (Line(points={{
          202,-12},{176,-12},{176,-32}}, color={0,0,255}));
  connect(Vanne_alimentationMPHP1.C1, PompeAlimHP.C2)
    annotation (Line(points={{724,-104.8},{812,-104.8},{812,-52},{794,-52}}));
  connect(PompeAlimMP.C2, Vanne_alimentationMPHP2.C1) annotation (Line(points={
          {794,-12},{840,-12},{840,-144.8},{774,-144.8}}, color={0,0,255}));
  connect(arretPomesMp1.y, Vanne_alimentationMPHP1.Ouv)
    annotation (Line(points={{876.1,-136},{826,-136},{826,-124},{712,-124},{712,
          -125.2}}));
  connect(arretPomesHP1.y, Vanne_alimentationMPHP2.Ouv)
    annotation (Line(points={{876.1,-180},{853.05,-180},{853.05,-165.2},{762,
          -165.2}}));
  connect(Vanne_alimentationMPHP1.C2, EconomiseurHP1.Cws1) annotation (Line(
        points={{700,-104.8},{606,-104.8},{606,-108},{518,-108},{518,-8},{496,
          -8},{496,-32}}, color={0,0,255}));
  connect(EconomiseurMP.Cws1, Vanne_alimentationMPHP2.C2)
    annotation (Line(points={{436,-72},{436,-144.8},{750,-144.8}}));
  connect(ConstantVanneTurbineMP.y, vanne_entree_TurbineMP.Ouv)
    annotation (Line(points={{-164.5,-265},{-144,-265},{-144,-299}}));
  connect(vanne_entree_TurbineHP.C2, VolumePreTHP.Ce) annotation (Line(points={
          {-134,-232},{-92,-232}}, color={255,0,0}));
  connect(DoubleDebitMP.Cs, vanne_entree_TurbineMP.C1) annotation (Line(points=
          {{-262,-112},{-262,-316},{-154,-316}}, color={255,0,0}));
  connect(vanne_entree_TurbineMP.C2, MelangeurPreTMP.Ce1) annotation (Line(
        points={{-134,-316},{-90,-316}}, color={255,0,0}));
  connect(SourceCaloporteur.C, Condenseur.Cee) annotation (Line(points={{590,
          -355},{608,-355},{608,-354},{609,-354.8}}, color={0,0,255}));
  connect(Condenseur.Cse, PuitsCaloporteur.C) annotation (Line(points={{689,
          -354},{706,-354}}, color={0,0,255}));
  connect(CapteurDebitVapCondenseur.C2, Condenseur.Cv) annotation (Line(points=
          {{649.3,-276.2},{649.3,-290.1},{649,-290.1},{649,-306}}, color={0,0,
          255}));
  connect(CapteurDebitEauCondenseur.C1, Condenseur.Cl)
    annotation (Line(points={{650.3,-404},{649.8,-404},{649.8,-386}}));
  connect(ConsigneNiveauEauHP.y, regulation_Niveau_HP.ConsigneNiveauEau)
    annotation (Line(points={{-152.3,120},{-130,120},{-130,108},{-70.5,108}}));
  connect(Condenseur.yNiveau, regulation_Niveau_Condenseur.MesureNiveauEau)
    annotation (Line(points={{693,-374.8},{750,-374.8},{750,-328},{702,-328},{
          702,-265},{727.5,-265}}));
  connect(BallonBP.Cs, CapteurDebitEauBPsortie.C1) annotation (Line(points={{
          548,20},{534,20},{534,14},{612,14},{612,-11.8},{657,-11.8}}, color={0,
          0,255}));
  connect(BallonBP.Ce1, vanne_alimentationBP.C2)
    annotation (Line(points={{588,48},{594,48},{594,46},{600,46}}));
  connect(BallonMP.Ce1, vanne_alimentationMP.C2)
    annotation (Line(points={{328,48},{348,48}}));
  connect(BallonHP.Ce1, vanne_alimentationHP.C2)
    annotation (Line(points={{8,48},{28,48}}));
  connect(TurbineHP.Cs, MoitieDebitHP.Ce) annotation (Line(points={{8.2,-232},{
          44,-232},{44,-172},{84,-172}}, color={255,0,0}));
  connect(VolumePreTHP.Cs3, TurbineHP.Ce) annotation (Line(points={{-72,-232},{
          -32.2,-232}}, color={255,0,0}));
  connect(MelangeurPreTMP.Cs, TurbineMP.Ce) annotation (Line(points={{-70,-316},
          {76,-316},{76,-232},{287.8,-232}}, color={255,0,0}));
  connect(TurbineMP.Cs, MelangeurPostTMP1.Ce1) annotation (Line(points={{328.2,
          -232},{378,-232}}, color={255,0,0}));
  connect(MelangeurPostTMP1.Cs, TurbineBP.Ce) annotation (Line(points={{398,
          -232},{545.8,-232}}, color={255,0,0}));
  connect(TurbineBP.Cs, perteChargeK1.C1) annotation (Line(points={{586.2,-232},
          {610,-232}}, color={255,0,0}));
  connect(EconomiseurMP.Cws2, CapteurDebitEauMP.C1) annotation (Line(points={{
          436,-32},{440,-32},{440,48.4},{394,48.4}}, color={0,0,255}));
  connect(TurbineMP.MechPower, Alternateur.Wmec2)
    annotation (Line(points={{330,-250},{338,-250},{338,-380},{372,-380}}));
  connect(TurbineBP.MechPower, Alternateur.Wmec1) annotation (Line(points={{588,
          -250},{598,-250},{598,-292},{358,-292},{358,-360},{372,-360}}));
  connect(TurbineHP.MechPower, Alternateur.Wmec3)
    annotation (Line(points={{10,-250},{18,-250},{18,-400},{372,-400}}));
  connect(Debit.y, SourceFumees.IMassFlow)
    annotation (Line(points={{-458.5,9},{-427,9},{-427,-31}}));
  connect(heatSource.C[1], BallonHP.Cex) annotation (Line(points={{-12,66.3},{
          -12,48}}, color={191,95,0}));
  connect(heatSource1.C[1], BallonMP.Cex) annotation (Line(points={{309,66.3},{
          309,48}}, color={191,95,0}));
  connect(heatSource2.C[1], BallonBP.Cex) annotation (Line(points={{568,62.3},{
          568,48}}, color={191,95,0}));
  connect(PompeAlimMP.rpm_or_mpower, arretPomesMp.y)
    annotation (Line(points={{784,-23},{784,-28},{874.1,-28}}, smooth=Smooth.None));
  connect(PompeAlimHP.rpm_or_mpower, arretPomesHP.y)
    annotation (Line(points={{784,-63},{784,-82},{875.1,-82}}, smooth=Smooth.None));
  connect(PompeAlimBP.rpm_or_mpower, arretPomesBP.y) annotation (Line(points={{
          722,-449},{722,-460},{860,-460},{860,-444},{875.1,-444}}, smooth=
          Smooth.None));
  annotation (Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-550,-460},{950,150}},
        initialScale=0.1), graphics));
end CombinedCycle_TripTAC;
