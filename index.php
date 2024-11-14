<?php
// $PROJECT_DIR = "https://munyathedev.co.za/gw-design";
$PROJECT_DIR = "http://localhost/gw-design";
?>

<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>GW Designer</title>

  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" />
</head>

<body>
  <div class="page_loading_class" id="page_loading">
    <div class="loader"></div>
  </div>
  <nav class="nav_parent">
    <!-- <h4>Greenworld Poster Maker</h4> -->
    <div style="width: 100%; background-color: white; max-height: 30px">
      <a href=<?php echo $PROJECT_DIR; ?>>
        <img src="./assets/design/logo.svg" style="height: 30px" alt="GW Designer Logo" />
      </a>
    </div>
    <div class="footer_social_media_links_container">
      <div class="footer_social_media_links_parent">
        <span class="footer_author" style="margin: 0px 5px 0px 10px">
          <a href="https://munya-dev.vercel.app/" target="_blank" style="text-decoration: none; color: white !important">
            <b>by Munya The Dev</b>
          </a>
        </span>
        <div class="footer_social_media_links" style="margin-right: 10px">
          <span>
            <a href="https://www.instagram.com/munyadesign_/" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-instagram"></i></a>
          </span>
          <span>
            <a href="https://www.facebook.com/MunyaDesign" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-facebook"></i></a>
          </span>
          <span>
            <a href="https://play.google.com/store/apps/dev?id=9171087412603231862" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-google"></i></a>
          </span>
          <span>
            <a href="https://www.tiktok.com/@munyathedev" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-tiktok"></i></a>
          </span>
        </div>
      </div>
    </div>
  </nav>

  <main class="app_parent">
    <main class="app_container">
      <section id="section_1">
        <h2 style="padding: 0px 30px; text-align: center;">Enter Your Details For The Poster</h2>
        <p id="formSubmitMessage"></p>
        <label class="text_input_label_1" for="full_name_input">Full Name</label>
        <input type="text" class="text_input_1" id="full_name_input" name="full_name_input" placeholder="Full Name" />
        <br />
        <br />
        <label class="text_input_label_1" for="user_email_input">Email</label>
        <input type="email" class="text_input_1" id="user_email_input" name="user_email_input" placeholder="Email" />
        <br />
        <br />
        <label class="text_input_label_1" for="contact_number_input">Contact Number</label>
        <input type="text" class="text_input_1" id="contact_number_input" name="contact_number_input" placeholder="Contact Number" />
        <br />
        <br />
        <label class="text_input_label_1" for="contact_number_input">Number of Star you've been promoted to.</label>
        <input type="number" class="text_input_1" id="promotion_star_level_input" name="promotion_star_level_input" placeholder="1" value="1" min="1" max="8" />
        <br />
        <button type="submit" id="details_next_button">Next</button>
      </section>
      <section id="section_2">

        <h2>Upload Your Image</h2>

        <span class="text_input_label_1" style="text-align: center">Choose a square or 1:1 ratio image.</span>

        <form id="uploadForm" enctype="multipart/form-data">
          <input type="file" id="imageInput" accept="image/*" style="width: 70%" class="upload_form_file_input" />
          <div id="changeUploadedImage">
            <br />
            <span id="changeUploadedImage_thisishow">This is how your image will be cropped</span>
            <div id="changeUploadedImage_change">
              Change Uploaded Image?
            </div>
          </div>
        </form>
        <br />
        <div id="previewUserImageContainer">
          <img src="./assets/design/user-icon.svg" id="previewUserImage" alt="Preview Image" style="max-width: 330px" />
        </div>
        <div class="row_center_align">
          <button type="submit" id="upload_image_next_button" style="margin-right: 10px; background-color: #7e7e7e">Back</button>
          <button type="submit" id="uploadFormButton">Upload Image</button>
        </div>

      </section>

      <div id="uploadResult" style="display: none">
        <h3 style="margin-bottom: 0px;">Get Your Poster</h3>
        <p id="uploadMessage"></p>
        <div id="imageDisplay" style="display: none">
          <img id="processedImage" src="" alt="Processed Image" />
          <a id="downloadButton" href="#" download>
            <div class="downloadButtonStyle">
              Download Image
            </div>
          </a>

          <a href=<?php echo $PROJECT_DIR; ?>>
            <button type="submit" id="create_another_button" style="background-color: #266a11; margin: 0px; animation: colorShift 1s infinite alternate; color: black; cursor: pointer; border: 0px">
              Create Another Poster
            </button>
          </a>

          <br />
          <button type="submit" id="uploadFormButton">Upload Image</button>
        </div>
      </div>
    </main>
    <br />
    <br />

    <div class="footer_social_media_links_container">
      <div class="footer_social_media_links_parent">
        <span class="footer_author" style="margin: 0px 5px 0px 10px">
          <a href="https://munya-dev.vercel.app/" target="_blank" style="text-decoration: none; color: white !important">
            <b>Munya The Dev</b>
          </a>
        </span>
        <div class="footer_social_media_links" style="margin-right: 10px">
          <span>
            <a href="https://www.instagram.com/munyadesign_/" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-instagram"></i></a>
          </span>
          <span>
            <a href="https://www.facebook.com/MunyaDesign" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-facebook"></i></a>
          </span>
          <span>
            <a href="https://play.google.com/store/apps/dev?id=9171087412603231862" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-google"></i></a>
          </span>
          <span>
            <a href="https://www.tiktok.com/@munyathedev" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-tiktok"></i></a>
          </span>
        </div>
      </div>
    </div>
  </main>

  <!-- JAVASCRIPT -->
  <script type="text/javascript" src="js/script.js"></script>
</body>

</html>