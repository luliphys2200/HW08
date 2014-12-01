/*
 * The function provides the RHS of the following system of four 
 * first order differential equations, which describe 
 * the motion of a glider
 *
 *   v' = -sin(theta) - v^2 / R
 *   theta' = - cos(theta)/v + v 
 *   x' = v cos(theta)
 *   y' = v sin(theta)
 *
 * Here v is the dimensionless speed of the glider, 
 * theta is the angle that the velocity direction 
 * makes with the horizontal, x and y are
 * dimensionless cartesian coordinates of the glider.
 * 
 */

#include <stdio.h>
#include <math.h>

#include <gsl/gsl_errno.h>
#include <gsl/gsl_odeiv2.h>

int func (double t, const double y[], double f[], 
	  void *params) 
{
  /*
   * y[0] - velocity, v
   * y[1] - angle. theta
   * y[2] - horizontal coordinate, x
   * y[3] - altitude, y
   */
  double R = *(double *) params;

  f[0] = -sin(y[1]) - y[0]*y[0]/R;
  f[1] = -cos(y[1])/y[0] + y[0];
  f[2] = y[0]*cos(y[1]);
  f[3] = y[0]*sin(y[1]);

  return GSL_SUCCESS;
}

