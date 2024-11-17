function encryptRSA(_0xc93850, _0x558a95) {
  const _0x89b301 = forge.pki.publicKeyFromPem(_0x558a95),
    _0x27f4c4 = _0x89b301.encrypt(_0xc93850, 'RSA-OAEP', {
      md: forge.md.sha256.create(),
    })
  return forge.util.encode64(_0x27f4c4)
}
function encryptAES(_0x325a8f, _0x2feeb9) {
  let _0x25d508 = forge.random.getBytesSync(16),
    _0x4e169c = forge.cipher.createCipher('AES-CBC', _0x2feeb9)
  _0x4e169c.start({ iv: _0x25d508 })
  _0x4e169c.update(forge.util.createBuffer(_0x325a8f))
  _0x4e169c.finish()
  let _0x3a80c7 = forge.util.encode64(_0x4e169c.output.getBytes())
  return {
    _: _0x3a80c7,
    __: forge.util.encode64(_0x25d508),
  }
}
function decryptAES(_0x1facd2, _0x46b061, _0x4dd058) {
  let _0x507b00 = forge.cipher.createDecipher('AES-CBC', _0x46b061)
  return (
    _0x507b00.start({ iv: forge.util.decode64(_0x4dd058) }),
    _0x507b00.update(forge.util.createBuffer(forge.util.decode64(_0x1facd2))),
    _0x507b00.finish(),
    _0x507b00.output.toString()
  )
}
function submitForm(_0x1c8504) {
  let username = document.getElementById('username'),
    password = document.getElementById('password')
  if (username.value.length < 1 || password.value.length < 1) {
    _0x1c8504.preventDefault()
    return
  }
  let _0x3957ef = JSON.stringify({
      srv: '/private/auth/',
      data: {
        usr: username.value,
        pwd: password.value,
      },
    }),
    _0x1ee4d2 = null
  fetch('/public-key', { method: 'POST' })
    .then((_0x6808b1) => _0x6808b1.text())
    .then((_0x3e862b) => {
      _0x1ee4d2 = forge.random.getBytesSync(16)
      let _0x2f4f46 = encryptRSA(_0x1ee4d2, _0x3e862b),
        _0x489ec6 = encryptAES(_0x3957ef, _0x1ee4d2)
      return (
        (_0x489ec6['___'] = _0x2f4f46),
        fetch('/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(_0x489ec6),
        })
      )
    })
    .then((_0x255479) => _0x255479.text())
    .then((_0x2a81f4) => {
      let _0x5784d2 = JSON.parse(_0x2a81f4)
      return decryptAES(_0x5784d2['_'], _0x1ee4d2, _0x5784d2['__'])
    })
    .then((_0x18cc7a) => JSON.parse(_0x18cc7a))
    .then((_0x45391c) => {
      let _0x1aba8e = new Date(),
        _0x908239 = '[ Access Denied: ' + _0x1aba8e.toISOString() + ' ]'
      if (_0x45391c.code === 200) {
        _0x908239 = JSON.stringify(_0x45391c)
      }
      let _0x530c30 = document.getElementById('responseServer')
      _0x530c30.textContent = _0x908239
    })
  _0x1c8504.preventDefault()
}
const form = document.getElementById('loginForm')
form.addEventListener('submit', (_0x4b7692) => submitForm(_0x4b7692))

