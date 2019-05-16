
#' @export
print_table <- function(x, n = 5L, width = getOption("width", 80L),
                        n_extra = 100L) {

  add_in_between <- function(x, n, what) {
    c(x[seq_len(n)], what, x[seq.int(n + 1L, 2L * n)])
  }

  add_in_shaft <- function(x, n, what = " ") {
    x[["shaft_format"]] <- add_in_between(x[["shaft_format"]], n, what)
    x
  }

  add_rowid <- function(x, id) {
    width <- max(crayon::col_nchar(id))
    id_col <- list(capital_format = rep(strrep(" ", width), 2L),
                   shaft_format = format(id))
    c(list(id_col), x)
  }

  complete_colonnade <- function(x, id, n, sep) {

    if (sep) {
      id <- add_in_between(id, n, pillar::style_subtle(ellipsis()))
      x <- lapply(x, add_in_shaft, n)
    }

    add_rowid(x, id)
  }

  hide_extra <- function(x) {
    c(x[!is.na(x)],
      paste(ellipsis(), "and", sum(is.na(x)), "additional columns"))
  }

  format_extra <- function(x) {
    fansi::strwrap_ctl(paste(x, collapse = ", "),
                       width = getOption("width", 80L), prefix = "# ")
  }

  rowid <- rownames(x)
  add_sep <- 2L * n < nrow(x)

  if (add_sep) {

    dat <- rbind(head(x, n), tail(x, n))

    if (is.null(rowid)) {
      rowid <- c(seq_len(n), seq.int(nrow(x) - n + 1L, nrow(x)))
    } else {
      rowid <- c(head(rowid, n), tail(rowid, n))
    }

  } else {

    dat <- x

    if (is.null(rowid)) {
      rowid <- seq_len(nrow(x))
    }
  }

  rowid <- big_mark(rowid)

  rowid <- pillar::style_subtle(format(rowid))

  tbl <- pillar::squeeze(
    pillar::colonnade(dat, has_row_id = FALSE,
                      width = width - max(crayon::col_nchar(rowid)) - 1L)
  )

  extra <- pillar::extra_cols(tbl, n = n_extra)
  tbl <- lapply(tbl, complete_colonnade, rowid, n, add_sep)
  desc <- pillar::style_subtle(paste0("# ", obj_desc(x)))

  if (length(extra) > 0L) {

    if (anyNA(extra)) extra <- hide_extra(extra)
    extra <- format_extra(extra)

  } else {

    extra <- NULL
  }

  res <- paste(c(desc, format(tbl), extra), collapse = "\n")

  cat(res, "\n")
}
