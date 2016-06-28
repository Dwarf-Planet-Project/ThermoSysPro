within ThermoSysPro.Examples.SimpleExamples;
model TestInvSingularPressureLoss

  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ
    annotation (Placement(transformation(extent={{-80,0},{-60,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkQ
    annotation (Placement(transformation(extent={{40,0},{60,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.InvSingularPressureLoss
    invSingularPressureLoss annotation (Placement(transformation(extent={{-20,0},
            {0,20}}, rotation=0)));
equation
  connect(sourcePQ.C, invSingularPressureLoss.C1) annotation (Line(points={{-60,
          10},{-20,10}}, color={0,0,255}));
  connect(invSingularPressureLoss.C2, sinkQ.C) annotation (Line(points={{0,10},
          {40,10}}, color={0,0,255}));
end TestInvSingularPressureLoss;
