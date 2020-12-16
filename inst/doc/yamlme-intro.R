## ----eval = FALSE-------------------------------------------------------------
#  library(devtools)
#  install_github("kamapu/yamlme", build_vignettes = TRUE)

## -----------------------------------------------------------------------------
library(yamlme)

## -----------------------------------------------------------------------------
cat(write_rmd(title = "My first document"))

## -----------------------------------------------------------------------------
cat(write_rmd(description = c("|",
						"This text starts with a vertical line",
						"and will be thus used as a description",
						"in the head.")))

## -----------------------------------------------------------------------------
the_title <- "Introduction to this package"
cat(write_rmd(
				title = the_title,
				vignette = c(">",
						paste0("%\\VignetteIndexEntry{", the_title, "}"),
						"%\\VignetteEngine{knitr::rmarkdown}",
						"%\\VignetteEncoding{UTF-8}")))

## -----------------------------------------------------------------------------
cat(write_rmd(author=c("- name: Miguel Alvarez",
						"url: https://kamapu.github.io/",
						"- name: Bisrat H. Gebrekhidan")))

## -----------------------------------------------------------------------------
cat(write_rmd(output=list(pdf_document="default")))

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
cat(my_document)

## ----eval = FALSE-------------------------------------------------------------
#  render_rmd(input = my_document, output_file = "my_document")

## -----------------------------------------------------------------------------
my_template <- function(
		title = "My Awesome Document",
		author = "My Self",
		output = "html_document",
		body = txt_body(
				"# Introduction",
				"",
				"This is just an example."),
		...) {
	write_rmd(
			title = title,
			author = author,
			output = output,
			body = body,
			...)
}

## -----------------------------------------------------------------------------
cat(my_template())

## -----------------------------------------------------------------------------
cat(my_template(
				output = "pdf_document",
				append = "# this is a modified version"
))

## ----eval = FALSE-------------------------------------------------------------
#  # Modify only the title of the template and render
#  render_rmd(my_template(title = "Example HTML document"))
#  
#  # Modify title and output format before rendering
#  render_rmd(my_template(title = "Example PDF document", output = "pdf_document"))

