# LSphere

Spectral interpolation at the nodes of spherical Lissajous curves
--------------------------------------------------------------------------------

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<img src="img/sphere.png" width="370"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<img src="img/sphere2.png" width="370"> 

Version: 0.4 (01.02.2018)

Written by <a href="http://math.hawaii.edu/~erb/index.html"> Wolfgang Erb</a>

Description
-----------

The package LSphere contains a Matlab-implementation to calculate a spectral interpolation on the sphere from data given on the nodes of spherical Lissajous curves. The description of the spherical
Lissajous curves, the Lissajous node sets and the spectral interpolation scheme can be found in [1]. 

<br><br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<img src="img/lissajous76.png" width="370"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<img src="img/LSindex76.png" width="370"> 

<br><br>

- To **test** the package use **main_example.m**

- To **plot** the spherical Lissajous curve and its intersection points use **Lissajous_example.m**

- To **plot** the Lagrange functions of the interpolation scheme use **Lagrange_example.m**

- For an **application** of the interpolation scheme in estimating the rotation of objects try **navigator_nls_example.m**

<br><br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<img src="img/harmonic-org.png" width="370"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<img src="img/harmonic-rot.png" width="370"> 

<br><br>



Citation and Credits
--------------------

The general construction of the interpolation scheme based on the node points of spherical Lissajous curves is introduced in 


*   [1] &nbsp; Erb, W. <br>
    <i> A spectral interpolation scheme on the unit sphere based on the nodes of spherical Lissajous curves </i> <br>
    arXiv:1802.06546 [math.NA] (2018) 


License
-------

Copyright (C) 2018 Wolfgang Erb

This software was written by Wolfgang Erb at the Department of Mathemathics at the University of Hawaii at Manoa.

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
