class Generator(BaseGenerator):
    def data(self):
    
        #First set up a random exponential of the form A*b^x + K
        var('x')
        
        k = randint(1,5)
        l = [ QQ(randint(k+1,3*k)/k) , randint(1,9)/10 ]
        
        if(choice([True,False])):
            [A,b] = l
            A *= choice([-1,1])
        else:
            l.sort()
            [A,b] = l
            A *= choice([-1,1])
        
        k = randint(1,5)*choice([-1,1])
        
        #Make variations on the exponential
        funcs = [ A*b^x + k, b*abs(A)^x + k, A*(1/b)^x+k ]
        f = A*b^x + k
        
        #Shuffle the functions around
        shuffle(funcs)
        f1(x) = funcs[0]
        f2(x) = funcs[1]
        f3(x) = funcs[2]
        
        #Assign the functions labels and colors --> (f, letter, color)
        ans = ["(a)", "(b)", "(c)"]
        colors = ["blue", "orange", "grey"]
        big_shuffle = list(zip(funcs,ans,colors))
        
        #Shuffle the triples and extract the functions, letters, and colors
        shuffle(big_shuffle)
        g1(x) = big_shuffle[0][0]
        ans1 = big_shuffle[0][1]
        color1 = big_shuffle[0][2]
        g2(x) = big_shuffle[1][0]
        ans2 = big_shuffle[1][1]
        color2 = big_shuffle[1][2]
        g3(x) = big_shuffle[2][0]
        ans3 = big_shuffle[2][1]
        color3 = big_shuffle[2][2]
        
        #Decide where to the put the letters a, b, and c on the graph
        if abs(f1(4)) < 10:
            x1 = 4.1
            y1 = f1(4)
        else:
            x1 = -2.1
            y1 = f1(-2)
            
        if abs(f2(4)) < 10:
            x2 = 4.1
            y2 = f2(4)
        else:
            x2 = -2.1
            y2 = f2(-2)
            
        if abs(f3(4)) < 10:
            x3 = 4.1
            y3 = f3(4)
        else:
            x3 = -2.1
            y3 = f3(-2)
        
        
        return{
            "f": f,
            "A": A,
            "b": b,
            "k": k,
            "x1": x1,
            "x2": x2,
            "x3": x3,           
            "y1": y1,
            "y2": y2,
            "y3": y3,
            "f1": g1(x),
            "f2": g2(x),
            "f3": g3(x),
            "ans1": ans1,
            "ans2": ans2,
            "ans3": ans3,
            "color1": color1,
            "color2": color2,
            "color3": color3,
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "graphs": plot(data['f1'],(x,-2,4),ymin=-8,ymax=8,color=data['color1'])+plot(data['f2'],(x,-2,4),ymin=-8,ymax=8,color=data['color2'])+plot(data['f3'],(x,-2,4),ymin=-8,ymax=8,color=data['color3'])+text("(a)", (data['x1'],data['y1']),color=data['color1'])+text("(b)", (data['x2'],data['y2']),color=data['color2'])+text("(c)", (data['x3'],data['y3']),color=data['color3'])
            }