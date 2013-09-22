within ThermoSysPro.InstrumentationAndControl.Blocks;
package Commun


  function rand "rand"
    output Integer y;
  external "C" y=  rand(0);
    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Text(
            extent={{-84,18},{84,-30}},
            lineColor={255,127,0},
            textString=
                 "fonction"),
          Text(extent={{-134,104},{142,44}}, textString=
                                                 "%name"),
          Ellipse(extent={{-100,40},{100,-100}}, lineColor={255,127,0}),
          Text(
            extent={{-82,-22},{86,-70}},
            lineColor={255,127,0},
            textString=
                 "externe")}),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end rand;

  function srand "rand"
    input Integer u;
  external "C" srand(u);
    annotation (
      Window(
        x=0.26,
        y=0.28,
        width=0.6,
        height=0.6),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Text(extent={{-134,104},{142,44}}, textString=
                                                 "%name"),
          Ellipse(extent={{-100,40},{100,-100}}, lineColor={255,127,0}),
          Text(
            extent={{-84,18},{84,-30}},
            lineColor={255,127,0},
            textString=
                 "fonction"),
          Text(
            extent={{-82,-22},{86,-70}},
            lineColor={255,127,0},
            textString=
                 "externe")}),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end srand;

  function fmod "fmod"
    input Real u1;
    input Real u2;
    output Real y;
  external "C" y=  fmod(u1, u2);
    annotation (Icon(graphics={
          Text(extent={{-134,104},{142,44}}, textString=
                                                 "%name"),
          Ellipse(extent={{-100,40},{100,-100}}, lineColor={255,127,0}),
          Text(
            extent={{-84,18},{84,-30}},
            lineColor={255,127,0},
            textString=
                 "fonction"),
          Text(
            extent={{-82,-22},{86,-70}},
            lineColor={255,127,0},
            textString=
                 "externe")}),
                             Documentation(info="<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  end fmod;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{0,0},{313,206}},
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
               "Unites"),
        Rectangle(extent={{-32,-6},{16,-35}}, lineColor={0,0,0}),
        Rectangle(extent={{-32,-56},{16,-85}}, lineColor={0,0,0}),
        Line(points={{16,-20},{49,-20},{49,-71},{16,-71}}, color={0,0,0}),
        Line(points={{-32,-72},{-64,-72},{-64,-21},{-32,-21}}, color={0,0,0}),
        Text(
          extent={{-120,135},{120,70}},
          lineColor={255,0,0},
          textString=
               "%name")}),
    Window(
      x=0.05,
      y=0.26,
      width=0.25,
      height=0.25,
      library=1,
      autolayout=1),
    Documentation(info="<html>
<p><b>Version 1.1</b></p>
</HTML>
"));
end Commun;
