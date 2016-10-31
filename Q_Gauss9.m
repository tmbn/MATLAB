function [I ] = Q_Gauss9(TT,a,b)
%Gauss-Legendre quadrature Con N=9
% Valores sacados del libro de Nakamura
s=[-0.96816024, 0.83603111, 0.61337143, -0.32425342,0.0,0.32425342,...
    0.61337143,0.83603111, 0.96816024];
w=[0.08127439, 0.18064816, 0.26061070, 0.31234708, 0.33023936, 0.31234708,...
    0.26061070, 0.18064816, 0.08127439];
z=((b-a)*s+a+b)/2;
for i=1:9
    y(i)=feval(TT,z(i));
end
I=sum(w.*y)*(b-a)/2;

end

