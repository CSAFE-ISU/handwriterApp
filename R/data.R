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

#' Cluster Template with Forty Clusters
#'
#' A list containing a single cluster template created by
#' \code{handwriter::make_clustering_template}. The cluster template was created
#' by sorting graphs from 120 training documents into 40 clusters with a K-means
#' algorithm. The training documents are from the CSAFE Handwriting Database: 50
#' Wizard of Oz prompts, 50 London Letter prompts, and 20 common phrase prompts.
#' Each prompt is from a distinct writer.
#' 
#' @name templateK40
#' @rdname templateK40
#' @keywords clusters
#' @format The cluster template is a named list with 16 items:
#' \describe{
#' \item{centers_seed}{The integer use for the random number generator to select starting cluster centers.}
#' \item{cluster}{A vector of cluster assignments
#'   for each graph used to create the cluster template.}
#' \item{centers}{The final cluster centers produced by the K-Means algorithm.}
#' \item{K}{The number of clusters.}
#' \item{n}{The number of training graphs to used in the K-means
#'   algorithm.}
#' \item{docnames}{A vector that lists the training document from which each graph originated.}
#' \item{writers}{A vector that lists the writer ID of each graph.}
#' \item{iters}{The maximum number of iterations of the K-means
#'   algorithm.}
#' \item{changes}{A vector of the number of graphs that
#'   changed clusters on each iteration of the K-means algorithm.}
#' \item{outlierCutoff}{A vector of the outlier cutoff values calculated on
#'   each iteration of the K-means algorithm.}
#' \item{stop_reason}{The reason the
#'   K-means algorithm terminated.}
#' \item{wcd}{A matrix of the within cluster
#'   distances on the last iteration of the K-means algorithm. More specifically,
#'   the distance between each graph and the center of the cluster to which it
#'   was assigned  on each iteration.}
#' \item{wcss}{A vector of the
#'   within-cluster sum of squares on each iteration of the K-means algorithm.}}
#'
#' @keywords cluster
#' @md
"templateK40"
