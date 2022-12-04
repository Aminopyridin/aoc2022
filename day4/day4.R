inp <- scan("day4/day4.txt", list(first="", second=""), sep=",");

# Part 1
includedCount <- 0
for (i in 1:length(inp$first)) {
    splittedFirst <- strsplit(inp$first[[i]], "-")
    splittedSecond <- strsplit(inp$second[[i]], "-")
    first <- c(splittedFirst[[1]][1]:splittedFirst[[1]][2])
    second <- c(splittedSecond[[1]][1]:splittedSecond[[1]][2])
    inter <- intersect(first, second)
    if (length(inter) == length(first) || length(inter) == length(second)) {
        includedCount <- includedCount + 1
    }
}
print(includedCount)

# Part 2

includedCount <- 0
for (i in 1:length(inp$first)) {
    splittedFirst <- strsplit(inp$first[[i]], "-")
    splittedSecond <- strsplit(inp$second[[i]], "-")
    first <- c(splittedFirst[[1]][1]:splittedFirst[[1]][2])
    second <- c(splittedSecond[[1]][1]:splittedSecond[[1]][2])
    inter <- intersect(first, second)
    if (length(inter) > 0) {
        includedCount <- includedCount + 1
    }
}
print(includedCount)
