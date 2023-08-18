class Generator(BaseGenerator):
    def data(self):
        #Choose some transformations
        #possible vertical reflection
        a = (-1)^randrange(0,2)
        #possible vertical stretching or shrinking
        #base factor
        b_0 = randrange(1,4)
        #stretch or shrink
        coin = randrange(0,2)
        if coin == 0:
            b = b_0
        else:
            b = Rational(1,b_0)
        #possible horizontal shift
        c = randrange(-5,6)
        #possible vertical shift
        d = randrange(-5,6)
        
        #Failsafe to make sure there its not the trivial transformation
        if a == 1 and b == 1 and c == 0 and d == 0:
            c = randrange(1,6)
            d = randrange(-5,0)
            
        #Create phrases for the transformations
        #Reflection
        if a == -1:
            reflection_phrase = "the graph has been reflected across the x-axis"
        else:
            reflection_phrase = "the graph has not been reflected across the x-axis"
        #scaling
        if b == 1:
            scale_phrase = "the graph has not been vertically scaled"
        else:
            scale_phrase = "the graph has been vertically scaled by a factor of " + str(b)
        #horizontal shift
        if c == 0:
            hshift_phrase = "the graph has not been shifted horizontally"
        else:
            lr = ["left","right"]
            hdir = lr[ceil(sign(c)/2)]
            hshift_phrase = "the graph has been shifted " + hdir + " by " + str(abs(c))
        #vertical shift
        if d == 0:
            vshift_phrase = "the graph has not been shifted vertically"
        else:
            ud = ["down","up"]
            vdir = ud[ceil(sign(d)/2)]
            vshift_phrase = "the graph has been shifted "+ vdir + " by " + str(abs(d))
        
        #Choose a parent function: 0 = x^2, 1 = sqrt(x), 2 = x^3, 3 = |x|, 4 = 1/x
        spinner = randrange(0,5)
        if spinner == 0:
            f(x) = x^2
            key_points = [(-1,1),(0,0),(1,1)]
            interval = (-10,10)
            new_points = [(-1 + c,a*b + d),(c,d),(1+c,a*b+d)]
            new_interval = interval
        elif spinner == 1:
            f(x) = sqrt(x)
            key_points = [(0,0),(1,1)]
            interval = (0,10)
            new_points = [(c,d),(1+c,a*b+d)]
            new_interval = (c,10)
        elif spinner == 2:
            f(x) = x^3
            key_points = [(-1,-1),(0,0),(1,1)]
            interval = (-10,10)
            new_points = [(-1 + c,a*b*-1 + d),(c,d),(1+c,a*b+d)]
            new_interval = interval
        elif spinner == 3:
            f(x) = abs(x)
            key_points = [(-1,1),(0,0),(1,1)]
            interval = (-10,10)
            new_points = [(-1 + c,a*b + d),(c,d),(1+c,a*b+d)]
            new_interval = interval
        else:
            f(x) = 1/x
            key_points = [(1/2,2),(1,1),(2,1/2)]
            interval = (0,10)
            new_points = [(1/2 + c, a*b*2 + d), (1+c,a*b+d), (2 + c, a*b*1/2 + d)]
            new_interval = (c,10)
            
        #Create g(x)
        g(x) = a*b*f(x-c)+d

        return {
            "f": f,
            "g": g,
            "function": latex(f(x)),
            "transformed": latex(g(x)),
            "reflection_phrase": reflection_phrase,
            "scale_phrase": scale_phrase,
            "hshift_phrase": hshift_phrase,
            "vshift_phrase": vshift_phrase,
            "interval": interval,
            "key_points": key_points,
            "new_interval": new_interval,
            "new_points": new_points,
        }
    
    @provide_data
    def graphics(data):

        return {
            "Show1": plot(data["f"],data["interval"],xmin=-10,xmax=10,ymin=-10,ymax=10,color ='red',detect_poles=True) + plot(0,(-10,10),color ='black') + list_plot(data["key_points"],color ='red',pointsize = 30),
            "Show2": plot(data["f"],data["interval"],xmin=-10,xmax=10,ymin=-10,ymax=10,color ='red',detect_poles=True) + plot(0,(-10,10),color ='black') + list_plot(data["key_points"],color ='red',pointsize=30) + plot(data["g"],data["new_interval"],ymin=-10,ymax=10,color ='blue',detect_poles=True) + list_plot(data["new_points"],color ='blue',pointsize=30)
        }