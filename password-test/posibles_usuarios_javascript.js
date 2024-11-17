function generateCombinations(pattern, maxLength) {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  let combinations = [];

  function helper(prefix) {
      if (prefix.length <= maxLength) {
          if (prefix.length > 0) {
              combinations.push(prefix);
          }
          if (prefix.length < maxLength) {
              for (let i = 0; i < chars.length; i++) {
                  helper(prefix + chars[i]);
              }
          }
      }
  }

  helper('');
  return combinations;
}

const pattern = '^[a-zA-Z0-9]{1,10}$';
const maxLength = 3;  // Puedes cambiar esto a 10, pero ten en cuenta la advertencia anterior
const allCombinations = generateCombinations(pattern, maxLength);

// Imprimir solo las primeras 100 combinaciones para evitar sobrecargar la consola
for (let i = 0; i < Math.min(allCombinations.length, 100); i++) {
  console.log(allCombinations[i]);
}

allCombinations.forEach(combination => console.log(combination));
console.log(`Total combinations (up to length ${maxLength}): ${allCombinations.length}`);
