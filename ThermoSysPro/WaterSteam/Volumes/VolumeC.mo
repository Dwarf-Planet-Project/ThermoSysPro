within ThermoSysPro.WaterSteam.Volumes;
model VolumeC "Mixing volume with 3 inlets and 1 outlet"
  parameter Modelica.SIunits.Volume V=1 "Volume";
  parameter Modelica.SIunits.AbsolutePressure P0=1e5
    "Initial fluid pressure (active if dynamic_mass_balance=true and steady_state=false)";
  parameter Modelica.SIunits.SpecificEnthalpy h0=1e5
    "Initial fluid specific enthalpy (active if steady_state=false)";
  parameter Boolean dynamic_mass_balance=false
    "true: dynamic mass balance equation - false: static mass balance equation";
  parameter Boolean steady_state=true
    "true: start from steady state - false: start from (P0, h0)";
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";

public
  Modelica.SIunits.Temperature T "Fluid temperature";
  Modelica.SIunits.AbsolutePressure P(start=1.e5) "Fluid pressure";
  Modelica.SIunits.SpecificEnthalpy h(start=100000) "Fluid specific enthalpy";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  Modelica.SIunits.MassFlowRate BQ
    "Right hand side of the mass balance equation";
  Modelica.SIunits.Power BH "Right hand side of the energybalance equation";
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro
    "Propriétés de l'eau"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}}, rotation
          =0)));
public
  Connectors.FluidInlet Ce1
                           annotation (Placement(transformation(extent={{-110,
            -10},{-90,10}}, rotation=0)));
  Connectors.FluidInlet Ce2
                           annotation (Placement(transformation(extent={{-10,80},
            {10,100}}, rotation=0)));
  Connectors.FluidOutlet Cs
                          annotation (Placement(transformation(extent={{90,-10},
            {110,10}}, rotation=0)));
  Connectors.FluidInlet Ce3
                           annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));
initial equation
  if steady_state then
    if dynamic_mass_balance then
      der(P) = 0;
    end if;

    der(h) = 0;
  else
    if dynamic_mass_balance then
      P = P0;
    end if;

    h = h0;
  end if;

equation
  assert(V > 0, "Volume non-positive");

  /* Unconnected connectors */
  if (cardinality(Ce1) == 0) then
    Ce1.Q = 0;
    Ce1.h = 1.e5;
    Ce1.b = true;
  end if;

  if (cardinality(Ce2) == 0) then
    Ce2.Q = 0;
    Ce2.h = 1.e5;
    Ce2.b = true;
  end if;

  if (cardinality(Ce3) == 0) then
    Ce3.Q = 0;
    Ce3.h = 1.e5;
    Ce3.b = true;
  end if;

  if (cardinality(Cs) == 0) then
    Cs.Q = 0;
    Cs.h = 1.e5;
    Cs.a = true;
  end if;

  /* Mass balance equation */
  BQ = Ce1.Q + Ce2.Q + Ce3.Q - Cs.Q;
  if dynamic_mass_balance then
    V*(pro.ddph*der(P) + pro.ddhp*der(h)) = BQ;
  else
    0 = BQ;
  end if;

  P = Ce1.P;
  P = Ce2.P;
  P = Ce3.P;
  P = Cs.P;

  /* Energy balance equation */
  BH = Ce1.Q*Ce1.h + Ce2.Q*Ce2.h + Ce3.Q*Ce3.h - Cs.Q*Cs.h;
  if dynamic_mass_balance then
    V*((h*pro.ddph - 1)*der(P) + (h*pro.ddhp + rho)*der(h)) = BH;
  else
    V*rho*der(h) = BH;
  end if;

  Ce1.h_vol = h;
  Ce2.h_vol = h;
  Ce3.h_vol = h;
  Cs.h_vol = h;

  /* Fluid thermodynamic properties */
  pro = ThermoSysPro.Properties.Fluid.Ph(P, h, mode, fluid);

  T = pro.T;

  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;

  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Line(points={{-90,0},{90,0}}),
        Line(points={{0,90},{0,-100}}),
        Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Line(points={{0,90},{0,-100}}),
        Line(points={{-90,0},{90,0}}),
        Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Window(
      x=0.09,
      y=0.2,
      width=0.66,
      height=0.69),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
", revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
end VolumeC;
