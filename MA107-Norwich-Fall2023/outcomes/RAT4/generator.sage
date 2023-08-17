class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        #Create the quadratic
        root_1 = (-1)^randrange(0,2)*randrange(1,10)
        root_2 = (-1)^randrange(0,2)*randrange(1,10)
        f(x) = (x-root_1)*(x-root_2)
        f_simple = f.simplify_full()
        
        #Create the cubic
        croot_1 = (-1)^randrange(0,2)*randrange(1,10)
        croot_2 = (-1)^randrange(0,2)*randrange(1,10)
        #flip a coin for which part to make quadratic
        coin = randrange(0,2)
        if coin == 0:
            g(x) = (x^2 - croot_1)*(x - croot_2)
            g_simple = g.simplify_full()
            if croot_1 > 0:
                cubic_phrase = "the real solutions to the cubic equation are"
                cubic_sol_1 = latex(sqrt(croot_1)) + ", "
                cubic_sol_2 = latex(-sqrt(croot_1)) + ", "
                cubic_sol_3 = croot_2
            else:
                cubic_phrase = "the only real solution to the cubic equation is"
                cubic_sol_1 = ""
                cubic_sol_2 = ""
                cubic_sol_3 = croot_2
        else:
            g(x) = (x - root_1)*(x^2 - croot_2)
            g_simple = g.simplify_full()
            if croot_2 > 0:
                cubic_phrase = "the real solutions to the cubic equation are"
                cubic_sol_1 = latex(sqrt(croot_2)) + ", "
                cubic_sol_2 = latex(-sqrt(croot_2)) + ", "
                cubic_sol_3 = croot_1
            else:
                cubic_phrase = "the only real solution to the cubic equation is"
                cubic_sol_1 = ""
                cubic_sol_2 = ""
                cubic_sol_3 = croot_1
        
        #Create the quartic
        qroot_1 = (-1)^randrange(0,2)*randrange(1,10)
        qroot_2 = (-1)^randrange(0,2)*randrange(1,10)
        h(x) = (x^2 - qroot_1)*(x^2 - qroot_2)
        h_simple = h.simplify_full()
        if qroot_1 > 0:
            if qroot_2 > 0:
                fourth_phrase = "the real solutions are "
                fourth_sol_1 = "x = " + latex(sqrt(qroot_1)) + ", "
                fourth_sol_2 = latex(-sqrt(qroot_1)) + ", "
                fourth_sol_3 = latex(sqrt(qroot_2)) + ", "
                fourth_sol_4 = latex(-sqrt(qroot_2))
            else:
                fourth_phrase = "the only real solutions are "
                fourth_sol_1 = "x = " + latex(sqrt(qroot_1)) + ", "
                fourth_sol_2 = latex(-sqrt(qroot_1))
                fourth_sol_3 = ""
                fourth_sol_4 = ""
        else:
            if qroot_2 > 0:
                fourth_phrase = "the only real solutions are "
                fourth_sol_1 = "x = " + latex(sqrt(qroot_2)) + ", "
                fourth_sol_2 = latex(-sqrt(qroot_2))
                fourth_sol_3 = ""
                fourth_sol_4 = ""
            else:
                fourth_phrase = "there are no real solutions"
                fourth_sol_1 = ""
                fourth_sol_2 = ""
                fourth_sol_3 = ""
                fourth_sol_4 = ""

        return {
            "root_1": root_1,
            "root_2": root_2,
            "quadratic": latex(f(x)),
            "quadratic_simple": latex(f_simple(x=x)),
            "cubic": latex(g(x)),
            "cubic_simple": latex(g_simple(x=x)),
            "cubic_phrase": cubic_phrase,
            "cubic_sol_1": cubic_sol_1,
            "cubic_sol_2": cubic_sol_2,
            "cubic_sol_3": cubic_sol_3,
            "quartic": latex(h(x)),
            "quartic_simple": latex(h_simple(x=x)),
            "fourth_phrase": fourth_phrase,
            "fourth_sol_1": fourth_sol_1,
            "fourth_sol_2": fourth_sol_2,
            "fourth_sol_3": fourth_sol_3,
            "fourth_sol_4": fourth_sol_4,
        }
