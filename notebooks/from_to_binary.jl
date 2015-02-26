function from_binary(x) ##Esta función convierte una cadena de 0 y 1 a un entero
    
    l=length(x)
    num=0
    
    for(i = 1:l)
        
        if(x[i]=='1')
            num=num+2^(l-i)
        end
    end
    
    num
    
end

## Esta función toma un entero y regresa su representación binaria en una cadena

function to_binary(x)
    
    str=""
    i=0
    
    while(x>0)
    
        if(mod(x,2)==0)
            str=str*"0"
        end
        
        if(mod(x,2)==1)
            str=str*"1"
        end
        
        x=int(x/2-rem(x,2))
        
        i=i+1
        
        if(i==100)
            break
        end
        
    end
    
    reverse(str)
end

##Esta función toma una cadena que contiene un número binario con punto decimal y regresa un real

function from_binary2(x)
    
    l=length(x)
    dot=0
    num=0
    
    for(i = 1:l)
        x[i]=='.'? dot=i : dot=dot  #Localizo el punto decimal
    end
    
    for(i = 1:dot-1)
        x[i]=='1' ? num = num + 2^(dot-i-1) : num=num
    end

    for(i = dot+1:l)
        x[i]=='1' ? num = num + 2.0^(dot-i) : num=num
    end    
    
    
    num
end

##Esta función toma un real y regresa una cadena con su representación binaria, incluyendo punto decimal

function to_binary2(x)
    
    a=""
    b=""
    j=0
    i=0
    
    for(i=1:99)
        if(x*(10^i)==int(x*(10^i)))
            j=i
            break
        end
    end
    
    y=(x*(10.0^j)-int(x-0.5)*10.0^j)/(10^j) # y guarda el valor de solo la parte a la derecha del punto
    
    a=to_binary(int(x-0.5)) #primero calculo la parte que corresponde a antes del punto decimal, utilizo mi funcion anterior
    
    i=1
    
    while(y>0)     
           
        if(y-2.0^-i>=0)
            y = y-2.0^-i
            b = b*"1"
        else
            b=b*"0"
        end
        
        i=i+1
        if(i==1000)
            break
        end
    end

    println(a*"."*b)
           
end
