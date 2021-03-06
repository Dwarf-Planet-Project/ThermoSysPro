within ThermoSysPro.Solar;
model SolarCollector "Solar Collector"
  parameter Modelica.SIunits.Length f=1 "Focal length";
  parameter Real RimAngle=90 "Rim Angle";
  parameter Modelica.SIunits.Length L=1 "Width of the collector";
  parameter Integer Ns=10 "Number of cells";
  parameter Modelica.SIunits.Diameter DTube=0.1 "Tube diameter";
  parameter Modelica.SIunits.Diameter DGlass=0.11 "Glass diameter";
  parameter Modelica.SIunits.Length e=1.e-4 "Glass thickness";
  parameter Real TauN=0.91 "Glass transmittivity at normal incidence";
  parameter Real AlphaN=0.97 "Tube absorptivity at normal incidence";
  parameter Real AlphaGlass=0.03 "Glass absorptivity at normal incidence";
  parameter Real EpsTube=0.06 "Tube emissivity";
  parameter Real EpsGlass=0.86 "Glass emissivity";
  parameter Real R=0.8 "Mirror reflectivity";
  parameter Real Gamma=0.83 "Intercept factor";
  parameter Modelica.SIunits.ThermalConductivity Lambda=0.00262
    "Gas thermal conductivity";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer h=3.06
    "Heat transfer coefficient";
  parameter Modelica.SIunits.SpecificHeatCapacity cp_glass=720
    "Glass heat capacity";
  parameter Modelica.SIunits.Density rho_glass=2500 "Glass density";
  parameter Modelica.SIunits.Temperature T0=350
    "Initial temperature (active if steady_state=false)";
  parameter Boolean steady_state=true
    "true: start from steady state - false: start from T0";

protected
  constant Real pi=Modelica.Constants.pi "pi";
  constant Real sigma=5.67e-8 "Bolzmann constant";

public
  Real PhiSun(start=1) "Radiation flux";
  Real Theta(start=0) "Incidence angle";
  Modelica.SIunits.Temperature Twall[Ns](start=fill(350,Ns))
    "Pipe wall temperature";
  Modelica.SIunits.Temperature Tatm(start=300) "Atmospheric temperature";
  Real WTube[Ns](start=fill(1,Ns)) "Flux to the pipe";
  Modelica.SIunits.Area AReflector(start=1) "Reflector surface";
  Modelica.SIunits.Area AGlass(start=1) "Glass surface";
  Modelica.SIunits.Area ATube(start=1) "Pipe surface";
  Modelica.SIunits.Mass dM(start=1) "Glass mass";
  Real OptEff(start=1) "Optical efficiency";
  Real IAM(start=1) "Incidence angle modifier";
  Real TauAlphaN(start=1) "Transmittivity-absorptivity factor";
  Modelica.SIunits.Power WRadWall[Ns](start=fill(0,Ns)) "Radiation of the wall";
  Modelica.SIunits.Power WConvWall[Ns](start=fill(0,Ns))
    "Convection of the wall";
  Modelica.SIunits.Power WCondWall[Ns](start=fill(0,Ns))
    "Conduction of the wall";
  Modelica.SIunits.Power WRadGlass[Ns](start=fill(0,Ns))
    "Radiation of the glass layer";
  Modelica.SIunits.Power WConvGlass[Ns](start=fill(0,Ns))
    "Convection of the glass layer";
  Modelica.SIunits.Power WAbsGlass[Ns](start=fill(0,Ns))
    "Absorption of the glass layer";
  Modelica.SIunits.Temperature Tsky(start=300) "Sky temperature";
  Modelica.SIunits.Temperature Tglass[Ns](start=fill(300,Ns))
    "Glass temperature";

  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ISun
    "Flux (W/m²)"
    annotation (Placement(transformation(extent={{-100,0},{-80,20}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IncidenceAngle "Degré"
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}},
          rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal AtmTemp
    "Atmospheric temperature (K)"
    annotation (Placement(transformation(extent={{-100,40},{-80,60}}, rotation=
            0)));
  ThermoSysPro.Thermal.Connectors.ThermalPort ITemperature[Ns]
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}}, rotation=
            0)));
initial equation
  if steady_state then
    for i in 1:Ns loop
      der(Tglass[i]) = 0;
    end for;

  else
    for i in 1:Ns loop
      Tglass[i] = T0;
    end for;
  end if;

equation
  /* Input connectors */
  PhiSun = ISun.signal;
  Theta = IncidenceAngle.signal;
  Tatm = AtmTemp.signal;

  /* Reflector area */
  AReflector = f*4*Modelica.Math.tan(RimAngle*pi/180./2)*L;

  /* Glass area */
  AGlass = pi*DGlass*L;

  /* Glass mass of one section */
  dM = rho_glass*pi*((DGlass + 2*e)^2 - DGlass^2)/4*L/Ns;

  /* Pipe area */
  ATube = pi*DTube*L;

  /* Incidence angle modifier model */
  IAM = Modelica.Math.cos(Theta*pi/180);

  /* Transmittivity-absorptivity factor */
  TauAlphaN = TauN*AlphaN*1/(1-(1-TauN)*(AlphaN));

  /* Optical efficiency */
  OptEff = IAM*TauAlphaN*Gamma*R;

  /* Sky temperature */
  Tsky = 0.0552*Tatm^(1.5);

  for i in 1:Ns loop
    /* Input connectors */
    Twall[i] = ITemperature[i].T;

    /* Output connectors */
    ITemperature[i].W = WTube[i];

    /* Wall */
    WRadWall[i] = ATube/Ns*sigma*EpsTube*(Twall[i]^(4) - Tglass[i]^(4));
    WConvWall[i] = 0;
    WCondWall[i] = ATube/Ns*Lambda*(Twall[i] - Tglass[i])/(DTube/2*Modelica.Math.log(DGlass/DTube));

    /* Glass */
    WRadGlass[i] = AGlass/Ns*sigma*EpsGlass*(Tglass[i]^(4) - Tsky^(4));
    WConvGlass[i] = AGlass/Ns*h*(Tglass[i] - Tatm);
    WAbsGlass[i] = PhiSun*AReflector/Ns*AlphaGlass*IAM*Gamma*R;

    /* Glass balance */
    dM*cp_glass*der(Tglass[i]) = WAbsGlass[i] + WCondWall[i] + WConvWall[i] + WRadWall[i] - WConvGlass[i] - WRadGlass[i];

    /* Flux to the pipe */
    -WTube[i] = OptEff*PhiSun*AReflector/Ns - WRadGlass[i] - WConvGlass[i];
  end for;

  annotation (Diagram(graphics={Rectangle(
          extent={{-80,60},{80,-40}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid)}),
                                       Icon(graphics={Rectangle(
          extent={{-80,60},{80,-40}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid), Bitmap(extent={{-72,58},{84,-38}},
            fileName=
            "SolarCollector.bmp")}),
    DymolaStoredErrors,
    Documentation(revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Guillaume Larrignon</li>
<li>
    Baligh El Hefni</li>
<li>
    Benoît Bride</li>
</ul>
</html>
", info="<html>
<p><b>Copyright &copy; EDF 2002 - 2013</b> </p>
<p><b>ThermoSysPro Version 3.1</b> </p>
</html>"));
end SolarCollector;
