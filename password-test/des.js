const forge = require('node-forge');
const fetch = require('node-fetch');

function encryptAES(plainText, secretKey) {
    let iv = forge.random.getBytesSync(16);
    let cipher = forge.cipher.createCipher('AES-CBC', secretKey);
    cipher.start({ iv: iv });
    cipher.update(forge.util.createBuffer(plainText));
    cipher.finish();
    let encrypted = forge.util.encode64(cipher.output.getBytes());
    return {
        _: encrypted,
        __: forge.util.encode64(iv),
    };
}

function decryptAES(encryptedText, secretKey, iv) {
    let decipher = forge.cipher.createDecipher('AES-CBC', secretKey);
    decipher.start({ iv: forge.util.decode64(iv) });
    decipher.update(forge.util.createBuffer(forge.util.decode64(encryptedText)));
    decipher.finish();
    return decipher.output.toString();
}

function encryptRSA(secretKey, publicKey) {
    let rsa = forge.pki.publicKeyFromPem(publicKey);
    let encrypted = rsa.encrypt(secretKey, 'RSA-OAEP');
    return forge.util.encode64(encrypted);
}

async function submitForm(event) {
    event.preventDefault();
    
    let username = document.getElementById('username').value;
    let password = document.getElementById('password').value;

    if (username.length < 1 || password.length < 1) {
        return;
    }

    let payload = JSON.stringify({
        srv: '/private/auth/',
        data: {
            usr: username,
            pwd: password,
        },
    });

    try {
        let publicKeyResponse = await fetch('/public-key', { method: 'POST' });
        let publicKey = await publicKeyResponse.text();

        let secretKey = forge.random.getBytesSync(16);
        let encryptedSecretKey = encryptRSA(secretKey, publicKey);
        let encryptedPayload = encryptAES(payload, secretKey);
        encryptedPayload['___'] = encryptedSecretKey;

        let loginResponse = await fetch('/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(encryptedPayload),
        });

        let encryptedResponse = await loginResponse.text();
        let responseJson = JSON.parse(encryptedResponse);
        let decryptedResponse = decryptAES(responseJson['_'], secretKey, responseJson['__']);
        let finalResponse = JSON.parse(decryptedResponse);

        let responseText = '[ Access Denied: ' + new Date().toISOString() + ' ]';
        if (finalResponse.code === 200) {
            responseText = JSON.stringify(finalResponse);
        }
        document.getElementById('responseServer').textContent = responseText;
    } catch (error) {
        console.error('Error during form submission', error);
    }
}

document.getElementById('loginForm').addEventListener('submit', submitForm);
