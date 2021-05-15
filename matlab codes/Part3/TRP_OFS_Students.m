clear all;
clc;
% A=[18 20 18]; %row
% B=[15 16 12 13];  %column
% C=[8 9 6 3; 6 11 5 10; 3 8 7 9]; %cost matrix

C=[10 7 8;15 29 9;7 8 12]; % 3 rows 4 col

A=[45 15 40]; %%Row 1row 3 col

B=[25 55 20]; %% Column 1 row 4 col

%Checked Balanced/Unbalanced Problem 
if sum(A)==sum(B)
   fprintf('Given TP is balanced\n');
else
   fprintf('Given TP is unbalanced\n'); 

if sum(A)<sum(B)
 C(end+1,:)=zeros(1,size(B,2));
   
 A(end+1)=sum(B)-sum(A);
 
elseif sum(B)<sum(A)
    C(:,end+1)= zeros(1,size(A,2));
 B(end+1)=sum(A)-sum(B);
end
end

% North-west corner method

[m,n]=size(C);
X=zeros(m,n);
BFS=m+n-1;
i=1;j=1;
count=0; % BFS initialization

while(count<BFS)
    if A(i)<=B(j)
        X(i,j)=A(i);  % Allocation
        B(j)=B(j)-A(i);
        i=i+1;  %%Row counter
        count=count+1;    %% BFS
    elseif B(j)<=A(i)
        X(i,j)=B(j);
        A(i)=A(i)-B(j);
        j=j+1;  %%Column increment
        count=count+1;   %%BFS
    else
        break;
    end        
end

fprintf('Initial BFS =\n');
IB=array2table(X);
disp(IB)

TotalBFS=length(nonzeros(X));
if TotalBFS==BFS
    fprintf('Initial BFS is Non-degenerate \n');
else
fprintf('Initial BFS is Degenerate \n');
end
InitialCost=sum(sum(C.*X));
fprintf('Initial BFS cost=%d\n', InitialCost)

return;

% Finding the Optimal solution

u=zeros(1,m); %rows
v=zeros(1,n); %columns
u(1)=0;

b=0;

for i=1:m
    for j=1:n
        if (X(i,j)==0)% Un allocated cells
            continue
        else
            if(j==b+1)
                 v(j)=C(i,j)-u(i);
                 b=j;
            else
                 u(i)=C(i,j)-v(j);
            end
        end
    end
end
u
v
% Calculating net evaluations
Net=zeros(m,n);
for i=1:m
    for j=1:n
        if (X(i,j)==0)%Un occupied cells
            Net(i,j)=C(i,j)-(u(i)+v(j));
        end
    end
end

Net

return;


for i=1:m-1
    for j=1:n-1
        TFC=TFC+C(i,j)*X(i,j);
    end
end

