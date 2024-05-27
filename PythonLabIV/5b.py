import re
email_regex = re.compile(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
phone = re.compile(r"(?<!\d)\+\d{2}\d{10}(?!\d)")
with open("textdoc.txt" , "r") as x:
    text = x.read()
    mail  = email_regex.findall(text)
    ph = phone.findall(text)

print("The phone number's in the text files are: ",ph)
print("The email adddresses in the text file are: ",mail)
    