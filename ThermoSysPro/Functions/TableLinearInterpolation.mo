within ThermoSysPro.Functions;
function TableLinearInterpolation "Table linear interpolation"
  input Real TabP[:] "1st reference table";
  input Real TabX[:] "2nd reference table";
  input Real TabY[:, :] "Results table";
  input Real P "1st reference value";
  input Real X "2nd reference value";

  output Real Y "Interpolated result";

protected
  Real deltaYX "Y step wrt. X";
  Real deltaYP "Y step wrt. P";

algorithm
  (Y,deltaYX,deltaYP) := ThermoSysPro.Functions.Utilities.TableLinearInterpolation_i(
    TabP,
    TabX,
    TabY,
    P,
    X);

  annotation (
    smoothOrder=2,
    Icon(graphics),        Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 3.0</b></p>
</HTML>
",        revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
end TableLinearInterpolation;
