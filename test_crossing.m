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
% ## @deftypefn {Function File} {@var{retval} =} test_crossing (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author:  <rh@steelworker>
% ## Created: 2017-03-02

function [retval] = test_crossing (gate_l, gate_r, pt_1, pt_2)

  v_gate = reshape(gate_r - gate_l, 2, 1);
  v_car = reshape(pt_2 - pt_1, 2, 1);

  A = [v_gate -v_car];
  b = reshape(pt_1 - gate_l, 2, 1);

  if(cond(A) > 1e9)
    retval = false;
  else  
    rs = linsolve(A, b);
    
    if(rs(1) <= 1.0 && rs(1) >= 0.0 && rs(2) <= 1.0 && rs(2) >= 0.0)
      retval = true;
    else
      retval = false;
    end
  end
    
end
