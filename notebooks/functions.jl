function bin_explorer(p,emin, emax)
     
    count=0
    num="."
    set = ASCIIString[]
    
    for i = 1:2.0^p #Primero genero el conjunto de números que necesito, de acuerdo a e minimo
         
        num =  to_binary(i-1)
        
        for j = length(num):p-1
            num="0"*num
        end
        
        if emin==0
            
            num="1."*num
        
        end
        
        
        if emin==-1
            
            num=".1"*num
        
        end
                
        if emin < -1
            
            num="1"*num
            
            for j = emin:-1
                
                num = "0"*num
            end
            
            num = "."*num
                
        end
                
        push!(set,num)
        
        println(set[i])

        count=count+1
    end
    
    #Esta parte ahora va moviendo el punto decimal a la derecha hasta llegar al numero que corresponde a emax

        
    for j = emin:emax-1
        
        dot=search(set[1],'.')
        
        println("-------------------")
        println("2^($(j+1))")
        println("-------------------")
        
        
        for i = 1:2.0^p
               
            set[i] = replace(set[i],set[i][dot:dot+1], reverse(set[i][dot:dot+1]))
            println(from_binary2(set[i]))
        
        end
        

    end


end

