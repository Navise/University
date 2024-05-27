import requests
import json

baseurl = "https://api.openweathermap.org/data/2.5/weather?"

#api key 7bdccf825b7dd119a05ac2e0afaf1aaa

city = input("Enter City Name: ")
apikey = input("Enter the api key: ")

url = baseurl + "q=" + city + "&appid=" + apikey

response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    main = data['main']

    temperature = main['temp']
    humidity = main['humidity']
    pressure = main['pressure']

    report = data['weather']
    print(f"{city}")
    print("Temperature: ",temperature)
    print("Pressure " , pressure)
    print("Weather Report: ", report)
else:
    print(response.json())
