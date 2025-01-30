# handwriterApp 2.0.1

## Minor improvements and fixes

* Previously, calling `handwriterRF::calculate_slr()` returned an error that `random_forest` cannot be found unless `library('handwriterRF')` was called first. Now
`handwriterRF::calculate_slr()` is called with the argument `handwriterRF::random_forest` so that users don't need to run `library('handwriterRF')`.

# handwriterApp 2.0.0

## New features

* Added functionality from 'handwriterRF' to the 'shiny' app. The new functionality allows users to perform forensic handwriting comparison of two scanned handwritten documents. This uses the statistical method described by Madeline Johnson and Danica Ommen (2021) <doi:10.1002/sam.11566>. Similarity measures and a random forest produce a score-based likelihood ratio that quantifies the strength of the evidence in favor of the documents being written by the same writer or different writers.

## Minor improvements and fixes

* Added the option to view a full-screen version of images displayed with `singleImageUI()` and `singleImageServer()`.

* Changed the navigation bar to have tabs Home, Scenarios, Scenario 1, Scenario 2, and More. More is a drop-down menu that gives the options About, Permitted Use, Contact, and License.

* Added a Permitted Use tab that informs users the app has not been validated for casework or court testimony and should not be used to draw formal conclusions. The app may be used for research and testing by forensics practitioners and other.

* Created a new function `plot_writer_profiles()` that plots writer profiles on the same set of axes and labels the lines by the document name. This function is similar to `handwriter::plot_cluster_fill_rates()`, but that function labels the lines by writer ID.

* Changed the color of links to light blue in the sidebar and purple in the body.

* Fixed a bug in the demo where the document previews were not displaying correctly.

* Renamed `currentImageUI()` and `currentImageServer()` as `selectImageUI()` and `selectImageServer()` respectively. This change better accommodates the new `singleImageUI()` and `singleImageServer()` module.

* Replaced the phrase "simulate casework" with "use your own samples" in Scenario 2 for better clarity.

# handwriterApp 1.0.1

* Changed the title from "Shiny App for Handwriting Analysis in R" to "A 'shiny' Application for Handwriting Analysis"

* Placed package names in single undirected quotes, and changed directed quotation marks to undirected quotes in the description text.

* Added "\value{No return value, called to launch 'shiny' app}" to the .Rd file for for the exported method handwriterApp().

# handwriterApp 1.0.0

* Initial CRAN submission.
