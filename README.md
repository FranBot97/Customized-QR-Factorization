# Customized QR Factorization

**(P)** is the linear least squares problem:

<div align="center">
    <img src="https://latex.codecogs.com/svg.image?\underset{w}{min}\left\|\hat{X}w-\hat{y}\right\|">
</div>

where:

<div align="center">
    <img src="https://latex.codecogs.com/svg.image?\hat{X}=\begin{bmatrix}X^{T}\\\lambda%20I\end{bmatrix},\hat{y}=\begin{bmatrix}y\\0\end{bmatrix}">
</div>

with <img src="https://latex.codecogs.com/svg.image?\mathbb{R}^{m\times%20n}"> being the (tall thin) matrix from the ML-cup dataset by Prof. Micheli, <img src="https://latex.codecogs.com/svg.image?\lambda%3E0">, and <img src="https://latex.codecogs.com/svg.image?y"> is a random vector.

**(A1)** is [thin QR factorization via Householder reflectors](https://my.siam.org/Store/Product/viewproduct/?ProductId=950), cf. also Lecture 10.

**(A2)** is a variant of thin QR (to be determined) in which you make use of the structure of the matrix <img src="https://latex.codecogs.com/svg.latex?\hat{X}"> (and in particular the zeros in the scaled identity block) to reduce the computational cost.

No off-the-shelf solvers allowed. In particular, you must implement the thin QR factorization yourself, and the computational cost of your implementation should be at most quadratic in <img src="https://latex.codecogs.com/svg.image?m">.


## Code Description
The code for the implementation is written in MATLAB, and the files are divided into folders.

The `Dataset` folder contains the *csv* file used to construct the matrix on which the experiments were performed.

In the `Utils` folder there are:
- `Matrices.m`: builds the X matrix and the y vector.
- `Solvefun.m`: solves the least squares problem with the different methods and returns the result for each method.

In the `Algorithms` folder there are four files:
- `householder_vector.m`: returns the Householder vectors.
- `ThinQR.m`: contains the implementation of the classical thin QR.
- `VariantThinQR.m`: contains the implementation of the variant of the algorithm.
- `VariantThinQRDirect.m`: contains the implementation of the second variant of the algorithm.

In the `Experiments/QR` folder there are scripts and functions used to test the accuracy of the factorization executed with different setups:
- `Standard.m`: tests the accuracy and execution time on the original matrix.
- `DifferentLambdas.m`: checks the error of the algorithms by varying the lambda value of the scaled identity matrix.
- `MoreRows.m`: checks the error of the factorization by varying the number of rows of the matrix.

In the `Experiments/SystemSolution` folder there are files to test the error and the time taken to solve the system:
- `Standard.m`: calculates the residual obtained by the different methods and the time taken to find the solution.
- `Gradient.m`: checks the value of the gradient.

In the main folder, there are two additional files:
- `TestAll.m`: tests all the implemented functions.
- `Mypath.m`: adds all the subfolders to the MATLAB workspace.
