Read me file for Naive Bayes document classifier

This project of implementing the naive bayes classifier is done in MATLAB version R2014a.
I have used some of the functions like 
1.textread anf dlmread for reading the data.
2.sparse for building a sparse matrix.
3.confusionmat for building a confusion matrix
4.repmat for building a repeatition matrix
5.find and size for finding and calculating the size of the document.

The data set and other files related to the project have been zipped into a folder "Project2NB".
Once the files are extracted and run in MATLAB by channging the path, the code runs and gives an accuracy of 78.47%.
The plot for the various beta values is done by calling the accuracy function and running the code within a for loop.
I have called the calcAcc function in the plotting file, and on running the plotting file, 
I get the plot of beta value versus the accuracy
The Plotting file gives the plot and the calcAcc file gives the accuracy.	

The implemetation for the question number 6 is given in the code,
but I have commented it mentioning that the specified part is the implementation for that question.
The following is the piece of code whih is used by me for implemeting my method.

%new implementatiopn part for question 6
a=sum(P)/61188; %calculating the probabilities
[b ix]=sort(a,100)     %sorting into top 100 probabilities
[at,ct]=sort(b(:),'decend');       
for i=1:100
    words(i)=ct(i)                 %getting the words from the indices
end
VB(words);                %printing the words(VB-vocabulary)












 

