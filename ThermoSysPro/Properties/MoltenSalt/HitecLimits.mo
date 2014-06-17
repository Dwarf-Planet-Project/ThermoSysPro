within ThermoSysPro.Properties.MoltenSalt;
package HitecLimits

  constant Real MINPOS=1.0e-9
    "minimal value for physical variables which are always > 0.0";

  constant Modelica.SIunits.Density DMIN=1690.584 "Minimum density";
  constant Modelica.SIunits.Density DMAX=1975.332 "Maximum densitye";
  constant Modelica.SIunits.Density DNOM=1938.0 "Nominal density";
  constant Modelica.SIunits.ThermalConductivity LAMMIN=0.239466
    "Minimum thermal conductivity";
  constant Modelica.SIunits.ThermalConductivity LAMNOM=0.46018
    "Nominal thermal conductivity";
  constant Modelica.SIunits.ThermalConductivity LAMMAX=0.493483
    "Maximum thermal conductivity";
  constant Modelica.SIunits.DynamicViscosity ETAMIN=9.93e-4
    "Minimum dynamic viscosity";
  constant Modelica.SIunits.DynamicViscosity ETAMAX=1.3e-2
    "Maximum dynamic viscosity";
  constant Modelica.SIunits.DynamicViscosity ETANOM=7.29e-3
    "Nominal dynamic viscosity";

  constant Modelica.SIunits.SpecificHeatCapacity CPMIN=MINPOS
    "Minimum specific heat capacity";
  constant Modelica.SIunits.SpecificHeatCapacity CPMAX=Modelica.Constants.inf
    "Maximum specific heat capacity";
  constant Modelica.SIunits.SpecificHeatCapacity CPNOM=1.571e3
    "Nominal specific heat capacity";

  constant Modelica.SIunits.Temperature TMIN=200 "Minimum temperature";
  constant Modelica.SIunits.Temperature TMAX=10000 "Maximum temperature";
  constant Modelica.SIunits.Temperature TNOM=800 "Nominal temperature";

end HitecLimits;
