import requests
import os
import bs4

url = 'http://xkcd.com/'

os.makedirs('xkcd', exist_ok=True)

while not (url.endswith("#")):
    print("Downloading")
    res = requests.get(url)
    res.raise_for_status()
    soup = bs4.BeautifulSoup(res.text, 'lxml')

    comics = soup.select("#comic img")
    if comics == []:
        print("No images found")
    else:
        comicurl = comics[0].get('src')
        print("Downloading the image:", comicurl)
        res = requests.get('http:' + comicurl)

        file = open(os.path.join('xkcd', os.path.basename(comicurl)), 'wb')
        for chunk in res.iter_content(1):
            file.write(chunk)
        file.close()

    pl = soup.select('a[rel="prev"]')[0]
    url = 'http://xkcd.com' + pl.get('href')

print("Done")
