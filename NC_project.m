function nc=NC_project(S, W1D)
h=immse(S, W1D);
nc=1-h;
end