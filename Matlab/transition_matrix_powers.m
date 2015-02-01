% transition_matrix_powers(P,n,minimumstate) uses grayscale heatmaps to display powers n of the matrix P
% the variable n is a vector of up to 6 numbers
% the default value for P is gambler_transition_matrix(10,20,0.5)
% the default value for n is n = [1 2 3 20 225 2000]
% the default value for minimumstate is 0; states are numbered, there is no other choice

function [void] = transition_matrix_powers(P,n,minimumstate)

if nargin < 1,
	P = gambler_transition_matrix(10,20,0.5);
end

if nargin < 2,
	n = [1 2 3 20 225 2000];
end

if nargin < 3,
	minimumstate = 0;
end

figure(1)             % open a new figure window
clf                   % clear the figure

colormap(1-gray);     % use white for zero, black for 1
orient tall           % stretch graph vertically when printing
caxis([0 1])          % 0 is white, 1 is black

[N,M] = size(P);        % determine the size of P
if N ~= M,
	fprintf('The matrix P is not square, something will crash!\n');
end

x = (1:N) - 1.5 + minimumstate;
y = x;                  % row numbers

subplotorder = [1 3 5 2 4 6];   % Matlab numbers subplots left to right in rows, then down the page, but I want them numbered down

for v = 1:min(6,length(n)),   % go through the subplots, calling the current one v
	subplot(3,2,subplotorder(v));             % 3 by 2 array of plots, this is plot # v

	pcolor_fixed(x, y, P^n(v));   % display matrix P to power n(v)
	axis ij;                    % number the axes as for a matrix, not a regular graph
	title(['Graphical representation of P^{' num2str(n(v)) '}']);
	xlabel('Final state');
	ylabel('Initial state');
end

% Note:  the pcolor function cuts off the last row and column, so an extra row and column is added, and x and y are one element longer than necessary.

% saveas(gcf,'transition_matrix_powers.pdf')    % uncomment this line or copy and paste to save as PDF
