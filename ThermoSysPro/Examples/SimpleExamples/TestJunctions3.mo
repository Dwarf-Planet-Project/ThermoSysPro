within ThermoSysPro.Examples.SimpleExamples;
model TestJunctions3

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP
                                           annotation (Placement(transformation(
          extent={{-104,0},{-84,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(                 P0=2e5)
    annotation (Placement(transformation(extent={{-104,-60},{-84,-40}},
          rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve1
    annotation (Placement(transformation(extent={{-10,6},{10,26}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve2
    annotation (Placement(transformation(extent={{-10,-54},{10,-34}}, rotation=
            0)));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve3
    annotation (Placement(transformation(extent={{50,-24},{70,-4}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP2
                                          annotation (Placement(transformation(
          extent={{82,-30},{102,-10}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe2(
    Duration=1,
    Initialvalue=1,
    Finalvalue=0.05)
                  annotation (Placement(transformation(extent={{32,20},{52,40}},
          rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe3(
                                    Initialvalue=1,
    Starttime=2,
    Finalvalue=0)
    annotation (Placement(transformation(extent={{-30,30},{-10,50}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe4(
                                    Initialvalue=1,
    Starttime=1,
    Finalvalue=0)
    annotation (Placement(transformation(extent={{-30,-30},{-10,-10}}, rotation
          =0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe pipe1
    annotation (Placement(transformation(extent={{-80,0},{-60,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe pipe2
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}}, rotation
          =0)));
  ThermoSysPro.WaterSteam.Junctions.Mixer8 staticVolume
    annotation (Placement(transformation(extent={{-40,0},{-20,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.Mixer8 staticVolume1
    annotation (Placement(transformation(extent={{20,-30},{40,-10}}, rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.Mixer8 staticVolume2
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}}, rotation
          =0)));
equation
  connect(valve3.C2, puitsP2.C)         annotation (Line(points={{70,-20},{82,
          -20}}, color={0,0,255}));
  connect(rampe2.y, valve3.Ouv)
    annotation (Line(points={{53,30},{60,30},{60,-3}}));
  connect(rampe3.y, valve1.Ouv)         annotation (Line(points={{-9,40},{0,40},
          {0,27}}));
  connect(rampe4.y, valve2.Ouv)         annotation (Line(points={{-9,-20},{0,
          -20},{0,-33}}));
  connect(sourceP.C, pipe1.C1)
    annotation (Line(points={{-84,10},{-80,10}}, color={0,0,255}));
  connect(sourceP1.C, pipe2.C1)
    annotation (Line(points={{-84,-50},{-80,-50}}, color={0,0,255}));
  connect(pipe1.C2, staticVolume.Ce4) annotation (Line(points={{-60,10},{-50,10},
          {-50,14},{-40.2,14}}, color={0,0,255}));
  connect(staticVolume.Cs, valve1.C1) annotation (Line(points={{-20,10},{-10,10}},
        color={0,0,255}));
  connect(staticVolume1.Cs, valve3.C1) annotation (Line(points={{40,-20},{50,
          -20}}, color={0,0,255}));
  connect(valve1.C2, staticVolume1.Ce1) annotation (Line(points={{10,10},{33,10},
          {33,-9.8}}, color={0,0,255}));
  connect(valve2.C2, staticVolume1.Ce8) annotation (Line(points={{10,-50},{33,
          -50},{33,-29.9}}, color={0,0,255}));
  connect(pipe2.C2, staticVolume2.Ce4) annotation (Line(points={{-60,-50},{-50,
          -50},{-50,-46},{-40.2,-46}}, color={0,0,255}));
  connect(staticVolume2.Cs, valve2.C1) annotation (Line(points={{-20,-50},{-10,
          -50}}, color={0,0,255}));
  annotation (Diagram(graphics));
end TestJunctions3;
