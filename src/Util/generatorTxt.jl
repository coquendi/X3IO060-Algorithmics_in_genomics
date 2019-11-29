# Fichier contenant la fonction pour recuperer le contenu des deux fichier à generer
# @author Corentin Pelhâtre
# @author Adrien Cassaigne
# @date 10/11/2019
# @version 1



# Fonction qui génére deux txt pour les mettre dans les fichier générés par la suite
# @param tab : Le tableau bien formé
# @param indice : L'indice du comparant
# @return ::String : Le string du comparant
# @return ::String : Le string des comparés 
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
