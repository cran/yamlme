## ----eval = FALSE-------------------------------------------------------------
#  library(devtools)
#  install_github("kamapu/yamlme", build_vignettes = TRUE)

## -----------------------------------------------------------------------------
library(yamlme)

## -----------------------------------------------------------------------------
my_document <- write_rmd(title = "My first document")
my_document

## -----------------------------------------------------------------------------
my_document <- write_rmd(description = c("|",
				"This text starts with a vertical line",
				"and will be thus used as a description",
				"in the head."))
my_document

## -----------------------------------------------------------------------------
the_title <- "Introduction to this package"
my_document <- write_rmd(
		title = the_title,
		vignette = c(">",
				paste0("%\\VignetteIndexEntry{", the_title, "}"),
				"%\\VignetteEngine{knitr::rmarkdown}",
				"%\\VignetteEncoding{UTF-8}"))
my_document

## -----------------------------------------------------------------------------
my_document <- write_rmd(author=c("- name: Miguel Alvarez",
				"url: https://kamapu.github.io/",
				"- name: Bisrat H. Gebrekhidan"))
my_document

## -----------------------------------------------------------------------------
my_document <- write_rmd(output=list(pdf_document="default"))
my_document

## -----------------------------------------------------------------------------
my_document <- write_rmd(title = "Mi First Document", author = "My Name",
		output = "html_document", append = "# This is a comment in head",
		body = txt_body(
				"# Starting a working day",
				"",
				"At the beginning of every day I will do:",
				"",
				"- Say everyone \"Good morning!\"",
				"- Start the coffe mashine",
				"- Start the computer",
				"- Read mails"))
my_document

## ----eval = FALSE-------------------------------------------------------------
#  render_rmd(input = my_document, output_file = "my_document")

## -----------------------------------------------------------------------------
my_template <- write_rmd(
		title = "Example HTML document",
		author = "My Self",
		output = "html_document",
		body = txt_body(
				"# Introduction",
				"",
				"This is just an example."))
my_template

## -----------------------------------------------------------------------------
my_template <- update(my_template, 
		title = "Example PDF document",
		output = "pdf_document",
		append = "# this is a modified version")
my_template

