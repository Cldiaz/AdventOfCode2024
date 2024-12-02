/* REXX */
/*
  Day 2 solution.
  Going trhough each line of the report and use abs function to determine
  the distance.
*/

data.1 = "7 6 4 2 1"
data.2 = "1 2 7 8 9"
data.3 = "9 7 6 2 1"
data.4 = "1 3 2 4 5"
data.5 = "8 6 4 4 1"
data.5 = "1 3 6 7 9"

safecount = 0
data.0 = 6

do i=1 to data.0
    len = words(data.i)
    lp = len -1

    ascdesc = ''
    status = ''
    do pt = 1 for lp by 1 until leaveloop
        leaveloop = 0
        w1 = word(data.i,pt)
        w2 = word(data.i,pt+1)
        /* first iteration */
        if (ascdesc = '') then do
            if (w1 > w2) & (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
                ascdesc = 'desc'
                status = 'safe'
            end
            else if (w1 < w2) & (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
                ascdesc = 'asc'
                status = 'safe'
            end
            else do 
                status = 'unsafe'
                leaveloop = 1
            end
        end
        else if (ascdesc = 'desc') then do
            if (w1 > w2) & (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
                status = 'safe'
            end
            else do
                status = 'unsafe'
                leaveloop = 1
            end
        end
        else do
            if (w1 < w2) & (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
                status = 'safe'
            end
            else do
                status = 'unsafe'
                leaveloop = 1
            end
        end
    end
    if status = 'safe' then
        safecount = safecount + 1
    else
        say data.i 
end

say 'Safe Reports #:' safecount

exit
