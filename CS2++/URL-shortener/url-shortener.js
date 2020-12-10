// URL shortener interview question

const TEST_URL = "https://mlb.com";
let short_urls_hash = {};

// generate new 6-digit code
function generateRandomLetter() {
  const alphabet = "abcdefghijklmnopqrstuvwxyz";

  return alphabet[Math.floor(Math.random() * alphabet.length)];
}

function addURLToHash(url) {
  let code = "";

  for (let x = 0; x < 3; x++) {
    code += generateRandomLetter();
    code += String(Math.floor(Math.random()*10));
  }

  if (!(code in short_urls_hash)){
    short_urls_hash[code] = url;
  } else {
    console.log("code is already there");
    //addURLToHash(url);
  }
  console.log(short_urls_hash);
}

// Get the info from webpage
let submit_button = document.getElementById("Submit");
let text_input = document.getElementById("OG-URL")

//submit_button.onclick = addURLToHash(text_input.value);
submit_button.addEventListener("click", addURLToHash(text_input.value));

addURLToHash(TEST_URL)
addURLToHash(TEST_URL)

