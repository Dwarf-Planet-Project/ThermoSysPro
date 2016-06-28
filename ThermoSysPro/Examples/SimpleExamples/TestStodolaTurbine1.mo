within ThermoSysPro.Examples.SimpleExamples;
model TestStodolaTurbine1
   parameter Modelica.SIunits.AbsolutePressure PoutPump(fixed=false,start=13e5)
    "Flow pressure at the outlet of the pump";
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine stodolaTurbine(pros1(x(start=
            1)), Hrs(start=2931e3))
    annotation (Placement(transformation(extent={{-60,60},{-40,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(                 mode=0, P0=45e5,
    C(h_vol(start=75002)))
    annotation (Placement(transformation(extent={{-20,60},{0,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=65e5) annotation (Placement(transformation(extent={{-100,60},{-80,80}},
          rotation=0)));
  ThermoSysPro.WaterSteam.Machines.DynamicCentrifugalPump
    DynamicCentrifugalPump1(
                        Q(fixed=true, start=50),
    R(start=20.347),
    Qv(start=11.04),
    Ch(start=1380),
    Pm(start=11.565e5),
    h(start=3040111),
    C1(P(start=10e5)),
    C2(P(start=3.e6)))
    annotation (Placement(transformation(extent={{20,-40},{40,-20}}, rotation=0)));
  ThermoSysPro.ElectroMechanics.Machines.Shaft Shaft1
    annotation (Placement(transformation(extent={{-20,-90},{0,-70}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1(                 mode=0, P0=13e5)
    annotation (Placement(transformation(extent={{60,-40},{80,-20}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=10e5) annotation (Placement(transformation(extent={{-20,-40},{0,-20}},
          rotation=0)));
  InstrumentationAndControl.Blocks.Sources.Constante Pout(k=PoutPump)
    annotation (Placement(transformation(extent={{56,-12},{68,0}}, rotation=0)));
equation
  connect(Shaft1.C2, DynamicCentrifugalPump1.M)
    annotation (Line(points={{1,-80},{30,-80},{30,-41}}));
  connect(stodolaTurbine.M, Shaft1.C1)
    annotation (Line(points={{-50,60},{-50,-80},{-21,-80}}));
  connect(sourceP1.C, DynamicCentrifugalPump1.C1)
    annotation (Line(points={{0,-30},{20,-30}}, color={0,0,255}));
  connect(DynamicCentrifugalPump1.C2, puitsP1.C) annotation (Line(points={{40,
          -30.2},{50,-30.2},{50,-30},{60,-30}}, color={0,0,255}));
  connect(sourceP.C, stodolaTurbine.Ce)
    annotation (Line(points={{-80,70},{-60.1,70}}, color={0,0,255}));
  connect(stodolaTurbine.Cs, puitsP.C)
    annotation (Line(points={{-39.9,70},{-20,70}}, color={0,0,255}));
  connect(Pout.y, puitsP1.IPressure)
    annotation (Line(points={{68.6,-6},{88,-6},{88,-30},{75,-30}}));
  annotation (
    Window(
      x=0.32,
      y=0.02,
      width=0.39,
      height=0.47),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TestStodolaTurbine1;
