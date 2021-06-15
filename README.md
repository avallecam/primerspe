
<!-- README.md is generated from README.Rmd. Please edit that file -->

# primerspe

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/primerspe)](https://CRAN.R-project.org/package=primerspe)
<!-- badges: end -->

The goal of primerspe is to have a local replicate of Rstudio primers.
The original material was translated to Spanish for educational
purposes.

## Installation

You can install the developmental version of `primerspe` with:

<!-- You can install the released version of primerspe from [CRAN](https://CRAN.R-project.org) with: -->

``` r
if(!require("remotes")) install.packages("remotes")
remotes::install_github("avallecam/primerspe")
```

También puedes instalarlo descargando el archivo `.tar.gz` o `.zip`
(este sólo funciona en Windows) e instalar el paquete `primerspe` desde
la opción **Tools -&gt; Install Packages -&gt; Install from -&gt;
Package Archive File (.zip; .tar.gz)**.

## `learnr` tutorial

``` r
# instalar learner
if(!require("learnr")) install.packages("learnr")

# correr tutorial 01
learnr::run_tutorial(name = "04-programacion-basica",package = "primerspe")

# correr tutorial 02
learnr::run_tutorial(name = "funciones-tutorial",package = "primerspe")
```

Si tienes la última versión de RStudio aparecerá en tu panel de
**Tutorial**. Sino, se abriá en tu buscador web.

## Referencias

-   Rstudio Primers <https://rstudio.cloud/learn/primers>
-   Taller MetaDocencia LatinR Rladies
    <https://github.com/yabellini/curso_learnr>
-   Generando tutoriales interactivos
    <https://yabellini.netlify.app/es/post/tutorialesconlearnr/>
-   Empaquetando tutoriales interactivos
    <https://yabellini.netlify.app/es/post/empaquetandotutoriales/>
-   RECON Learn tutorials in Spanish
    <https://www.reconlearn.org/topics/spanish.html>
