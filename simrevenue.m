function y=simrevenue(x,y,r)
if min(x,y)>r
    y=min(x,y);
elseif max(x,y)>r
    y=r;
elseif max(x,y)<r
    y=0;
end
end
         
     