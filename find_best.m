best_km_per_liter = 0.0;
best_i1 = 0;
best_i2 = 0;
best_i3 = 0;
best_i4 = 0;
best_i5 = 0;

for i1 = 1 : length(out_laps_start_to_t2)
  for i2 = 1 : length(flying_laps_start_to_t2)
    for i3 = 1 : length(all_t2_to_t10)
      for i4 = 1 : length(in_laps_t10_to_finish)
        for i5 = 1 : length(flying_laps_t10_to_finish)
          t = race_times{i1, i2, i3, i4, i5};
          d = race_dists{i1, i2, i3, i4, i5};
          f = race_fuels{i1, i2, i3, i4, i5};
          if(t < 40*60 && d/f > best_km_per_liter)
            best_km_per_liter = d/f;
            best_i1 = i1;
            best_i2 = i2;
            best_i3 = i3;
            best_i4 = i4;
            best_i5 = i5;
          end
        end
      end
    end
  end
end
