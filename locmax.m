function maxp=locmax(x)
% maxp: a matrix of n rows and 2 columns


nn=length(x);
%w=zeros(nn,2);

zmax=x(1);
zmin=x(1);
d_tp=0;  %temple index of possible max, min
d_i=1;	%corresponding t
count=0;
if x(2)>x(1) & x(2)>x(3)
    count=1;
    maxp(count,1)=2;
    maxp(count,2)=x(2);
elseif(x(2)>x(1) & x(2)==x(3))    %initialize d_tp
   d_tp=1;
end


for i=3:nn-1
   if (x(i-1)<x(i) & x(i)>x(i+1))
      count=count+1;
      maxp(count,1)=i;
      maxp(count,2)=x(i);
      d_tp=0;
   elseif (x(i-1)==x(i) & x(i)>x(i+1))
      if (d_tp>0)
			count=count+1;
			maxp(count,1)=ceil((d_i+(i-d_i)/2));
            maxp(count,2)=x(ceil(d_i+(i-d_i)/2));
            d_tp=0;
      end
   elseif x(i)>x(i-1) & x(i)==x(i+1)
		d_tp=1;
        d_i=i;
   end
end


if count==0
    maxp=[];
end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%���㷨û�п��������˵㣬����Ĳ����ǶԶ˵�Ŀ���
%������������Լ����ϵ�
%��������ֵ���ڵ�һ������ֵ���򽫵�һ��Ҳ��Ϊ�ֲ�����ֵ��Χ
if count~=0;
if x(1)>maxp(1,2)
    maxpp(1,1)=1;
    maxpp(1,2)=x(1);
    for i=1:count
        maxpp(i+1,1)=maxp(i,1);
        maxpp(i+1,2)=maxp(i,2);
    end    
count=count+1;
maxp=maxpp;
end
end
%���ĩ���ֵ�������һ������ֵ����ĩ��Ҳ��Ϊ�ֲ�����ֵ��Χ~
if count~=0;
if x(nn)>maxp(count,2)
    maxp(count+1,1)=nn;
    maxp(count+1,2)=x(nn);
end
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~