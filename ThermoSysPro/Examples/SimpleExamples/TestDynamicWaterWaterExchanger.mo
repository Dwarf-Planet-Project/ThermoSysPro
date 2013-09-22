within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicWaterWaterExchanger

  ThermoSysPro.WaterSteam.HeatExchangers.DynamicWaterWaterExchanger
    echangeurAPlaques1D(
    modec=1,
    modef=1,
    N=5) annotation (Placement(transformation(extent={{-20,40},{0,60}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
                                           T0=340)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1
                                            annotation (Placement(
        transformation(extent={{-60,20},{-40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP
                                         annotation (Placement(transformation(
          extent={{40,40},{60,60}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1
                                          annotation (Placement(transformation(
          extent={{20,20},{40,40}}, rotation=0)));
equation
  connect(sourceP.C, echangeurAPlaques1D.Ec)
    annotation (Line(points={{-60,50},{-20,50}}, color={0,0,255}));
  connect(sourceP1.C, echangeurAPlaques1D.Ef) annotation (Line(points={{-40,30},
          {-15,30},{-15,44}}, color={0,0,255}));
  connect(echangeurAPlaques1D.Sc, puitsP.C) annotation (Line(points={{0,50.2},{
          20,50.2},{20,50},{40,50}}, color={0,0,255}));
  connect(echangeurAPlaques1D.Sf, puitsP1.C) annotation (Line(points={{-5,44},{
          -6,44},{-6,30},{20,30}}, color={0,0,255}));
  annotation (experiment(StopTime=1000), Diagram(graphics));
end TestDynamicWaterWaterExchanger;
