let image_cropped = false;

// const PROJECT_DIR = "https://production.endpoint.com";
let PROJECT_DIR = "http://localhost/gw-design";

if (window?.location?.href?.indexOf("localhost") != -1) {
  PROJECT_DIR = "http://localhost/gw-design";
} else {
  PROJECT_DIR = "https://greenworld.munyathedev.com/posters/star-qualifier";
}

document.addEventListener("DOMContentLoaded", function () {
  setTimeout(() => {
    document.getElementById("page_loading").style.display = "none";
  }, 500);

  // INPUTS START HERE
  const imageInput = document.getElementById("imageInput");
  const full_name_input = document.getElementById("full_name_input");
  const user_email_input = document.getElementById("user_email_input");
  const contact_number_input = document.getElementById("contact_number_input");
  const promotion_star_level_input = document.getElementById(
    "promotion_star_level_input"
  );
  // INPUTS END HERE
  const page_loading = document.getElementById("page_loading");
  const previewUserImage = document.getElementById("previewUserImage");
  const previewUserImageContainer = document.getElementById(
    "previewUserImageContainer"
  );
  const upload_image_next_button = document.getElementById(
    "upload_image_next_button"
  );
  const uploadFormButton = document.getElementById("uploadFormButton");
  const details_next_button = document.getElementById("details_next_button");
  const changeUploadedImage = document.getElementById("changeUploadedImage");
  const uploadResult = document.getElementById("uploadResult");
  const uploadMessage = document.getElementById("uploadMessage");
  const imageDisplay = document.getElementById("imageDisplay");
  const processedImage = document.getElementById("processedImage");
  const downloadButton = document.getElementById("downloadButton");
  const changeUploadedImage_change = document.getElementById(
    "changeUploadedImage_change"
  );

  uploadFormButton.addEventListener("click", async function (event) {
    event.preventDefault();

    if (previewUserImage.src === "./assets/design/user-icon.svg") {
      showMessage("Can't use default profile picture.");
      return;
    }

    if (!validateInputs()) return validateInputs();

    const file = imageInput.files[0];
    if (!file) {
      showMessage("Please select an image file.");
      return;
    }

    if (file.size > 10 * 1024 * 1024) {
      showMessage("File size exceeds 10MB limit.");
      return;
    }

    if (!file.type.startsWith("image/")) {
      showMessage("Please upload an image file.");
      return;
    }

    const formData = new FormData();
    formData.append("image", file);
    formData.append("action", "create");
    formData.append("full_name_input", full_name_input.value);
    formData.append("user_email_input", user_email_input.value);
    formData.append("contact_number_input", contact_number_input.value);
    formData.append(
      "promotion_star_level_input",
      promotion_star_level_input.value
    );

    let tempResponse = null;

    page_loading.style.display = "flex";

    try {
      // Make API call to "/api/crop.php"
      const response = await fetch(PROJECT_DIR + "/api/crop.php", {
        method: "POST",
        body: formData,
      });

      tempResponse = response;

      // console.log("response", response);

      if (!response.ok) {
        throw new Error("Failed to upload image.");
      }

      const data = await response.json();
      // const data = await response.text();
      // console.log("data", data);
      // return false;

      if (data.success) {
        showSuccessMessage(data.message);
        if (data.imageData) {
          showProcessedImage(data.imageData);
        }
      } else {
        showMessage(data.message || "Failed to process image.");
      }
    } catch (error) {
      console.error("data >> ", tempResponse);
      showMessage("Error: " + error.message + JSON.stringify(tempResponse));
      page_loading.style.display = "none";
    }
  });

  imageInput.addEventListener("change", function (event) {
    //   console.log("imageInput", imageInput.value);

    const file = imageInput.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (event) {
        previewUserImage.src = event.target.result;
        previewUserImage.style.display = "block";
        //
        imageInput.style.display = "none";
        previewUserImageContainer.style.display = "flex";
        changeUploadedImage.style.display = "flex";
        uploadFormButton.style.display = "block";
      };
      reader.readAsDataURL(file);
    }
  });

  changeUploadedImage_change.addEventListener("click", function (event) {
    console.log("changeUploadedImage_change");
    previewUserImage.src = "./assets/design/user-icon.svg";
    imageInput.value = null;
    imageInput.style.display = "block";
    changeUploadedImage.style.display = "none";
    uploadFormButton.style.display = "none";
  });

  details_next_button.addEventListener("click", function (event) {
    if (!validateInputs()) return;
    document.getElementById("section_1").style.display = "none";
    document.getElementById("section_2").style.display = "flex";
  });

  upload_image_next_button.addEventListener("click", function (event) {
    if (!validateInputs()) return;
    document.getElementById("section_2").style.display = "none";
    document.getElementById("section_1").style.display = "flex";
  });

  function showMessage(message) {
    uploadResult.style.display = "flex";
    uploadMessage.textContent = message;
    imageDisplay.style.display = "none";
  }

  function showSuccessMessage(message) {
    showMessage(message);
  }

  function showProcessedImage(imageData) {
    // Convert base64 image data to blob
    const byteCharacters = atob(imageData);
    const byteNumbers = new Array(byteCharacters.length);
    for (let i = 0; i < byteCharacters.length; i++) {
      byteNumbers[i] = byteCharacters.charCodeAt(i);
    }
    const byteArray = new Uint8Array(byteNumbers);
    const blob = new Blob([byteArray], {
      type: "image/jpeg",
    });

    // Display the image
    const imageUrl = URL.createObjectURL(blob);
    imageDisplay.style.display = "flex";
    processedImage.src = imageUrl;
    processedImage.style.width = "320px";
    //
    document.getElementById("section_1").style.display = "none";
    document.getElementById("section_2").style.display = "none";

    // Update download link to allow downloading the image
    downloadButton.href = imageUrl;
    downloadButton.download = `munyathedev-${getFormattedDateTime()}.jpg`; // Set the name of the downloaded image file
    setTimeout(() => {
      page_loading.style.display = "none";
    }, 1000);
  }
});

function getFormattedDateTime() {
  const now = new Date();
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, "0");
  const day = String(now.getDate()).padStart(2, "0");
  const hours = String(now.getHours()).padStart(2, "0");
  const minutes = String(now.getMinutes()).padStart(2, "0");
  const seconds = String(now.getSeconds()).padStart(2, "0");
  return `${year}${month}${day}-${hours}${minutes}${seconds}`;
}

const validateInputs = () => {
  const formSubmitMessage = document.getElementById("formSubmitMessage");
  const full_name_input = document.getElementById("full_name_input");
  const user_email_input = document.getElementById("user_email_input");
  const contact_number_input = document.getElementById("contact_number_input");
  const promotion_star_level_input = document.getElementById(
    "promotion_star_level_input"
  );

  formSubmitMessage.style.color = "red";
  formSubmitMessage.style.fontWeight = "bold";

  if (full_name_input.value === "") {
    formSubmitMessage.textContent = "Please enter your full name.";
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
    alert("Please enter your full name.");
    return false;
  }

  if (user_email_input.value !== "") {
    if (!validateEmail(user_email_input.value)) {
      formSubmitMessage.textContent = "Please enter a valid email.";
      window.scrollTo({
        top: 0,
        behavior: "smooth",
      });
      alert("Please enter a valid email.");
      return false;
    }
  } else {
    formSubmitMessage.textContent = "Please enter your email.";
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
    alert("Please enter your email.");
    return false;
  }

  if (contact_number_input.value === "") {
    formSubmitMessage.textContent = "Please enter your contact number.";
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
    alert("Please enter your contact number.");
    return false;
  }

  if (
    promotion_star_level_input.value < 1 ||
    promotion_star_level_input.value > 8
  ) {
    formSubmitMessage.textContent =
      "Please enter your promotion star level between 1 and 8.";
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
    alert("Please enter your promotion star level between 1 and 8.");
    return false;
  }

  formSubmitMessage.style.color = "black";
  formSubmitMessage.style.textContent = "";
  return true;
};

const validateEmail = (email) => {
  const bool = String(email)
    .toLowerCase()
    .match(
      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    );
  if (!bool) {
    return false;
  }
  return true;
};
