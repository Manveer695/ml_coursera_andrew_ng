function J = costError(X,y,theta)
predictions = X*theta;
sqError = (y-predictions).^2;
m = size(X,1);
J = 1/(2*m)*sum(sqError);