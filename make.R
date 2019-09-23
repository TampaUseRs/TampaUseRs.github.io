owd <- setwd(tempdir())

logger <- function(...) cat(
  strftime(Sys.time(), "\n[%F %T] ", tz = "America/New_York"), 
  ..., 
  sep = ""
)

# Start clean
logger("Cloning TampaUseRs/TampaUseRs.github.io into ", getwd(), "/tampausers-web-auto")
unlink("tampausers-web-auto", recursive = TRUE)
git2r::clone("https://github.com/TampaUseRs/TampaUseRs.github.io.git", "tampausers-web-auto", credentials = git2r::cred_token())
setwd("tampausers-web-auto")

# Rebuild website
logger("Rebuilding website...")
rmarkdown::render_site(encoding = "UTF-8")
logger("Rebuilding website done")

# Check if website changed
if ("index.html" %in% unlist(git2r::status()$unstaged)) {
  logger(length(unlist(git2r::status()$unstaged)), " files changed")
  git2r::add(path = c("index.html", "site_libs", "upcoming.rds"))
  rs_commit <- git2r::commit(message = strftime(Sys.time(), "Update %F %T", tz = "America/New_York"))
  logger("Committed files: ", rs_commit$sha)
  logger("Pushing updates...")
  git2r::push(credentials = git2r::cred_token())
} else {
  logger("No changes")
}

logger("Update complete")
setwd(owd)
