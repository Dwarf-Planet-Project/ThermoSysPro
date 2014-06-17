within ThermoSysPro.Examples.SimpleExamples;
model TestSensors

  ThermoSysPro.WaterSteam.Sensors.SensorH specificEnthalpySensor
    annotation (Placement(transformation(extent={{-60,8},{-40,28}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQ massFlowSensor
    annotation (Placement(transformation(extent={{-20,8},{0,28}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorQv volumetricFlowSensor
    annotation (Placement(transformation(extent={{20,8},{40,28}}, rotation=0)));
  ThermoSysPro.WaterSteam.Sensors.SensorP pressureSensor
    annotation (Placement(transformation(extent={{-60,-32},{-40,-12}}, rotation
          =0)));
  ThermoSysPro.WaterSteam.Sensors.SensorT temperatureSensor
    annotation (Placement(transformation(extent={{-20,-32},{0,-12}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP
                                         annotation (Placement(transformation(
          extent={{60,-40},{80,-20}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP
                                           annotation (Placement(transformation(
          extent={{-100,0},{-80,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP
    annotation (Placement(transformation(extent={{20,-40},{40,-20}}, rotation=0)));
equation
  connect(sourceP.C, specificEnthalpySensor.C1)
    annotation (Line(points={{-80,10},{-60,10}}, color={0,0,255}));
  connect(specificEnthalpySensor.C2, massFlowSensor.C1)
    annotation (Line(points={{-39.8,10},{-20,10}}, color={0,0,255}));
  connect(massFlowSensor.C2, volumetricFlowSensor.C1)
    annotation (Line(points={{0.2,10},{20,10}}, color={0,0,255}));
  connect(volumetricFlowSensor.C2, pressureSensor.C1) annotation (Line(points={
          {40.2,10},{60,10},{60,0},{-80,0},{-80,-30},{-60,-30}}, color={0,0,255}));
  connect(pressureSensor.C2, temperatureSensor.C1) annotation (Line(points={{
          -39.8,-30},{-20,-30}}, color={0,0,255}));
  connect(temperatureSensor.C2, perteDP.C1)
    annotation (Line(points={{0.2,-30},{20,-30}}, color={0,0,255}));
  connect(perteDP.C2, puitsP.C)
    annotation (Line(points={{40,-30},{60,-30}}, color={0,0,255}));
  annotation (Diagram(graphics));
end TestSensors;
