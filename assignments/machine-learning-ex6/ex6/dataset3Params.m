function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
minErr = 100000;
x1 = [1 2 1]; x2 = [0 4 -1];

C = 0.01;
while C <= 90
   sigma = 0.01;
   while sigma <= 90
	model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
   	predictions = svmPredict(model, Xval);
	err = mean(double(predictions ~= yval));
	if(err < minErr)
		minErr = err; 
		bestC = C;
		bestSigma = sigma;
	endif
	sigma = sigma*3;
   endwhile
   C = C*3;
endwhile

C = bestC
sigma = bestSigma

% =========================================================================

end
