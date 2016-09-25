clear all;
limit = 10^5;

j=1;i=1;
%Plotting the graph of alpha(X) vs accuracy(Y)
while(i <= limit)
    alpha = i/limit;
    X(j)=alpha;
    Y(j)=calcAcc(alpha);        %calling the function here
    j = j+1;
    %Incremeting i this way will make the scale on X axis a logscale
    i = 10*i;
end

plot(X,Y);