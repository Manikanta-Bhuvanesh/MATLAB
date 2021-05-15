%VALIVETI MANIKANTA BHUVANESH
%19BCD7088
%hungarian method
clc;
clear all;
arr = [140 110 155 170 180;115 100 110 140 155;120 90 135 150 165;30 30 60 60 90;35 15 50 60 85];
disp('cost matrix');
disp(arr)
b = arr;

for i = 1:size(arr,1)
    sub=min(arr(i,:));
    arr(i,:) = arr(i,:)-sub;
end 

for i=1:size(arr,2)
    sub=min(arr(:,i));
    arr(:,i) = arr(:,i)-sub;
end

disp('after subtracting row minimum and column minimium');
disp(arr);
while true
    temp = arr;
    lines = 0;
    while true
        minz = inf;
        for i = 1:size(temp,1)
            count = size(find(temp(i,:)==0),2);

            if(count>0 && count<minz)
                minz=count;
                d = 1;
                y = find(temp(i,:)==0,1);

            end
        end
        for i = 1:size(temp,2)
            count = size(find(temp(:,i)==0),1);
 
            if (count>0 && count < minz)
                minz = count;
                d = 0;
                y=find(temp(:,i)==0,1);

            end
        end
        if minz == inf
            break;
        end
        if d ==1
            temp(:,y) = inf;
        else
            temp(y,:) = inf;
        end
        lines = lines +1;
        disp('lines is :');
        disp(lines);
    end
    sub = min(min(temp));
    if (lines~=5)
        for i = 1: size(arr,1)
            for j = 1: size(arr,2)
                if(temp(i,j)~=inf)
                    arr(i,j) = arr(i,j)-sub;
                elseif((size(find(temp(i,:)==inf),2)==4) && (size(find(temp(:,j)==inf),1)==4))
                    arr(i,j) = arr(i,j)+sub;
                end
            end
        end
    end
    if(lines == 5)
        break;
    end
end
disp('Modified cost matrix');
disp(arr);
totalc = 0;

for i = 1:size(arr,1)
    for j = 1:size(arr,2)
        if(arr(i,j)==0)
            totalc = totalc+b(i,j);
            for k =j+1:size(arr,2)
                if(arr(i,k)==0)
                    arr(i,k)=inf;
                end
            end
            for k = i+1:size(arr,1)
                if(arr(k,j)==0)
                    arr(k,j)=inf;
                end
            end
        end
    end
end
disp('Total cost');
disp(totalc);
    
    