LSphere: Spectral interpolation at the node points of spherical Lissajous curves
--------------------------------------------------------------------------------

Version: 0.4 (01.02.2018)
-------------------------

Copyright (C) 2018 Wolfgang Erb

This software was written by Wolfgang Erb 
and developed at the Department of Mathematics, University of Hawaii at Manoa

LSphere is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.


Description
-----------

The package LSphere contains a Matlab-implementation for spectral interpolation on 
the node points LS of spherical Lissajous curves. The description of the spherical
Lissajous curves, the point sets LS and the spectral interpolation scheme can be found in [1]. 

The main test file for interpolation at spherical Lissajous node points is
- main_example.m

For plotting spherical Lissajous curves and the LS points use
- Lissajous_example.m

To plot one of the fundamental Lagrange functions of the interpolation scheme use
- Lagrange_example.m

To test the plot program on the sphere use
- sphereplotter_example.m

For an application of the interpolation scheme in estimating the rotation of objects try
- navigator_nls_example.m



Citation
--------

[1] Erb, W., A spectral interpolation scheme on the unit sphere based on the
node points of spherical Lissajous curves, arXiv, 2018
