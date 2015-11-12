function [ C ] = parallel1( A,B,i )
% parpool ('local',2);
% spmd
% Using 3 threads
%   i = 10;
%   m(i) = 2^(i-1);
%   maxNumCompThreads(m(i)); 
%     C = A*B; 

[m,n]=size(A);
[k,l]=size(B);

C=zeros(1,l);
            parfor j=1:l
				%C(1,j) = parallel2(A,B,i,j);
				for p=1:n
					temp1=C(1,j);
					temp2=A(i,p)*B(p,j);
					C(1,j)= temp1+temp2;
				end
			end
			
end