## ----eval = FALSE-------------------------------------------------------------
#  library(devtools)
#  install_github("kamapu/yamlme", build_vignettes = TRUE)

## -----------------------------------------------------------------------------
library(yamlme)

## -----------------------------------------------------------------------------
my_document <- list(title = "My first document")
as(my_document, "rmd_doc")

## -----------------------------------------------------------------------------
my_document <- list(description = paste0(c(
            "This text starts with a vertical line",
			"and will be thus used as a description",
			"in the head."), collapse = "\n"))
as(my_document, "rmd_doc")

## -----------------------------------------------------------------------------
my_document <- list("header-includes" = c(
        "\\usepackage{titling}",
        "\\pretitle{\\begin{flushleft}\\LARGE\\textbf}",
        "\\posttitle{\\end{flushleft}}",
        "\\sffamily"))
as(my_document, "rmd_doc")

## -----------------------------------------------------------------------------
my_document <- list(output = list(pdf_document = "default"))
as(my_document, "rmd_doc")

## -----------------------------------------------------------------------------
my_document <- list(
    author = list(
        list(
            name = "Miguel Alvarez",
            url = "https://kamapu.github.io/"),
        list(
            name = "Bisrat H. Gebrekhidan")))
as(my_document, "rmd_doc")

## -----------------------------------------------------------------------------
my_document <- list(
    title = "Mi First Document",
    author = "My Name",
    output = "html_document",
    body = txt_body(
        "# Starting a working day",
		"",
		"At the beginning of every day I will do:",
		"",
		"- Say everyone \"Good morning!\"",
		"- Start the coffe mashine",
		"- Start the computer",
		"- Read mails"))
my_document <- as(my_document, "rmd_doc")

## ----eval = FALSE-------------------------------------------------------------
#  render_rmd(input = my_document)
#  browseURL("my_document.html")

## -----------------------------------------------------------------------------
my_template <- list(
    title = "Example HTML document",
	author = "My Self",
	output = "html_document",
	body = txt_body(
      "# Introduction",
      "",
      "This is just an example."))
my_template <- as(my_template, "rmd_doc")
my_template

## -----------------------------------------------------------------------------
my_template <- update(my_template, 
		title = "Example PDF document",
		output = "pdf_document")
my_template

