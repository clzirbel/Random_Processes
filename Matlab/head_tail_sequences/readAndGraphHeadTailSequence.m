% readAndGraphHeadTailSequence.m displays a sequence of H and T as up and down steps

sequencenumber = {'IID','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16'};

for s = 1:length(sequencenumber),

  fid = fopen(['../../R/head_tail_sequences/sequence' sequencenumber{s} '.txt']);
  S = fgetl(fid);
  fclose(fid);

  t = 0:length(S);                   % time points
  X = zeros(1,length(S)+1);          % create space to store location of the head-tail process

  for i = 1:length(S),
    if S(i) == 'H',
      X(i+1) = X(i) + 1;
    else
      X(i+1) = X(i) - 1;
    end
  end

  figure(1)
  clf
  plot(t(1:301),X(1:301),'linewidth',0.5)
  xlabel('Step number');
  ylabel('Position');
  title(['Head-tail sequence ' sequencenumber{s} ' as an up down walk'])
  orient landscape
  saveas(gcf,['sequence' sequencenumber{s} '_up_down_300_steps.pdf'])
  pause
end