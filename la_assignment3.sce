clear;
close;
clc;
function[a,b]=least(a,b)
    disp(a,"a = ");
    disp(b,"b = ");
    x = (a' * a)\(a' * b);
    disp(x, "x = ");
    C = x(1,1);
    D = x(2,1);
    disp(C, 'C = ');
    disp(D, 'D = ');
    disp('The line of best fit it b = C+Dt');
    
endfunction

function main()

    A = zeros(3,2);
    A(1,1)=input("input a11: ")
    A(1,2)=input("input a12: ")
    A(2,1)=input("input a21: ")
    A(2,2)=input("input a22: ")
    A(3,1)=input("input a31: ")
    A(3,2)=input("input a32: ")
    
    b = zeros(3,1)
    b(1,1)=input("input b11: ")
    b(2,1)=input("input b21: ")
    b(3,1)=input("input b31: ")
    
    [x,a]=least(A,b)

endfunction
main();
