function[] = SyntheticData()
%Synthetic data is used to test the clustering algorithm

 d = 5;
 A = 5*[randn(d,1)+5, randn(d,1)+5,ones(d,1).*1/5];
 csvwrite('A.csv',A);
 B = 5*[randn(d,1)+5, randn(d,1)-5,ones(d,1).*2/5];
 csvwrite('B.csv',B);
 C = 5*[randn(d,1)-5, randn(d,1)+5,ones(d,1).*3/5];
 csvwrite('C.csv',C);
 D = 5*[randn(d,1)-5, randn(d,1)-5,ones(d,1).*4/5];
 csvwrite('D.csv',D);
 E = 5*[randn(d,1), randn(d,1),ones(d,1)];
 csvwrite('E.csv',E);
 

 close all;
 figure(1);
 plot(A(:,1),A(:,2),'r.');hold on
 plot(B(:,1),B(:,2),'m.');
 plot(C(:,1),C(:,2),'g.');
 plot(D(:,1),D(:,2),'y.');
 plot(E(:,1),E(:,2),'c.');

% Dados aleatórios dentre os dados fornecidos.
 Data = [A;B;C;D;E];
 csvwrite('Synthetic2D.csv',Data);
 nsample = 50;
 DataSample = Data(randsample(1:length(Data),nsample),:);
 size(DataSample);
 plot(DataSample(:,1),DataSample(:,2),'ko');
end