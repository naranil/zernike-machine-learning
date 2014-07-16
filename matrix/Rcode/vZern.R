##ZERNFUN Zernike functions of order N and frequency M on the unit circle.
##   Z = ZERNFUN(N,M,R,THETA) returns the Zernike functions of order N
##   and angular frequency M, evaluated at positions (R,THETA) on the
##   unit circle.  N is a vector of positive integers (including 0), and
##   M is a vector with the same number of elements as N.  Each element
##   k of M must be a positive integer, with possible values M(k) = -N(k)
##   to +N(k) in steps of 2.  R is a vector of numbers between 0 and 1,
##   and THETA is a vector of angles.  R and THETA must have the same
##   length.  The output Z is a matrix with one column for every (N,M)
##   pair, and one row for every (R,THETA) pair.
##
##   Z = ZERNFUN(N,M,R,THETA,'norm') returns the normalized Zernike
##   functions.  The normalization factor sqrt((2-delta(m,0))*(n+1)/pi),
##   with delta(m,0) the Kronecker delta, is chosen so that the integral
##   of (r * [Znm(r,theta)]^2) over the unit circle (from r=0 to r=1,
##   and theta=0 to theta=2*pi) is unity.  For the non-normalized
##   polynomials, max(Znm(r=1,theta))=1 for all [n,m].
##
##   The Zernike functions are an orthogonal basis on the unit circle.
##   They are used in disciplines such as astronomy, optics, and
##   optometry to describe functions on a circular domain.
##
##   The following table lists the first 15 Zernike functions.
##
##       n    m    Zernike function           Normalization
##       --------------------------------------------------
##       0    0    1                                 1
##       1    1    r * cos(theta)                    2
##       1   -1    r * sin(theta)                    2
##       2   -2    r^2 * cos(2*theta)             sqrt(6)
##       2    0    (2*r^2 - 1)                    sqrt(3)
##       2    2    r^2 * sin(2*theta)             sqrt(6)
##       3   -3    r^3 * cos(3*theta)             sqrt(8)
##       3   -1    (3*r^3 - 2*r) * cos(theta)     sqrt(8)
##       3    1    (3*r^3 - 2*r) * sin(theta)     sqrt(8)
##       3    3    r^3 * sin(3*theta)             sqrt(8)
##       4   -4    r^4 * cos(4*theta)             sqrt(10)
##       4   -2    (4*r^4 - 3*r^2) * cos(2*theta) sqrt(10)
##       4    0    6*r^4 - 6*r^2 + 1              sqrt(5)
##       4    2    (4*r^4 - 3*r^2) * cos(2*theta) sqrt(10)
##       4    4    r^4 * sin(4*theta)             sqrt(10)
##       --------------------------------------------------
##
##   Example 1:
##
##       % Display the Zernike function Z(n=5,m=1)
##       x = -1:0.01:1;
##       [X,Y] = meshgrid(x,x);
##       [theta,r] = cart2pol(X,Y);
##       idx = r<=1;
##       z = nan(size(X));
##       z(idx) = zernfun(5,1,r(idx),theta(idx));
##       figure
##       pcolor(x,x,z), shading interp
##       axis square, colorbar
##       title('Zernike function Z_5^1(r,\theta)')
##
##   Example 2:
##
##       % Display the first 10 Zernike functions
##       x = -1:0.01:1;
##       [X,Y] = meshgrid(x,x);
##       [theta,r] = cart2pol(X,Y);
##       idx = r<=1;
##       z = nan(size(X));
##       n = [0  1  1  2  2  2  3  3  3  3];
##       m = [0 -1  1 -2  0  2 -3 -1  1  3];
##       Nplot = [4 10 12 16 18 20 22 24 26 28];
##       y = zernfun(n,m,r(idx),theta(idx));
##       figure('Units','normalized')
##       for k = 1:10
##           z(idx) = y(:,k);
##           subplot(4,7,Nplot(k))
##           pcolor(x,x,z), shading interp
##           set(gca,'XTick',[],'YTick',[])
##           axis square
##           title(['Z_{' num2str(n(k)) '}^{' num2str(m(k)) '}'])
##       end
##
##   See also ZERNPOL, ZERNFUN2.

##   Paul Fricker 11/13/2006


## Check and prepare the inputs:
## -----------------------------

vZern <- function(n, m, r, theta, nflag){
  ## Check and prepare the inputs:
  ## -----------------------------
  
}