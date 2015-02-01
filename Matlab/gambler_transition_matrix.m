% gambler_transition_matrix(m,n,p) is a function which sets up the transition matrix for a gambler's wealth after successive iid bets of 1 dollar.
% Input parameters are m, the amount of money the gambler has, n, the amount the opponent has, and p, the probability that the gambler wins each bet.

function [P] = gambler_transition_matrix(m,n,p)

if nargin < 1,
	m = 10;           % default initial wealth of the gambler
end

if nargin < 2,
	n = 20;           % default initial wealth of the opponent
end

if nargin < 3,      % nargin counts the Number of ARGuments passed IN
	p = 0.5;          % default probability of winning a bet
end

N = m + n;          % total wealth at the table
q = 1 - p;          % probability of losing a bet

P=zeros(N+1,N+1);   % set up a matrix of zeros, of the right size
                    % rows 1..N+1 correspond to wealths 0..N

for i=2:N,          % let i take values 2, 3, 4, ..., N
   P(i,i-1)=q;      % wealth decreases by 1
   P(i,i+1)=p;      % wealth increases by 1
end

P(1,1) = 1;         % stay at 0 wealth with probability 1
P(N+1,N+1) = 1;     % stay at wealth N with probability 1
