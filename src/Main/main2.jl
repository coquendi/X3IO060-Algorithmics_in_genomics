# Fichier contenant tous pour la création de l'arbre final
# @author Corentin Pelhâtre
# @author Adrien Cassaigne
# @date 10/11/2019
# @version 1


include("../Util/includes2.jl")
using LinearAlgebra

# Tableaux des protéines :
BMP4 = [0 833 832 830 581 831 835 833 699;
        681 697 697 697 581 697 691 680 0;
        831 844 843 819 580 0 830 819 897;
        835 828 828 819 581 830 0 822 699;
        833 822 820 847 579 819 822 0 698]
Distal = [0 509 509 509 404 509 511 509 441;
          442 444 444 444 405 444 444 444 0;
          509 515 515 510 407 0 513 510 443;
          511 513 513 511 416 513 0 511 444;
          509 510 510 514 408 510 511 0 444]
Fibro = [0 846 845 771 551 847 840 792 664;
         674 668 667 634 551 669 670 645 0;
         859 1024 981 809 557 0 868 838 869;
         867 880 873 872 556 882 0 803 678;
         823 856 856 875 549 862 816 0 662]
Insuline = [0 2785 2790 2643 1796 2795 2793 2648 2394;
            2369 2381 2366 2357 1875 2359 2360 2347 0;
            2795 2837 2833 2660 1801 0 2797 2663 2402;
            2793 2787 2802 2657 1796 2797 0 2660 2407;
            2655 2648 2643 2826 1786 2627 2634 0 22383]
Myoglo = [0 266 264 245 103 265 258 243 226;
          226 241 238 237 132 242 246 241 0;
          265 307 287 263 115 0 270 261 242;
          258 268 271 260 115 270 0 262 246;
          243 259 262 293 121 261 262 0 241]
Sonic = [0 605 606 642 468 605 638 648 578;
         538 659 660 678 572 662 676 683 0;
         611 931 902 773 557 0 775 779 696;
         624 739 763 763 557 743 0 769 695;
         600 723 720 860 571 721 743 0 694]

# Tableaux normalisés :
SonicN=normetab(Sonic)
MyogloN=normetab(Myoglo)
InsulineN=normetab(Insuline)
DistalN=normetab(Distal)
BMP4N=normetab(BMP4)
FibroN=normetab(Fibro)

# Récupération du tableau moyen :
score=meanTab(SonicN,MyogloN,InsulineN,DistalN,BMP4N,FibroN)

# Complétion du tableau moyen pour avoir une matrice de distance bien formée :
MatDist=completeTab(score)

# On symétrise la matrix puisque pour l'instant elle est en fonction de la taille de la sequence
MatDistGood = magieDeLaSymetrie(MatDist)

for i in 1:length(MatDistGood)
    txt = ""
    for j in 1:length(MatDistGood)
        txt *= string(round(MatDistGood[i][j], digits=3)) * " & "
    end
    println(SubString(txt, 1, length(txt)-2), "\\\\")
    println("\\hline")
end


quatrePts(MatDistGood)
