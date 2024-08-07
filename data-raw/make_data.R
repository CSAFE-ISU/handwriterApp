templateKeight <- readRDS(file.path("data-raw", "templateKeight.rds"))
templateKeight$template_graphs <- NULL
usethis::use_data(templateKeight, overwrite = TRUE)

templateKforty <- readRDS(file.path("data-raw", "templateKforty.rds"))
templateKforty$template_graphs <- NULL
templateKforty$wcd <- templateKforty$wcd[templateKforty$iters,]
usethis::use_data(templateKforty, overwrite = TRUE)
