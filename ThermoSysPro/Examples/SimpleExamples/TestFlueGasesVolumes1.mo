within ThermoSysPro.Examples.SimpleExamples;
model TestFlueGasesVolumes1

  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases1 annotation (Placement(transformation(extent=
            {{-60,-60},{-40,-40}}, rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceFlueGasesP
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}},
          rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkFlueGasesP
    annotation (Placement(transformation(extent={{60,-60},{80,-40}}, rotation=0)));
  ThermoSysPro.FlueGases.Volumes.VolumeATh volumeFlueGasesATh
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}}, rotation=0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases2 annotation (Placement(transformation(extent=
            {{20,-60},{40,-40}}, rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkFlueGasesP1
    annotation (Placement(transformation(extent={{60,-100},{80,-80}}, rotation=
            0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases4 annotation (Placement(transformation(extent=
            {{20,-100},{40,-80}}, rotation=0)));
  ThermoSysPro.FlueGases.Volumes.VolumeCTh volumeFlueGasesCTh
    annotation (Placement(transformation(
        origin={-10,30},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases3 annotation (Placement(transformation(
        origin={-10,-10},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases5 annotation (Placement(transformation(extent=
            {{-60,20},{-40,40}}, rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceFlueGasesP1
    annotation (Placement(transformation(extent={{-100,20},{-80,40}}, rotation=
            0)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss
    singularPressureLossFlueGases6 annotation (Placement(transformation(extent=
            {{-60,60},{-40,80}}, rotation=0)));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceFlueGasesP2
    annotation (Placement(transformation(extent={{-100,60},{-80,80}}, rotation=
            0)));
equation
  connect(sourceFlueGasesP.C, singularPressureLossFlueGases1.C1) annotation (Line(
      points={{-80,-50},{-60,-50}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases1.C2, volumeFlueGasesATh.Ce1)
    annotation (Line(
      points={{-40,-50},{-20,-50}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases2.C2, sinkFlueGasesP.C) annotation (Line(
      points={{40,-50},{60.2,-50}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases4.C2, sinkFlueGasesP1.C) annotation (Line(
      points={{40,-90},{60.2,-90}},
      color={0,0,0},
      thickness=1));
  connect(volumeFlueGasesATh.Cs1, singularPressureLossFlueGases2.C1)
    annotation (Line(
      points={{0,-50},{20,-50}},
      color={0,0,0},
      thickness=1));
  connect(volumeFlueGasesATh.Cs2, singularPressureLossFlueGases4.C1)
    annotation (Line(
      points={{-10,-60},{-10,-90},{20,-90}},
      color={0,0,0},
      thickness=1));
  connect(volumeFlueGasesCTh.Cs, singularPressureLossFlueGases3.C1) annotation (Line(
      points={{-10,20},{-10,0}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases3.C2, volumeFlueGasesATh.Ce2)
    annotation (Line(
      points={{-10,-20},{-10,-40}},
      color={0,0,0},
      thickness=1));
  connect(sourceFlueGasesP1.C, singularPressureLossFlueGases5.C1)
                                                                 annotation (Line(
      points={{-80,30},{-60,30}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases5.C2, volumeFlueGasesCTh.Ce3)
    annotation (Line(
      points={{-40,30},{-20,30}},
      color={0,0,0},
      thickness=1));
  connect(sourceFlueGasesP2.C, singularPressureLossFlueGases6.C1)
                                                                 annotation (Line(
      points={{-80,70},{-60,70}},
      color={0,0,0},
      thickness=1));
  connect(singularPressureLossFlueGases6.C2, volumeFlueGasesCTh.Ce1)
    annotation (Line(
      points={{-40,70},{-10,70},{-10,40}},
      color={0,0,0},
      thickness=1));
  annotation (experiment(stopTime=200), Diagram(graphics));
end TestFlueGasesVolumes1;
