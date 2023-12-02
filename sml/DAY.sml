val lines = String.tokens (Char.contains "\n\r")
val unlines = String.concatWith "\n"

fun readLines filename =
    let val ins = TextIO.openIn filename
    in  lines (TextIO.inputAll ins)
        before TextIO.closeIn ins
    end

infix |>
fun x |> f = f x

fun sum xs = foldl (op+) 0 xs
fun maximum xs = foldl Int.max (hd xs) xs
fun whoops() = raise Fail "Should not happen"


fun input() = readLines "input.txt"

val test = [
]

fun parse line = whoops()

fun report part fmt ans =
    ( print part; print ": "
    ; fmt ans |> print
    ; print "\n")

fun part1 input = input |> map parse
val answer1 = input() |> part1 |> report "Part 1" Int.toString

fun part2 input = input |> map parse
val answer2 = input() |> part2 |> report "Part 2" Int.toString
