const alphabet = [86, 70, 65]

// keep track of index outside of the event handler
var index = 0

// unattached event handler
function onKeyDownHandler(e) {
  const key = parseInt(e.detail || e.which)

  if (key === alphabet[index]) {
    index++

    if (index === alphabet.length) {
      alert("YOU DID IT!")
      index = 0
    }
  } else {
    index = 0
  }
}
