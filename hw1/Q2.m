%% step 1
clear; clc; close all;

n = 50;
matrix = ones(n);

down = randi([-5, 4],n ,n);
up = 4.* magic(n) ./ max(magic(n),[],2);
matrix = (matrix .* eye(n)) + triu(up, 1) + tril(down, -1);

diag_help = diag(diag(matrix)); 
matrix = matrix - diag_help;

help = matrix(:,end:-1:1);
diag_help = diag(diag(help));
diag_help = diag_help(:,end:-1:1);
matrix = matrix - diag_help;

matrix = matrix - (diag(diag(matrix)));
matrix = matrix + 2*eye(50);

i = randperm(48,2)+1;
j = randperm(48,2)+1;
matrix(i(1),j(1)) = NaN;
matrix(i(2),j(2)) = NaN;
matrix1= matrix;

%% step 2
maen_all = mean(matrix,'all');
row_max = max(matrix,[],1);
[row,col] = find(isnan(matrix));
matrix(row(1),col(1)) = 0;
matrix(row(2),col(2)) = 0;

temp = matrix(row(1)-1:row(1)+1,col(1)-1:col(1)+1);
matrix(row(1),col(1)) = 1/8 * sum(temp,'all');
temp = matrix(row(2)-1:row(2)+1,col(2)-1:col(2)+1);
matrix(row(2),col(2)) = 1/8 * sum(temp,'all');
matrix2= matrix;
mean_col = mean(matrix,1);
mean_row = mean(matrix,2);
min_row = min(matrix , [] , 2);
max_row = max(matrix , [] , 2);
min_col = min(matrix , [] , 1);
max_col = max(matrix , [] , 1);

mean_all = mean(matrix,'all');
%% step 3

temp = matrix == 1;
temp_col = sum(temp,1);
temp2 = find(temp_col < 4);
matrix(:,temp2)=[];
matrix3 = matrix;

%% step 4
My_struct = struct; 
My_struct.first = matrix1;
My_struct.second = matrix2;
My_struct.final = matrix3;
My_struct.mean_col = mean_col;
My_struct.mean_row = mean_row;
My_struct.mean_all = mean_all;
My_struct.min_row = min_row;
My_struct.max_row = max_row;
save('My_struct.mat','My_struct');





