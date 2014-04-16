within ;
package ThermoSysPro


annotation (
  Icon(graphics={
      Rectangle(
        extent={{-100,-100},{80,50}},
        lineColor={0,0,255},
        fillColor={235,235,235},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
        lineColor={0,0,255},
        fillColor={235,235,235},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
        lineColor={0,0,255},
        fillColor={235,235,235},
        fillPattern=FillPattern.Solid),
      Text(
        extent={{-120,135},{120,70}},
        lineColor={255,0,0},
        textString=
             "%name"),
      Text(
        extent={{-90,40},{70,10}},
        lineColor={160,160,164},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        textString=
             "Library"),
      Rectangle(extent={{-32,-6},{16,-35}}, lineColor={0,0,0}),
      Rectangle(extent={{-32,-56},{16,-85}}, lineColor={0,0,0}),
      Line(points={{16,-20},{49,-20},{49,-71},{16,-71}}, color={0,0,0}),
      Line(points={{-32,-72},{-64,-72},{-64,-21},{-32,-21}}, color={0,0,0}),
      Polygon(
        points={{16,-71},{29,-67},{29,-74},{16,-71}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{-32,-21},{-46,-17},{-46,-25},{-32,-21}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid)}),
  Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>"),
  uses(Modelica(version="3.2.1")),
  version="3.0",
  conversion(noneFromVersion=""),
  __OpenModelica_messageOnLoad="ThermoSysPro is not yet fully operational with OpenModelica.
The authors suggest using Dymola for full benefit of the library, in particular if you are experiencing difficulties.
The current operational status with OpenModelica of the included examples can be found at https://test.openmodelica.org/libraries/ThermoSysPro/BuildModelRecursive.html");
end ThermoSysPro;
