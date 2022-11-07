clear

load('data0509.mat');

modal3(:,106:end)=[];

X_train = normalize([modal1, modal2, modal3]);
train_label = label;

[pvalue,status] = l1_ls_nonneg(X_train, train_label, 0.1);
pvalue_nonn=abs(pvalue);   

ppp=sort(pvalue_nonn,'descend');
[ppp, ppp_index]=sort(pvalue_nonn, 'descend');

[data, str] = xlsread('data.xlsx');

str=str(2:end);
top_20_num = ppp(1:20);
top_20_str = str(ppp_index(1:20))';
