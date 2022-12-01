inp <- readLines("day1.txt")
elves <- c(0)
last_index <- 0
for (i in inp) {
    if(i != "") { 
        elves[last_index] <- elves[last_index] + as.integer(i)
    } else {
        last_index <- last_index + 1
        elves[last_index] <- 0 
    }
}

print(max(elves))

len <-length(elves)
top3 <- sort(elves)[(len-2):len]
print(sum(top3))
