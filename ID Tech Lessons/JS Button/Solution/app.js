//SOLUTION

//this variable is a constant
const sound = new Audio('media/cymbals.mp3');

let tallyCount = document.getElementById("tally");

//we say this is "let" because we'll change it later on
let tally = 0;

function playSound(){
    //Sound effect by freesound_community from Pixabay

    //console.log is a good function for debugging and just testing your JS logic
    console.log("A sound is playing!");

    sound.play();
}

function addTally(){
    tally++;

    //console.log is a good function for debugging and just testing your JS logic
    console.log("The tally: " + tally);

    tallyCount.innerHTML = tally;

}


function addNum(){

    let aNum = parseInt(document.getElementById("aNum").value);
    console.log("The first num is " + aNum);

    let bNum = parseInt(document.getElementById("bNum").value);
    console.log("The second num is " + bNum);


    //formula for inclusive random
    let addedNum = aNum + bNum;

    document.getElementById("addedNum").innerHTML = addedNum;

}


//these find the button by the id label, and on the click calls a function
//these must come after the functions are defined, otherwise JS won't know how to compile

document.getElementById("sound-btn").addEventListener("click", playSound);

document.getElementById("tally-btn").addEventListener("click", addTally);

document.getElementById("add-btn").addEventListener("click", addNum);