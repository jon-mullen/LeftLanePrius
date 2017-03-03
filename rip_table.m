% ## Copyright (C) 2017 
% ## 
% ## This program is free software; you can redistribute it and/or modify it
% ## under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 3 of the License, or
% ## (at your option) any later version.
% ## 
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*- 
% ## @deftypefn {Function File} {@var{retval} =} rip_table (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author:  <rh@steelworker>
% ## Created: 2017-03-02

function [lap] = rip_table (table)

  lap.time = table(:, 1);
  lap.throttle = table(:, 2);
  lap.brake = table(:, 3);
  lap.gear = table(:, 4);
  lap.omega = table(:, 5);
  lap.vee = table(:, 6);
  lap.fuel = table(:, 7);
  lap.odo = table(:, 8);
  lap.lat = table(:, 9);
  lap.lon = table(:, 10);
  lap.ev = table(:, 12);
  lap.soc = table(:, 13);
  lap.alt = table(:, 14);

end
