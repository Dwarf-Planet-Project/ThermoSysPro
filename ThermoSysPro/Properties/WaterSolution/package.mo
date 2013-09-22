within ThermoSysPro.Properties;
package WaterSolution "Water solution properties library"


annotation (
  Icon(coordinateSystem(
      preserveAspectRatio=false,
      extent={{0,0},{442,394}},
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
      Text(
        extent={{-108,125},{132,60}},
        lineColor={255,0,0},
        textString=
             "%name")}),
  Window(
    x=0.45,
    y=0.01,
    width=0.44,
    height=0.65,
    library=1,
    autolayout=1));
end WaterSolution;
