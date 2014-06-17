within ThermoSysPro.Functions;
function SmoothMax "Smooth max function"
  input Real x1;
  input Real x2;
  input Real alpha=100;

  output Real y;

algorithm
  y := SmoothStep(x1 - x2, alpha)*x1 + SmoothStep(x2 - x1, alpha)*x2;

  annotation (smoothOrder=2, Documentation(info="<html>
<p><h4>Copyright &copy; EDF 2002 - 2012</h4></p>
<p><b>ThermoSysPro Version 3.1</b> </p>
</html>"));
end SmoothMax;
