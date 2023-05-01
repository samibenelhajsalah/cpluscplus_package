# cpluscplus_package
environnement de travail pour l'installation des outils, logiciel, librairie c++ 
# install Eigen3 Eigen 3.4.0 with spack

```cmake
#
# Eigen3
#
#find_package(Eigen3 3.4.0) # a tester
#cette commande va ajouter la variable "Eigen3_DIR
#/home/sami/Documents/travail/spack/opt/spack/linux-ubuntu22.04-ivybridge/gcc-11.3.0/eigen-3.4.0-dls4c4jv4m6rgme4fatksjizyj6gh5ld/share/eigen3/cmake
SET(EIGEN3_INCLUDE_DIR "$ENV{EIGEN3_INCLUDE_DIR}")
IF (NOT EIGEN3_INCLUDE_DIR)
    MESSAGE(FATAL_ERROR "Please point the environment variable EIGEN3_INCLUDE_DIR
                        to the include directory of your Eigen3 installation.")
ENDIF ()
INCLUDE_DIRECTORIES("${EIGEN3_INCLUDE_DIR}")
# DISABLE OpenMP multithreading if it's enable inside EIGEN
add_definitions(-DEIGEN_DONT_PARALLELIZE)
message(
        STATUS "\n-------------------------------------------------------")

message(STATUS "EIGEN3 . INCLUDE : ${EIGEN3_INCLUDE_DIR}")
```

```bash
#!/bin/bash
alias cmake='/home/sami/Documents/travail/spack/var/spack/environments/compilation/.spack-env/view/bin/cmake'
alias ccmake='/home/sami/Documents/travail/spack/var/spack/environments/compilation/.spack-env/view/bin/ccmake'
export EIGEN3_INCLUDE_DIR=/home/sami/Documents/travail/spack/opt/spack/linux-ubuntu22.04-ivybridge/gcc-11.3.0/eigen-3.4.0-dls4c4jv4m6rgme4fatksjizyj6gh5ld/include
```

## exemple


```cpp
#include <iostream>
#include <eigen3/Eigen/Dense>

using Eigen::MatrixXd;
 
int main()
{
  MatrixXd m(2,2);
  m(0,0) = 3;
  m(1,0) = 2.5;
  m(0,1) = -1;
  m(1,1) = m(1,0) + m(0,1);
  std::cout << m << std::endl;
  std::cout << " --> faut faire attention a l include de Dense !\n --> verifie bien le bon chemin" <<std::endl;
}
```