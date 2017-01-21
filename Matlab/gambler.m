% gambler.m  sets up the transition matrix for Gambler's wealth.

N=30;             % total wealth at the table
p=0.5;            % probability of increasing wealth by 1
q=1-p;

P=zeros(N+1);     % set up transition matrix
                  % rows 1..31 correspond to wealths 0..30
for i=2:30,
   P(i,i-1)=q;
   P(i,i+1)=p;
end
P(1,1)=1;         % stay at 0 wealth
P(N+1,N+1)=1;     % stay at wealth N

mu=zeros(1,N+1);  % set up initial distribution
mu(11)=1;         % start with wealth 10


x=-0.5:1:30.5;    % x values to make heat maps of powers of P
y=x;              % y values to make heat maps of powers of P

subplot(3,2,1);

pcolor(x, y, [[P zeros(N+1,1)]' zeros(N+2,1)]');
axis ij;
title('Graphical representation of transition matrix P');
xlabel('Final state');
ylabel('Initial state');
%shading flat

subplot(3,2,3);

pcolor(x, y, [[P^2 zeros(N+1,1)]' zeros(N+2,1)]');
axis ij;
title('Graphical representation of P^2');
xlabel('Final state');
ylabel('Initial state');
%shading flat

subplot(3,2,5);

pcolor(x, y, [[P^4 zeros(N+1,1)]' zeros(N+2,1)]');
axis ij;
title('Graphical representation of P^{4}');
xlabel('Final state');
ylabel('Initial state');
%shading flat

subplot(3,2,2);

pcolor(x, y, [[P^20 zeros(N+1,1)]' zeros(N+2,1)]');
axis ij;
title('Graphical representation of P^{20}');
xlabel('Final state');
ylabel('Initial state');
%shading flat

subplot(3,2,4);

pcolor(x, y, [[P^225 zeros(N+1,1)]' zeros(N+2,1)]');
axis ij;
title('Graphical representation of P^{225}');
xlabel('Final state');
ylabel('Initial state');
%shading flat

subplot(3,2,6);

pcolor(x, y, [[P^2000 zeros(N+1,1)]' zeros(N+2,1)]');
axis ij;
title('Graphical representation of P^{2000}');
xlabel('Final state');
ylabel('Initial state');
%shading flat


% use black for probability 1, white for probability 0 by reversing the colormap
map = colormap('gray');
map = flipud(map);
colormap(map);


% Helpful code for displaying matrices

%fprintf('%4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f\n', P')

%A=P^225;
%A=[(0:30)' A];

%fprintf('%2d | %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f |\n', A')

