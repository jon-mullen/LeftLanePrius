%## Copyright (C) 2017 
%## 
%## This program is free software; you can redistribute it and/or modify it
%## under the terms of the GNU General Public License as published by
%## the Free Software Foundation; either version 3 of the License, or
%## (at your option) any later version.
%## 
%## This program is distributed in the hope that it will be useful,
%## but WITHOUT ANY WARRANTY; without even the implied warranty of
%## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%## GNU General Public License for more details.
%## 
%## You should have received a copy of the GNU General Public License
%## along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%## -*- texinfo -*- 
%## @deftypefn {Function File} {@var{retval} =} segment_stats (@var{input1}, @var{input2})
%##
%## @seealso{}
%## @end deftypefn
%
%## Author:  <rh@steelworker>
%## Created: 2017-03-02

function [fuel, dist, time] = segment_stats (segment)

  fuel = segment.fuel(end) - segment.fuel(1);
  dist = segment.odo(end) - segment.odo(1);
  time = segment.time(end) - segment.time(1);

end
