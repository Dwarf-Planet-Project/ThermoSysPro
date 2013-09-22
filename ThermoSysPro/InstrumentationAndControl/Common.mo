within ThermoSysPro.InstrumentationAndControl;
package Common


  record Duree
    Integer nb_jours(min=0) "Nombre de jours";
    Integer nb_heures(min=0, max=23) "Nombre d'heures";
    Integer nb_minutes(min=0, max=59) "Nombre de minutes";
    Integer nb_secondes(min=0, max=59) "Nombre de secondes";
    Integer nb_dixiemes_secondes(min=0, max=9) "Nombre de dixèmes de secondes";
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(
            extent={{-100,50},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Text(extent={{-127,115},{127,55}}, textString=
                                                 "%name"),
          Line(points={{-100,-50},{100,-50}}, color={0,0,0}),
          Line(points={{-100,0},{100,0}}, color={0,0,0}),
          Line(points={{0,50},{0,-100}}, color={0,0,0})}),
      Window(
        x=0.33,
        y=0.33,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  end Duree;

  record DateEtHeure
    Integer annee(min=2000) "Année";
    Integer mois(min=1, max=12) "Mois dans l'année";
    Integer jour(min=1, max=31) "Jour dans le mois";
    Integer heure(min=0, max=23) "Heure du jour";
    Integer minutes(min=0, max=59) "Nombre de minutes";
    Integer secondes(min=0, max=59) "Nombre de secondes";
    Integer nb_dixemes_secondes(min=0, max=9) "Nombre de dixèmes de secondes";
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(
            extent={{-100,50},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Text(extent={{-127,115},{127,55}}, textString=
                                                 "%name"),
          Line(points={{-100,-50},{100,-50}}, color={0,0,0}),
          Line(points={{-100,0},{100,0}}, color={0,0,0}),
          Line(points={{0,50},{0,-100}}, color={0,0,0})}),
      Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  end DateEtHeure;

  function CvtEntierVersDuree
    input Integer t "Duree en dixiemes secondes";
    output Duree d "Duree"        annotation (Placement(transformation(extent={
              {-70,-70},{70,70}}, rotation=0)));
  algorithm

    d.nb_jours := integer(t/24/3600/10);
    d.nb_heures := integer((t - d.nb_jours*24*3600*10)/3600/10);
    d.nb_minutes := integer((t - d.nb_jours*24*3600*10 - d.nb_heures*3600*10)/
      60/10);
    d.nb_secondes := integer((t - d.nb_jours*24*3600*10 - d.nb_heures*3600*10
       - d.nb_minutes*60*10)/10);
    d.nb_dixiemes_secondes := integer(t - d.nb_jours*24*3600*10 - d.nb_heures*
      3600*10 - d.nb_minutes*60*10 - d.nb_secondes*10);
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Ellipse(
            extent={{-100,40},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-84,-4},{84,-52}},
            lineColor={255,127,0},
            textString=
                 "fonction"),
          Text(extent={{-134,104},{142,44}}, textString=
                                                 "%name")}),
      Window(
        x=0.27,
        y=0.27,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  end CvtEntierVersDuree;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{0,0},{311,208}},
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
        Polygon(
          points={{16,-71},{29,-67},{29,-74},{16,-71}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-32,-21},{-46,-17},{-46,-25},{-32,-21}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
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
<p><b>Copyright &copy; EDF 2002 - 2003</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
end Common;
