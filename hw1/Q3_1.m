clear;
clc;
n=5;
rule = 22;
outs = [18  22 30 50;...
                 54 60 69 70;...
                 73 77 94 99;...
                 105 109 110 126;...
                 150 158 190 248];
             
 fig = figure();
 for i = 1:5
     for j = 1:4
         subplot(5,4,(i-1)*4+j);
         cellularAutomaton_img(outs(i,j),20);
     end
 end


function init = cellularAutomaton(rule, init, n)
  init(n + 1, :) = 0;
  for k = 1 : n
    init(k,1) = init(k,2*n);
    init(k,2*n+1) = init(k,2);
    init(k + 1, :) = bitget(rule, 1 + filter2([4 2 1], init(k, :)));
  end
end

 function img = cellularAutomaton_img(rule, n)
     clearvars -except n rule
     matrix = zeros(n,2*n+1);
     matrix(1,n+1) = 1;
     mat = cellularAutomaton(rule, matrix, n);
     img = imagesc(mat);
     set(gca,'XTick',[], 'YTick', []);
     colormap(flipud(gray));
     title(sprintf('rule %d',rule),'Interpreter','latex');
 end
 