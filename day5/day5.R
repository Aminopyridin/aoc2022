testStacks <- list(c("Z", "N"), c("M", "C", "D"), c("P"))
realStacks <- list(
                c("G", "F", "V", "H", "P", "S"), 
                c("G", "J", "F", "B", "V", "D", "Z", "M"),
                c("G", "M", "L", "J", "N"),
                c("N", "G", "Z", "V", "D", "W", "P"),
                c("V", "R", "C", "B"),
                c("V", "R", "S", "M", "P", "W", "L", "Z"),
                c("T", "H", "P"),
                c("Q", "R", "S", "N", "C", "H", "Z", "V"),
                c("F", "L", "G", "P", "V", "Q", "J"))

stacks <- realStacks
inp <- readLines("day5/day5.txt")


# Part 1
for (i in inp) {
    words <- strsplit(i, " ")[[1]]
    if(is.na(words[1]) || words[1] != "move") next
    move <- as.integer(words[2])
    from <- as.integer(words[4])
    to <- as.integer(words[6])


    for (j in 1:move) {
        len <- length(stacks[[from]])
        temp <- stacks[[from]][[len]]
        stacks[[to]] <- c(stacks[[to]], temp)
        if (len == 1) {
            stacks[[from]] <- c("")            
        } else {
            stacks[[from]] <- stacks[[from]][1:(len-1)]
        }
    }
}

res <- ""
for (i in stacks) {
    len <- length(i)
    res <- paste(res, i[[len]], sep="")
}

print(res)

# Part 2
stacks <- realStacks
for (i in inp) {
    words <- strsplit(i, " ")[[1]]
    if(is.na(words[1]) || words[1] != "move") next
    move <- as.integer(words[2])
    from <- as.integer(words[4])
    to <- as.integer(words[6])

    len <- length(stacks[[from]])
    stacks[[to]] <- c(stacks[[to]], stacks[[from]][(len-move+1):len])
    if ((len - move) == 0) {
        stacks[[from]] <- c("")
    } else {
        stacks[[from]] <- stacks[[from]][1:(len-move)]
    }
}

res <- ""
for (i in stacks) {
    len <- length(i)
    res <- paste(res, i[[len]], sep="")
}

print(res)
