## Website Quick Start

### Updating Upcoming Meetings

The website uses [rladies/meetupr](https://github.com/rladies/meetupr) to interact with the Meetup API.

```r
# install.packages("devtools")
devtools::install_github("rladies/meetupr")
```

A Meetup API key is required to update the upcoming meetings.
To get one, login to Meetup, go to <https://secure.meetup.com/meetup_api/key/>, copy the key they present there.

Then, run `usethis::edit_r_environ()` and add following line to your `~/.Renviron` file:

```
MEETUP_KEY=<your key here>
```

Restart your R session and the **meetupr** package will work.

## Updating Previous Meetings

Add previous presentations to `past_meetups.yaml`, following the structure in the file and re-knit `index.Rmd`.

Note that updating previous meetings will also pull in any new meetings, so that section may change.

## Deploying

The website is rendered using `rmarkdown::render_site()`.
Make any changes and run this function.
To update the upcoming meetups, remove `upcoming.rds` (if it exists) first.

Commit your changes into a feature branch (include both source `*.Rmd` or `.md` files and rendered `.html` files.). 
Push to the [TampUseRs github repo](https://github.com/TampaUseRs/TampaUseRs) and submit a PR.

GitHub Pages is autmatically enabled to serve from the master branch to <https://tampausers.github.io>


## Required Packages

- tidyverse (dplyr, tidyr, purrr)
- htmltools
- rmarkdown
- rladies/meetupr
- yaml
- pacman (used but not necessarily required)