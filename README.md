# reversible-jumps-adaptive-discrete-ordinate

## Prerequisites
One must have the following Matlab toolboxes installed before running the code:
* *[Vectorized Numerical Integration](https://www.mathworks.com/matlabcentral/fileexchange/48931-vectorized-numerical-integration-matlab?s_tid=mwa_osa_a)*

## Numerical Methods

### Variational Formulation

The original equation is ![](http://latex.codecogs.com/gif.latex?\hat{\Omega}\cdot\nabla\psi(\vec{r},\hat{\Omega})+\sigma_t(\vec{r})\psi(\vec{r})=\frac{1}{4\pi}\left[\sigma_s(\vec{r})\int_{\mathbb{S}^2}\psi(\vec{r},\hat{\Omega})d\Omega'+q(\vec{r})\right])

We multiply both sides by an arbitrary test function ![](http://latex.codecogs.com/gif.latex?u(\vec{r})) and perform integration over the region ![](http://latex.codecogs.com/gif.latex?\mathcal{R})) to get

![](http://latex.codecogs.com/gif.latex?\int_{\partial\mathbb{R}}\hat{\Omega}\cdot\hat{n}\nabla dS(\vec{r})-\int_{\mathcal{R}}\psi(\vec{r},\hat{\Omega})\hat{\Omega}\cdot\nabla u(\vec{r})d\vec{r}+\int_{\mathcal{R}}\sigma_t(\vec{r})\psi(\vec{r})u(\vec{r}))d\vec{r}=\frac{1}{4\pi}\int_{\mathcal{R}}\left[\sigma_s(\vec{r})\int_{\mathbb{S}^2}\psi(\vec{r},\hat{\Omega})d\Omega'+q(\vec{r})\right]d\vec{r})

