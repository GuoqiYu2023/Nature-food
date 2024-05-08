
/* sensitivity analysis with addtional adjustment for total lipids (Table S3), only for lipiphilic chemicals */
LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_final_analysis;
set ep.chemical_diet_final_analysis;
run;
%macro RunReg(y,x);
PROC reg data=chemical_diet_final_analysis;
ods output ParameterEstimates=adjust_lip_TEI&y;
model &y=&x TotalLipid energy momage	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH,aMed_noalc);
%RunReg(log_GammaHCH,aMed_noalc);
%RunReg(log_HCB,aMed_noalc);
%RunReg(log_Oxychlordane,aMed_noalc);
%RunReg(log_TransChlordane,aMed_noalc);
%RunReg(log_TransNo_chlor,aMed_noalc);
%RunReg(log_P_P_DDE,aMed_noalc);
%RunReg(log_O_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDT,aMed_noalc);
%RunReg(log_Mirex,aMed_noalc);
%RunReg(log_BDE28,aMed_noalc);
%RunReg(log_BDE47,aMed_noalc);
%RunReg(log_BDE100,aMed_noalc);
%RunReg(log_BDE99,aMed_noalc);
%RunReg(log_BDE85,aMed_noalc);
%RunReg(log_PBB153,aMed_noalc);
%RunReg(log_BDE154,aMed_noalc);
%RunReg(log_BDE153,aMed_noalc);
%RunReg(log_BDE183,aMed_noalc);
%RunReg(log_PCB5_8,aMed_noalc);
%RunReg(log_PCB18_17,aMed_noalc);
%RunReg(log_PCB31_28,aMed_noalc);
%RunReg(log_PCB33_20,aMed_noalc);
%RunReg(log_PCB22,aMed_noalc);
%RunReg(log_PCB52_73,aMed_noalc);
%RunReg(log_PCB49_43,aMed_noalc);
%RunReg(log_PCB47_48_75,aMed_noalc);
%RunReg(log_PCB44,aMed_noalc);
%RunReg(log_PCB41_64,aMed_noalc);
%RunReg(log_PCB74_61,aMed_noalc);
%RunReg(log_PCB70_76,aMed_noalc);
%RunReg(log_PCB66_80,aMed_noalc);
%RunReg(log_PCB93_95,aMed_noalc);
%RunReg(log_PCB90_101_89,aMed_noalc);
%RunReg(log_PCB99,aMed_noalc);
%RunReg(log_PCB110,aMed_noalc);
%RunReg(log_PCB118_106,aMed_noalc);
%RunReg(log_PCB114_122,aMed_noalc);
%RunReg(log_PCB105_127,aMed_noalc);
%RunReg(log_PCB146_161,aMed_noalc);
%RunReg(log_PCB153,aMed_noalc);
%RunReg(log_PCB137,aMed_noalc);
%RunReg(log_PCB138_158,aMed_noalc);
%RunReg(log_PCB128,aMed_noalc);
%RunReg(log_PCB167,aMed_noalc);
%RunReg(log_PCB156,aMed_noalc);
%RunReg(log_PCB157,aMed_noalc);
%RunReg(log_PCB182_187,aMed_noalc);
%RunReg(log_PCB183,aMed_noalc);
%RunReg(log_PCB177,aMed_noalc);
%RunReg(log_PCB172_192,aMed_noalc);
%RunReg(log_PCB180,aMed_noalc);
%RunReg(log_PCB170,aMed_noalc);
%RunReg(log_PCB202,aMed_noalc);
%RunReg(log_PCB199,aMed_noalc);
%RunReg(log_PCB196_203,aMed_noalc);
%RunReg(log_PCB195,aMed_noalc);
%RunReg(log_PCB194,aMed_noalc);
%RunReg(log_PCB208,aMed_noalc);
%RunReg(log_PCB206,aMed_noalc);
%RunReg(log_PCB209,aMed_noalc);


%RunReg(lg_totalocp,aMed_noalc);
%RunReg(lg_totalbdes,aMed_noalc);
%RunReg(lg_totalpcbs,aMed_noalc);

data adjust_lip_TEI;
 set adjust_lip_TEI:;
run;

PROC EXPORT DATA=adjust_lip_TEI
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical.xlsx"
DBMS=XLSX REPLACE;
SHEET="adjust_lip_TEI_aMed_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_final_analysis;
set ep.chemical_diet_final_analysis;
run;

%macro RunReg(y,x);
PROC reg data=chemical_diet_final_analysis;
ods output ParameterEstimates=adjust_lip_TEI&y;
model &y=&x TotalLipid energy momage	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH,AHEI_noalc);
%RunReg(log_GammaHCH,AHEI_noalc);
%RunReg(log_HCB,AHEI_noalc);
%RunReg(log_Oxychlordane,AHEI_noalc);
%RunReg(log_TransChlordane,AHEI_noalc);
%RunReg(log_TransNo_chlor,AHEI_noalc);
%RunReg(log_P_P_DDE,AHEI_noalc);
%RunReg(log_O_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDT,AHEI_noalc);
%RunReg(log_Mirex,AHEI_noalc);
%RunReg(log_BDE28,AHEI_noalc);
%RunReg(log_BDE47,AHEI_noalc);
%RunReg(log_BDE100,AHEI_noalc);
%RunReg(log_BDE99,AHEI_noalc);
%RunReg(log_BDE85,AHEI_noalc);
%RunReg(log_PBB153,AHEI_noalc);
%RunReg(log_BDE154,AHEI_noalc);
%RunReg(log_BDE153,AHEI_noalc);
%RunReg(log_BDE183,AHEI_noalc);
%RunReg(log_PCB5_8,AHEI_noalc);
%RunReg(log_PCB18_17,AHEI_noalc);
%RunReg(log_PCB31_28,AHEI_noalc);
%RunReg(log_PCB33_20,AHEI_noalc);
%RunReg(log_PCB22,AHEI_noalc);
%RunReg(log_PCB52_73,AHEI_noalc);
%RunReg(log_PCB49_43,AHEI_noalc);
%RunReg(log_PCB47_48_75,AHEI_noalc);
%RunReg(log_PCB44,AHEI_noalc);
%RunReg(log_PCB41_64,AHEI_noalc);
%RunReg(log_PCB74_61,AHEI_noalc);
%RunReg(log_PCB70_76,AHEI_noalc);
%RunReg(log_PCB66_80,AHEI_noalc);
%RunReg(log_PCB93_95,AHEI_noalc);
%RunReg(log_PCB90_101_89,AHEI_noalc);
%RunReg(log_PCB99,AHEI_noalc);
%RunReg(log_PCB110,AHEI_noalc);
%RunReg(log_PCB118_106,AHEI_noalc);
%RunReg(log_PCB114_122,AHEI_noalc);
%RunReg(log_PCB105_127,AHEI_noalc);
%RunReg(log_PCB146_161,AHEI_noalc);
%RunReg(log_PCB153,AHEI_noalc);
%RunReg(log_PCB137,AHEI_noalc);
%RunReg(log_PCB138_158,AHEI_noalc);
%RunReg(log_PCB128,AHEI_noalc);
%RunReg(log_PCB167,AHEI_noalc);
%RunReg(log_PCB156,AHEI_noalc);
%RunReg(log_PCB157,AHEI_noalc);
%RunReg(log_PCB182_187,AHEI_noalc);
%RunReg(log_PCB183,AHEI_noalc);
%RunReg(log_PCB177,AHEI_noalc);
%RunReg(log_PCB172_192,AHEI_noalc);
%RunReg(log_PCB180,AHEI_noalc);
%RunReg(log_PCB170,AHEI_noalc);
%RunReg(log_PCB202,AHEI_noalc);
%RunReg(log_PCB199,AHEI_noalc);
%RunReg(log_PCB196_203,AHEI_noalc);
%RunReg(log_PCB195,AHEI_noalc);
%RunReg(log_PCB194,AHEI_noalc);
%RunReg(log_PCB208,AHEI_noalc);
%RunReg(log_PCB206,AHEI_noalc);
%RunReg(log_PCB209,AHEI_noalc);

%RunReg(lg_totalocp,AHEI_noalc);
%RunReg(lg_totalbdes,AHEI_noalc);
%RunReg(lg_totalpcbs,AHEI_noalc);

data adjust_lip_TEI;
 set adjust_lip_TEI:;
run;

PROC EXPORT DATA=adjust_lip_TEI
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical.xlsx"
DBMS=XLSX REPLACE;
SHEET="adjust_lip_TEI_AHEI_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_final_analysis;
set ep.chemical_diet_final_analysis;
run;

%macro RunReg(y,x);
PROC reg data=chemical_diet_final_analysis;
ods output ParameterEstimates=adjust_lip_TEI&y;
model &y=&x TotalLipid energy momage	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH,DASH);
%RunReg(log_GammaHCH,DASH);
%RunReg(log_HCB,DASH);
%RunReg(log_Oxychlordane,DASH);
%RunReg(log_TransChlordane,DASH);
%RunReg(log_TransNo_chlor,DASH);
%RunReg(log_P_P_DDE,DASH);
%RunReg(log_O_P_DDD,DASH);
%RunReg(log_P_P_DDD,DASH);
%RunReg(log_P_P_DDT,DASH);
%RunReg(log_Mirex,DASH);
%RunReg(log_BDE28,DASH);
%RunReg(log_BDE47,DASH);
%RunReg(log_BDE100,DASH);
%RunReg(log_BDE99,DASH);
%RunReg(log_BDE85,DASH);
%RunReg(log_PBB153,DASH);
%RunReg(log_BDE154,DASH);
%RunReg(log_BDE153,DASH);
%RunReg(log_BDE183,DASH);
%RunReg(log_PCB5_8,DASH);
%RunReg(log_PCB18_17,DASH);
%RunReg(log_PCB31_28,DASH);
%RunReg(log_PCB33_20,DASH);
%RunReg(log_PCB22,DASH);
%RunReg(log_PCB52_73,DASH);
%RunReg(log_PCB49_43,DASH);
%RunReg(log_PCB47_48_75,DASH);
%RunReg(log_PCB44,DASH);
%RunReg(log_PCB41_64,DASH);
%RunReg(log_PCB74_61,DASH);
%RunReg(log_PCB70_76,DASH);
%RunReg(log_PCB66_80,DASH);
%RunReg(log_PCB93_95,DASH);
%RunReg(log_PCB90_101_89,DASH);
%RunReg(log_PCB99,DASH);
%RunReg(log_PCB110,DASH);
%RunReg(log_PCB118_106,DASH);
%RunReg(log_PCB114_122,DASH);
%RunReg(log_PCB105_127,DASH);
%RunReg(log_PCB146_161,DASH);
%RunReg(log_PCB153,DASH);
%RunReg(log_PCB137,DASH);
%RunReg(log_PCB138_158,DASH);
%RunReg(log_PCB128,DASH);
%RunReg(log_PCB167,DASH);
%RunReg(log_PCB156,DASH);
%RunReg(log_PCB157,DASH);
%RunReg(log_PCB182_187,DASH);
%RunReg(log_PCB183,DASH);
%RunReg(log_PCB177,DASH);
%RunReg(log_PCB172_192,DASH);
%RunReg(log_PCB180,DASH);
%RunReg(log_PCB170,DASH);
%RunReg(log_PCB202,DASH);
%RunReg(log_PCB199,DASH);
%RunReg(log_PCB196_203,DASH);
%RunReg(log_PCB195,DASH);
%RunReg(log_PCB194,DASH);
%RunReg(log_PCB208,DASH);
%RunReg(log_PCB206,DASH);
%RunReg(log_PCB209,DASH);

%RunReg(lg_totalocp,DASH);
%RunReg(lg_totalbdes,DASH);
%RunReg(lg_totalpcbs,DASH);

data adjust_lip_TEI;
 set adjust_lip_TEI:;
run;

PROC EXPORT DATA=adjust_lip_TEI
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical.xlsx"
DBMS=XLSX REPLACE;
SHEET="adjust_lip_TEI_DASH";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;
