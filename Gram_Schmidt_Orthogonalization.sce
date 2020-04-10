clear;close;clc;
function[A] = gram_schmidt(A)
    disp(A,"A = ");
    [m, n] = size(A);
    for k=1:n
        v(:,k) = A(:, k);
        for j=1:k-1
        r(j,k) = v(:,j)' * A(:,k);
            v(:,k) = v(:,k) - r(j,k)*v(:,j);    
        end
        r(k,k) = norm(v(:,k))
        v(:,k) = v(:,k)/r(k,k);
    end
    disp(v,"Q = ");
endfunction

function main()
    A=[0,0,0;0,0,0;0,0,0]
    A(1,1)=input("input a11: ")
    A(1,2)=input("input a12: ")
    A(1,3)=input("input a13: ")
    A(2,1)=input("input a21: ")
    A(2,2)=input("input a22: ")
    A(2,3)=input("input a23: ")
    A(3,1)=input("input a31: ")
    A(3,2)=input("input a32: ")
    A(3,3)=input("input a33: ")
    [A]=gram_schmidt(A)
endfunction
main();
