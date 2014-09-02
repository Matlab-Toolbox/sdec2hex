function value = sdec2hex(x, wordlength, mode)
%% SDEC2HEX Signed integer decimal to hexadecimal conversion
% Currently only Twos complement supported

    max_value = 2^(wordlength-1) - 1;
    min_value = -2^(wordlength-1);
    hex_len   = ceil(wordlength/4);

    if (x > max_value)
      error([num2str(x) ' is above max value (', num2str(max_value),') for signed ', num2str(wordlength),' bit wordlength'])
    end
    if (x<min_value) 
      error([num2str(x) ' is below min value (', num2str(min_value),') for signed ', num2str(wordlength),' bit wordlength'])
    end

    if x < 0
      twos_comp = 2^wordlength + x;
      value = dec2hex(twos_comp, hex_len);
    else
      value = dec2hex(x,         hex_len);
    end
    
    
end
