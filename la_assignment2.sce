clear ;
close ;
clc ;


function[cs,ns,rs,lns]=FourSubspaces(A)    
    [v , pivot ]= rref ( A) ;
    r = length ( pivot ) ;
    cs = A (: , pivot ) ;    
    ns = kernel ( A ) ;
    rs = v (1: r ,:)';   
    lns = kernel (A') ;    
endfunction



function[a]=ColumnSpanning(a)
        disp(a)
    if a(1,1)~=0 then
        a(2,:) = a(2,:)-(a(2,1)/a(1,1))*a(1,:)
        a(3,:) = a(3,:)-(a(3,1)/a(1,1))*a(1,:)
        a(1,:) = a(1,:)/a(1,1)
    end
    
    if a(2,2)~=0 then
        a(3,:) = a(3,:)-(a(3,2)/a(2,2))*a(2,:)
        a(2,:) = a(2,:)/a(2,2)
    end
    
    disp(a)
    for i=1:3
        for j=1:3
            if (a(i,j)<>0)
                disp('is a pivot column',j,'column')
                break
            end
        end
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
    disp('1.Spanning column space\n2.Fundamental subspaces\n')
    ch=input("Enter choice:")
    if ch==1 then       
       [a]=ColumnSpanning(A)
        
    elseif ch==2 then
        [cs,ns,rs,lns]=FourSubspaces(A);
        
        disp(cs,"Column space= ");
        disp(ns,"Null Space=");
        disp(rs,"Row space=");
        disp(lns,"Leftnull space=");
        
        
        end
 endfunction   
main();
