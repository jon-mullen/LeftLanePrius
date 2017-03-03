for i = 1 : length(all_t2_to_t10)
  this_segment = all_t2_to_t10{i};
  [seg_fuel, seg_dist, seg_time] = segment_stats(this_segment);
  all_t2_to_t10{i}.seg_fuel = seg_fuel;
  all_t2_to_t10{i}.seg_dist = seg_dist;
  all_t2_to_t10{i}.seg_time = seg_time;
end

for i = 1 : length(out_laps_start_to_t2)
  this_segment = out_laps_start_to_t2{i};
  [seg_fuel, seg_dist, seg_time] = segment_stats(this_segment);
  out_laps_start_to_t2{i}.seg_fuel = seg_fuel;
  out_laps_start_to_t2{i}.seg_dist = seg_dist;
  out_laps_start_to_t2{i}.seg_time = seg_time;
end

for i = 1 : length(flying_laps_start_to_t2)
  this_segment = all_t2_to_t10{i};
  [seg_fuel, seg_dist, seg_time] = segment_stats(this_segment);
  flying_laps_start_to_t2{i}.seg_fuel = seg_fuel;
  flying_laps_start_to_t2{i}.seg_dist = seg_dist;
  flying_laps_start_to_t2{i}.seg_time = seg_time;
end

for i = 1 : length(in_laps_t10_to_finish)
  this_segment = in_laps_t10_to_finish{i};
  [seg_fuel, seg_dist, seg_time] = segment_stats(this_segment);
  in_laps_t10_to_finish{i}.seg_fuel = seg_fuel;
  in_laps_t10_to_finish{i}.seg_dist = seg_dist;
  in_laps_t10_to_finish{i}.seg_time = seg_time;
end

for i = 1 : length(flying_laps_t10_to_finish)
  this_segment = flying_laps_t10_to_finish{i};
  [seg_fuel, seg_dist, seg_time] = segment_stats(this_segment);
  flying_laps_t10_to_finish{i}.seg_fuel = seg_fuel;
  flying_laps_t10_to_finish{i}.seg_dist = seg_dist;
  flying_laps_t10_to_finish{i}.seg_time = seg_time;
end