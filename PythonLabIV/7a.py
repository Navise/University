import math

class Shape:
    def area(self):
        pass

class Triangle(Shape):
    def __init__(self , base , height):
        self.base = base
        self.height = height
    
    def area(self):
        return (0.5 * self.base * self.height)

class Circle(Shape):
    def __init__(self , radius):
        self.radius = radius
    
    def area(self):
        return (math.pi * self.radius * self.radius)

class Rectangle(Shape):
    def __init__(self , length , breadth) :
        self.lenght = length
        self.breadth = breadth

    def area(self):
        return( self.lenght * self.breadth)

tri = Triangle(4, 5)
cir = Circle(40)
rec = Rectangle(32,80)

print("The area of triangle -",tri.area())
print("The area of Circle -",cir.area())
print("The area of rectangle -",rec.area())