clear all
close all
clc

process;
make_model;

% Order:
% out_start_to_t2
% flying_start_to_t2
% t2_to_t10
% in_t10_to_finish
% flying_t10_to_finish

for i1 = 1 : length(out_laps_start_to_t2)
  for i2 = 1 : length(flying_laps_start_to_t2)
    for i3 = 1 : length(all_t2_to_t10)
      for i4 = 1 : length(in_laps_t10_to_finish)
        for i5 = 1 : length(flying_laps_t10_to_finish)
          s1 = out_laps_start_to_t2{i1};
          s2 = flying_laps_start_to_t2{i2};
          s3 = all_t2_to_t10{i3};
          s4 = in_laps_t10_to_finish{i4};
          s5 = flying_laps_t10_to_finish{i5};
          [t_time, t_dist, t_fuel] = race_sim(s1, s2, s3, s4, s5);
          race_times{i1, i2, i3, i4, i5} = t_time;
          race_dists{i1, i2, i3, i4, i5} = t_dist;
          race_fuels{i1, i2, i3, i4, i5} = t_fuel;
        end
      end
    end
  end
end

find_best;

fprintf("Out lap start to t2: %d, times %f to %f, file %s\n", i1, out_laps_start_to_t2{i1}.time(1), out_laps_start_to_t2{i1}.time(end), out_laps_start_to_t2{i1}.fname)
fprintf("Flying lap start to t2: %d, times %f to %f, file %s\n", i2, flying_laps_start_to_t2{i1}.time(1), flying_laps_start_to_t2{i1}.time(end), flying_laps_start_to_t2{i1}.fname)
fprintf("t2 to t10: %d, times %f to %f, file %s\n", i3, all_t2_to_t10{i1}.time(1), all_t2_to_t10{i1}.time(end), all_t2_to_t10{i1}.fname)
fprintf("In lap t10 to finish: %d, times %f to %f, file %s\n", i4, in_laps_t10_to_finish{i1}.time(1), in_laps_t10_to_finish{i1}.time(end), in_laps_t10_to_finish{i1}.fname)
fprintf("Flying lap t10 to finish: %d, times %f to %f, file %s\n", i5, flying_laps_t10_to_finish{i1}.time(1), flying_laps_t10_to_finish{i1}.time(end), flying_laps_t10_to_finish{i1}.fname)