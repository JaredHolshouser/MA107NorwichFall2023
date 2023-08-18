class Generator(BaseGenerator):
    def data(self):
        #Write an equation of the form b^(linear) = b^(linear)
        base_1 = randrange(2,11)
        m_11 = (-1)^randrange(0,2)*randrange(1,10)
        b_11 = (-1)^randrange(0,2)*randrange(1,10)
        #Make sure there is a solution (i.e. no parallel lines)
        m_12_choices = [i for i in range(-10,11) if i != m_11 and i != 0]
        m_12 = choice(m_12_choices)
        b_12 = randrange(-10,11)
        
        exp_eqn_1 = base_1^(m_11*x + b_11) == base_1^(m_12*x + b_12)
        #Solve m_11x + b_11 = m_12x + b_12
        exp_sol_1 = latex(Rational((b_12 - b_11)/(m_11 - m_12)))
        exp_reason_1 = str(base_1) + "^\\square = " + str(base_1) + "^\\Delta \\text{ exactly when } \\square = \\Delta"
        
        #Write an equation of the form b^(linear) = b^p^(linear)
        base_21 = randrange(2,11)
        power = (-1)^randrange(0,2)*randrange(2,4)
        base_22 = Rational(base_21^power)
        #Make sure there is a solution (i.e. no parallel lines)
        m_2_choices = [i for i in range(-10,11) if i != power and i!= 0]
        m_2 = choice(m_2_choices)
        b_21 = randrange(-10,11)
        b_22 = randrange(-10,11)
        
        exp_eqn_2 = base_21^(m_2*x + b_21) == base_22^(x + b_22)
        #Solve m_2x + b_21 = px + pb_22
        exp_sol_2 = latex(Rational((power*b_22 - b_21)/(m_2 - power)))
        exp_reason_2 = str(base_22) + " = " + str(base_21) + "^{" + str(power) + "}"
        
        #Write an equation of the form ae^x + b = c
        a = randrange(2,10)
        b = (-1)^randrange(0,2)*randrange(1,10)
        c = randrange(b+a+1,30)
        inside = latex(Rational((c - b)/a))
        exp_eqn_3 = a*e^x + b == c
        #Solve for x
        exp_sol_3 = "\\ln \\left( " + inside + " \\right)"
        exp_reason_3 = "\\text{you can isolate } e^x \\text{ and then use } \\ln \\text{ to get } x \\text{ by itself}"
        
        #Scramble the order of of the problems
        options = [(exp_eqn_1,exp_sol_1,exp_reason_1),(exp_eqn_2,exp_sol_2,exp_reason_2),(exp_eqn_3,exp_sol_3,exp_reason_3)]
        
        choice_1 = choice(options)
        equation_1 = choice_1[0]
        answer_1 = choice_1[1]
        reason_1 = choice_1[2]
        options.remove(choice_1)
        
        choice_2 = choice(options)
        equation_2 = choice_2[0]
        answer_2 = choice_2[1]
        reason_2 = choice_2[2]
        options.remove(choice_2)
        
        choice_3 = options[0]
        equation_3 = choice_3[0]
        answer_3 = choice_3[1]
        reason_3 = choice_3[2]

        return {
            "equation_1": latex(equation_1),
            "equation_2": latex(equation_2),
            "equation_3": latex(equation_3),
            "answer_1": answer_1,
            "answer_2": answer_2,
            "answer_3": answer_3,
            "reason_1": reason_1,
            "reason_2": reason_2,
            "reason_3": reason_3,
        }
