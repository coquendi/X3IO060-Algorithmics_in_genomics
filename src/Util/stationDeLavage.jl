# Fichier contenant tous pour bien laver le tableau d'espece afin de générer par la suite les fichiers
# @author Corentin Pelhâtre
# @author Adrien Cassaigne
# @date 10/11/2019
# @version 1



# Fonction qui renvoie un tableau de tuple bien formé pour la generation par la suite
# @param tableau : le tableau contenant tous les gloabl pour une espece
# @param nom : le tableau de noms (cf main)
# @return ::Array{Tuple{String, String}, 1} : Le tableau bien formé
function lavage(tableau::Array{Any, 1}, nom::Array{Tuple{String, String, Int64}, 1})
    tabrtn = [("autres", "")]
    for i in 1:length(nom)
        if nom[i][3] == 2
            push!(tabrtn, (nom[i][1], string("> ", nom[i][2], "\n")))
        end
    end
    for i in 1:length(tableau)
        tmp = [j for j=2:length(tabrtn)  if tabrtn[j][1] == getAccolades(tableau[i])]
        if length(tmp) > 0
            tabrtn[tmp[1]] = (tabrtn[tmp[1]][1], string(tabrtn[tmp[1]][2], getContente(tableau[i])))
        else
             tabrtn[1] = (tabrtn[1][1], string(tabrtn[1][2], "> ", getAccoladesRename(tableau[i], nom), "\n", getContente(tableau[i]), "\n"))
        end
    end
    return tabrtn
end



# Fonction qui recupere le nom (compris entre [] dans le fichier original)
# @param string : Le global pour une espece
# @return ::String : le nom
function getAccolades(string::String)
    return SubString(string, findfirst("[", string).stop+1, findfirst("]", string).stop-1)
end



# Fonction qui recupère le nom d'une espece et le modifie celon le tableau de nom
# @param string : Le global pour une espece
# @param nom : le tableau de noms (cf main)
# @return ::String : le nouveau nom associé
function getAccoladesRename(string::String, nom::Array{Tuple{String, String, Int64}, 1})
    str = getAccolades(string)
    for i in 1:length(nom)
        if (nom[i][3] == 1 && nom[i][1] == str)
            return nom[i][2]
        end
    end
    return str
end



# Fonction qui permet de recuperer la suite de caractères
# @param string : Le global pour une espece
# @return ::String : le contenu
function getContente(string::String)
    return SubString(string, findfirst("\n", string).stop+2)
end
