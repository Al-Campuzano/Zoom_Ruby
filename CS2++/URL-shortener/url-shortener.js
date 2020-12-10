// URL shortener interview question

const TEST_URL = "https://mlb.com";
let short_urls_hash = {};

// generate new 6-digit code
function generateRandomLetter() {
  const alphabet = "abcdefghijklmnopqrstuvwxyz";

  return alphabet[Math.floor(Math.random() * alphabet.length)];
}

function displayNewURL(code) {
  let newURL = location.origin + location.pathname + "?" + code;
  let response_el = document.getElementById("Response");

  let para = document.createElement("a");
  let node = document.createTextNode("Your new shorter URL is: " + newURL);
  para.href = newURL;

  para.appendChild(node);
  response_el.innerHTML = "";
  response_el.appendChild(para);
}

function addURLToHash(url) {
  let code = "";

  for (let x = 0; x < 3; x++) {
    code += generateRandomLetter();
    code += String(Math.floor(Math.random()*10));
  }

  if (!(code in short_urls_hash)){
    short_urls_hash[code] = url;
  } else { // code is already in hash
    addURLToHash(url);
  }
  displayNewURL(code)
  console.log(short_urls_hash);
}

function addURLToHashWrapper() {
  addURLToHash(document.getElementById("OG-URL").value)
}

// Get the info from webpage
let submit_button = document.getElementById("Submit");

submit_button.addEventListener("click", addURLToHashWrapper);

addURLToHash(TEST_URL)
addURLToHash(TEST_URL)

