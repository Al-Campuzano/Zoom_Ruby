// better version after the first 70 minutes elapsed 
// URL shortener interview question

query_string = location.search.slice(1);
if (query_string in localStorage) {
  window.location.replace(localStorage[query_string]);
}

// generate new 6-digit code
function generateRandomLetter() {
  const alphabet = "abcdefghijklmnopqrstuvwxyz";

  return alphabet[Math.floor(Math.random() * alphabet.length)];
}

function displayNewURL(code) {
  let newURL = location.origin + location.pathname + "?" + code;
  let response_el = document.getElementById("Response");

  let para = document.createElement("a");
  let node = document.createTextNode(newURL);
  para.href = newURL;

  para.appendChild(node);
  response_el.innerHTML = "";
  response_el.parentElement.style.display = "block";
  response_el.appendChild(para);
}

function createRandomCode(pairs = 3) {
  let code = "";

  for (let x = 0; x < pairs; x++) {
    code += generateRandomLetter();
    code += String(Math.floor(Math.random()*10));
  }

  return code;
}

function addURLToHash(url) {
  code = createRandomCode();  

  if (!(code in localStorage)){
    localStorage[code] = url;
  } else { // code is already in hash
    console.log("Code already there");
    addURLToHash(url);
  }
  displayNewURL(code)
  console.log(localStorage);
}

function addURLToHashWrapper() {
  addURLToHash(document.getElementById("OG-URL").value)
}

// Get the info from webpage
let submit_button = document.getElementById("Submit");
submit_button.addEventListener("click", addURLToHashWrapper);
