within ThermoSysPro.Correlations.Misc;
function WBCorrectiveDiameterCoefficient "Corrective diameter coefficient" 
  input Real PasTD "Transverse step on the diameter";
  input Real PasLD "Longitudinal steap on the diameter";
  input Modelica.SIunits.Diameter Dext "Pipes external diameter";
  
  output Real Optl;
  
protected 
  constant Real TabTD[6]={1.,1.6,2.2,3.,3.6,6.};
  constant Real TabLD[4]={1.,2.,3.,4.};
  constant Real TabOpt[4, 6]=[0.4, 1., 2.3, 5.1, 6.8, 12.; 1.7, 3.1, 5., 7.1,
      8.5, 13.1; 5.1, 6.3, 7.5, 9.1, 10.2, 14.3; 7.7, 8.7, 9.7, 11., 11.9, 16.];
  Real Opt "Interpolated parameter";
algorithm 
  
  if PasLD > 0 then
    Opt := ThermoSysPro.Functions.TableLinearInterpolation(TabLD, TabTD, TabOpt, PasLD, PasTD);
    Optl := Opt*Dext;
  else
    Optl := 0;
  end if;
  
  annotation (
    smoothOrder=2,
    Icon,            Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
",  revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
end WBCorrectiveDiameterCoefficient;
