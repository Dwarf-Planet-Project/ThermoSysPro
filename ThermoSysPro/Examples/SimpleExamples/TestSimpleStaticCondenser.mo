within ThermoSysPro.Examples.SimpleExamples;
model TestSimpleStaticCondenser

  ThermoSysPro.WaterSteam.HeatExchangers.SimpleStaticCondenser
    simpleStaticCondenser annotation (Placement(transformation(extent={{-20,20},
            {0,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP
    annotation (Placement(transformation(extent={{-60,20},{-40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(T0=400)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP
    annotation (Placement(transformation(extent={{20,20},{40,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP1
    annotation (Placement(transformation(extent={{20,-20},{40,0}}, rotation=0)));
equation
  connect(sourceP.C, simpleStaticCondenser.Ef) annotation (Line(points={{-40,30},
          {-20,30}}, color={0,0,255}));
  connect(sourceP1.C, simpleStaticCondenser.Ec) annotation (Line(points={{-40,
          -10},{-16,-10},{-16,20}}, color={0,0,255}));
  connect(simpleStaticCondenser.Sf, sinkP.C) annotation (Line(points={{0,29.9},
          {10,29.9},{10,30},{20,30}}, color={0,0,255}));
  connect(simpleStaticCondenser.Sc, sinkP1.C) annotation (Line(points={{-4,20},
          {-4,-10},{20,-10}}, color={0,0,255}));
  annotation (Diagram(graphics));
end TestSimpleStaticCondenser;
