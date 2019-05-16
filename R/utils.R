
ellipsis <- function(fancy = l10n_info()$`UTF-8`) {
  if (fancy) {
    cli::symbol$ellipsis
  } else {
    "..."
  }
}

times <- function(fancy = l10n_info()$`UTF-8`) {
  if (fancy) {
    cli::symbol$times
  } else {
    "x"
  }
}

big_mark <- function(x, ...) {
  mark <- if (identical(getOption("OutDec"), ",")) "." else ","
  formatC(x, big.mark = mark, ...)
}

print_dim <- function(x) {
  paste0("[", big_mark(as.integer(nrow(x))), " ", times(), " ",
        big_mark(as.integer(ncol(x))), "]")
}

obj_desc <- function (x, ...) {
  UseMethod("obj_desc", x)
}

obj_desc.data.frame <- function(x, ...) {
  paste0("A data.frame ", print_dim(x), " ", memuse::mu(x))
}

obj_desc.default <- function(x, ...) {
  print_dim(x)
}
