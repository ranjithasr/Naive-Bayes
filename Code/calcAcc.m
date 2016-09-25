function[acc]=calcAcc(alpha)

class=20;  %class size
VB=61188;   %vocabulary size
trainsize=11269;    %size of train label
testsize=7505;      %size of the test label
traininput=dlmread('train.data');   %reading the train data
testinput=dlmread('test.data');     %reading the test data
trainl=dlmread('train.label');      %reading the train label file
testl=dlmread('test.label');        %reading the test label file
vocabulary=textread('vocabulary.txt','%s');     %reading the vocabulary file

%finding the probability and storing them into a matrix(MLE)

for i=1:20
    [a(i,1),temp] = size(find(trainl == i));
    Y(i,1) = a(i,1)/trainsize;      %probability = observed/total and storing it into a column matrix Y

end

%calculating MAP
P=zeros(class,VB);      %zero matrix of the class and the vocabulary
[n,t]=size(traininput);   

%new implementatiopn part for question 6
%a=sum(P)/61188; %calculating the probabilities
%[b ix]=sort(a,100)     %sorting into top 100 probabilities
%[at,ct]=sort(b(:),'decend');       
%for i=1:100
 %   words(i)=ct(i)                 %getting the words from the indices
%end
%VB(words);                %printing the words

for(i=1:n)
  P(trainl(traininput(i,1)),traininput(i,2))=P(trainl(traininput(i,1)),traininput(i,2))+traininput(i,3);
end

%P(i,j) now stores the number of occurances of word j within all documents in class i

alpha=1/VB;
sumP=sum(P,2)+alpha*VB;
% sum(P,2) stores the total number of words in each class
% Adding 1 so that the probability does not become zero

R=zeros(class,VB);
for i=1:class
  R(i,:)=(P(i,:)+alpha)./sumP(i);
end      %end of MAP (R gives the MAP)

%building the matrix with test data
%classification
V1=zeros(testsize,VB);    %intialing a zero matrix

A = sparse(testinput(:,1),testinput(:,2),testinput(:,3));   %building the matrix with sparse function
A=A';       %calculating the transpose of the sparse matrix
R1=log(R);  %calculating the logrithmic value for the MAP matrix
R2=R1*A;    %calculating the product of r1(log2(map)) with the sparse matrix(transposed form)
R2= R2+ repmat( Y, 1, 7505);    %adding the product with a matrix formed by repmat function
[c1,Ynew]=max(R2);               

c = confusionmat(testl , Ynew );    %calculating the confusion matrix

acc = 100*sum(diag(c)) /7505 ;      %calculating the accuracy percentage
end


