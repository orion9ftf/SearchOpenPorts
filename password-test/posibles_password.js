function generateCombinations() {
  const letters = ['a', 'b', 'c', 'd'];
  const digits = ['0', '1', '2', '3'];
  const combinations = [];

  for (let i = 0; i < letters.length; i++) {
      for (let j = 0; j < letters.length; j++) {
          for (let k = 0; k < letters.length; k++) {
              for (let l = 0; l < digits.length; l++) {
                  for (let m = 0; m < digits.length; m++) {
                      for (let n = 0; n < digits.length; n++) {
                          const password = letters[i] + letters[j] + letters[k] + digits[l] + digits[m] + digits[n];
                          combinations.push(password);
                      }
                  }
              }
          }
      }
  }

  return combinations;
}

const allCombinations = generateCombinations();
allCombinations.forEach(combination => console.log(combination));
console.log(`Total combinations: ${allCombinations.length}`);
