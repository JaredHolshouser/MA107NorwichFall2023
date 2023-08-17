class Generator(BaseGenerator):
    def data(self):
        #Make a logarithm with either 1 or -1 in it
        base_1 = randrange(2,20)
        coin = randrange(0,2)
        if coin == 0:
            log_expr_1 = "\\log_{" + str(base_1) + "}(1)"
            log_ans_1 = " = 0"
        else:
            log_expr_1 = "\\log_{" + str(base_1) + "}(-1)"
            log_ans_1 = "\\, DNE"
            
        #Make a logarithm of a base to a small power
        base_2 = choice([2,3,4,5,10])
        exp_2 = (-1)^randrange(0,2)*randrange(2,5)
        log_ans_2 = " = " + str(exp_2)
        log_in_2 = Rational(base_2^exp_2)
        log_expr_2 = "\\log_{" + str(base_2) + "}\\left( " + latex(log_in_2) + " \\right)"
        
        #Make a logarithm that breaks calculators
        exp_3 = randrange(1000000,3000000)
        log_ans_3 = " = " + str(exp_3)
        coin_2 = randrange(0,2)
        #The ln case
        if coin_2 == 0:
            log_expr_3 = "\\ln \\left( e^{" + str(exp_3) + "} \\right)"
        #The base 10 case
        else:
            log_expr_3 = "\\log_{10} \\left( 10^{" + str(exp_3) + "} \\right)"
            
        #Make a logarithm that needs a calculator
        base_4 = randrange(2,10)
        exp_4_low_bound = randrange(1,10)
        log_in_4 = randrange(base_4^exp_4_low_bound + 1, base_4^(exp_4_low_bound + 1))
        log_exp_4 = round(log(log_in_4)/log(base_4),2)
        log_ans_4 = " \\approx " + str(log_exp_4)
        log_expr_4 = "\\log_{" + str(base_4) + "}\\left( " + latex(log_in_4) + " \\right)"
        
        #Shuffle the choices
        options = [(log_expr_1,log_ans_1),(log_expr_2,log_ans_2),(log_expr_3,log_ans_3),(log_expr_4,log_ans_4)]
        
        choice_1 = choice(options)
        expression_1 = choice_1[0]
        answer_1 = choice_1[1]
        options.remove(choice_1)
        
        choice_2 = choice(options)
        expression_2 = choice_2[0]
        answer_2 = choice_2[1]
        options.remove(choice_2)
        
        choice_3 = choice(options)
        expression_3 = choice_3[0]
        answer_3 = choice_3[1]
        options.remove(choice_3)
        
        choice_4 = options[0]
        expression_4 = choice_4[0]
        answer_4 = choice_4[1]

        return {
            "expression_1": expression_1,
            "expression_2": expression_2,
            "expression_3": expression_3,
            "expression_4": expression_4,
            "answer_1": answer_1,
            "answer_2": answer_2,
            "answer_3": answer_3,
            "answer_4": answer_4,
        }
