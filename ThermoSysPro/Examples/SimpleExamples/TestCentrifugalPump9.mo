within ThermoSysPro.Examples.SimpleExamples;
model TestCentrifugalPump9

  ThermoSysPro.WaterSteam.Machines.CentrifugalPump centrifugalPump(mode_car_hn=
        1, mode_car_Cr=1,
    mode_car=1,
    dynamic_mech_equation=false,
    Cm(start=0),
    w_a(start=0))    annotation (Placement(transformation(extent={{-20,20},{0,
            40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ(Q0=100)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink
    annotation (Placement(transformation(extent={{40,20},{60,40}}, rotation=0)));
  ThermoSysPro.ElectroMechanics.BoundaryConditions.SourceMechanicalPower
    sourceMechanicalPower(W0=0) annotation (Placement(transformation(extent={{
            -80,-20},{-60,0}}, rotation=0)));
equation
  connect(sourcePQ.C, centrifugalPump.C1)
    annotation (Line(points={{-60,30},{-20,30}}, color={0,0,255}));
  connect(centrifugalPump.C2, sink.C)
    annotation (Line(points={{0,30},{40,30}}, color={0,0,255}));
  connect(sourceMechanicalPower.M, centrifugalPump.M)
    annotation (Line(points={{-59,-10},{-10,-10},{-10,19}}));
  annotation (experiment(StopTime=1000), 
    Diagram(graphics={
        Text(
          extent={{-100,100},{-60,80}},
          lineColor={0,0,255},
          textString=
               "w=0 ==> w=0.05"),
        Text(
          extent={{-100,80},{-80,60}},
          lineColor={0,0,255},
          textString=
               "q=100"),
        Text(
          extent={{-100,60},{-60,40}},
          lineColor={0,0,255},
          textString=
               "theta=90 ==> theta=71"),
        Text(
          extent={{-40,80},{0,60}},
          lineColor={0,0,255},
          textString=
               "W=0")}));
end TestCentrifugalPump9;
