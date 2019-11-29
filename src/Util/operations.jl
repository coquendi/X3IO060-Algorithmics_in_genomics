# Fichier contenant tous les includes pour le main 2
# @author Corentin Pelhâtre
# @author Adrien Cassaigne
# @date 10/11/2019
# @version 1



# Fonction qui trouve le min du tableau en excluant 
function mintab(tab::Array{Int,2})
    min = 100000
    for i in tab
        if i < min && i!=0
            min=i
        end
    end
    return min
end

function normetab(tab::Array{Int,2})
    min = mintab(tab)
    tab = map(x -> (x-min)/(maximum(tab)-min),tab)
    return tab
end

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
    return transpose(tab)
end

function completeTab(tab::Array{Float64,2})
    fintab = [0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0]
    return fintab
end

function quatrePts(tab::Array{Float64,2})
    for a in 1:9
        for b in a:9
            for c in b:9
                for d in c:9

                end
            end
        end
    end

end
