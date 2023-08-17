class Generator(BaseGenerator):
    def data(self):
        
        #The list of bs and cs that make a quadratic with a nice vertex and nice x-intercepts when a = 1
        good_pairs = [(2,-15),(2,-8),(2,-3),(2,1),(4,-12),(4,-5),(4,3),(4,4),(6,-16),(6,-7),(6,5),(6,8),(6,9),(8,-20),(8,-9),(8,7),(8,12),(8,15),(8,16),(10,-11),(10,9),(10,16)]
        
        #Start with a = 1 and a good pair of b and c
        pair_index = randrange(0,len(good_pairs))
        pair = good_pairs[pair_index]
        b_0 = pair[0]
        c_0 = pair[1]
        
        #Decide to flip the signs on the roots
        coin = randrange(0,2)
        if coin == 0:
            b_1 = b_0
        else:
            b_1 = -b_0
            
        f_0(x) = x^2 +b_1*x + c_0
        
        #Decide to scale and maybe reflect
        scales = [-3,Rational(-5/2),-2,Rational(-3/2),-1,Rational(-1/2),Rational(1/2),1,Rational(3/2),2,Rational(5/2),3]
        scale_index = randrange(0,len(scales))
        scale = scales[scale_index]
        
        a = scale
        b = scale*b_1
        c = scale*c_0
        
        #Build the quadratic
        f(x) = a*x^2 + b*x + c
        
        #Get the y-intercept
        y_int = (0,c)
        
        #Find the vertex
        h = -b/(2*a)
        k = Rational(f(h))
        vertex = (h,k)
        
        #Find the roots
        root_1 = (-b + sqrt(b^2 - 4*a*c))/(2*a)
        root_2 = (-b - sqrt(b^2 - 4*a*c))/(2*a)
        x_int_1 = (root_1,0)
        x_int_2 = (root_2,0)
        
        #Graph limits
        min_x = min(h,0,root_1,root_2)
        max_x = max(h,0,root_1,root_2)
        Delta_x = max_x - min_x
        xlim0 = min_x - 0.1*Delta_x - 1
        xlim1 = max_x + 0.1*Delta_x + 1

        return {
            "quadratic": latex(f(x)),
            "unscaled": latex(f_0(x)),
            "scale": scale,
            "vertex": vertex,
            "x_int_1": x_int_1,
            "x_int_2": x_int_2,
            "y_int": y_int,
            "plot": f,
            "xlim0": xlim0,
            "xlim1": xlim1,
        }
        
    @provide_data
    def graphics(data):

        return {
            "Show": point(data["vertex"],pointsize=20,color='blue') + point(data["x_int_1"],pointsize=20,color='blue') + point(data["x_int_2"],pointsize=20,color='blue') + point(data["y_int"],pointsize=20,color='blue') + plot(data["plot"],(x,data["xlim0"],data["xlim1"]),color='red'),
            }
