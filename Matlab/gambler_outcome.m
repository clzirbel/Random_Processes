% gambler_outcome.m generates outcomes of Gambler's wealth

InitialWealth = 10;             % Starting wealth for the gambler
OpponentWealth = 20;            % Starting wealth for the opponent
p = 0.5;                        % probability of winning each bet

MaxWealth = InitialWealth + OpponentWealth;  % number of dollars at the table

NumSteps = 80;                  % start the graph with this number of total steps; add more later if needed

while 1 > 0,                    % continue forever
  clear n
  clear W
        
  figure(1)
  clf

  n(1) = 0;                     % start at time 0
  W(1) = InitialWealth;         % initial wealth
  for j = 2:NumSteps,
    n(j) = NaN;
    W(j) = NaN;                 % not a number, so it does not get plotted
  end

  i = 1;                        % current step number

  while W(i) > 0 && W(i) < MaxWealth,

    n(i+1) = n(i) + 1;         % keep track of the number of bets so far

    if (rand < p),             % rand is uniformly distributed between 0 and 1
      W(i+1)=W(i)+1;           % move up with probability p
    else
      W(i+1)=W(i)-1;           % move down with probability 1-p
    end

    plot(n,W,'linewidth',3);   % plot bet number on the horizontal, W on the vertical
    xlabel('Bet number');      % label x axis
    ylabel('Wealth');          % label y axis
    title('Gambler''s wealth simulation from gambler\_outcome.m');
    axis([0 length(n)+1 0 MaxWealth]); % set axis limits
    set(gca,'fontsize',14)     % use a larger font size on the axes

    figure(1)                  % bring the figure window to the front
    drawnow                    % graph any changes now
    pause(0.1)                 % pause for this many seconds after each step

    i = i + 1;                 % increase the step number by 1
    
  end

  disp('Press any key to simulate again, press Control-C to break')
  pause                        % wait for a key to be pressed before going to the next simulation
end
