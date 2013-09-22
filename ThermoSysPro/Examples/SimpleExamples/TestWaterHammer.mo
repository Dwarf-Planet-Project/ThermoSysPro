within ThermoSysPro.Examples.SimpleExamples;
model TestWaterHammer

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP PSource1(P0=3000000)
                                                    annotation (Placement(
        transformation(extent={{-100,-20},{-80,0}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.WaterHammer waterHammer(
    L=600,
    D=0.5,
    lambda=0.018,
    a=1200) annotation (Placement(transformation(extent={{-60,-20},{-40,0}},
          rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PSink1(P0=2400000)
                                   annotation (Placement(transformation(extent=
            {{60,-20},{80,0}}, rotation=0)));
  WaterSteam.PressureLosses.ControlValve             VanneTORC1(
      continuous_flow_reversal=true)                               annotation (Placement(
        transformation(extent={{20,-14},{40,6}}, rotation=0)));
  InstrumentationAndControl.Blocks.Sources.Rampe rampe(
    Initialvalue=1,
    Finalvalue=0.01,
    Duration=0.15)  annotation (Placement(transformation(extent={{-40,20},{-20,
            40}}, rotation=0)));
  WaterSteam.Volumes.VolumeA volumeA annotation (Placement(transformation(
          extent={{-20,-20},{0,0}}, rotation=0)));
equation
  connect(PSource1.C, waterHammer.C1)
                                  annotation (Line(points={{-80,-10},{-60,-10}},
        color={0,0,255}));
  connect(VanneTORC1.C2, PSink1.C)  annotation (Line(points={{40,-10},{60,-10}},
        color={0,0,255}));
  connect(rampe.y, VanneTORC1.Ouv)
    annotation (Line(points={{-19,30},{30,30},{30,7}}, smooth=Smooth.None));
  connect(waterHammer.C2, volumeA.Ce1) annotation (Line(
      points={{-40,-10},{-20,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(volumeA.Cs1, VanneTORC1.C1) annotation (Line(
      points={{0,-10},{20,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (experiment(stopTime=10),
    Window(
      x=0.17,
      y=0.16,
      width=0.6,
      height=0.6),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestWaterHammer;
