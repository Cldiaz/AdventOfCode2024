/* REXX

Solution for day 1 of Advent of Code 2024 using REXX language.

I decided to solve this without using only native REXX routines. 
I am used to NetView REXX and the advantages of PIPEs so this was a fun way to come up with a solution.
*/
/* left list    3 4 2 1 3 3     */
/* sorted       1 2 3 3 3 4     */

/* right list   3 5 3 9 3       */
/* sorted       3 3 3 4 5 9     */

lst.1= '3'
lst.2= '4'
lst.3= '2'
lst.4= '1'
lst.5= '3'
lst.6= '3'

lst.0 = 6

lst2.1= '4'
lst2.2= '3'
lst2.3= '5'
lst2.4= '3'
lst2.5= '9'
lst2.6= '3'

lst2.0 = 6

/*
  bubble sort logic converted into a subroutine in the code above so it can be reutilized.
  left it here so other can follow since is cleaner than subroutine for understanding 
  bubble sort algorithm
*/
/*
n = lst.0
m = n -1

do m = m for m by -1 until leaveloop
    leaveloop = 1
    do j = 1 for m 
        k = j + 1
        if lst.j <= lst.k then iterate
        temp = lst.j
        lst.j = lst.k
        lst.k = temp
        leaveloop = 0
    end
end
*/
lname = "Left List"
call bubbleSort(lst.)
call printStem lst. lname

lname = "Right List"
call bubbleSort(lst2.)
call printStem lst2. lname

/* Calculate distance between two lists */
dist = 0
do i=0 to lst.0 
    d = lst.i - lst2.i
    dist = dist + abs(d)
end

say "Distance:" dist
exit

/* Print stem subroutine 
  Just used for validation, also helped me get the
  syntax correctly for passing STEM in subroutines.
*/
printStem:
arg stem lname
say "****** Sorted " lname "********"
do i=1 to value(stem||0)
    say "item "i ":" value(stem||i) 
end
say "**********************"
return

/* Bubble sort subroutine 
 since REXX does not allow to pass STEM to subroutines, 
 resorted to using value to interpret the names.
*/
bubbleSort:
arg stem 

n = value(stem||0)
m = n -1

do m = m for m by -1 until leaveloop
    leaveloop = 1
    do j = 1 for m 
        k = j + 1
        if value(stem||j) <= value(stem||k) then iterate
        higher = value(stem||j)
        /*lst.j = lst.k*/
        lower = value(stem||k)
        call value stem||j,lower
        /*lst.k = higher*/
        call value stem||k,higher
        leaveloop = 0
    end
end

return
