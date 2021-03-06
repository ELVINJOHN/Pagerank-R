library(igraph)

actors <- data.frame(name=c("Alice", "Bob", "Cecil", "David",
                            "Esmeralda"),
                     age=c(48,33,45,34,21),
                     gender=c("F","M","F","M","F"))
relations <- data.frame(from=c("Bob", "Cecil", "Cecil", "David",
                               "David", "Esmeralda"),
                        to=c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
                        same.dept=c(FALSE,FALSE,TRUE,FALSE,FALSE,TRUE),
                        friendship=c(4,5,5,2,1,1), advice=c(4,5,5,4,2,3))

g <- graph_from_data_frame(relations, directed=TRUE, vertices=actors)
print(g, e=TRUE, v=TRUE)

pr <- page_rank(g, algo = c("prpack", "arpack", "power"), vids = V(g),
                directed = TRUE, damping = 0.85, personalized = NULL, weights = NULL,
                options = NULL)
print(pr)
plot(g, axes = FALSE, add = FALSE, xlim = c(-1, 1),
     ylim = c(-1, 1))
