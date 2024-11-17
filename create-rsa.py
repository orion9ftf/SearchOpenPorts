from Cryptodome.PublicKey import RSA

key = RSA.generate(1024)

with open('priv.pem', 'wb') as f:
  f.write(key.export_key('PEM'))

with open('pub.pem', 'wb') as f:
  f.write(key.public_key().export_key('PEM'))
