/**
 * @license
 * Copyright 2019 Google LLC. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */
 
function sendReport(panorama){
  console.log(panorama.getPosition()); 
  // 1. Capture the canvas as a data URL.
  var canvas = document.getElementsByClassName('mapsConsumerUiSceneInternalCoreScene__canvas widget-scene-canvas')[0];
  var dataUrl = canvas.toDataURL('image/jpeg');
  
  // 2. Convert the data URL to a Blob.
  fetch(dataUrl)
      .then(res => res.blob())
      .then(blob => {
          // 3. Use the Fetch API to send the Blob as a POST request.
          var formData = new FormData();
          formData.append('image', blob, 'canvas.jpg');
  
          fetch('https://ae41-165-225-106-171.ngrok-free.app/predict', {
              method: 'POST',
              body: formData
          })
          .then(r => r.json())
          .then(r => {
             alert(r.class_with_highest_probability + "\n" + r.class_with_second_highest_probability) // You will get JSON response here.
  }).catch(error => console.error('Error', error))
      });
  }
  function createCenterControl(map, panorama) {
    const controlButton = document.createElement("button");
  
    // Set CSS for the control.
    controlButton.style.backgroundColor = "#fff";
    controlButton.style.border = "2px solid #fff";
    controlButton.style.borderRadius = "4px";
    controlButton.style.boxShadow = "0 2px 6px rgba(0,0,0,.3)";
    controlButton.style.color = "rgb(25,25,25)";
    controlButton.style.cursor = "pointer";
    controlButton.style.fontFamily = "Roboto,Arial,sans-serif";
    controlButton.style.fontSize = "16px";
    controlButton.style.lineHeight = "38px";
    controlButton.style.margin = "8px 0 22px";
    controlButton.style.padding = "0 5px";
    controlButton.style.textAlign = "center";
    controlButton.textContent = "Send Report";
    controlButton.title = "Click to report issue";
    controlButton.type = "button";
    // Setup the click event listeners: simply set the map to Chicago.
    controlButton.addEventListener("click", () => {
      sendReport(panorama);
    });
    return controlButton;
  } 
   
  function initialize() {
    const fenway = { lat: 12.9716, lng: 77.5946 };
    const map = new google.maps.Map(document.getElementById("map"), {
      center: fenway,
      zoom: 14,
    });
    const panorama = new google.maps.StreetViewPanorama(
      document.getElementById("pano"),
      {
        position: fenway,
        pov: {
          heading: 34,
          pitch: 10,
        },
      }
    );
  
    map.setStreetView(panorama);
    // Create the DIV to hold the control.
    const centerControlDiv = document.createElement("div");
    // Create the control.
    const centerControl = createCenterControl(map, panorama);
  
    // Append the control to the DIV.
    centerControlDiv.appendChild(centerControl);
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);
  }
  
  window.initialize = initialize;
  