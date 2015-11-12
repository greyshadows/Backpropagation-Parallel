function [ C ] = matrixmultparallel( A,B )
% parpool ('local',2);
% spmd
% Using 3 threads
%   i = 10;
%   m(i) = 2^(i-1);
%   maxNumCompThreads(m(i)); 
%     C = A*B; 

[m,n]=size(A);
[k,l]=size(B);
if(n~=k) || m==0 || k==0
    C=[];
    disp('Error, not able to multiply matrices');
    return
end

C=zeros(m,l);
       parfor i=1:m
            %C(i,:)=parallel1(A,B,i);
			for j=1:l
				%C(1,j) = parallel2(A,B,i,j);
				for p=1:n
					temp1=C(i,j);
					temp2=A(i,p)*B(p,j);
					C(i,j)= temp1+temp2;
				end
			end
        end
end
 
