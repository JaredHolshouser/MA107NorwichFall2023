class Generator(BaseGenerator):
    def data(self):
        plist = [2,3,5,7,9,11,13];
        p = choice(plist);
        
        #task 1: Condense an expression of the form m1 ln(a+x1) + m2 ln(b+x2) + m3 ln(c+x3) into one logarithm.
        #Set the variables
        a = var('a');
        b = var('b');
        c = var('c');
        
        #Choose some powers
        m1 = randrange(1,11)*choice([1,-1]);
        m2 = randrange(1,11)*choice([1,-1]);
        m3 = randrange(1,11)*choice([1,-1]);
        
        #Choose some shifts
        x1 = randrange(-3,3);
        x2 = randrange(-3,3);
        x3 = randrange(-3,3);
        
        #Set the simplified expression
        simplified_inside = (a+x1)^m1 * (b + x2)^m2 * (c + x3)^m3;
        simplified_expression = "\\ln\\left( " + latex(simplified_inside) + " \\right)"
        
        inside1 = a + x1;
        inside2 = b + x2;
        inside3 = c + x3;
        
        #Set the unsimplified expression
        outside1 = m1;
        oustide2 = m2;
        outside3 = m3;
        
        if(m1 < 0):
            sign1 = "";
        else:
            sign1 = "+";
            
        if(m2 < 0):
            sign2 = "";
        else:
            sign2 = "+";
            
        if(m3 < 0):
            sign3 = "";
        else:
            sign3 = "+";
        
        expression1 = sign1 + str(m1) + "\\ln(" + latex(inside1) + ")" + sign2 + str(m2) + "\\ln(" + latex(inside2) + ")" + sign3 + str(m3) + "\\ln(" + latex(inside3) + ")";

        # task2 stuff
        x = var('x');
        s = sample(range(1,9),3);
        a = s[0]*choice([-1,1]);
        b = s[1]*choice([-1,1]);
        c = s[2];

        pp = choice(["","2","3"]);
        qq = choice(["","2","3"]);
        rr = choice(["","2","3"]);

        power_dict = {"":1,"2":2,"3":3};
        
        #Choose between x^2 - c^2 and x^2 + c^2 on bottom.
        coin_flip = choice([0,2]);
        
        #The x^2 - c case
        if coin_flip == 0:
            f(x) = x^(power_dict[pp])*(x-a)^(power_dict[qq])*(x-b)^(power_dict[rr])/(x^2-c^2);
            expression2 = "\\ln\\left(" + latex(f(x)) + "\\right)"
            expanded_expression = pp + "\\ln(" + latex(x) + ") + " + qq + "\\ln(" + latex(x-a) + ") + " + rr + "\\ln(" + latex(x-b) + ") - " + "\\ln(x + " + str(c) + ") - \\ln(x - " + str(c) + ")"
         
        #The x^2 + c case
        else:
            f(x) = x^(power_dict[pp])*(x-a)^(power_dict[qq])*(x-b)^(power_dict[rr])/(x^2+c^2);
            expression2 = "\\ln\\left(" + latex(f(x)) + "\\right)"
            expanded_expression = pp + "\\ln(" + latex(x) + ") + " + qq + "\\ln(" + latex(x-a) + ") + " + rr + "\\ln(" + latex(x-b) + ") - " + "\\ln(x^2 + " + str(c^2) + ")"

        


        return {
            "simplified_expression": simplified_expression,
            "expression1": expression1,
            "expression2": expression2,
            "expanded_expression": expanded_expression,
        }

