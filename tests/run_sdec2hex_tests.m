restoredefaultpath; matlabrc % Clear path
clear import; % clear packages to test correct library

%% Add functions to path
run('../../sdec2hex/load_toolbox');

error_count = 0;
pass_count  = 0;

%% Test vectors
  test ={};
  res = 0; 
  test(end+1).input =   sdec2hex(  2, 3);   test(end).expect =  '2' ;
  test(end+1).input =   sdec2hex(  3, 3);   test(end).expect =  '3' ;
  test(end+1).input =   sdec2hex( -1, 3);   test(end).expect =  '7' ;
  test(end+1).input =   sdec2hex( -4, 3);   test(end).expect =  '4' ;
  
  test(end+1).input =   sdec2hex(  7, 4);   test(end).expect =  '7' ;
  test(end+1).input =   sdec2hex( -1, 4);   test(end).expect =  'F' ;
  test(end+1).input =   sdec2hex( -8, 4);   test(end).expect =  '8' ;



  %% The tests
  for vector=1:size(test,2)
     if (  ~isequal(test(vector).input, test(vector).expect)  )
       disp('sdec2hex() Failed ')
       error_count = error_count + 1;
     else
       pass_count  = pass_count  + 1;
     end
  end
   

  
  %% Test Status Report
  if error_count > 0
    disp(['Test FAILED : ', num2str(pass_count), ' passes and ',num2str(error_count),' fails'])
  else
    disp(['Test Passed : ', num2str(pass_count), ' checks ran '])
  end
















