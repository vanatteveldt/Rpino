#' Parse sentences using Alpino (via a system call)
#'
#' @param sentences a vector of sentences to parse
#' @param ALPINO_HOME Specify the location of Alpino on the system. If NULL, the environment variable ALPINO_HOME will be used
#'
#' @return a token list suitable for use in e.g. rsyntax
#' @export
parse.Alpino <- function(sentences, ALPINO_HOME=NULL) {
  if (is.null(ALPINO_HOME)) {
    ALPINO_HOME = Sys.getenv("ALPINO_HOME")
    if (ALPINO_HOME == "") stop("Please set ALPINO_HOME")
  } else {
    Sys.setenv(ALPINO_HOME=ALPINO_HOME)
  }

  bin = paste(ALPINO_HOME, "bin/Alpino", sep = "/")
  cmd = paste(bin, "end_hook=dependencies", "-parse")

  parse = system(cmd, input=sentences, intern=T)

  s = strsplit(parse, "|", fixed=T)
  tokens = as.data.frame(unique(rbind(t(sapply(s, function(x) x[c(1:7, 16)])), t(sapply(s, function(x) x[9:16])))))
  colnames(tokens) = c("lemma", "word", "start", "id", "pos", "pos_spec", "type", "sentence")

  deps = as.data.frame(t(sapply(s, function(x) x[c(4, 8, 12, 16)])))
  colnames(deps) = c("parent", "relation", "id", "sentence")
  deps$relation = gsub(".*/", "", deps$relation)
  tokens = merge(tokens, deps, all=T, by=c("sentence", "id"))
  tokens = tokens[tokens$pos != "top", ]
  rsyntax::unique_ids(tokens, context=tokens$sentence)
}
