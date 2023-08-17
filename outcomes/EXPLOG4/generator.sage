class Generator(BaseGenerator):
    def data(self):
        plist = [2,3,5,7,9,11,13];
        p = choice(plist);

        # task1.1 stuff
        if p == 2:
            r11 = randrange(2,8)*choice([1,-1]);
        elif p == 3:
            r11 = randrange(2,6)*choice([1,-1]);
        elif p == 5 or p == 7:
            r11 = randrange(2,4)*choice([1,-1]);
        else:
            r11 = choice([2,-2]);

        if p < 7:
            m = randrange(5);
        elif p == 7:
            m = randrange(4);
        else:
            m = choice([0,1]);

        r21 = (2*m+1)/2;
        r1 = r11 + r21;

        if r1 == 1:
            disp_r1 = " ";
        else:
            disp_r1 = r1;

        # task1.2 stuff
        plist.remove(p)
        g = choice(plist)
        
        if p == 2:
            r12 = randrange(2,8);
        elif p == 3:
            r12 = randrange(2,6);
        elif p == 5 or p == 7:
            r12 = randrange(2,4);
        else:
            r12 = 2;
        
        r22 = randrange(r12);
        r2 = r12 - r22;

        if r22==0:
            arg22 = " ";
        else:
            arg22 = p^(r22);

        if r2 == 1:
            disp_r2 = " ";
        else:
            disp_r2 = r2;

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

        f(x) = x^(power_dict[pp])*(x-a)^(power_dict[qq])*(x-b)^(power_dict[rr])/(x^2-c^2);


        return {
            "p": p,
            "arg11": p^(r11),
            "arg21": p^(r21),
            "r1": r1,
            "disp_r1": disp_r1,
            "g": g,
            "arg12": p^(r12),
            "arg22": arg22,
            "r2": r2,
            "disp_r2": disp_r2,
            "f": f(x),
            "afact": x-a,
            "bfact": x-b,
            "c1fact": x-c,
            "c2fact": x+c,
            "pp": power_dict[pp],
            "qq": power_dict[qq],
            "rr": power_dict[rr],
        }

