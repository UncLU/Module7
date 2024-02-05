import requests
from bs import BeautifulSoup4
import os

def download_favicon(url, output_dir):
    try:
        # Получение HTML-кода страницы
        response = requests.get(url)
        response.raise_for_status()

        # Использование BeautifulSoup для поиска тега с favicon
        soup = BeautifulSoup(response.text, 'html.parser')
        favicon_tag = soup.find('link', rel='icon') or soup.find('link', rel='shortcut icon')

        if favicon_tag:
            # Получение URL favicon
            favicon_url = favicon_tag['href']
            favicon_url = favicon_url if favicon_url.startswith(('http:', 'https:')) else url + favicon_url

            # Скачивание и сохранение favicon
            favicon_response = requests.get(favicon_url)
            favicon_response.raise_for_status()

            filename = os.path.join(output_dir, 'favicon.ico')
            with open(filename, 'wb') as file:
                file.write(favicon_response.content)

            return f"Favicon downloaded and saved to {filename}"
        else:
            return "Favicon not found on the webpage"

    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == "__main__":
    website_url = "https://apps.skillfactory.ru/"
    output_directory = "/app/output"
    
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)
    
    result = download_favicon(website_url, output_directory)
    print(result)