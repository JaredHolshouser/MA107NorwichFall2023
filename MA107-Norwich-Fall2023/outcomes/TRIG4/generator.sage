class Generator(BaseGenerator):
    def data(self):
        # task1 stuff
        f = choice([r'\sin^2(\theta)',r'\tan^2(\theta)',r'\cot^2(\theta)']);
        p = randrange(2,10);

        sign = choice(["+","-"]);
        
        if f == r'\sin^2(\theta)':
            g = choice([r'\tan',r'\cot',r'\sec',r'\csc']);
            if sign == "+":
                h = r'\cos^2(\theta)';
                b = " ";
                q = " ";
            else:
                h = " ";
                b = r"\cos^2(\theta) ";
                q = sign;
        elif f == r'\tan^2(\theta)':
            g = choice([r'\sin',r'\cot',r'\cos',r'\csc']);
            if sign == "+":
                h = " ";
                b = r"\sec^2(\theta)";
                q = " "
            else:
                h = r'\sec^2(\theta)';
                b = " ";
                q = sign;
        else:
            g = choice([r'\sin',r'\tan',r'\cos',r'\sec']);
            if sign == "+":
                h = " ";
                b = r'\csc^2(\theta)';
                q = " ";
            else:
                h = r'\csc^2(\theta)';
                b = " ";
                q = sign;

        if b == " ":
            bb = 1;
        else:
            bb = b;


        # task2 stuff
        theta_deg = choice([45,135,225,315])*choice([1,-1]);
        phi_deg = choice([30,60,120,150,210,])*choice([1,-1]);


        return {
            "f": f,
            "g": g,
            "p": p,
            "h": h,
            "b": b,
            "q": q,
            "bb": bb,
            "pm": sign,
            "AB": theta_deg+phi_deg,
            "sAB": sin((theta_deg+phi_deg)*pi/180),
            "cAB": cos((theta_deg+phi_deg)*pi/180),
        }
