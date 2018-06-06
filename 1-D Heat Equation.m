%%HEAT EQUATION MODEL.
syms alpha x

c=input('The value of c?');
h=input('The value of h?');
k=input('The value of k?');

alpha=(k*c^2)/h^2;

str=input('Give the initial condition in x: ','s');
fun=str2func(str);

if h<1 && k<1
    a=0:h:1;
    u=zeros((1/k)+1,(1/h)+1);
    for i=1:numel(a)
        u((1/k)+1,i)=fun(a(i));
    end
    u(:,(1/h)+1)=input('enter the last column boundary conditions(hint the number of elements will be (1/k)+1)');
    u(:,1)=input('enter the 1st column boundary conditions (hint the number of elements will be (1/k)+1)');
end

if h>=1 && k>=1
    h1=input('Maximum value in X direction?');
    a=0:h:(h1/h);
    k1=input('Maximum value in T direction?');
    u=zeros((k1/k)+1,(h1/h)+1);
    for i=1;numel(a)
        u((k1/k)+1,i)=fun(a(i));
    end
    u(:,(h1/h)+1)=input('enter the last column boundary conditions (hint the number of elements will be (Max. value in T direction/k))');
    u(:,1)=input('enter the 1st column boundary conditions (hint the number of elements will be (Max. value in T direction/k))');
end

if h<1 && k<1
for i=1/k:-1:1
    for j=2:1/h
        u(i,j)=alpha*(u(i+1,j-1)+u(i+1,j+1))+(1-2*alpha)*u(i+1,j);
    end
end
end
    
if h>=1 && k>=1
for i=k1/k:-1:1
    for j=2:h1/h
        u(i,j)=alpha*(u(i+1,j-1)+u(i+1,j+1))+(1-2*alpha)*u(i+1,j);
    end
end
end



