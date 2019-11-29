# Fichier contenant tous les includes pour le main 2
# @author Corentin Pelhâtre
# @author Adrien Cassaigne
# @date 10/11/2019
# @version 1



# Fonction qui trouve le min du tableau en excluant les 0
# @param tab : le tableau dont on cherche le min
# @return ::Int : Le min
function mintab(tab::Array{Int,2})
    min = 100000
    for i in tab
        if i < min && i!=0
            min=i
        end
    end
    return min
end



# Fonction qui normalise un tableau
# @param tab : le tableau a normalisé
# @return ::Array{Float64, 2} : le tableau normalisé (interval [0;1])
function normetab(tab::Array{Int,2})
    min = mintab(tab)
    tab = map(x -> (x-min)/(maximum(tab)-min),tab)
    return tab
end



# Fonction qui calcule le tableau moyen
# @param tab1 : Le tabeau 1 (normalisé)
# @param tab2 : Le tabeau 2 (normalisé)
# @param tab3 : Le tabeau 3 (normalisé)
# @param tab4 : Le tabeau 4 (normalisé)
# @param tab5 : Le tabeau 5 (normalisé)
# @param tab6 : Le tabeau 6 (normalisé)
# @return ::Array{Float64, 2} : le tableau moyen des 6 précedents
function meanTab(tab1::Array{Float64,2},tab2::Array{Float64,2},tab3::Array{Float64,2},tab4::Array{Float64,2},tab5::Array{Float64,2},tab6::Array{Float64,2})
    tab =Array{Float64,2}(undef,5,9)
    for j in 1:9
        for i in 1:5
            tab[i,j]=1/6*(tab1[i,j]+tab2[i,j]+tab3[i,j]+tab4[i,j]+tab5[i,j]+tab6[i,j])
            if tab[i,j] < 0
                tab[i,j]=0
            end
        end
    end
    return tab
end



# Fonction qui permet de complété le tableau final
# @param tab : le tableau avant completage
# @return ::Array{Float64, 2} : le tableau complété
function completeTab(tab::Array{Float64,2})
    tab = transpose(tab)
    fintab = [tab[2,1] tab[3,1] tab[4,1] tab[5,1];
             0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             tab[2,3] tab[3,3] tab[4,3] tab[5,3];
             tab[2,4] tab[3,4] tab[4,4] tab[5,4];
             tab[2,5] tab[3,5] tab[4,5] tab[5,5];
             tab[2,2] tab[3,2] tab[4,2] tab[5,2]]
    fintab = hcat(tab,fintab)
    dist = [fintab[1,:],fintab[9,:],fintab[6,:],fintab[7,:],fintab[8,:],fintab[2,:],fintab[3,:],fintab[4,:],fintab[5,:]]
    return dist
end
