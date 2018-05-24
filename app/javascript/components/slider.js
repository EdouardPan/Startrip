
var slider1 = document.getElementById("myWaterRange");
var output1 = document.getElementById("waterDemo");


if (slider1){

  output1.innerHTML = slider1.value; // Display the default slider value

  // Update the current slider value (each time you drag the slider handle)
  slider1.oninput = function PrettySlider() {
      output1.innerHTML = this.value;
  }

  var slider2 = document.getElementById("myBreathabilityRange");
  var output2 = document.getElementById("breathabilityDemo");
  output2.innerHTML = slider2.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    slider2.oninput = function PrettySlider() {
        output2.innerHTML = this.value;
    }

  var slider3 = document.getElementById("myAsteroidAttackRange");
  var output3 = document.getElementById("myAsteroidAttackdemo");
  output3.innerHTML = slider3.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    slider3.oninput = function PrettySlider() {
        output3.innerHTML = this.value;
    }
}
