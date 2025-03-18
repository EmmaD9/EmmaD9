function playSound(){
    const sound = new Audio('media/cymbals.mp3');
    //Sound effect by freesound_community from Pixabay
    sound.play();
}

function changeColor(){
    const colorButton = document.getElementById("color-btn");
    
    colorButton.style.background = '#0027ff';
}

document.getElementById("sound-btn").addEventListener("click", playSound);

document.getElementById("color-btn").addEventListener("click", changeColor);