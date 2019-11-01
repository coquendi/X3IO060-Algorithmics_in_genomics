include("../Util/includes.jl")

# Choix des proteins :
choix = [
           ("Sonic_Hedgehog",           true),
           ("Pax-6",                    true),
           ("Oxytocin_receptor",        true),
           ("myoglobin",                true),
           ("Lactase",                  true),
           ("insulin-likeGrowFactor",   true),
           ("insulin_receptor",         true),
           ("Hox-c6",                   true),
           ("Gremlin",                  true),
           ("FOXp2",                    true),
           ("Fibrinogen_Gama_Chain",    true),
           ("Fibrinogen_Beta_Chain",    true),
           ("Distal-less",              true),
           ("BMP4",                     true)
       ]

# Gestion des noms d'espece et comparaison :
Noms = [
        ("Homo sapiens" ,"Homme" , 2),
        ("Pan troglodytes" ,"yu" , 2),
        ("Macaca mulatta" ,"gyuh" , 2),
        ("Canis lupus familiaris" ,"Loup" , 2),
        ("Bos taurus" ,"Taureau" , 2),
        ("Mus musculus" ,"sdf" , 1),
        ("Rattus norvegicus" ,"Rat" , 1),
        ("Gallus gallus" ,"sdfs" , 1),
        ("Xenopus tropicalis" ,"sfdq" , 1),
        ("Danio rerio" ,"eff" , 1)
        ]

# Gestion des paths :
pathInput = "../../Input/"
pathOutput = "../../Output/"

for i in 1:length(choix)
    if choix[i][2]
        # Recuperation/lecture du fichier de la prot
        pathTMP = string(pathInput, choix[i][1], ".txt")
        prot, tab = lectureProt(pathTMP)

        # Lavage du fichier et generation des élément a comparés
        tab = lavage(tab, Noms)

        for ii in 2:length(tab)
            # Generation des deux txt pour la sortie
            comparer, comparant = deuxTxt(tab, ii)

            # Ecriture dans la sortie
            ecriture(comparer, string(pathDossier(string(pathOutput, prot, "/"), pathOutput),tab[ii][1], "1.txt"))
            ecriture(comparant, string(pathDossier(string(pathOutput, prot, "/"), pathOutput),tab[ii][1], "2.txt"))
        end
    end
end
