<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

function CreateFinalImage(
    $imageWaterMark = false,
    $full_name = "",
    $user_email = "",
    $contact_number_input = "",
    $promotion_star_level = "",
    $uploadedFileName = "",
) {
    // Path to the base image and watermark image
    $baseImagePath = '../assets/templates/template-1.png';
    $watermarkImagePath = '../assets/user-images/2.jpg';

    // Load the base image
    $baseImage = imagecreatefrompng($baseImagePath);
    if (!$baseImage) {
        return ["baseImage" => $baseImage];
        die('Failed to load base image');
    }

    // Load the watermark image (convert to PNG format)
    $watermarkImage = null;
    if ($imageWaterMark) {
        $watermarkImage = $imageWaterMark;
    } else {
        $watermarkImage = imagecreatefromjpeg($watermarkImagePath);
    }

    if (!$watermarkImage) {
        return ["watermarkImage" => $watermarkImage];
        die('Failed to load watermark image');
    }

    // Get dimensions of the base image
    $baseWidth = imagesx($baseImage);
    $baseHeight = imagesy($baseImage);

    // Get dimensions of the watermark image
    $watermarkWidth = imagesx($watermarkImage);
    $watermarkHeight = imagesy($watermarkImage);

    // Create a temporary image to hold the merged result
    $mergedImage = imagecreatetruecolor($baseWidth, $baseHeight);

    // Merge the watermark image (first layer) onto the base image (second layer)
    imagecopy($mergedImage, $watermarkImage, 0, 68, -187, 0, $baseWidth, $baseHeight);
    imagecopy($mergedImage, $baseImage, 0, 0, 0, 0, $baseWidth, $baseHeight);

    // ==========================
    // TEXT 3 - CONTACT DETAILS
    // ========================== 


    // Allocate a color for the text
    $header3_textColor = imagecolorallocate($mergedImage, 0, 0, 0);

    // Check if the font file exists
    $header3_fontPath = '../assets/fonts/Arial Bold.ttf';
    if (!file_exists($header3_fontPath)) {
        http_response_code(500);
        echo json_encode(['failed' => false, 'message' => 'Font file not found.']);
        exit;
    }

    // Set the text to be added to the image
    $header3_text = $user_email . "  |  " . $contact_number_input;

    // Set the font size
    $header3_fontSize = 22;

    // Calculate the bounding box of the text
    $bbox = imagettfbbox($header3_fontSize, 0, $header3_fontPath, $header3_text);
    $textWidth = abs($bbox[4] - $bbox[0]);

    // Get the width of the image
    $imageWidth = imagesx($mergedImage);

    // Calculate the x coordinate for the text to be centered
    $header3_x = ($imageWidth - $textWidth) / 2;

    // Set the y coordinate where the text will be added
    $header3_y = 1166 + $header3_fontSize;

    // Add the text to the image
    if (!imagettftext($mergedImage, $header3_fontSize, 0, $header3_x, $header3_y, $header3_textColor, $header3_fontPath, $header3_text)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Failed to add text to image.']);
        exit;
    }


    // ==========================
    // TEXT 2 - START COUNT
    // ========================== 

    // Allocate a color for the text
    $header1_textColor = imagecolorallocate($mergedImage, 0, 0, 0);

    // Check if the font file exists
    $header1_fontPath = '../assets/fonts/Academy Engraved LET Fonts.ttf';
    if (!file_exists($header1_fontPath)) {
        http_response_code(500);
        echo json_encode(['failed' => false, 'message' => 'Font file not found.']);
        exit;
    }

    // Set the text to be added to the image
    $header1_text = $promotion_star_level;

    // Set the font size
    $header1_fontSize = 72;

    // Set the coordinates where the text will be added
    // Adjusting coordinates to ensure visibility
    $header1_x = strlen($header1_text) === 2 ? 295 : 340;
    $header1_y = 860 + $header1_fontSize;

    // Add the text to the image
    if (!imagettftext($mergedImage, $header1_fontSize, 0, $header1_x, $header1_y, $header1_textColor, $header1_fontPath, $header1_text)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Failed to add text to image.']);
        exit;
    }

    // ==========================
    // TEXT 1 - CONGRATULATIONS {NAME}
    // ========================== 

    // Allocate a color for the text
    $header2_textColor = imagecolorallocate($mergedImage, 0, 0, 0);

    // Check if the font file exists
    $header2_fontPath = '../assets/fonts/Arial Bold.ttf';
    if (!file_exists($header2_fontPath)) {
        http_response_code(500);
        echo json_encode(['failed' => false, 'message' => 'Font file not found.']);
        exit;
    }

    // Set the text to be added to the image
    $header2_text = $full_name . ' On Being Promoted To A';

    // Set the font size
    $header2_fontSize = 22;

    // Calculate the bounding box of the text
    $bbox = imagettfbbox($header2_fontSize, 0, $header2_fontPath, $header2_text);
    $textWidth = abs($bbox[4] - $bbox[0]);

    // Get the width of the image
    $imageWidth = imagesx($mergedImage);

    // Calculate the x coordinate for the text to be centered
    $header2_x = floor(($imageWidth - $textWidth) / 2);

    // Set the y coordinate where the text will be added
    $header2_y = 785 + $header2_fontSize;

    // Add the text to the image
    if (!imagettftext($mergedImage, $header2_fontSize, 0, $header2_x, $header2_y, $header2_textColor, $header2_fontPath, $header2_text)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Failed to add text to image.']);
        exit;
    }

    // ==========================
    // TEXT END
    // ========================== 



    // Generate a datetime string for the filename
    $img_name_datetime = $uploadedFileName;
    // $img_name_datetime = date('Ymd_His') . '.png'; // Format: YYYYMMDD_HHMMSS

    // Define the path to save the resulting image, including the datetime in the filename
    $resultImagePath = '../assets/created-images/' . $img_name_datetime;

    // log
    appendToJsonFile(
        $full_name,
        $user_email,
        $contact_number_input,
        $promotion_star_level,
        $img_name_datetime
    );

    // Save the resulting image as PNG
    $successful_image_save = false;
    if (imagepng($mergedImage, $resultImagePath)) {
        $successful_image_save = true;
    }

    // Free memory
    imagedestroy($baseImage);
    imagedestroy($watermarkImage);
    imagedestroy($mergedImage);

    if ($successful_image_save)
        return base64_encode(file_get_contents($resultImagePath));
    else
        return false;
}




function appendToJsonFile($full_name_input, $user_email_input, $contact_number_input, $promotion_star_level_input, $image_name)
{
    // Generate the datetime string
    $datetime = date('Ymd_His');

    // Create an array with the input data
    $new_entry = array(
        'full_name' => $full_name_input,
        'email' => $user_email_input,
        'contact_number' => $contact_number_input,
        'promotion_star_level' => $promotion_star_level_input,
        'image_name' => $image_name,
        'datetime' => $datetime
    );

    // Path to your JSON file
    $file_path = '../assets/data/user-data.json';

    // Check if the file exists
    if (!file_exists($file_path)) {
        // If the file does not exist, create it with an empty entries array
        file_put_contents($file_path, json_encode(array('entries' => array())));
    }

    // Read the current content of the JSON file
    $json_data = file_get_contents($file_path);

    // Decode the JSON data to an array
    $data = json_decode($json_data, true);

    // Append the new entry to the entries array
    $data['entries'][] = $new_entry;

    // Encode the data back to JSON
    $new_json_data = json_encode($data, JSON_PRETTY_PRINT);

    // Write the new JSON data back to the file
    file_put_contents($file_path, $new_json_data);

    // Return success message
    return "Data successfully appended to JSON file.";
}
