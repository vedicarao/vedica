clear;clc;close();
function[A]=rayleigh_power(A)
disp(A,"The given Matrix is");
u0=[1 1 1]';
disp(u0,'The initial vector is');
v=A*u0;
a=max(u0);
disp(u0,'The initial vector is');
v=A*u0;
a=max(u0);
disp(a,'First approximation to eigen value is');
while abs(max(v)-a)>0.002;
    disp(v,'current eigen vectors');
    a=max(v);
    disp(a,'current eigen value is');
    u0=v/max(v);
    v=A*u0;
end

format('v',4);
disp(max(v),'The largest Eigen Value is');
format('v',5);
disp(u0,'The corresponding Eigen Vector is');
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
    
    [A]=rayleigh_power(A);
endfunction
main();
