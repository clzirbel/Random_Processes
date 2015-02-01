% pcolor_fixed(x,y,M) adds a last row and column to M and to x and y so that the last row and column are not cut off

function [void] = pcolor_fixed(x,y,M)

	[A,B] = size(M);
	x(B+1) = max(x) + 1;    % add one element
	y(A+1) = max(y) + 1;    % add one element
  M(A+1,B+1) = 0;         % add one row and one column to M

	pcolor(x, y, M);   % display matrix M as a heat map
