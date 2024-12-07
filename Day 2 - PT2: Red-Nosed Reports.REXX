/* rexx */

/* Day 2 pt 2 solution. Not the fanciest solution, a lot if statements to cover different scenarios. 
Defintely could be imroved but just went with the first solution I though */

data.1 = '20 17 18 21 23 25'
data.2 = '54 54 60 61 65'
data.0 = 2

do i=1 to data.0
    len = words(data.i)
    lp = len -1

    skip1lvl = 0
    ascdesc = ''
    status = ''
    do pt = 1 for lp by 1 while pt <= lp
        leaveloop = 0
        
        w1 = word(data.i,pt)
        w2 = word(data.i,pt+1)
        w3 = word(data.i,pt+2)
        w4 = word(data.i,pt+3)
        /* first iteration we determine if ascending or descending*/
        if (ascdesc = '') then do
            rc = isItAscDesc(w1,w2,w3,w4)
            if rc = 1 then leave
        end
        /* rest of the times we just compare */
        else if (ascdesc = 'desc') then do
            if (w1 > w2) & (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
                status = 'safe'
            end
            else do
                rc = checkRemoveLvl(w1,w2,w3)
                if rc = 1 then leave
            end
        end
        else do
            if (w1 < w2) & (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
                status = 'safe'
            end
            else do
                rc = checkRemoveLvl(w1,w2,w3)
                if rc = 1 then leave
            end
        end
    end
    if status = 'safe' then
        safecount = safecount + 1
    /*else
        say 'unsafe: ' data.i */
end

say 'Safe Reports #:' safecount

exit


/* Function to determine if the order is ascending or descending*/
isItAscDesc:
w1 = arg(1)
w2 = arg(2)
w3 = arg(3)
w4 = arg(4)

/* best scenario for descending w1 > w2 > w3 */
if (w1 > w2 & w2 > w3) then do
    if (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
        ascdesc = 'desc'
        status = 'safe'
    end
    else do
        /* lets skip it */
        skip1lvl = 1
    end
end
/* best scenario for ascending w1 < w2 < w3 */
else if (w1 < w2 & w2 < w3) then do
    if (abs(w1-w2) >= 1) & (abs(w1-w2) <= 3) then do
        ascdesc = 'asc'
        status = 'safe'
    end
    else do
        /* lets skip it */
        skip1lvl = 1
    end
end
/* Edge cases when same number repeats */
else if (w1 = w2 | w2 = w3) then do
        /* ignore either w1 or w2 to determine order */
        if (w2 > w3 | w1 > w3) then do
            ascdesc = 'desc'
        end
        else if (w2 < w3 | w1 < w3) then do
            ascdesc = 'asc'
        end
        /* we must ignore one level*/
        rc = checkRemoveLvl(w1,w2,w3)
        leaveloop = rc
end
/* Esdge case when we have to look at w4 to determine asc or desc */
else do
    /* remove 1st level?  desc*/
    if (w2 > w3 & w3 > w4) then do
        ascdesc = 'desc'
    end
    /* remove 2nd level? desc*/
    else if(w1 > w3 & w3 > w4) then do
        ascdesc = 'desc'
    end
    /* remove 1st level?  asc*/
    else if (w2 > w3 & w3 > w4) then do
        ascdesc = 'asc'
    end
    /* remove 2nd level? asc*/
    else if(w1 > w3 & w3 > w4) then do
        ascdesc = 'asc'      
    end
    /* last scenario when you would have to remove more than one level*/
    else do
        ascdesc = 'notdet'
    end
    if (ascdesc = 'notdet') then do
        status = 'unsafe'
        leaveloop = 1
    end
    else do
        rc = checkRemoveLvl(w1,w2,w3)
        leaveloop = rc
    end    
end

return leaveloop

/* Function to evaluate conditions bypassing one level*/
checkRemoveLvl:
w1 = arg(1)
w2 = arg(2)
w3 = arg(3)
w4 = arg(4)

if (w3 \= '' & skip1lvl = 0) then do
    if (abs(w1-w3) >= 1) & (abs(w1-w3) <= 3) then do
        status = 'safe'
        pt = pt + 1 /* move poiner to bypass level */
        skip1lvl = 1 /* can only skip one level */
    end
    else do
        status = 'unsafe'
        leaveloop = 1
    end
end
/*we reched the end and we can ignore the last level as safe*/
else if (w3 = '' & skip1lvl = 0) then do
    status = 'safe'
    pt = pt + 1 
    skip1lvl = 1
end
/* we reaached the end but already skipped a level*/
else do
    status = 'unsafe'
    leaveloop = 1
end

return leaveloop
