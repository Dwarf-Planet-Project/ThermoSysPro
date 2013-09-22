within ThermoSysPro.Examples.SimpleExamples;
model TestRefP

  ThermoSysPro.WaterSteam.BoundaryConditions.RefP refP
    annotation (Placement(transformation(extent={{-90,0},{-70,20}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(
                                                 k=2.e5)
    annotation (Placement(transformation(extent={{-100,60},{-80,80}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump pump
    annotation (Placement(transformation(extent={{-30,0},{-10,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerQ loopBreakerQ
    annotation (Placement(transformation(extent={{0,0},{20,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerH loopBreakerH
    annotation (Placement(transformation(extent={{30,0},{50,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.RefT refT
    annotation (Placement(transformation(extent={{-60,0},{-40,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe
    annotation (Placement(transformation(extent={{60,0},{80,20}}, rotation=0)));
equation
  connect(refP.C2, refT.C1) annotation (Line(points={{-70,10},{-60,10}}, color=
          {0,0,255}));
  connect(refT.C2, pump.C1) annotation (Line(points={{-40,10},{-30,10}}, color=
          {0,0,255}));
  connect(constante.y, refP.IPressure) annotation (Line(points={{-79,70},{-60,
          70},{-60,34},{-80,34},{-80,21}}));
  connect(lumpedStraightPipe.C2, refP.C1) annotation (Line(points={{80,10},{100,
          10},{100,-20},{-100,-20},{-100,10},{-90,10}}, color={0,0,255}));
  connect(pump.C2, loopBreakerQ.C1)
    annotation (Line(points={{-10,10},{0,10}}, color={0,0,255}));
  connect(loopBreakerQ.C2, loopBreakerH.C1)
    annotation (Line(points={{20,10},{30,10}}, color={0,0,255}));
  connect(loopBreakerH.C2, lumpedStraightPipe.C1)
    annotation (Line(points={{50,10},{60,10}}, color={0,0,255}));
  annotation (experiment(stopTime=1000), Diagram(graphics));
end TestRefP;
