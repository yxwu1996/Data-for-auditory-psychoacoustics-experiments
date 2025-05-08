K=[0 0.05 0.1 0.15 0.2]; 
R=[0.005 0.0075 0.01 0.0125 0.015 0.0175 0.02 0.0225 0.025 0.05 0.075 0.1 0.125 0.15 0.175 0.2 0.225 0.25 0.5];
aaa=cell(length(R),length(K)); % show the D and delta_f values at corresponding cell.
aaaa=zeros(length(R),length(K)); % results from calculation by Comsol.
for rr=1:length(R) % D value
  for kk=1:length(K) %Delta f value
        model.param.set('f',num2str(K(1,kk)));
        model.param.set('D',num2str(R(1,rr)));
        try 
% Here, "int1", "int6" depends on your Comsol program.  "int1" below is the
% integral of global probability for normalization. "int6" below is for
% calculating the results of EPR or Ave Jss/Pss.
            model.study('std1').run;
            aa = model.result.numerical('int1').computeResult;
            %Here we show the calculation of ave Jss/Pss for a instance.
            model.result.numerical('int6').setIndex('expr',strcat('(((J1)^2)+((J2)^2))*(u/((',num2str(cell2mat(aa(1,1)),15), ')^3))'), 0);
            bb = model.result.numerical('int6').computeResult;
            aaa{rr,kk} = strcat('D= ', num2str(R(1,rr)), ', f= ', num2str(K(1,kk)));
            aaaa(rr,kk) = bb{1,1};
        catch
            aa = model.result.numerical('int1').computeResult;
            model.result.numerical('int6').setIndex('expr',strcat('(((J1)^2)+((J2)^2))*(u/((',num2str(cell2mat(aa(1,1)),15), ')^3))'), 0);
            bb = model.result.numerical('int6').computeResult;
            aaa{rr,kk} = strcat('D= ', num2str(R(1,rr)), ', f= ', num2str(K(1,kk)));
            aaaa(rr,kk) = bb{1,1};
        end
  end
end
