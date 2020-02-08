clc;clear;close;

function [U,L]=LUD(A)
    U=A
    disp(A,'Matrix A=')
    m=det(U(1,1));
    n=det(U(2,1));
    x=n/m
    U(2,:)=U(2,:)-U(1,:)/(m/n)
    n=det(U(3,1));
    y=n/m
    U(3,:)=U(3,:)-U(1,:)/(m/n)
    m=det(U(2,2))
    n=det(U(3,2));
    z=n/m
    U(3,:)=U(3,:)-U(2,:)/(m/n)
    L=[1,0,0;x,1,0;y,z,1]
endfunction

function [B]=inverse(A)
    n=length(A(1,:))
    Aug=[A,eye(n,n)]
    //Forward Elimination
    for j=1:n-1
        for i=j+1:n
            Aug(i,j:2*n)=Aug(i,j:2*n)-Aug(i,j)/Aug(j,j)*Aug(j,j:2*n)
        end
    end
    //Backward Elimination
    for j=n:-1:2
        Aug(1:j-1,:)=Aug(1:j-1,:)-Aug(1:j-1,j)/Aug(j,j)*Aug(j,:)
    end
    //Diagonal Normalisation
    for j=1:n
        Aug(j,:)=Aug(j,:)/Aug(j,j)
    end
    B=Aug(:,n+1:2*n)
endfunction

function[x,a]=gaussElimination(A,b)
    A_aug=[A b]
    a=A_aug
    n=3;
    for i=2:n
        for j=2:n+1
            a(i,j)=a(i,j)-a(1,j)*a(i,1)/a(1,1);
    end
    a(i,1)=0;
    end
    for i=3:n
        for j=3:n+1
            a(i,j)=a(i,j)-a(2,j)*a(i,2)/a(2,2);
        end
        a(i,2)=0;
    end
    x(n)=a(n,n+1)/a(n,n);
    for i=n-1:-1:1
        sumk=0;
        for k=i+1:n
            sumk=sumk+a(i,k)*x(k);
        end
        x(i)=(a(i,n+1)-sumk)/a(i,i);
    end
endfunction

function main()
    A=[0,0,0;0,0,0;0,0,0]
    A(1,1)=input("a11: ")
    A(1,2)=input("a12: ")
    A(1,3)=input("a13: ")
    A(2,1)=input("a21: ")
    A(2,2)=input("a22: ")
    A(2,3)=input("a23: ")
    A(3,1)=input("a31: ")
    A(3,2)=input("a32: ")
    A(3,3)=input("a33: ")
    disp('1.Gaussian Elimination\n2.LU Decomposition\n3.Gauss Jordan method\n')
    ch=input("Enter choice:")
    if ch==1 then
        b=[0;0;0]
        b(1,1)=input("b1: ")
        b(2,1)=input("b2: ")
        b(3,1)=input("b3: ")
        [x,a]=gaussElimination(A,b)
        disp(x(3),x(2),x(1),'The values of x,y,z are:');
        disp(a(1,1),a(2,2),a(3,3),'The pivots are:');
    elseif ch==2 then
        [U,L]=LUD(A)
        disp(U,'Upper triangular matrix is U =')
        disp(L,'Lower triangular matrix is L =')
    elseif ch==3 then
        [B]=inverse(A)
        disp(B,'Inverse of A is');
    end
endfunction
main();
