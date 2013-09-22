within ThermoSysPro.Examples.SimpleExamples;
model TestStaticWaterWaterExchanger

  ThermoSysPro.WaterSteam.HeatExchangers.StaticWaterWaterExchanger
    plateHeatExchanger(modec=1, modef=1)
               annotation (Placement(transformation(extent={{-20,44},{0,64}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP2(
                                            T0=340)
    annotation (Placement(transformation(extent={{-80,44},{-60,64}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP3
    annotation (Placement(transformation(extent={{-60,24},{-40,44}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP2
                                          annotation (Placement(transformation(
          extent={{40,44},{60,64}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP3
                                          annotation (Placement(transformation(
          extent={{20,24},{40,44}}, rotation=0)));
equation
  connect(sourceP2.C, plateHeatExchanger.Ec)
    annotation (Line(points={{-60,54},{-20,54}}, color={0,0,255}));
  connect(sourceP3.C, plateHeatExchanger.Ef)
                                            annotation (Line(points={{-40,34},{
          -15,34},{-15,48}}, color={0,0,255}));
  connect(plateHeatExchanger.Sc, puitsP2.C)
                                           annotation (Line(points={{0,54.2},{
          20,54.2},{20,54},{40,54}}, color={0,0,255}));
  connect(plateHeatExchanger.Sf, puitsP3.C)
                                           annotation (Line(points={{-5,48},{-6,
          48},{-6,34},{20,34}}, color={0,0,255}));
  annotation (experiment(stopTime=1000), Diagram(graphics));
end TestStaticWaterWaterExchanger;
