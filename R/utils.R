
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

str_trunc <- function(x, width) {

  if (is.infinite(width)) return(x)

  str_width <- pillar::get_extent(x)

  too_wide <- which(!is.na(x) & str_width > width)
  x[too_wide] <- paste0(
    fansi::substr_ctl(x[too_wide], 1, width - pillar::get_extent(ellipsis())),
    ellipsis()
  )

  x
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
