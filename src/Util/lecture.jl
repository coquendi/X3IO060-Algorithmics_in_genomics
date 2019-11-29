# Fichier contenant toutes les fonctions permettant de lire sur le disque 
# @author Corentin Pelhâtre
# @date 10/11/2019
# @version 1



# Fonction qui permet les fichiers de proteins
# @param path l'adresse du fichier à etudier
# @return le tableau de strings associé à chaque espece
function lectureProt(path::String)
    # Ouverture du flux
    f = open(path)

    # Recuperation du nom exacte de la protein :
    prot = readline(f)

    #
    tab = []
    for line in eachline(f)
        if (string(SubString(line, 1, 1)) == string(">"))
            push!(tab, line)
        else
            tab[length(tab)] = string(tab[length(tab)], "\n", line)
        end
    end

    return prot, tab
end



# Fonction qui permet de verifier la presence d'un dossier
# @param path : l'adresse du dossier
# @param dossier : Le nom du dossier
# @param std : L'adresse de sortie des std out/err
# @return ::Bool : True si le dossier existe dejà false sinon
function verifDossier(path::String, dossier::String, std::String)
    # Ls du path :
    run(pipeline(`ls $path`, stdout=pipeline(`sort`, string(std, "stdout"))))

    # Lecture du fichier stdout :
    flux=open(string(std, "stdout"))
    stdout = readlines(flux)
    close(flux)

    # verification de la sortie :
    return length(findall(x -> (x == dossier), stdout)) > 0
end
