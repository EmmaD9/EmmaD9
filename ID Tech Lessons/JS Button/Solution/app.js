function playSound(){
    const sound = new Audio('Media/cymbals.mp3');
    sound.play();
}

Document.getElementById("sound-btn").addEventListener("click", playSound);