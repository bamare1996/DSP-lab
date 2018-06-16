s = pll_init(0.1,1,1,2*pi/100,1,1024);

Ns = 100; % number of samples
Nb = 10; % number of blocks

load('ref_800hz');

in = reshape(ref_in, Ns, Nb); % 1000 samples, 10 blocks
out = zeros(Ns, Nb);

for n = 1:10
   [out(:,n),s] = pll(in(:,n), s);
   plot(1:length(in(:,n)),in(:,n), 1:length(in(:,n)),out(:,n))
   pause
end

%y_output = reshape(out, Ns*Nb, 1);
y_input = ref_in;

y_output = out(:);
plot(1:length(y_input),y_input);
hold on;
plot(1:length(y_output),y_output,'r')

hold off;
