/* Symon Kimitei
 Data set and multiple regression with interactions in SAS  */

/* data_7.18 in SAS */

/* For the multiple regression model
/* Fit the multiple linear regression model */
PROC IMPORT DATAFILE='C:/Users/skimitei/Desktop/stat_8210/hwk4/datasets/data_7.18.csv' OUT=data_hwk4 DBMS=CSV REPLACE;
RUN;

PROC PRINT DATA=data_hwk4;
RUN;


 PROC MEANS DATA=data_hwk4; 
 run;


data hwk4;
set data_hwk4;
x1_ctr=x1-8.3115385;
x2_ctr=x2-2.8000000;
x3_ctr=x3-5.1038462;
x1_sq=(x1_ctr)**2;
x2_sq=(x2_ctr)**2;
x3_sq=(x3_ctr)**2;
x1_x2=(x1_ctr)*(x2_ctr);
x1_x3=(x1_ctr)*(x3_ctr);
x2_x3=(x2_ctr)*(x3_ctr);
run;

PROC PRINT DATA=hwk4;
Mean(x1);
RUN;


proc reg data= hwk4 alpha=0.05 
    plots(only)=(diagnostics residuals fitplot observedbypredicted RStudentByLeverage(label) CooksD(label)
                Residuals(smooth) DFFITS(label) DFBETAS ObservedByPredicted(label));
  model y = x1_ctr x2_ctr x3_ctr x1_sq x2_sq x3_sq x1_x2 x1_x3 x2_x3;
run;