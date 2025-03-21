const sound = new Audio('media/cymbals.mp3');
//freesound_community from pixabay

let tallyCount = document.getElementById("tally");
let tally = 0;

function playSound(){
    console.log("A sound is playing!");

    sound.play();
}

function addTally(){
    tally++;

    console.log("the tally: " + tally);

    tallyCount.innerHTML = tally;
    console.log("the tallyCount inner html: " + tallyCount.innerHtml);
}

function addNum(){
    let aNum = parseInt(document.getElementById("aNum").value);
    console.log("the first num is " + aNum);

    let bNum = parseInt(document.getElementById("bNum").value);
    console.log("the second num is " + bNum);

    let addedNum = aNum + bNum;

    document.getElementById("addedNum").innerHTML = addedNum;
}

document.getElementById("sound-btn").addEventListener("click", playSound);

document.getElementById("tally-btn").addEventListener("click", addTally);

document.getElementById("add-btn").addEventListener("click", addNum);