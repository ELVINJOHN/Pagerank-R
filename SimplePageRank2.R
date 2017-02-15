library(igraph)
pages<-read.csv("page.csv")
names <-data.frame(pages)
g <- graph_from_data_frame(names, directed=TRUE)

plot(g, axes = FALSE, add = FALSE, xlim = c(-1, 1),
     ylim = c(-1, 1))

pr <- page_rank(g, algo = c("prpack", "arpack", "power"), vids = V(g),
                directed = TRUE, damping = 0.85, personalized = NULL, weights = NULL,
                options = NULL)

maxpr <- which.max(pr$vector)

print(maxpr)

plot(g, axes = FALSE, add = FALSE, xlim = c(-1, 1),
     ylim = c(-1, 1),mark.groups = maxpr)
