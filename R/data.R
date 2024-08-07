# The handwriterApp R package performs writership analysis of handwritten
# documents. Copyright (C) 2024 Iowa State University of Science and Technology
# on behalf of its Center for Statistics and Applications in Forensic Evidence
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <https://www.gnu.org/licenses/>.

#' Cluster Template with Eight Clusters
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name templateKeight
#' @rdname templateKeight
#' @keywords clusters
#' @format A list containing a single cluster template created by
#'   \code{handwriter::make_clustering_template}. The cluster template was created by sorting
#'   a random sample of 1000 graphs from 10 training documents into 10 clusters
#'   with a K-means algorithm. The cluster template is a named list with 16
#'   items:
#' \describe{
#' \item{centers_seed}{An integer for the random number generator.}
#' \item{cluster}{A vector of cluster assignments
#'   for each graph used to create the cluster template.}
#' \item{centers}{The final cluster centers produced by the K-Means algorithm.}
#' \item{K}{The number of clusters to build (10) with the K-means algorithm.}
#' \item{n}{The number of training graphs to use (1000) in the K-means
#'   algorithm.}
#' \item{docnames}{A vector that lists the training document from which each graph originated.}
#' \item{writers}{A vector that lists the writer of each graph.}
#' \item{iters}{The maximum number of iterations for the K-means
#'   algorithm (3).}
#' \item{changes}{A vector of the number of graphs that
#'   changed clusters on each iteration of the K-means algorithm.}
#' \item{outlierCutoff}{A vector of the outlier cutoff values calculated on
#'   each iteration of the K-means algorithm.}
#' \item{stop_reason}{The reason the
#'   K-means algorithm terminated.}
#' \item{wcd}{A matrix of the within cluster
#'   distances on each iteration of the K-means algorithm. More specifically,
#'   the distance between each graph and the center of the cluster to which it
#'   was assigned  on each iteration.}
#' \item{wcss}{A vector of the
#'   within-cluster sum of squares on each iteration of the K-means algorithm.}}
#' 
#' @md
"templateKeight"

#' Cluster Template with Forty Clusters
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name templateKforty
#' @rdname templateKforty
#' @keywords cluster
#' @md
#' @usage templateKforty
"templateKforty"
