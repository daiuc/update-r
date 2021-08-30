### Collect packages from a migrating system

## tbd...

if (require(dplyr) == F) install.packages("dplyr")

all.my.pkgs = installed.packages()
cran.pkgs = available.packages()
bioc.pkgs = BiocManager::available()

labelSource = function(installed_pkgs, cran, bioc) {
  #' @param installed_pkgs: chr vector, all installed packages
  #' @param cran: chr vector, CRAN available packages
  #' @param bioc: chr vector, Bioconductor available packages
  labels = lapply(installed_pkgs, function(p) {
    if (p %in% rownames(cran)) {
      l = "cran"
    } else if (p %in% bioc) {
      l = "bioc"
    } else {
      l = "git"
    }
    return(l)
  })
  return(unlist(labels, use.names = F))
}
