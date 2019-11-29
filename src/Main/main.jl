include("../Util/includes.jl")

# Choix des proteins :
choix = [
           ("Sonic_Hedgehog",           true),
           ("Pax-6",                    false),
           ("Oxytocin_receptor",        false),
           ("myoglobin",                true),
           ("Lactase",                  false),
           ("insulin-likeGrowFactor",   true),
           ("insulin_receptor",         false),
           ("Hox-c6",                   false),
           ("Gremlin",                  false),
           ("FOXp2",                    true),
           ("Fibrinogen_Gama_Chain",    false),
           ("Fibrinogen_Beta_Chain",    true),
           ("Distal-less",              true),
           ("BMP4",                     true)
       ]

# Gestion des noms d'espece et comparaison :
Noms = [
        ("Homo sapiens" ,"Homme" , 2),
        ("Pan troglodytes" ,"Chimpanze" , 1),
        ("Macaca mulatta" ,"Macaque Rhesus" , 1),
        ("Canis lupus familiaris" ,"Loup" , 2),
        ("Bos taurus" ,"Bovins" , 2),
        ("Mus musculus" ,"Souris Grise" , 2),
        ("Rattus norvegicus" ,"Rat Brin" , 1),
        ("Gallus gallus" ,"Coq dore" , 2),
        #("Xenopus tropicalis" ,"Crapaud" , 1),
        ("Danio rerio" ,"Poisson zebre" , 1)
        ]

# Gestion des paths :
pathInput = "../../Input/"
pathOutput = "../../Output/"

# Boucle qui géneère tous les fichiers nécessaires 
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
