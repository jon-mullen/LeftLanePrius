clear all
close all
clc

% gates for dividing lap

% turn 2 apex
gate_t2_l = [38.160940; -122.458832];
gate_t2_r = [38.161087; -122.458868];

% turn 10 exit (end of exit curbing)
gate_t10_l = [38.160931; -122.452567];
gate_t10_r = [38.160903; -122.452725];

% load stuff
out_files = dir('LapsSorted/Out/*.csv');
flying_files = dir('LapsSorted/Flying/*.csv');
in_files = dir('LapsSorted/In/*.csv');

% rip csv files to cell array of structs
for i = 1 : length(out_files)
  out_laps{i} = rip_table(csvread(strcat('LapsSorted/Out/', out_files(i).name)));
  out_laps{i}.fname = out_files(i).name;
end

for i = 1 : length(flying_files)
  flying_laps{i} = rip_table(csvread(strcat('LapsSorted/Flying/', flying_files(i).name)));
  flying_laps{i}.fname = flying_files(i).name;
end

for i = 1 : length(in_files)
  in_laps{i} = rip_table(csvread(strcat('LapsSorted/In/', in_files(i).name)));
  in_laps{i}.fname = in_files(i).name;
end

% clean up
clear out_files
clear flying_files
clear in_files
clear i

% lap lengths
out_lengths = zeros(size(out_laps));
for i = 1 : length(out_laps)
  out_lengths(i) = out_laps{i}.odo(end);
end

flying_lengths = zeros(size(flying_laps));
for i = 1 : length(flying_laps)
  flying_lengths(i) = flying_laps{i}.odo(end);
end

in_lengths = zeros(size(in_laps));
for i = 1 : length(in_laps)
  in_lengths(i) = in_laps{i}.odo(end);
end

% find sections and segregate

% in laps
for i = 1 : length(in_laps)

  this_lap = in_laps{i};
  start_index = 1;
  
  t2_index = [];
  t10_index = [];
  
  end_index = length(this_lap.odo);
  
  for j = 2 : length(this_lap.odo)
    crosses_t2 = test_crossing(gate_t2_l, gate_t2_r, ...
                    [this_lap.lat(j-1); this_lap.lon(j-1)], ...
                    [this_lap.lat(j); this_lap.lon(j)]);
    if(crosses_t2)
      % TODO: interpolate for cut
      t2_index = j;
    end
    
    crosses_t10 = test_crossing(gate_t10_l, gate_t10_r, ...
              [this_lap.lat(j-1); this_lap.lon(j-1)], ...
              [this_lap.lat(j); this_lap.lon(j)]);

    if(crosses_t10)
      t10_index = j;
    end
  end
  
  in_laps_start_to_t2{i} = segregate(this_lap, start_index, t2_index);
  in_laps_t2_to_t10{i} = segregate(this_lap, t2_index + 1, t10_index);
  in_laps_t10_to_finish{i} = segregate(this_lap, t10_index + 1, end_index);

end

% flying laps
for i = 1 : length(flying_laps)

  this_lap = flying_laps{i};
  start_index = 1;
  
  t2_index = [];
  t10_index = [];
  
  end_index = length(this_lap.odo);
  
  for j = 2 : length(this_lap.odo)
    crosses_t2 = test_crossing(gate_t2_l, gate_t2_r, ...
                  [this_lap.lat(j-1); this_lap.lon(j-1)], ...
                  [this_lap.lat(j); this_lap.lon(j)]);
    if(crosses_t2)
      % TODO: interpolate for cut
      t2_index = j;
    end
    
    crosses_t10 = test_crossing(gate_t10_l, gate_t10_r, ...
              [this_lap.lat(j-1); this_lap.lon(j-1)], ...
              [this_lap.lat(j); this_lap.lon(j)]);

    if(crosses_t10)
      t10_index = j;
    end
  end
  
  flying_laps_start_to_t2{i} = segregate(this_lap, start_index, t2_index);
  flying_laps_t2_to_t10{i} = segregate(this_lap, t2_index + 1, t10_index);
  flying_laps_t10_to_finish{i} = segregate(this_lap, t10_index + 1, end_index);

end

% out laps
for i = 1 : length(flying_laps)

  this_lap = out_laps{i};
  start_index = 1;
  
  t2_index = [];
  t10_index = [];
  
  end_index = length(this_lap.odo);
  
  for j = 2 : length(this_lap.odo)
    crosses_t2 = test_crossing(gate_t2_l, gate_t2_r, ...
                  [this_lap.lat(j-1); this_lap.lon(j-1)], ...
                  [this_lap.lat(j); this_lap.lon(j)]);
    if(crosses_t2)
      % TODO: interpolate for cut
      t2_index = j;
    end
    
    crosses_t10 = test_crossing(gate_t10_l, gate_t10_r, ...
              [this_lap.lat(j-1); this_lap.lon(j-1)], ...
              [this_lap.lat(j); this_lap.lon(j)]);

    if(crosses_t10)
      t10_index = j;
    end
  end
  
  out_laps_start_to_t2{i} = segregate(this_lap, start_index, t2_index);
  out_laps_t2_to_t10{i} = segregate(this_lap, t2_index + 1, t10_index);
  out_laps_t10_to_finish{i} = segregate(this_lap, t10_index + 1, end_index);

end

all_t2_to_t10 = [in_laps_t2_to_t10 flying_laps_t2_to_t10 out_laps_t2_to_t10];