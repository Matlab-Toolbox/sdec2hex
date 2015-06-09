function value = sdec2hex(x, wordlength, mode)
%% SDEC2HEX Signed integer decimal (base10) to hexadecimal (base16) conversion
% Usage :
%   value = sdec2hex(x, wordlength, [mode])
%
% Currently mode selection is not supported, hex output is twos complement.

if nargin < 1
  help sdec2hex
  error('No arguments supplied')
end

if nargin < 2
  % Calculate number of bits plus sign to represent input
  wordlength = ceil(log2(abs(x)+1)) + 1 ;
  if x <0 
    warning(['wordlength not specified for negative integer (', num2str(x), '), generated pattern is sensitive to this, ', num2str(wordlength),' bits will be used.'])
  end
  
end

  %% Input Validation (Integer Check)
  % double any allows input 2D arrays to be collapsed to a single boolean
  if ~isreal(x) || any(any(x ~= fix(x)))
    error('sdec2hex : First argument must contain integers.');
  end

    max_value = 2^(wordlength-1) - 1;
    min_value = -2^(wordlength-1);
    hex_len   = ceil(wordlength/4);

    %% for value checks perfoming conversion on a cell-by-cell basis
    [rows,cols] = size(x);
    for i=1:rows 
      for j=1:cols
        cell_value = x(i,j);
        if (cell_value > max_value)
          error([num2str(cell_value) ' is above max value (', num2str(max_value),') for signed ', num2str(wordlength),' bit wordlength'])
        end
        if (cell_value<min_value) 
          error([num2str(cell_value) ' is below min value (', num2str(min_value),') for signed ', num2str(wordlength),' bit wordlength'])
        end

        
        if cell_value < 0
          twos_comp = 2^wordlength + cell_value;
          value(i,j) = {dec2hex(twos_comp,  hex_len)};
        else
          value(i,j) = {dec2hex(floor(cell_value), hex_len)};
        end
      end
    end
    
    
end
