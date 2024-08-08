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

demoKnownSidebarUI <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::fluidRow(shiny::column(width=12, shiny::actionButton(ns("demo_known_estimate"), "Estimate Writer Profiles"))),
    shiny::br()
  )
}

demoKnownBodyUI <- function(id){
  ns <- shiny::NS(id)
  shiny::tagList(
    currentImageUI(ns("demo_known"))
  )
}

demoKnownServer <- function(id, global) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      shiny::observeEvent(input$demo_known_estimate, {
        # setup tempdir()
        temp_dir <- tempdir()
        global$main_dir <- file.path(temp_dir, "demo")
        create_dir(global$main_dir)
        create_dir(file.path(global$main_dir, "data"))
        create_dir(file.path(global$main_dir, "data", "model_docs"))
        create_dir(file.path(global$main_dir, "data", "questioned_docs"))
        saveRDS(templateKeight, file.path(global$main_dir, "data", "template.rds"))
        
        # known writing samples in tests folder
        known_paths <- list.files(testthat::test_path("fixtures", "template", "data", "model_docs"), full.names = TRUE)
        known_names <- basename(known_paths)
        
        # copy known docs to temp directory > data > model_docs
        copy_docs_to_project(main_dir = global$main_dir, 
                             paths = known_paths, 
                             names = known_names,
                             type = "model")
        
        # list known filepaths
        global$known_paths <- list_docs(global$main_dir, type = "model", filepaths = TRUE)
        global$known_names <- list_names_in_named_vector(global$known_paths)
        
        # fit model
        global$model <- handwriter::fit_model(main_dir = global$main_dir,
                                              model_docs = file.path(global$main_dir, "data", "model_docs"),
                                              num_iters = 4000,
                                              num_chains = 1,
                                              num_cores = 1,
                                              writer_indices = c(2, 5),
                                              doc_indices = c(7, 18))
      })
      
      currentImageServer("demo_known", global, "model")
    }
  )
}