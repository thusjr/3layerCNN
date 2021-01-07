function hexchar = final_pzh(dec_num)
%十进制数转二进制
binchar='00.00000';
dec_num_tmp=abs(dec_num);
zhengshupart=floor(dec_num_tmp);
xiaoshupart=dec_num_tmp-zhengshupart;
bin_zhengshu=dec2bin(zhengshupart);
binchar(3-length(bin_zhengshu):2)=bin_zhengshu;
for i=1:1:5
    if xiaoshupart*2>=1
        binchar(3+i)='1';
        xiaoshupart=xiaoshupart-0.5;
    end
    xiaoshupart=xiaoshupart*2;
end
binchar=['0',binchar];
binchar0=binchar;
if dec_num<0
    %取反
    for i=1:1:9
        if binchar0(i)=='0'
            binchar(i)='1';
        end
        if binchar0(i)=='1'
            binchar(i)='0';
        end
    end
end
binchar(4)=[];
hexchar='00';
hexchar(1)=dec2hex(bin2dec(binchar(1:4)));
hexchar(2)=dec2hex(bin2dec(binchar(5:8)));  
end

