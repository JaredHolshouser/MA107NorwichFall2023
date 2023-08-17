class Generator(BaseGenerator):
    def data(self):
        #Write an equation of the form log_b(x) = c
        b = randrange(2,10)
        c = randrange(2,6)
        
        equation_1 = "\\log_{" + str(b) + "}(x) = " + str(c)
        #The solution is b^c
        solution_1 = str(b^c)
        #This is also the reason
        reason_1 = str(b) + "^{" + str(c) +"} = " + solution_1
        
        #Write an equation of the form log(alpha) + log(x + beta) = log(x + gamma) or ln
        #In any case the solution comes from alpha*x + alpha*beta = x + gamma
        #Which means that x = (gamma - alpha*beta)/(alpha - 1)
        
        #Set numbers
        alpha = randrange(2,10)
        beta = randrange(2,10)
        #Ensure the solution is positive
        gamma = randrange(beta + 1,20)
        #Find the solution
        solution_2 = latex(Rational((gamma - alpha*beta)/(alpha - 1)))
        
        
        #Decide log or ln
        coin_1 = randrange(0,2)
        #Decide constant or equation first
        coin_2 = randrange(0,2)
        #log
        if coin_1 == 0:
            #Write the reason
            reason_2 = "\\log(\\square) + \\log(\\Delta) = \\log(\\square \\cdot \\Delta)"
            #Constant first
            if coin_2 == 0:
                equation_2 = "\\log(" + str(alpha) + ") + \\log(x + " + str(beta) + ") = \\log(x + " + str(gamma) + ")"
            #Constant second
            else:
                equation_2 = "\\log(x + " + str(beta) + ") + \\log(" + str(alpha) + ") = \\log(x + " + str(gamma) + ")"
        #ln
        else:
            #Constant first
            reason_2 = "\\ln(\\square) + \\ln(\Delta) = \\ln(\\square \\cdot \\Delta)"
            if coin_2 == 0:
                equation_2 = "\\ln(" + str(alpha) + ") + \\ln(x + " + str(beta) + ") = \\ln(x + " + str(gamma) + ")"
            #Constant second
            else:
                equation_2 = "\\ln(x + " + str(beta) + ") + \\ln(" + str(alpha) + ") = \\ln(x + " + str(gamma) + ")"
        
        reason_2 += " \\text{ which allows you to condense the left hand side to a single logarithm, and then remove the logarithms from both sides }"
            
        

        return {
            "equation_1": equation_1,
            "solution_1": solution_1,
            "reason_1": reason_1,
            "equation_2": equation_2,
            "solution_2": solution_2,
            "reason_2": reason_2,
        }
