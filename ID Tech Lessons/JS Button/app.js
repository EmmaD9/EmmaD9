const sound = new Audio('media/cymbals.mp3');

let tallyCount = document.getElementById("tally");

let tally = 0;

function playSound(){
    console.log("A sound is playing!");
    sound.play();
}

function addTally(){
    tally++;
    console.log("The tally: " + tally);
    tallyCount.innerHTML = tally;
}

function addNum(){
    let aNum = document.getElementById("aNum").value;
    let bNum = document.getElementById("bNum").value;

    console.log("aNum: " + aNum);
    console.log("bNum: " + bNum);

    let addedNum = parseInt(aNum) + parseInt(bNum);
    document.getElementById("addedNum").innerHTML = addedNum;
}

document.getElementById("sound-btn").addEventListener("click", playSound);

document.getElementById("tally-btn").addEventListener("click", addTally);

document.getElementById("add-btn").addEventListener("click", addNum);