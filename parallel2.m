function [ temp1 ] = parallel2( A,B,i,j )
% parpool ('local',2);
% spmd
% Using 3 threads
%   i = 10;
%   m(i) = 2^(i-1);
%   maxNumCompThreads(m(i)); 
%     C = A*B; 

[m,n]=size(A);
[k,l]=size(B);

 temp1=0;
				parfor p=1:n
					%temp1=C;
					temp2=A(i,p)*B(p,j);
					temp1= temp1+temp2;
				end
			
			
end