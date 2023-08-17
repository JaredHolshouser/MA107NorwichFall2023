class Generator(BaseGenerator):
    def data(self):
        #Choose your first function f
        #Choose parameters
        a_0 = randrange(1,10)
        a_sign = randrange(0,2)
        a = (-1)^a_sign * a_0
        b_0 = randrange(1,10)
        b_sign = randrange(0,2)
        b = (-1)^a_sign * a_0
        #Choose the function type (0 is squared, 1 is cubed, 2 is rational)
        f_type = randrange(0,3)
        if f_type == 0:
            f(x) = a*(x-b)^2
        elif f_type == 1:
            f(x) = (x - a)^3 + b
        else:
            f(x) = b/(x-a)
            
        #Choose your second function g
        #Choose parameters
        c_0 = randrange(1,10)
        c_sign = randrange(0,2)
        c = (-1)^a_sign * a_0
        d_0 = randrange(1,10)
        d_sign = randrange(0,2)
        d = (-1)^a_sign * a_0
        #Choose the function type (0 is linear, 1 is a different looking linear, 2 is rational)
        g_type = randrange(0,3)
        if g_type == 0:
            g(t) = c*t + d
        elif g_type == 1:
            g(t) = (t - c)/d
        else:
            g(t) = 1/(t - c)^2
        
        #Choosing an input
        good_0 = [n for n in range(-10,11) if n != a and n != c]
        good_1 = [n for n in good_0 if g(n) != a and f(n) != c]
        good = [n for n in good_1 if g(n) != 0 and f(n) != 0]
        index = randrange(0,len(good))
        x_in = good[index]
        
        #Evaluating the functions for some explanation
        f_eval = f(x_in)
        g_eval = g(x_in)
        fg_eval = f(g_eval)
        gf_eval = g(f_eval)
    
        #Choose between + and -
        coin_1 = randrange(0,2)
        if coin_1 == 0:
            op_1 = "f + g"
            ans_1 = f(x_in) + g(x_in)
            expl_1 = latex(f_eval) + " + " + latex(g_eval)
        else:
            coin_11 = randrange(0,2)
            if coin_11 == 0:
                op_1 = "f - g"
                ans_1 = f(x_in) - g(x_in)
                expl_1 = latex(f_eval) + " - " + latex(g_eval)
            else:
                op_1 = "g - f"
                ans_1 = g(x_in) - f(x_in)
                expl_1 = latex(g_eval) + " - " + latex(f_eval)
            
        #Choose between * and /
        coin_2 = randrange(0,2)
        if coin_2 == 0:
            op_2 = "f \\cdot g"
            ans_2 = f(x_in)*g(x_in)
            expl_2 = latex(f_eval) + " \\cdot " + latex(g_eval)
        else:
            coin_12 = randrange(0,2)
            if coin_12 == 0:
                op_2 = "\\frac{f}{g}"
                ans_2 = f(x_in)/g(x_in)
                expl_2 = "\\frac{" + latex(f_eval) + "}{" + latex(g_eval) + "}"
            else:
                op_2 = "\\frac{g}{f}"
                ans_2 = g(x_in)/f(x_in)
                expl_2 = "\\frac{" + latex(g_eval) + "}{" + latex(f_eval) + "}"
            
        #Choose between f(g(x)) and g(f(x))
        coin_3 = randrange(0,2)
        if coin_3 == 0:
            op_3 = "f \\circ g"
            variable = "t"
            ans_3 = simplify(f(g(t)))
            ans_4 = fg_eval
            expl_4 = "f(" + latex(g_eval) + ")"
        else:
            op_3 = "g \\circ f"
            variable = "x"
            ans_3 = simplify(g(f(x)))
            ans_4 = gf_eval
            expl_4 = "g(" + latex(f_eval) + ")"
        
        
        return {
            "f": latex(f(x)),
            "g": latex(g(t)),
            "op_1": op_1,
            "op_2": op_2,
            "op_3": op_3,
            "x_in": x_in,
            "ans_1": ans_1,
            "ans_2": ans_2,
            "variable": variable,
            "ans_3": latex(ans_3),
            "ans_4": ans_4,
            "f_eval": f_eval,
            "g_eval": g_eval,
            "fg_eval": fg_eval,
            "gf_eval": gf_eval,
            "expl_1": expl_1,
            "expl_2": expl_2,
            "expl_4": expl_4,
        }
