class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        y = var('y')
        
        #Generate the nice whole number solution first
        x_sol = randrange(-20,21)
        y_sol = randrange(-20,21)
        
        #Make the first line passing through this point.
        Delta_y_1 = (-1)^randrange(0,2)*randrange(1,11)
        Delta_x_1 = (-1)^randrange(0,2)*randrange(1,11)
        slope_1 = Rational(Delta_y_1/Delta_x_1)
        num_1 = slope_1.numerator()
        den_1 = slope_1.denominator()
        eq_1 = den_1*y - num_1*x == den_1*y_sol - num_1*x_sol
        expr_1 = den_1*y - num_1*x
        const_1 = den_1*y_sol - num_1*x_sol
        
        #Make the second line passing through this point.
        y_change = (-1)^randrange(0,2)*2*randrange(1,6) + 1
        Delta_y_2 = Delta_y_1*y_change
        x_change = (-1)^randrange(0,2)*2*randrange(1,6)
        Delta_x_2 = Delta_x_1*x_change
        slope_2 = Rational(Delta_y_2/Delta_x_2)
        num_2 = slope_2.numerator()
        den_2 = slope_2.denominator()
        eq_2 = den_2*y - num_2*x == den_2*y_sol - num_2*x_sol
        expr_2 = den_2*y - num_2*x
        const_2 = den_2*y_sol - num_2*x_sol
        
        #Format the Latex for the first system
        system_1 = "\\begin{cases} "
        system_1 += latex(expr_1) + " & = " + const_1 + "\\\\"
        system_1 += latex(expr_2) + " & = " + const_2 + "\\\\"
        system_1 += "\\end{cases} "
        
        #Decide to do an inconsistent system or a colinear one
        coin = randrange(0,2)
        if coin == 0:
            answer = "inconsistent"
            reason = "an equation with 0 on one side and a different number on the other side"
            multiplier = (-1)^randrange(0,2)*randrange(2,5)
            expr_3 = multiplier*expr_1
            new_consts = [n for n in range(-100,101) if n != const_1]
            const_3 = new_consts[randrange(0,199)]
            eq_3 = expr_3 == const_3
        else:
            answer = "colinear"
            reason = "an equation with 0 on both sides"
            multiplier = (-1)^randrange(0,2)*randrange(2,5)
            expr_3 = multiplier*expr_1
            const_3 = multiplier*const_1
            eq_3 = expr_3 == const_3
            
        #Format the Latex for the first system
        system_2 = "\\begin{cases} "
        system_2 += latex(expr_1) + " & = " + const_1 + "\\\\"
        system_2 += latex(expr_3) + " & = " + const_3 + "\\\\"
        system_2 += "\\end{cases} "

        return {
            "x_sol": x_sol,
            "y_sol": y_sol,
            "system_1": system_1,
            "system_2": system_2,
            "answer": answer,
            "reason": reason,
        }
