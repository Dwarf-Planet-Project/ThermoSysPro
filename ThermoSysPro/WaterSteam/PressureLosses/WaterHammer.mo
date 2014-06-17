within ThermoSysPro.WaterSteam.PressureLosses;
model WaterHammer "Water hammer"
  parameter Modelica.SIunits.Length L=10. "Pipe length";
  parameter Modelica.SIunits.Diameter D=0.1 "Internal pipe diameter";
  parameter Modelica.SIunits.Position z1=0 "Inlet altitude";
  parameter Modelica.SIunits.Position z2=0 "Outlet altitude";
  parameter Real lambda=0.03 "Friction pressure loss coefficient";
  parameter Integer n=10 "Number of sections";
  parameter Modelica.SIunits.Velocity a=1000 "Fluid speed of sound";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";

protected
  constant Modelica.SIunits.Acceleration g=Modelica.Constants.g_n
    "Gravity constant";
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Integer N=2*n "Number of segments";
  parameter Modelica.SIunits.Area A=pi*D^2/4 "Pipe cross-sectional area";
  parameter Modelica.SIunits.PathLength dx=L/N "Length of a segment";
  parameter Modelica.SIunits.Time dt=dx/a "Time step";

public
  Modelica.SIunits.Length H[N + 1] "Head in segment i";
  Modelica.SIunits.VolumeFlowRate Qv[N + 1] "Volume flow in segment i";
  Real B "(s-3)";
  Real R "(s2/m5)";
  discrete Modelica.SIunits.Length Cp1[N + 1];
  discrete Modelica.SIunits.Length Cm1[N + 1];
  discrete Real Bp1[N + 1] "(s-3)";
  discrete Real Bm1[N + 1] "(s-3)";
  discrete Modelica.SIunits.Length Cp2[N + 1];
  discrete Modelica.SIunits.Length Cm2[N + 1];
  discrete Real Bp2[N + 1] "(s-3)";
  discrete Real Bm2[N + 1] "(s-3)";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  Modelica.SIunits.Temperature T(start=290) "Fluid temperature";
  Modelica.SIunits.AbsolutePressure P(start=1.e5) "Fluid average pressure";
  Modelica.SIunits.SpecificEnthalpy h(start=100000) "Fluid specific enthalpy";

public
  Connectors.FluidInlet C1
                          annotation (                            layer="icon",
      Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
  Connectors.FluidOutlet C2
                          annotation (                          layer="icon",
      Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro
    annotation (Placement(transformation(extent={{-100,80},{-80,100}}, rotation
          =0)));
equation

  C1.h = C2.h;
  h = C1.h;

  C1.Q = rho*Qv[1];
  C1.P = rho*g*H[1];

  C2.Q = rho*Qv[N + 1];
  C2.P = rho*g*(H[N + 1] - (z2 - z1));

  /* Flow reversal */
  //  0 = if (C1.Q > 0) then C1.h - C1.h_vol else C2.h - C2.h_vol;
  C1.h_vol = C1.h;

  /* Characteristics method */
  R = lambda*dx/(2*g*D*A^2);
  B = a/(g*A);

  when sample(dt, 2*dt) then
    for i in 2:2:N loop
      Cp2[i] = pre(H[i - 1]) + B*pre(Qv[i - 1]);
      Cm2[i] = pre(H[i + 1]) - B*pre(Qv[i + 1]);
      Bp2[i] = B + R*abs(pre(Qv[i - 1]));
      Bm2[i] = B + R*abs(pre(Qv[i + 1]));
    end for;

    for i in 1:2:N + 1 loop
      Cp2[i] = 0;
      Cm2[i] = 0;
      Bp2[i] = 0;
      Bm2[i] = 0;
    end for;
  end when;

  when sample(0, 2*dt) then
    Cp1[1] = 0;
    Cm1[1] = pre(H[2]) - B*pre(Qv[2]);
    Bp1[1] = 0;
    Bm1[1] = B + R*abs(pre(Qv[2]));

    for i in 3:2:N - 1 loop
      Cp1[i] = pre(H[i - 1]) + B*pre(Qv[i - 1]);
      Cm1[i] = pre(H[i + 1]) - B*pre(Qv[i + 1]);
      Bp1[i] = B + R*abs(pre(Qv[i - 1]));
      Bm1[i] = B + R*abs(pre(Qv[i + 1]));
    end for;

    for i in 2:2:N loop
      Cp1[i] = 0;
      Cm1[i] = 0;
      Bp1[i] = 0;
      Bm1[i] = 0;
    end for;

    Cp1[N + 1] = pre(H[N]) + B*pre(Qv[N]);
    Cm1[N + 1] = 0;
    Bp1[N + 1] = B + R*abs(pre(Qv[N]));
    Bm1[N + 1] = 0;
  end when;

  /* Steady state at initial time */
  if (time < 2*dt) then
    for i in 2:N + 1 loop
      H[i] = H[i - 1] - R*Qv[i]*abs(Qv[i]);
      Qv[i] = Qv[i - 1];
    end for;

  /* Transient (2 equations) computed by the characteristics method */
  else
    for i in 2:2:N loop
      H[i] = (Cp2[i]*Bm2[i] + Cm2[i]*Bp2[i])/(Bp2[i] + Bm2[i]);
      Qv[i] = (Cp2[i] - Cm2[i])/(Bp2[i] + Bm2[i]);
    end for;

    for i in 3:2:N - 1 loop
      H[i] = (Cp1[i]*Bm1[i] + Cm1[i]*Bp1[i])/(Bp1[i] + Bm1[i]);
      Qv[i] = (Cp1[i] - Cm1[i])/(Bp1[i] + Bm1[i]);
    end for;

    H[1] = Cm1[1] + Bm1[1]*Qv[1];
    H[N + 1] = Cp1[N + 1] - Bp1[N + 1]*Qv[N + 1];
  end if;

  /* Fluid properties */
  P = (C1.P + C2.P)/2;

  pro = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(P, h, mode);

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
        Rectangle(
          extent={{-100,20},{-60,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{-60,20},{-20,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{20,20},{60,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{60,20},{100,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255})}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Rectangle(
          extent={{-100,20},{-60,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{-60,20},{-20,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{20,20},{60,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Rectangle(
          extent={{60,20},{100,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Text(
          extent={{-20,60},{20,20}},
          lineColor={0,0,255},
          fillColor={170,85,255},
          fillPattern=FillPattern.Solid,
          textString =                      "C")}),
    Window(
      x=0.08,
      y=0,
      width=0.87,
      height=0.97),
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
end WaterHammer;
