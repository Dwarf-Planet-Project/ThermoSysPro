within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicOnePhaseFlowPipe

  ThermoSysPro.WaterSteam.HeatExchangers.DynamicOnePhaseFlowPipe
    dynamicOnePhaseFlowPipe annotation (Placement(transformation(extent={{-20,
            20},{0,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP
    annotation (Placement(transformation(extent={{-60,20},{-40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP
    annotation (Placement(transformation(extent={{20,20},{40,40}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(
    T0={1000,1100,1200,1300,1400,1500,1600,1700,1800,1900},
    option_temperature=2,
    W0={2e6,2e6,2e6,2e6,2e6,2e6,2e6,2e6,2e6,2e6})
    annotation (Placement(transformation(extent={{-20,60},{0,80}}, rotation=0)));
  ThermoSysPro.Thermal.HeatTransfer.HeatExchangerWall heatExchangerWall(Ns=10)
    annotation (Placement(transformation(extent={{-20,40},{0,60}}, rotation=0)));
equation
  connect(sourceP.C, dynamicOnePhaseFlowPipe.C1) annotation (Line(points={{-40,
          30},{-20,30}}, color={0,0,255}));
  connect(dynamicOnePhaseFlowPipe.C2, sinkP.C) annotation (Line(points={{0,30},
          {20,30}}, color={0,0,255}));
  connect(heatSource.C, heatExchangerWall.WT2) annotation (Line(points={{-10,
          60.2},{-10,52}}, color={191,95,0}));
  connect(heatExchangerWall.WT1, dynamicOnePhaseFlowPipe.CTh)
    annotation (Line(points={{-10,48},{-10,33}}, color={191,95,0}));
  annotation (experiment(stopTime=1000), Diagram(graphics));
end TestDynamicOnePhaseFlowPipe;
