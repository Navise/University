
class Employee:

    def __init__(self , Name , Employee_ID, Department, Salary):
        self.Name = Name
        self.Employee_ID = Employee_ID
        self.Department = Department
        self.Salary = Salary

    def update_salary(self , Department ,Salary):
        if(self.Department == Department):
            self.Salary = Salary
    
    def __str__(self):
        return f"{self.Name}\n{self.Department}\n{self.Salary}"

EmployeeObj = []
n = int(input("Enter the Number of Employees: "))

for i in range(n):
    name = input("\nEnter the name of the employee: ")
    id = input("Enter employee id: ")
    dept= input("Enter the department of the employee: ")
    sal = input("Enter the Salary: ")

    Obj = Employee(name , id , dept  , sal)
    EmployeeObj.append(Obj)

for i in EmployeeObj:
    print(i)

x = input("Enter the Department to Update Salary: ")
y = input("Enter the Updated Salary")

for Obj in EmployeeObj:
    Obj.update_salary(x , y)
    print(Obj)




