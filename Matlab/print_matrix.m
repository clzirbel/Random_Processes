% print_matrix(P) prints a matrix to the screen in a reasonable way for probability transition matrices
% It is set to print four places after the decimal, but you can adjust that if you want.

function [void] = print_matrix(P)

[a,b] = size(P);

for i = 1:a,
  for j = 1:b,
    fprintf('%0.4f ',P(i,j));
  end
  fprintf('\n');
end
