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


#' Copy Documents to Project Directory
#'
#' When the user selects documents the files are copied to main_dir > data >
#' model_docs or main_dir > data > questioned_docs so that all documents used in
#' the analysis are stored in the project folder.
#'
#' @param main_dir A filepath to the project folder
#' @param paths The filepaths of the writing samples
#' @param names The filenames of the writing samples
#' @param type Either "model" or "questioned"
#'
#' @return NULL
#'
#' @noRd
copy_docs_to_project <- function(main_dir, paths, names, type = "model"){
  lapply(1:length(paths), function(i) {
    file.copy(paths[i], file.path(main_dir, "data", paste0(type, "_docs"), names[i]))}
  )
}

#' Create a Directory
#'
#' This helper function creates a directory if it doesn't already exist.
#'
#' @param folder A filepath for the new directory
#'
#' @return NULL
#' 
#' @noRd
create_dir <- function(folder){
  if (!dir.exists(folder)){
    dir.create(folder)
  }
}

#' Delete the Demo Folder
#' 
#' Delete the demo folder and its contents from the temporary directory.
#'
#' @return NULL
#'
#' @noRd
delete_demo_dir <- function() {
  unlink(file.path(tempdir(), "demo"), recursive = TRUE)
}

#' List Handwriting Samples in Folder
#'
#' This helper function lists the documents in main_dir > data > model_docs or
#' main_dir > data > questioned_docs and returns the filenames in a vector.
#'
#' @param main_dir A filepath to the project folder
#' @param type Either "model" or "questioned"
#' @param filepaths TRUE to return the full filepaths or FALSE to return the filenames only
#'
#' @return List
#'
#' @noRd
list_docs <- function(main_dir, type = "model", filepaths = TRUE){
  docs <- list.files(file.path(main_dir, "data", paste0(type, "_docs")), pattern = ".png", full.names = filepaths)
  return(docs)
}

#' Get the Filenames of the Questioned Documents
#' 
#' This helper function returns the full filepath of the questioned 
#' document in main_dir > data > questioned_docs.
#'
#' @param main_dir A filepath to the project folder
#'
#' @return Filename
#' 
#' @noRd
list_names_in_named_vector <- function(paths){
  if (length(paths) > 0 ) {
    # get names list where names are the filepaths and values are the filenames
    names <- sapply(paths, basename)
    # swap names and values so the names are the filenames and the values are the filepaths
    names <- stats::setNames(names(names), names)
    return(names)
  }
}

#' Load Analysis
#' 
#' This helper function loads the analysis created by 
#' handwriter::analyze_questioned_document and saved as main_dir >
#' data > analysis.rds.
#'
#' @param main_dir A filepath to the project folder
#'
#' @return Analysis as a list
#'
#' @noRd
load_analysis <- function(main_dir){
  if (file.exists(file.path(main_dir, "data", "analysis.rds"))){
    return(readRDS(file.path(main_dir, "data", "analysis.rds")))
  }
}

#' Load Model
#' 
#' This helper function loads the model created by 
#' handwriter::fit_model and saved as main_dir >
#' data > model.rds.
#'
#' @param main_dir A filepath to the project folder
#'
#' @return Model as a list
#'
#' @noRd
load_model <- function(main_dir) {
  if (file.exists(file.path(main_dir, "data", "model.rds"))){
    return(readRDS(file.path(main_dir, "data", "model.rds")))
  }
}

#' Load Processed Document
#' 
#' This helper function loads the document
#' processed with handwriter::processDocument 
#'
#' @param main_dir A filepath to the project folder
#' @param name Filename of the document
#' @param type Either "model" or "questioned
#'
#' @return Processed document as a list
#'
#' @noRd
load_processed_doc <- function(main_dir, name, type){
  # drop file extension from name
  name <- stringr::str_replace(name, ".png", "")
  graphs <- list.files(file.path(main_dir, "data", paste0(type, "_graphs")), pattern = ".rds", full.names = TRUE)
  graphs <- graphs[grepl(name, graphs)]
  graphs <- readRDS(graphs)
  return(graphs)
}

#' Load Document
#'
#' This helper function loads a document as an image with the magick package.
#'
#' @param path The filepath for the document
#'
#' @return An image
#'
#' @noRd
load_image <- function(path){
  if (!is.null(path) && file.exists(path)){
    return(magick::image_read(path))
  }
}

#' Make Dataframe of Posterior Probabilities
#' 
#' This helper function formats the posterior probabilities of 
#' writership stored in analysis calculated with 
#' handwriter::analyze_questioned_document. The posterior probabilities
#' are placed in a dataframe with columns Known Writer and Posterior Probability
#' of Writership. The posterior probabilities are formatted as percentages.
#'
#' @param analysis analysis created with handwriter::analyze_questioned_document
#'
#' @return Processed document as a list
#'
#' @noRd
make_posteriors_df <- function(analysis){
  # prevent note: "no visible binding for global variable"
  post_probs <- NULL
  
  df <- analysis$posterior_probabilities
  
  # Format posterior probabilities as percentage
  qd_columns <- colnames(df)[-1]
  df <- df %>% tidyr::pivot_longer(cols = tidyr::all_of(qd_columns), 
                             names_to = "qd", 
                             values_to = "post_probs")
  df <- df %>% dplyr::mutate(post_probs = paste0(100*post_probs, "%"))
  df <- df %>% tidyr::pivot_wider(names_from = "qd", values_from = "post_probs")
  
  # Change "known_writer" to "Known Writer"
  colnames(df)[1] <- "Known Writer"
  
  return(df)
}

#' Reset the App
#' 
#' Reset the global reactive values.
#'
#' @param global 
#'
#' @return NULL
#'
#' @noRd
reset_app <- function(global) {
  global$analysis <- NULL
  global$known_names <- NULL
  global$known_paths <- NULL
  global$main_dir <- NULL
  global$model <- NULL
  global$qd_names <- NULL
  global$qd_paths <- NULL
}

#' Setup Main Directory
#' 
#' This helper function creates directory called "data" inside the main directory.
#' Inside the "data" directory, "questioned_docs," "questioned_graphs," and "model_docs"
#' directories are created. The data object "template" is saved in the "data" directory
#' as template.rds. These directories and the template.rds file are required by the 
#' handwriter package to analyze a questioned document.
#'
#' @param main_dir A filepath to the project folder
#'
#' @return Processed document as a list
#'
#' @noRd
setup_main_dir <- function(main_dir){
    # create directory structure in main directory
    create_dir(file.path(main_dir, "data"))
    create_dir(file.path(main_dir, "data", "questioned_docs"))
    create_dir(file.path(main_dir, "data", "questioned_graphs"))
    create_dir(file.path(main_dir, "data", "model_docs"))
    
    # handwriter requires template.rds to exist in main_dir > data
    saveRDS(templateKforty, file.path(main_dir, "data", "template.rds"))
}
