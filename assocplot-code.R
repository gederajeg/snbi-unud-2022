# install the vcd package to run this code
# to install vcd, uncomment (i.e., delete the hashtag `#` in the front of) the following line
# install.packages("vcd")

# load the vcd package
library(vcd)

# read the PANAS concordance data
panas <- read.table(file = "panas_raw.txt", header = TRUE, sep = "\t", quote = "", comment.char = "", stringsAsFactors = FALSE)

# filter out the root word 'panas', analysing only the derived forms
panas_derived <- subset(panas, node != "panas")

# create a crosstabulation between the word forms and their meanings
panas_tbl <- table(panas_derived$use, panas_derived$node)

# preview the crosstabulation table
panas_tbl

# generate the association plot with the assoc() function in vcd and save as a .png file
png(filename = "assocplot.png", width = 6, height = 5, unit = "in", res = 300) # prepare the file & settings to save the plot
labels_args <- list(rot_labels = c(top = 45, left = 0), varnames = c(FALSE, FALSE)) # few settings for the label
assoc(panas_tbl, shade = TRUE, labeling_args = labels_args) # plotting
dev.off() # close the graphic device

