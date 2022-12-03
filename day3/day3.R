inp <- readLines("day3/day3.txt")

aCode <- strtoi(charToRaw('a'), 16L)
ACode <- strtoi(charToRaw('A'), 16L)

# Part 1
sum <- 0
for (i in inp) {
    chars <- strsplit(i, "")[[1]]
    half <- length(chars)/2
    firstPart <- chars[0:half]
    secondPart <- chars[(half+1):length(chars)]
    inter <- intersect(firstPart, secondPart)

    charCode <- strtoi(charToRaw(inter),16L)
    if (tolower(inter) != inter) {
        sum <- sum + (charCode - ACode + 27)
    } else {
        sum <- sum + (charCode - aCode + 1)
    }
}
print(sum)

# Part 2
sum2 <- 0
for (i in 1:(length(inp)/3)) {
    idx <- (i-1) * 3
    firstElf <- strsplit(inp[idx + 1], "")[[1]]
    secondElf <- strsplit(inp[idx + 2], "")[[1]]
    thirdElf <- strsplit(inp[idx + 3], "")[[1]]
    inter <- intersect(intersect(firstElf, secondElf), thirdElf)

    charCode <- strtoi(charToRaw(inter[1]),16L)
    if (tolower(inter) != inter) {
        sum2 <- sum2 + (charCode - ACode + 27)
    } else {
        sum2 <- sum2 + (charCode - aCode + 1)
    }
}
print(sum2)