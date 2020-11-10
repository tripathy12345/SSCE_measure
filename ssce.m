function ce=ssce(x, m)
%%%%%%x is the analyzed signal%%%
%%%%%%m is the embedded dimension%%%%%%

N=length(x);
%%%%%%%%%%%%%%embeddeding%%%%%%%%%%%%%%%%%
dataMat = zeros(m,N-m);
for i = 1:m
    dataMat(i,:) = x(i:N-m+i-1);
end

%%%%%%%%%%%%%Correlation matrix estimation%%%%%%%%%%%%%
corrmat=dataMat'*dataMat;
%%%%%%%%%%Extraction of only upper triangular elements%%%%%%%%
U = triu(corrmat);
for i=1:size(dataMat,2)
    for j=1:size(dataMat,2)
        U(i,i)=0;
    end
end
KK=U(:);
mm=(KK==0);
KK(mm)=[];
%%%%%%Create histogram of correlation matrix%%%%%%%%%%%%%
zz=hist(KK);
pp=zz./sum(zz);
lpp=pp.*log2(pp);
ce=-sum(lpp);
end