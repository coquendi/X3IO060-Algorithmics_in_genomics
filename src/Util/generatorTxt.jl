function deuxTxt(tab, indice)
    txt = ""
    for i in 1:indice-1
        txt = string(txt, tab[i][2], "\n")
    end
    for i in indice+1:length(tab)
        txt = string(txt, tab[i][2], "\n")
    end
    return tab[indice][2], txt
end
