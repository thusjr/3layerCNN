clc
data=xlsread('D:\GradeFour\FPGA-1\project\3layerCNN\datacnn_for_trans.xlsx');
[m,n] = size(data);
data0=cell(m,n);

for i= 1:1:m
    for j=1:1:n
        if j~=10
            if ~isnan(data(i,j))
                data0{i,j}=final_pzh(data(i,j));
            end
        end
    end
end

fid = fopen('densright.mif','w');
fprintf(fid, '%s\n','DEPTH = 720;');
fprintf(fid, '\n');
fprintf(fid, '%s\n','WIDTH = 108;');
fprintf(fid, '\n');
fprintf(fid, '%s\n','ADDRESS_RADIX = HEX;');
fprintf(fid, '\n');
fprintf(fid, '%s\n','DATA_RADIX = HEX;');
fprintf(fid, '\n');
fprintf(fid, '%s\n','CONTENT');
fprintf(fid, '\n');
fprintf(fid, '%s\n','BEGIN');
fprintf(fid, '\n');


for j=12:1:n-1
    if j~=13
        if j==12
            tmp=length(dec2hex(j-11));
            if tmp<4
                for qqq=1:1:4-tmp
                    fprintf(fid, '%s','0');
                end
            end
            fprintf(fid, '%s',dec2hex(j-12));
            
        end
        if j>13
            tmp=length(dec2hex(j-12));
            if tmp<4
                for qqq=1:1:4-tmp
                    fprintf(fid, '%s','0');
                end
            end
            fprintf(fid, '%s',dec2hex(j-13));
            
        end
        fprintf(fid, '%s','  : ');
        for i=1:1:9
            fprintf(fid, '%s',data0{i,j});           
        end
        fprintf(fid,'%s',data0{10,j});
        fprintf(fid,'%s\n','  ; ');
    end
end
fprintf(fid,'%s\n','END;');



