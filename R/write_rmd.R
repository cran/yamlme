#' @name write_rmd
#' 
#' @title Writing R-Markdown Documents
#' 
#' @description 
#' This function generates YAML headers and R-Markdown documents by including
#' the settings as arguments of the function.
#' Comments and pieces of header can be also added through the argument
#' `append`.
#' 
#' @param ... Named arguments to be inserted in the YAML header. These arguments
#'     may be inserted either as vectors or lists.
#' @param append A piece of code to be appended in the header. For instance, it
#'     can contain commented code.
#' @param body The content of the document that will be inserted after the
#'     header.
#' @param filename A character value with the name of the file to be written
#'     (usually a *.Rmd file). If missing, no file will be written by this
#'     function.
#' 
#' @return 
#' A character vector of class `rmd_doc` and, if argument set for parameter
#' `filename`, an Rmd file.
#' 
#' @examples 
#' \dontrun{
#' my_document <- write_rmd(
#' 		title = "Sample Document", author = "Miguel Alavarez",
#' 		output = "html_document",
#' 		body = txt_body(
#' 				"# Intro",
#' 				"",
#' 				"This is just an example."))
#' my_document
#' }
#' 
#' @export write_rmd
#' 
write_rmd <- function(..., append, body = "", filename) {
	OUT <- list()
	OUT$header <- list(...)
	# Append
	if(!missing(append))
		OUT$append <- txt_body(append) else OUT$append <- NULL
	OUT$body <- body
	# Write output file
	if(!missing(filename)) {
		con <- file(filename, "wb")
		writeBin(charToRaw(paste0(c("---\n", write_yaml(OUT$header), OUT$append,
										"\n---\n\n", OUT$body, "\n"),
								collapse="")),
				con)
		close(con)
	}
	# Return strings
	class(OUT) <- c("rmd_doc", "list")
	invisible(OUT)
}

#' @keywords internal
#' 
setOldClass("rmd_doc")
