within ThermoSysPro.InstrumentationAndControl;
package Connectors "Connectors"


  connector InputDateAndTime
    input ThermoSysPro.InstrumentationAndControl.Common.DateEtHeure
                             signal;
    annotation (
      Window(
        x=0.37,
        y=0.02,
        width=0.49,
        height=0.65),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-1,-1},{1,1}},
          grid={2,2}), graphics={Polygon(
            points={{-1,1},{1,0},{-1,-1},{-1,1}},
            lineColor={0,0,255},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end InputDateAndTime;

  connector OutputDateAndTime
    output ThermoSysPro.InstrumentationAndControl.Common.DateEtHeure
                              signal;
    annotation (
      Window(
        x=0.29,
        y=0.11,
        width=0.6,
        height=0.6),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-1,-1},{1,1}},
          grid={2,2}), graphics={Polygon(
            points={{-1,1},{1,0},{-1,-1},{-1,1}},
            lineColor={0,0,255},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end OutputDateAndTime;

  connector InputReal
    input Real signal;
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Polygon(
            points={{-100,100},{-100,-100},{100,0},{-100,100}},
            lineColor={0,0,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}),
      Window(
        x=0.34,
        y=0.2,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end InputReal;

  connector InputLogical
     input Boolean signal;
     annotation (
       Window(
         x=0.37,
         y=0.02,
         width=0.49,
         height=0.65),
       Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Polygon(
            points={{-100,100},{-100,-100},{100,0},{-100,100}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid)}),
       Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end InputLogical;

  connector InputInteger
    input Integer signal;
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Polygon(
            points={{-100,100},{-100,-100},{100,0},{-100,100}},
            lineColor={0,0,255},
            fillColor={255,0,255},
            fillPattern=FillPattern.Solid)}),
      Window(
        x=0.34,
        y=0.2,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Version 1.6</b></p>
</HTML>
"));

  end InputInteger;

  connector OuputInteger
    output Integer signal;
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Polygon(
            points={{-100,100},{-100,-100},{100,0},{-100,100}},
            lineColor={0,0,255},
            fillColor={255,0,128},
            fillPattern=FillPattern.Solid)}),
      Window(
        x=0.34,
        y=0.18,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  end OuputInteger;

  connector OutputLogical
      output Boolean signal;
      annotation (
        Window(
          x=0.29,
          y=0.11,
          width=0.6,
          height=0.6),
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Polygon(
            points={{-100,100},{-100,-100},{100,0},{-100,100}},
            lineColor={0,0,255},
            fillColor={127,255,0},
            fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end OutputLogical;

  connector OutputReal
      output Real signal;
      annotation (
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Polygon(
            points={{-100,100},{-100,-100},{100,0},{-100,100}},
            lineColor={0,0,255},
            fillColor={0,255,255},
            fillPattern=FillPattern.Solid)}),
        Window(
          x=0.34,
          y=0.18,
          width=0.6,
          height=0.6),
        Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end OutputReal;
  annotation (
    Window(
      x=0.05,
      y=0.26,
      width=0.25,
      height=0.25,
      library=1,
      autolayout=1),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{0,0},{311,211}},
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
<p><b>Version 1.0</b></p>
</HTML>
"));
end Connectors;
