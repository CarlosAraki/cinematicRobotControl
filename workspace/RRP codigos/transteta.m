function  [newteta] = transteta(oldteta)
    if(oldteta<(2*pi))
        newteta = oldteta;
    else
        newteta = mod(oldteta,(2*pi));
    end
end