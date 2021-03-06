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
% ## @deftypefn {Function File} {@var{retval} =} segregate (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author:  <rh@steelworker>
% ## Created: 2017-03-02

function [retval] = segregate (lap, ind1, ind2)

  names = fieldnames(lap);
  for i = 1 : length(names)
    fieldname = names{i};
    v = lap.(fieldname);
    if(!strcmp(fieldname, 'fname'))
      retval.(fieldname) = v(ind1 : ind2);
    else
      retval.(fieldname) = v;
    end
  end

end
