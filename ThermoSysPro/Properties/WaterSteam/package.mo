within ThermoSysPro.Properties;
package WaterSteam "Water/steam properties library"


  replaceable package IF97 =
      ThermoSysPro.Properties.WaterSteam.IF97_packages.IF97_wAJ;


annotation (
  Icon(coordinateSystem(
      preserveAspectRatio=false,
      extent={{0,0},{312,210}},
      grid={2,2}), graphics={
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
        extent={{-110,125},{130,60}},
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
      Line(points={{-32,-72},{-64,-72},{-64,-21},{-32,-21}}, color={0,0,0})}),
  Window(
    x=0.05,
    y=0.26,
    width=0.25,
    height=0.25,
    library=1,
    autolayout=1),
  Documentation(info="<html>
<p><b>Version 1.2</b></p>
</HTML>
"));
end WaterSteam;
