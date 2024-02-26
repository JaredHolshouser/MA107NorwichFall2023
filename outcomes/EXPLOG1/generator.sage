class Generator(BaseGenerator):
    def data(self):
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
        
        funcs = [ A*b^x + k, b*abs(A)^x + k, A*(1/b)^x+k ]
        f = A*b^x + k
        
        shuffle(funcs)
        f1(x) = funcs[0]
        f2(x) = funcs[1]
        f3(x) = funcs[2]
        ans = ["(a)", "(b)", "(c)"]
        
        big_shuffle = list(zip(funcs,ans))
            
        shuffle(big_shuffle)
        g1(x) = big_shuffle[0][0]
        ans1 = big_shuffle[0][1]
        g2(x) = big_shuffle[1][0]
        ans2 = big_shuffle[1][1]
        g3(x) = big_shuffle[2][0]
        ans3 = big_shuffle[2][1]
        
        
        return{
            "f": f,
            "A": A,
            "b": b,
            "k": k,
            "x1": 4.1 if abs(f1(4))<10 else -2.1,
            "x2": 4.1 if abs(f2(4))<10 else -2.1,
            "x3": 4.1 if abs(f3(4))<10 else -2.1,           
            "y1": f1(4) if abs(f1(4))<10 else f1(-2),
            "y2": f2(4) if abs(f2(4))<10 else f2(-2),
            "y3": f3(4) if abs(f3(4))<10 else f3(-2),
            "f1": g1(x),
            "f2": g2(x),
            "f3": g3(x),
            "ans1": ans1,
            "ans2": ans2,
            "ans3": ans3,
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "graphs": plot(data['f1'],(x,-2,4),ymin=-8,ymax=8,color='blue')+plot(data['f2'],(x,-2,4),ymin=-8,ymax=8,color='orange')+plot(data['f3'],(x,-2,4),ymin=-8,ymax=8,color='gray')+text("(a)", (data['x1'],data['y1']),color='blue')+text("(b)", (data['x2'],data['y2']),color='orange')+text("(c)", (data['x3'],data['y3']),color='gray')
            }