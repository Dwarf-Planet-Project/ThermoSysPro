within ThermoSysPro.Properties.FlueGases;
function FlueGases_Xtot "Density"
  input ThermoSysPro.Units.AbsolutePressure PMF "Flue gases average pressure";
  input ThermoSysPro.Units.AbsoluteTemperature TMF
    "Flue gases average temperature";
  input Real Xco2 "CO2 mass fraction";
  input Real Xh2o "H2O mass fraction";
  input Real Xo2 "O2 mass fraction";
  input Real Xso2 "SO2 mass fraction";

  output Real Xtot "Total molar Mass";

protected
  ThermoSysPro.Properties.ModelicaMediaFlueGases.ThermodynamicState state;
  Real Xn2 "N2 mass fraction";

algorithm
  Xn2 := 1 - Xco2 - Xh2o - Xo2 - Xso2;

  /* Computation of the thermodynamic state */
  // state :=ThermoSysPro.Properties.ModelicaMediaFlueGases.setState_pTX(PMF, TMF, {Xn2,Xo2,Xh2o,Xco2,Xso2});
  state.p := PMF;
  state.T := TMF;
  state.X := {Xn2,Xo2,Xh2o,Xco2,Xso2};

  /* Computation of the Total molar mass of mixture */
  Xtot := ThermoSysPro.Properties.ModelicaMediaFlueGases.molarMass(state);

  annotation (smoothOrder=2,  Icon(graphics={
        Text(extent={{-136,102},{140,42}}, textString=
                                               "%name"),
        Ellipse(
          extent={{-100,40},{100,-100}},
          lineColor={255,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-84,-4},{84,-52}},
          lineColor={255,127,0},
          textString=
               "function")}),
                           Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
end FlueGases_Xtot;
