class Generator(BaseGenerator):
    def data(self):
        sketch_11 = sqrt(4 - x^2)
        sketch_12 = -sqrt(4 - x^2)
        
        sketch_2 = 2*sin(x)
        
        sketch_3 = 1/3*2^x - 3

        return {
            "sketch_11": sketch_11,
            "sketch_12": sketch_12,
            "sketch_2": sketch_2,
            "sketch_3": sketch_3,
        }

    @provide_data
    def graphics(data):

        return {
            "Show1": plot(data["sketch_11"],(x,-2,2),color='red') + plot(data["sketch_12"],(x,-2,2),color='red'),
            "Show2": plot(data["sketch_2"],(x,-5,5),color='red'),
            "Show3": plot(data["sketch_3"],(x,-5,5),color='red'),
        }