% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alpinor.r
\name{parse.Alpino}
\alias{parse.Alpino}
\title{Parse sentences using Alpino (via a system call)}
\usage{
parse.Alpino(sentences, ALPINO_HOME = NULL)
}
\arguments{
\item{sentences}{a vector of sentences to parse}

\item{ALPINO_HOME}{Specify the location of Alpino on the system. If NULL, the environment variable ALPINO_HOME will be used}
}
\value{
a token list suitable for use in e.g. rsyntax
}
\description{
Parse sentences using Alpino (via a system call)
}

