const url = 'https://jsonplaceholder.typiode.com/users/'

const withFetch = () => {
  fetch(url)
  .then(res => res.json())
  .then(data => console.log(data))
}
// responseServer
withFetch()
