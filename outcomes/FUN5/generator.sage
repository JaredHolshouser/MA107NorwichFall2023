class Generator(BaseGenerator):
    def data(self):
        #Part 1
        y = var('y')
        t = var('t')
        #Make some parameters
        a = randrange(-5,6)
        b = randrange(-5,6)
        c = (-1)^randrange(0,2)
        d = (-1)^randrange(0,2)
    
        #Decide to do square root, hyperbolic sine, a rational function, an exponential, or hyperbolic tangent
        spinner = randrange(0,5)
        if spinner == 0:
            f_gr(x) = sqrt((x-a)) + b
            inv_gr(x) = ((x-b)^2 + a)*sqrt((x-b))/sqrt(abs((x-b)))
        elif spinner == 1:
            f_gr(x) = c*sinh(d*(x-a)) + b
            inv_gr(x) = d*arcsinh(c*(x - b)) + a
        elif spinner == 2:
            f_gr(x) = c/(x-a) + b
            inv_gr(x) = c/(x-b) + a
        elif spinner == 3:
            f_gr(x) = c*2^(d*(x-a)) + b
            inv_gr(x) = d*log(c*(x-b),2) + a
        elif spinner == 4:
            f_gr(x) = 4*tanh(1/3*(x-a))+b
            inv_gr(x) = 3*arctanh(1/4*(x-b)) + a
            
        y_eq = y == f_gr(x)
        inv_eq = y == inv_gr(x)
        
        #Part 2
        a_1 = (-1)^randrange(0,2)*randrange(1,6) + a
        b_1 = (-1)^randrange(0,2)*randrange(1,6) + b
        #Decide to be inverses or not
        coin_1 = randrange(0,2)
        if coin_1 == 0:
            answer_2 = "they are inverses"
        else:
            answer_2 = "they are not inverses"
        #Decide to do rational or cubic
        coin_2 = randrange(0,2)
        if coin_2 == 0:
            f(x) = c/(x-a) + b
            if coin_1 == 0:
                g(t) = (c + a*t-a*b)/(t-b)      
            else:
                g(t) = (d + a_1*t-a_1*b_1)/(t-b_1)
        else:
            f(x) = c*(x-a)^3 + b
            if coin_1 == 0:
                g(t) = c*(t-b)^(1/3) + a
            else:
                g(t) = d*(t-b_1)^(1/3) + a_1
        
        fg_0(t) = f(g(t))
        fg = fg_0.simplify_real().simplify_full()
        gf_0(x) = g(f(x))
        gf = gf_0.simplify_real().simplify_full()
        ff_0(x) = f(f(x))
        ff = ff_0.simplify_real().simplify_full()
        gg_0(x) = g(g(x))
        gg = gg_0.simplify_real().simplify_full()
        
        #Part 3
        Delta_x = (-1)^randrange(0,2)*randrange(1,10)
        Delta_y = (-1)^randrange(0,2)*randrange(1,10)
        y_int = (-1)^randrange(0,2)*randrange(1,10)
        
        slope = Rational(Delta_y/Delta_x)
        
        h(x) = slope*x + y_int
        
        h_inv_0(x) = (x - y_int)/slope
        h_inv = h_inv_0.simplify_full()

        return {
            "a": a,
            "b": b,
            "y_eq": y_eq,
            "inv_eq": inv_eq,
            "f": latex(f(x)),
            "g": latex(g(t)),
            "fg": latex(fg(t=t)),
            "gf": latex(gf(x=x)),
            "ff": latex(ff(x=x)),
            "gg": latex(gg(x=x)),
            "answer_2": answer_2,
            "h": latex(h(x)),
            "h_inv": latex(h_inv(x=x)),
        }
        
    @provide_data
    def graphics(data):

        return {
            "Graph": implicit_plot(data["y_eq"], (x,-10,data["a"]), (y,-10,10), color='red') + implicit_plot(data["y_eq"], (x,data["a"],10), (y,-10,10), color='red') + implicit_plot(y == 0,(x,-10,10), (y,-10,10), color='black') + implicit_plot(x == 0,(x,-10,10), (y,-10,10), color='black'),
            "GraphInverse": implicit_plot(data["y_eq"], (x,-10,data["a"]), (y,-10,10), color='red') + implicit_plot(data["y_eq"], (x,data["a"],10), (y,-10,10), color='red') + implicit_plot(y == 0,(x,-10,10), (y,-10,10), color='black') + implicit_plot(x == 0,(x,-10,10), (y,-10,10), color='black') + implicit_plot(data["inv_eq"], (x,-10,data["b"]), (y,-10,10), color='blue') +  implicit_plot(data["inv_eq"], (x,data["b"],10), (y,-10,10), color='blue') + implicit_plot(y == x, (x,-10,10), (y,-10,10), color='black', linestyle = "dashed"),
        }