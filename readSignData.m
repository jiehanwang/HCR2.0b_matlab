clear all;
training_path_01  = '.\data\P50\';
training_path_02  = '.\data\P51\';
test_path = '.\data\P52\';
names = importdata('.\data\sign_10.txt');
dim = 61;

testCount = 0;
for i = 1 : length(names)
    disp(i);
    data01 = importdata([training_path_01 names{i} '.txt'], ' ', 1);
    data02 = importdata([training_path_02 names{i} '.txt'], ' ', 1);
    data = importdata([test_path names{i} '.txt'], ' ', 1);
    
    %--------------------------------------
    %Training data
    [h, w] = size(data01.data);
    for j=1:h
           trainLabels{1,2*i-1}(j) = str2num(names{i}(2:5));
        for k=1:dim
           trainSeqs{1,2*i-1}(k,j) = data01.data(j,k);
        end
    end
    
    [h, w] = size(data02.data);
     for j=1:h
           trainLabels{1,2*i}(j) = str2num(names{i}(2:5));
        for k=1:dim
           trainSeqs{1,2*i}(k,j) = data02.data(j,k);
        end
     end
    %-------------------------------------
    % Testing data
    [h, w] = size(data.data);
     for j=1:h
           testLabels{1,1}(testCount + j) = str2num(names{i}(2:5));
        for k=1:dim
           testSeqs{1,1}(k,testCount + j) = data.data(j,k);
        end
     end
     testCount = testCount + h;
end