% gambler_length.m computes the distribution of the length of the game

P = gambler_transition_matrix(10,20,0.5);

N = size(P,1);             % number of rows in P, also the number of columns

mu = zeros(1,31);
mu(11) = 1;

n = 0;                      % store time points
F = 0;                      % store probabilities the game is over by now

for i=1:3000,
  mu = mu*P;
  n(i+1) = i;
  F(i+1) = mu(1) + mu(N);
end

subplot(2,1,1)

stairs(n, F, 'k');
title('Cumulative distribution function of game length')
axis([0 1000 0 1]);

subplot(2,1,2)

pmf = [0 diff(F)];               % pmf of game length
plot(n, pmf, 'k.');
title('Distribution of game length')
axis([0 1000 0 max(pmf)*1.05]);

EN = sum(1-F);
fprintf('Average game length is %4.4f\n', EN);

orient tall
saveas(gcf,'gambler_game_length.pdf');

figure(2)
clf
plot(log(n),log(pmf),'k.');
