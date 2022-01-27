db_names <- c("lead",
              "tlc",
              "tlcmiss",
              "smoking",
              "fev1",
              "headache",
              "bpd",
              "impairment",
              "insomnia",
              "tvsfp",
              "ntp",
              "melanoma",
              "obesity", # only as .txt
              "muscatine",
              "epilepsy",
              "seizure",
              "ecg",
              "amenorrhea",
              "contracep",
              "exercise",
              "diabetes",
              "dental",
              "birthwt",
              "chd",
              "leprosy",
              "cholesterol",
              "rat",
              "respir",
              "tumor",
              "cd4",
              "toenail",
              "progesterone",
              "arthritis",
              "schizophrenia",
              "skin",
              "fat",
              "ccs")

exts <- c(".txt", '-data.txt', '.sas7bdat', '.dta')

downloader <- function(fprefix, ext){
    outdir <- if (ext %in% '.txt') 'descriptedtxt'
              else if (ext %in% '-data.txt') 'rawtxt'
              else if (ext %in% '.sas7bdat') 'sas7bdat'
              else if (ext %in% '.dta') 'dta'
    fname <- paste0(fprefix, ext)
    url <- paste0("http://content.sph.harvard.edu/fitzmaur/ala2e/",
                  fname)
    download.file(url = url, destfile = paste0(outdir, "/", fname))
}

for (f in db_names){
    for (ext in exts){
        tryCatch(
            downloader(f, ext),
            error = function(e) print(sprintf("%s%s NOT WORKING", f, ext)))
    }
}
