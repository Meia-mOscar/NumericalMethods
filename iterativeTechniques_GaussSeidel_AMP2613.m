A = [2,-3,1; 1,1,-1;-1,1,-3];
B = [0,1,-3];
X = [0,0,0];

xO = X;
nMax = 30;
tol = 10^-4;
n = 0;
err = 1;
w = 0.4;

while (err>tol) && (n<=nMax)
  %disp(['ITERATION: ',num2str(n)]);

  X(1) = (1-w)*xO(1)+(w/2)*(-X(3)+3*X(2));
  %disp(['X1: ',num2str(X(1))]);

  X(2) = (1-w)*xO(2)+w*(1+X(3)-X(1));
  %disp(['X2: ',num2str(X(2))]);

  X(3) = (1-w)*xO(3)-(w/3)*(-3+X(1)-X(2));
  %disp(['X3: ',num2str(X(3))]);

  n = n+1;
  err = max(abs(X-xOld)./X);
  xOld = X;
end

if n>=nMax
  disp(['ERROR: Method did not converge within', num2str(nMax), ' iterations.']);
 else
  disp(['Convergence after ',num2str(n),' iterations.']);
  disp('Result:');
  disp(X);
end

