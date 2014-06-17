within ThermoSysPro;
package AAAUsersGuide "ThermoSysPro Licence and Users Guide"


  class ReleaseNotes "Release notes"


  class Version_2_0 "Version 2.0"

      annotation (Documentation(info="<html>
<h3><font color=\"#008000\">Version 2.0 (January 24, 2011)</font></h3>
<p> This is the first open source release of the library.
</p>
</html>
"));
  end Version_2_0;

  class Version_3_0 "Version 3.0"

      annotation (Documentation(info="<html>
<p><b><font style=\"font-size: 10pt; color: #008000; \">Version 3.0 (December 20, 2011)</font></b></p>
<p align=\"center\"><b><font style=\"font-size: 16pt; \">ThermoSysPro modifications from version 2.0</b> </p>
<p>Analytic jacobian is added to the library.</p>
<p>The examples package is added to the library.</p>
<p>Other modifications:</p>
<p><ul>
<li>Component MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases </li>
<li><ul>
<li>Introduction of two new parameters z1 and z2 </li>
<li>Correction of parameters TwoPhaseFlowPipe.z1, and TwoPhaseFlowPipe.z2 </li>
<li>Old values: z1 = 0, z2 = 0</li>
<li>New values: z1 = z1, z2 = z2</li>
</ul></li>
<li>Package Units </li>
<li><ul>
<li>New unit AbsoluteTemperature </li>
<li>New unit DifferentialTemperature </li>
<li>New unit&nbsp; AbsolutePressure </li>
<li>New unit DifferentialPressure </li>
<li>New unit SpecificEnthalpy </li>
</ul></li>
<li>Component&nbsp; ElectroMechanics.Machines.SynchronousMotor </li>
<li><ul>
<li>Parameter permanent_meca changed to steady_state_mech </li>
<li>Parameter Coupleur changed to mech_coupling </li>
</ul></li>
<li>Component&nbsp; ElectroMechanics.Machines.Shaft </li>
<li><ul>
<li>Parameter permanent_meca changed to steady_state_mech </li>
</ul></li>
<li>Package Properties.WaterSteam.IF97_packages </li>
<li><ul>
<li>New IF97 package with analytic jacobian </li>
<li>Removal of the old IF97 package </li>
</ul></li>
<li>Function IF97.SplineUtilities.Modelica_Interpolation.Bspline1D.parametrization </li>
<li><ul>
<li>arccos changed to acos </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.CheckValve </li>
<li><ul>
<li>Adding modifier (start=false, fixed=true) for variables touvert and tferme. </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.IdealCheckValve </li>
<li><ul>
<li>Adding modifier (start=false, fixed=true) for variables touvert and tferme. </li>
</ul></li>
<li>Component FlueGases.PressureLosses.CheckValve </li>
<li><ul>
<li>Adding modifier (start=false, fixed=true) for variables touvert and tferme. </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.DynamicTwoPhaseFlowPipe </li>
<li><ul>
<li>Adding a default value to parameter T0 </li>
</ul></li>
<li>Package Functions </li>
<li><ul>
<li>New function SmoothStep </li>
<li>New function SmoothSign </li>
<li>New function SmoothAbs </li>
</ul></li>
<li>Component WaterSteam.Machines.DynamicCentrifugalPump </li>
<li><ul>
<li>Use of function SmoothSign for computation of Cf. </li>
<li>New parameter continuous_flow_reversal </li>
</ul></li>
<li>Component WaterSteam.Machines.StaticCentrifugalPump </li>
<li><ul>
<li>New parameter continuous_flow_reversal </li>
<li>Removing input commandePompe </li>
<li>Input VRotation changed to rpm_or_mpower </li>
<li>New parameter MPower </li>
<li>New parameter fixed_rot_or_power </li>
<li>Efficiency characteristics rh=a*Qv^2/R^2 + b*Qv/R + c changed to rh=a*Qv*abs(Qv)/R^2+b*Qv/R+c to ensure convergence for fixed mechanical power </li>
</ul></li>
<li>Component</font><font style=\"color: #ff0000; \"> </font>WaterSteam.PressureLoses.LumpedStraightPipe &LT;====== </li>
<li><ul>
<li>Modification of default value of parameter rugosrel. Old value: 0, new value 0.0001. </li>
<li>Adding initial equation:&nbsp; der(Q) = 0 </li>
</ul></li>
<li>Component WaterSteam.Volumes.TwoPhaseVolume </li>
<li><ul>
<li>Property prol is computed at pressure (P + Pfond)/2 instead of P. </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.DynamicOnePhaseFlowPipe </li>
<li><ul>
<li>New parameter dpfCorr </li>
<li>New parameter hcCorr </li>
</ul></li>
<li>Component WaterSteam.HeatExchanger.DynamicTwoPhaseFlowPipe </li>
<li><ul>
<li>New parameter dpfCorr </li>
</ul></li>
<li>Component Thermal.HeatTransfer.HeatExchangerWall </li>
<li><ul>
<li>Wall 1 becomes the internal wall </li>
<li>Wall 2 becomes the external wall </li>
<li>Heat flux through external wall is corrected </li>
</ul></li>
<li>Component WaterSteam.HeatExchanger. StaticWaterWaterExchangerDTorWorEff </li>
<li><ul>
<li>Modification of the power equation for case exchanger_type = 3. </li>
</ul></li>
<li>Component WaterSteam.HeatExchanger.TemperatureWallBoiler </li>
<li><ul>
<li>Modification of some parameter default values </li>
</ul></li>
<li>Function Correlations.PressureLosses.WBWaterSteamPressureLosses </li>
<li><ul>
<li>b0 is bounded to 0.01 </li>
<li>Gm^2 is replaced by Gm*abs(Gm) </li>
<li>Adding equation dpa := 0. </li>
</ul></li>
<li>Function Properties.WaterSteam.BaseIF97.Basic.psat </li>
<li><ul>
<li>Calls to LogVariable removed. </li>
</ul></li>
<li>Component Combustion.BoundaryConditions.FuelSourcePQ </li>
<li><ul>
<li>Handling of input signals corrected. </li>
</ul></li>
<li>Component MultiFluid.HeatExchangers.NTUTechnologicalExchangerWaterSteamFlueGases </li>
<li><ul>
<li>Correction of computation of variable mono. </li>
</ul></li>
<li>Component WaterSteam.Machines.StodolaTurbine </li>
<li><ul>
<li>Modification of default value for parameter Qmax. Old Value=15, new value=1. </li>
</ul></li>
<li>Function Correlation.Thermal.WBInternalHeatTransferCoefficient </li>
<li><ul>
<li>New function. </li>
</ul></li>
<li>Component WaterSteamHeatExchangers.TemperatureWallBoiler </li>
<li><ul>
<li>Call to WBInternalHeatTransferCoefficient instead of separate calls to WBInternalOnePhaseFlowHeatTransferCoefficient and WBInternalTwoPhaseFlowHeatTransferCoefficient </li>
</ul></li>
<li>Component WaterSteam.Junctions.Mixer3 </li>
<li><ul>
<li>Bug correction: flow from port Ce3 added in mass balance and energy balance equations. </li>
</ul></li>
<li>Component WaterSteam.BoundaryConditions.RefQ </li>
<li><ul>
<li>Correction of default value for Q0. Old value=1.e5. New value=10. </li>
</ul></li>
<li>Component WaterSteam.Junctions.StaticDrum </li>
<li><ul>
<li>Correction of comment for parameter x </li>
<li>Adding thermal connector Cth and variable T </li>
<li>Modification of energy balance equation to take into account external energy supply. </li>
<li>Adding equation Cth.T = T; </li>
</ul></li>
<li>Package Thermal.BoundaryConditions </li>
<li><ul>
<li>New component HeatSink </li>
</ul></li>
<li>Package WaterSteam.BoundaryConditions </li>
<li><ul>
<li>New components PlugA, PlugB </li>
</ul></li>
<li>Component InstrumentationAndControl.Blocks.Tables.Table1D </li>
<li><ul>
<li>Dymola specific function Interpolate is replaced by ThermoSysPro.Functions.LinearInterpolation. </li>
</ul></li>
<li>Component InstrumentationAndControl.Blocks.Tables.Table1DTemps </li>
<li><ul>
<li>Dymola specific function Interpolate is replaced by ThermoSysPro.Functions.LinearInterpolation. </li>
</ul></li>
<li>Function Functions.LinearInterpolation </li>
<li><ul>
<li>Output DeltaYX is removed. </li>
<li>Function calls Functions.LinearInterpolation_i, which returns DelTaXY. </li>
</ul></li>
<li>Function Functions.TableLinearInterpolation </li>
<li><ul>
<li>Outputs DeltaYX and DeltaYP are removed. </li>
<li>Function calls Functions.TableLinearInterpolation_i, which returns DelTaXY and DeltaYP. </li>
</ul></li>
<li>Function Correlations.Misc..WBCorrectiveDiameterCoefficient </li>
<li><ul>
<li>Unused variables Z1, Z2 are removed. </li>
</ul></li>
<li>Function Correlations.Thermal.WBCrossedCurrentConvectiveHeatTranferCoefficient </li>
<li><ul>
<li>Unused variables Z1, Z2 are removed. </li>
</ul></li>
<li>Function Correlations.Thermal.WBLongitudinalCurrentConvectiveHeatTranferCoefficient </li>
<li><ul>
<li>Unused variables Z1, Z2 are removed. </li>
</ul></li>
<li>Function Correlations.Thermal.WBRadiativeHeatTranferCoefficient </li>
<li><ul>
<li>Unused variables Z1, Z2, Z3, Z4 are removed. </li>
</ul></li>
<li>Component WaterSteam.Machines.SteamEngine </li>
<li><ul>
<li>Function Interpolation is replaced by function LinearInterpolation </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.ControlValve </li>
<li><ul>
<li>Function Interpolation is replaced by function LinearInterpolation </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.DynamicCheckValve </li>
<li><ul>
<li>Function Interpolation is replaced by function LinearInterpolation </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.DynamicReliefValve </li>
<li><ul>
<li>Function Interpolation is replaced by function LinearInterpolation </li>
</ul></li>
<li>Component FlueGases.PressureLosses.ControlValve </li>
<li><ul>
<li>Function Interpolation is replaced by function LinearInterpolation </li>
</ul></li>
<li>Package Functions </li>
<li><ul>
<li>Function Interpolation is removed. One should use function LinearInterpolation instead. </li>
</ul></li>
<li>Package Units </li>
<li><ul>
<li>Unit RotationVelocity renamed to AngularVelocity_rpm </li>
</ul></li>
</ul></p>
<p><b>&nbsp;</b> </p>
</html>"));
  end Version_3_0;

  class Version_3_1 "Version 3.1"

      annotation (Documentation(info="<html>
<p><b><font style=\"font-size: 10pt; color: #008000; \">Version 3.1 (June 12, 2014)</font></b> </p>
<p align=\"center\"><b><font style=\"font-size: 16pt; \">ThermoSysPro modifications from version 3.0</b> </p>
<p>&nbsp; </p>
<p><ul>
<li>Component ElectroMechanics.BoundaryConditions.SourceMechanicalPower </li>
<li><ul>
<li>Equation M.Ctr*abs(M.w) = IPower.signal is replaced by M.Ctr*M.w = IPower.signal </li>
</ul></li>
<li>Package ElectroMechanics.BoundaryConditions </li>
<li><ul>
<li>New component SourceAngularVelocity </li>
<li>New component SourceTorque </li>
</ul></li>
<li>Package Function </li>
<li><ul>
<li>New function SmoothMax </li>
<li>New function SmoothMin </li>
<li>New function SmoothCond </li>
</ul></li>
<li>Package WaterSteam.Machines </li>
<li><ul>
<li>New component CentrifugalPump, replaces old components DynamicCentrifugalPump and StaticCentrifugalPump. </li>
</ul></li>
<li>Component WaterSteam.Machines.DynamicCentrifugalPump </li>
<li><ul>
<li>Obsolete component, replaced by component CentrifugalPump </li>
</ul></li>
<li>Component WaterSteam.Machines.StaticCentrifugalPump </li>
<li><ul>
<li>Obsolete component, replaced by component CentrifugalPump </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.DynamicOnePhaseFlowPipe </li>
<li><ul>
<li>Parameter dynamic_energy_balance is removed </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.DynamicTwoPhaseFlowPipe </li>
<li><ul>
<li>Parameter dynamic_energy_balance is removed </li>
</ul></li>
<li>Function Properties.CH3F5.CH3F5_Ps </li>
<li><ul>
<li>Correction of the computation of x for one-phase flow (liquid or vapor) </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.SimpleDynamicCondenser </li>
<li><ul>
<li>Correction of the computation of Wout </li>
</ul></li>
<li>Component WaterSteam.Volumes.TwoPhaseVolume </li>
<li><ul>
<li>Correction: Cl.a = true (instead of Cl.b = true) </li>
</ul></li>
<li>Component FlueGases.HeatExchangers. StaticWallFlueGasesExchanger </li>
<li><ul>
<li>Correction of the computation of dW[i] </li>
</ul></li>
<li>Component WaterSteam.Junctions.SteamDryer </li>
<li><ul>
<li>Correction of the mass balance equations </li>
</ul></li>
<li>Component Combustion.CombustionChambers.GenericCombustionChamber </li>
<li><ul>
<li>Correction of the computation of HFuel </li>
</ul></li>
<li>Component Combustion.CombustionChambers.GTCombustionChamber </li>
<li><ul>
<li>Correction of the computation of HFuel </li>
</ul></li>
<li>Component WaterSteam.Volumes.Tank </li>
<li><ul>
<li>Parameter k is replaced by parameters ke1, ke2, ks1, ks2. </li>
</ul></li>
<li>Function Functions. LinearInterpolation_i </li>
<li><ul>
<li>Correction of the computation of Y </li>
</ul></li>
<li>Package Units </li>
<li><ul>
<li>Unit SpecificEnthalpy removed </li>
<li>Unit AbsolutePressure removed </li>
<li>Unit AbsoluteTemperature removed </li>
</ul></li>
<li>Package WaterSteam.HeatExchangers </li>
<li><ul>
<li>New component DynamicWaterHeating </li>
</ul></li>
<li>Package WaterSteam.Volumes </li>
<li><ul>
<li>New component TwoPhaseCavity </li>
</ul></li>
<li>Component FlueGases.Volumes.VolumeATh </li>
<li><ul>
<li>Modifier stateSelect removed </li>
</ul></li>
<li>Component FlueGases.Volumes.VolumeBTh </li>
<li><ul>
<li>Modifier stateSelect removed </li>
</ul></li>
<li>Component FlueGases.Volumes.VolumeCTh </li>
<li><ul>
<li>Modifier stateSelect removed </li>
</ul></li>
<li>Component FlueGases.Volumes.VolumeDTh </li>
<li><ul>
<li>Modifier stateSelect removed </li>
</ul></li>
<li>Component WaterSteam.Machines.Compressor </li>
<li><ul>
<li>xm is bounded by min value 0.01 (to avoid division by zero in case fluid is water, which should not happen in a compressor). </li>
</ul></li>
<li>Component FlueGases.PressureLosses.SingularPressureLoss </li>
<li><ul>
<li>Default value for parameter K changed to 1.e-3. </li>
</ul></li>
<li>Component WaterSteam.Machines.StodolaTurbine </li>
<li><ul>
<li>Extension of the computation of xm and Q for supercritical regimes. </li>
</ul></li>
<li>Component WaterSteam.Boilers.ElectricBoiler </li>
<li><ul>
<li>Correction of the computation of deltaH. </li>
</ul></li>
<li>Component WaterSteam.Machines.StaticCentrifugalPump </li>
<li><ul>
<li>Value of rh is changed. Old value: 0.05 - New value: 0.20 </li>
</ul></li>
<li>Component WaterSolution.Machines.StaticCentrifugalPump </li>
<li><ul>
<li>Value of rh is changed. Old value: 0.05 - New value: 0.20 </li>
</ul></li>
<li>Component FlueGases.Machines.StaticFan </li>
<li><ul>
<li>Value of rh is changed. Old value: 0.05 - New value: 0.20 </li>
</ul></li>
<li>Package Functions </li>
<li><ul>
<li>New functions SplineInterpolation and TableSplineInterpolation </li>
<li>New package Utilities </li>
<li>Function LinearInterpolation_i&nbsp; moved to Functions.Utilities </li>
<li>Function TableLinearInterpolation_i&nbsp; moved to Functions.Utilities </li>
</ul></li>
<li>Package Functions.Utilities </li>
<li><ul>
<li>New function CubicHermite </li>
</ul></li>
<li>Block InstrumentationAndControl.Blocks.Table.Table1D </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Block InstrumentationAndControl.Blocks.Table.Table1DTemps </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Block InstrumentationAndControl.Blocks.Table.Table2D </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Component WaterSteam.Machines.CentrifugalPump </li>
<li><ul>
<li>Linear interpolation of F and G is replaced by spline interpolation </li>
</ul></li>
<li>Component FlueGases.PressureLosses.ControlValve </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.ControlValve </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.DynamicCheckValve </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Component WaterSteam.PressureLosses.DynamicReliefValve </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Component WaterSteam.Machines.SteamEngine </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Function Correlation.Misc.WBCorrectiveDiameterCoefficient </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Function Correlation.Thermal. WBCrossedCurrentConvectiveHeatTransferCoefficient </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Function Correlation.Thermal. WBLongitudinalCurrentConvectiveHeatTransferCoefficient </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Function Correlation.Thermal. WBRadiativeHeatTransferCoefficient </li>
<li><ul>
<li>New interpolating option: spline interpolation </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.TwoPhaseFlowPipe </li>
<li><ul>
<li>Adding noEvent for the computation of hi and Xtt </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.DynamicOnePhaseFlowPipe </li>
<li><ul>
<li>Extension of the computation of hc for laminar flows </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.DynamicWaterWaterExchanger </li>
<li><ul>
<li>Modification of the computation of DPc and DPf </li>
<li>Previous version </li>
<li>DPc[i] = p_Kc*Qc[i]^2/(2*rhoc[i]); </li>
<li>DPf[i] = p_Kf*Qf[i]^2/(2*rhof[i]); </li>
<li>New version </li>
<li>DPc[i] = p_Kc*Qc[i]^2/rhoc[i]; </li>
<li>DPf[i] = p_Kf*Qf[i]^2/rhof[i]; </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.StaticWaterWaterExchanger </li>
<li><ul>
<li>Modification of the computation of DPc and DPf </li>
<li>Previousversion </li>
<li>DPc[i] = p_Kc*Qc[i]^2/(2*rhoc[i]); </li>
<li>DPf[i] = p_Kf*Qf[i]^2/(2*rhof[i]); </li>
<li>New version </li>
<li>DPc[i] = p_Kc*Qc[i]^2/rhoc[i]; </li>
<li>DPf[i] = p_Kf*Qf[i]^2/rhof[i]; </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.NTUWaterHeating </li>
<li><ul>
<li>Modification of the value of eps </li>
<li>Previous value: 1 </li>
<li>New value: 1.e-3 </li>
</ul></li>
<li>Component WaterSteam.HeatExchangers.DynamicTwoPhaseFlowPipe </li>
<li><ul>
<li>Adaptation to the supercritical phase </li>
</ul></li>
<li>Package WaterSteam.HeatExchangers </li>
<li><ul>
<li>New component DynamicWaterHeatingOnePipe </li>
</ul></li>
<li>Package Thermal.HeatTransfer </li>
<li><ul>
<li>New component HeatExchangerWallCounterFlow </li>
</ul></li>
<li>Package Properties </li>
<li><ul>
<li>New package MoltenSalt </li>
<li>New package Oil_TherminolVP1 </li>
</ul></li>
<li>Component WaterSteam.Machines.StodolaTurbine </li>
<li><ul>
<li>Equation xm = if noEvent(Ps &GT; pcrit) then 1 else (1 + pros1.x)/2; is replaced by xm = 1; </li>
</ul></li>
</ul></p>
<p>&nbsp; </p>
<p>&nbsp; </p>
</html>"));
  end Version_3_1;
    annotation (Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Release notes</font></h3>
<p>
This section summarizes the changes that have been performed
on the ThermoSysPro library.
</html>
"));
  end ReleaseNotes;

  class Contact "Contact"

    annotation (Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Contact 
</font></h3>
<dl><dt>The development of the ThermoSysPro library is organized by<br/></dt>
<dd>Daniel Bouskela and Baligh El Hefni<br/></dd>
<dd>EDF/R&AMP;D</dd>
<dd>6, quai Watier</dd>
<dd>F-78401 Chatou Cedex</dd>
<dd>France<br/></dd>
<dd>email: <a href=\"mailto:daniel.bouskela@edf.fr\">daniel.bouskela@edf.fr</a></dd>
<dd>email: <a href=\"mailto:baligh.el-hefni@edf.fr\">baligh.el-hefni@edf.fr</a><br/></dd>
</dl></html>"));

  end Contact;

  class ThermoSysProLicense "License"

    annotation (Documentation(info="<html>
<h3><font color=\"#008000\" size=5>The ThermoSysPro License 
</font></h3>
<p>The use of the ThermoSysPro Library is granted by EDF under the provisions of Modelica License 2.
<ol>
</p>

<hr>
<h4><a name=\"ModelicaLicense2\"></a>The Modelica License 2</h4>
<p>
<b>Preamble.</b> The goal of this license is that Modelica related
model libraries, software, images, documents, data files etc. can be
used freely in the original or a modified form, in open source and in
commercial environments (as long as the license conditions below are
fulfilled, in particular sections 2c) and 2d). The Original Work is
provided free of charge and the use is completely at your own risk.
Developers of free Modelica packages are encouraged to utilize this
license for their work.</p>

<p>
The Modelica License applies to any Original Work that contains the
following licensing notice adjacent to the copyright notice(s) for
this Original Work:</p>
<p><b>Licensed
by the Modelica Association under the Modelica License 2</b></p>

<p><b>1. Definitions.</b></p>
<ol>
 <li>&ldquo;License&rdquo; is this Modelica License.</li>

 <li>
 &ldquo;Original Work&rdquo; is any work of authorship, including
 software, images, documents, data files, that contains the above
 licensing notice or that is packed together with a licensing notice
 referencing it.</li>

 <li>
 &ldquo;Licensor&rdquo; is the provider of the Original Work who has
 placed this licensing notice adjacent to the copyright notice(s) for
 the Original Work. The Original Work is either directly provided by
 the owner of the Original Work, or by a licensee of the owner.</li>

 <li>
 &ldquo;Derivative Work&rdquo; is any modification of the Original
 Work which represents, as a whole, an original work of authorship.
 For the matter of clarity and as examples: </li>

 <ol>
  <li>
  Derivative Work shall not include work that remains separable from
  the Original Work, as well as merely extracting a part of the
  Original Work without modifying it.</li>

  <li>
  Derivative Work shall not include (a) fixing of errors and/or (b)
  adding vendor specific Modelica annotations and/or (c) using a
  subset of the classes of a Modelica package, and/or (d) using a
  different representation, e.g., a binary representation.</li>

  <li>
  Derivative Work shall include classes that are copied from the
  Original Work where declarations, equations or the documentation
  are modified.</li>

  <li>
  Derivative Work shall include executables to simulate the models
  that are generated by a Modelica translator based on the Original
  Work (of a Modelica package).</li>
 </ol>

 <li>
 &ldquo;Modified Work&rdquo; is any modification of the Original Work
 with the following exceptions: (a) fixing of errors and/or (b)
 adding vendor specific Modelica annotations and/or (c) using a
 subset of the classes of a Modelica package, and/or (d) using a
 different representation, e.g., a binary representation.</li>

 <li>
 &quot;Source Code&quot; means the preferred form of the Original
 Work for making modifications to it and all available documentation
 describing how to modify the Original Work.</li>

 <li>
 &ldquo;You&rdquo; means an individual or a legal entity exercising
 rights under, and complying with all of the terms of, this License.</li>

 <li>
 &ldquo;Modelica package&rdquo; means any Modelica library that is
 defined with the<br>&ldquo;<FONT FACE=\"Courier New, monospace\"><FONT SIZE=2 STYLE=\"font-size: 9pt\"><b>package</b></FONT></FONT><FONT FACE=\"Courier New, monospace\"><FONT SIZE=2 STYLE=\"font-size: 9pt\">
 &lt;Name&gt; ... </FONT></FONT><FONT FACE=\"Courier New, monospace\"><FONT SIZE=2 STYLE=\"font-size: 9pt\"><b>end</b></FONT></FONT><FONT FACE=\"Courier New, monospace\"><FONT SIZE=2 STYLE=\"font-size: 9pt\">
 &lt;Name&gt;;</FONT></FONT>&ldquo; Modelica language element.</li>
</ol>

<p>
<b>2. Grant of Copyright License.</b> Licensor grants You a
worldwide, royalty-free, non-exclusive, sublicensable license, for
the duration of the copyright, to do the following:</p>

<ol>
 <li><p>
 To reproduce the Original Work in copies, either alone or as part of
 a collection.</li></p>
 <li><p>
 To create Derivative Works according to Section 1d) of this License.</li></p>
 <li><p>
 To distribute or communicate to the public copies of the <u>Original
 Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No
 fee, neither as a copyright-license fee, nor as a selling fee for
 the copy as such may be charged under this License. Furthermore, a
 verbatim copy of this License must be included in any copy of the
 Original Work or a Derivative Work under this License.<br>      For
 the matter of clarity, it is permitted A) to distribute or
 communicate such copies as part of a (possible commercial)
 collection where other parts are provided under different licenses
 and a license fee is charged for the other parts only and B) to
 charge for mere printing and shipping costs.</li></p>
 <li><p>
 To distribute or communicate to the public copies of a <u>Derivative
 Work</u>, alternatively to Section 2c), under <u>any other license</u>
 of your choice, especially also under a license for
 commercial/proprietary software, as long as You comply with Sections
 3, 4 and 8 below. <br>      For the matter of clarity, no
 restrictions regarding fees, either as to a copyright-license fee or
 as to a selling fee for the copy as such apply.</li></p>
 <li><p>
 To perform the Original Work publicly.</li></p>
 <li><p>
 To display the Original Work publicly.</li></p>
</ol>

<p>
<b>3. Acceptance.</b> Any use of the Original Work or a
Derivative Work, or any action according to either Section 2a) to 2f)
above constitutes Your acceptance of this License.</p>

<p>
<b>4. Designation of Derivative Works and of Modified Works.
</b>The identifying designation of Derivative Work and of Modified
Work must be different to the corresponding identifying designation
of the Original Work. This means especially that the (root-level)
name of a Modelica package under this license must be changed if the
package is modified (besides fixing of errors, adding vendor specific
Modelica annotations, using a subset of the classes of a Modelica
package, or using another representation, e.g. a binary
representation).</p>

<p>
<b>5. Grant of Patent License.</b>
Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license,
under patent claims owned by the Licensor or licensed to the Licensor by
the owners of the Original Work that are embodied in the Original Work
as furnished by the Licensor, for the duration of the patents,
to make, use, sell, offer for sale, have made, and import the Original Work
and Derivative Works under the conditions as given in Section 2.
For the matter of clarity, the license regarding Derivative Works covers
patent claims to the extent as they are embodied in the Original Work only.</p>

<p>
<b>6. Provision of Source Code.</b> Licensor agrees to provide
You with a copy of the Source Code of the Original Work but reserves
the right to decide freely on the manner of how the Original Work is
provided.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For the matter of clarity, Licensor might provide only a binary
representation of the Original Work. In that case, You may (a) either
reproduce the Source Code from the binary representation if this is
possible (e.g., by performing a copy of an encrypted Modelica
package, if encryption allows the copy operation) or (b) request the
Source Code from the Licensor who will provide it to You.</p>

<p>
<b>7. Exclusions from License Grant.</b> Neither the names of
Licensor, nor the names of any contributors to the Original Work, nor
any of their trademarks or service marks, may be used to endorse or
promote products derived from this Original Work without express
prior permission of the Licensor. Except as otherwise expressly
stated in this License and in particular in Sections 2 and 5, nothing
in this License grants any license to Licensor&rsquo;s trademarks,
copyrights, patents, trade secrets or any other intellectual
property, and no patent license is granted to make, use, sell, offer
for sale, have made, or import embodiments of any patent claims.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No license is granted to the trademarks of
Licensor even if such trademarks are included in the Original Work,
except as expressly stated in this License. Nothing in this License
shall be interpreted to prohibit Licensor from licensing under terms
different from this License any Original Work that Licensor otherwise
would have a right to license.</p>

<p>
<b>8. Attribution Rights.</b> You must retain in the Source
Code of the Original Work and of any Derivative Works that You
create, all author, copyright, patent, or trademark notices, as well
as any descriptive text identified therein as an &quot;Attribution
Notice&quot;. The same applies to the licensing notice of this
License in the Original Work. For the matter of clarity, &ldquo;author
notice&rdquo; means the notice that identifies the original
author(s). <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You must cause the Source Code for any Derivative
Works that You create to carry a prominent Attribution Notice
reasonably calculated to inform recipients that You have modified the
Original Work. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In case the Original Work or Derivative Work is not provided in
Source Code, the Attribution Notices shall be appropriately
displayed, e.g., in the documentation of the Derivative Work.</p>

<p><b>9. Disclaimer
of Warranty. <br></b><u><b>The Original Work is provided under this
License on an &quot;as is&quot; basis and without warranty, either
express or implied, including, without limitation, the warranties of
non-infringement, merchantability or fitness for a particular
purpose. The entire risk as to the quality of the Original Work is
with You.</b></u><b> </b>This disclaimer of warranty constitutes an
essential part of this License. No license to the Original Work is
granted by this License except under this disclaimer.</p>

<p>
<b>10. Limitation of Liability.</b> Under no circumstances and
under no legal theory, whether in tort (including negligence),
contract, or otherwise, shall the Licensor, the owner or a licensee
of the Original Work be liable to anyone for any direct, indirect,
general, special, incidental, or consequential damages of any
character arising as a result of this License or the use of the
Original Work including, without limitation, damages for loss of
goodwill, work stoppage, computer failure or malfunction, or any and
all other commercial damages or losses. This limitation of liability
shall not apply to the extent applicable law prohibits such
limitation.</p>

<p>
<b>11. Termination.</b> This License conditions your rights to
undertake the activities listed in Section 2 and 5, including your
right to create Derivative Works based upon the Original Work, and
doing so without observing these terms and conditions is prohibited
by copyright law and international treaty. Nothing in this License is
intended to affect copyright exceptions and limitations. This License
shall terminate immediately and You may no longer exercise any of the
rights granted to You by this License upon your failure to observe
the conditions of this license.</p>

<p>
<b>12. Termination for Patent Action.</b> This License shall
terminate automatically and You may no longer exercise any of the
rights granted to You by this License as of the date You commence an
action, including a cross-claim or counterclaim, against Licensor,
any owners of the Original Work or any licensee alleging that the
Original Work infringes a patent. This termination provision shall
not apply for an action alleging patent infringement through
combinations of the Original Work under combination with other
software or hardware.</p>

<p>
<b>13. Jurisdiction.</b> Any action or suit relating to this
License may be brought only in the courts of a jurisdiction wherein
the Licensor resides and under the laws of that jurisdiction
excluding its conflict-of-law provisions. The application of the
United Nations Convention on Contracts for the International Sale of
Goods is expressly excluded. Any use of the Original Work outside the
scope of this License or after its termination shall be subject to
the requirements and penalties of copyright or patent law in the
appropriate jurisdiction. This section shall survive the termination
of this License.</p>

<p>
<b>14. Attorneys&rsquo; Fees.</b> In any action to enforce the
terms of this License or seeking damages relating thereto, the
prevailing party shall be entitled to recover its costs and expenses,
including, without limitation, reasonable attorneys' fees and costs
incurred in connection with such action, including any appeal of such
action. This section shall survive the termination of this License.</p>

<p>
<b>15. Miscellaneous.</b>
</p>
<ol>
 <li>If any
 provision of this License is held to be unenforceable, such
 provision shall be reformed only to the extent necessary to make it
 enforceable.</li>

 <li>No verbal
 ancillary agreements have been made. Changes and additions to this
 License must appear in writing to be valid. This also applies to
 changing the clause pertaining to written form.</li>

 <li>You may use the
 Original Work in all ways not otherwise restricted or conditioned by
 this License or by law, and Licensor promises not to interfere with
 or be responsible for such uses by You.</li>
</ol>

<p>
<br>
</p>

</html>
"));

  end ThermoSysProLicense;

  class ThermoSysProDocumentation "Documentation"

    annotation (Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Documentation 
</font></h3>
<p>The full documentation of the library is still under construction. </p>
<p>A conference paper explaining the fundamentals of the library can be found here:
<a href=\"https://www.modelica.org/events/modelica2011/Proceedings/pages/papers/15_2_ID_115_a_fv.pdf\">https://www.modelica.org/events/modelica2011/Proceedings/pages/papers/15_2_ID_115_a_fv.pdf</a>.
</p>
</html>"));

  end ThermoSysProDocumentation;
  annotation (DocumentationClass=true, Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Users Guide of the ThermoSysPro Library</font></h3>
<p>
ThermoSysPro is a library for the modelling and simulation of power plants and energy systems.
It is developed with the Modelica language from the Modelica Association, see
<a href=\"http://www.Modelica.org\">http://www.Modelica.org</a>.
It provides components in various disciplines related to the modelling of power plants and energy systems.
</p>
<p>
</html>"));
end AAAUsersGuide;
