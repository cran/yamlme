% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update.R
\name{update}
\alias{update}
\alias{update.rmd_doc}
\title{Update an rmd_doc}
\usage{
\method{update}{rmd_doc}(object, ..., append, body)
}
\arguments{
\item{object}{An object of class \code{rmd_doc}.}

\item{...}{Named arguments to be inserted in the YAML header (passed to
\code{\link[=write_rmd]{write_rmd()}}).}

\item{append}{A piece of code to be appended in the header (passed to
\code{\link[=write_rmd]{write_rmd()}}).}

\item{body}{The content of the document that will be inserted after the
header (passed to
\code{\link[=write_rmd]{write_rmd()}}).}
}
\description{
Alternative to modify settings and content in \code{rmd_doc} objects. Note that to
skip some elements of the YAML header, you can set the argument NULL to the
respective parameter.
}
\examples{
\dontrun{
my_document <- write_rmd(
		title = "Sample Document", author = "Miguel Alavarez",
		output = "html_document",
		body = txt_body(
				"# Intro",
				"",
				"This is just an example."))
my_document

## Change output format
my_document_v2 <- update(my_document, output = "pdf_document")
my_document_v2
}
 

}
