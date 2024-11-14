<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once("./template-1.php");

// Check if a file was uploaded
if ($_FILES['image']['error'] === UPLOAD_ERR_OK) {

    $user_email_input = "{Email}";
    $promotion_star_level_input = 1;
    $full_name_input = "{Full Name}";
    $contact_number_input = '{contact_number_input}';

    if (
        isset($_POST['full_name_input']) && !empty($_POST['full_name_input']) &&
        isset($_POST['user_email_input']) && !empty($_POST['user_email_input']) &&
        isset($_POST['contact_number_input']) && !empty($_POST['contact_number_input']) &&
        isset($_POST['promotion_star_level_input']) && !empty($_POST['promotion_star_level_input'])
    ) {
        $full_name_input = $_POST['full_name_input'];
        $user_email_input = $_POST['user_email_input'];
        $contact_number_input = $_POST['contact_number_input'];
        $promotion_star_level_input = $_POST['promotion_star_level_input'];
    }

    // Validate file type
    $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    $fileType = $_FILES['image']['type'];
    if (!in_array($fileType, $allowedTypes)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Only JPEG, PNG, and GIF images are allowed.']);
        exit;
    }

    // Set upload directory and file path
    $uploadDir = '../assets/created-images/'; // Adjust the directory path as per your server configuration
    $uploadedFile = $uploadDir . basename($_FILES['image']['name']);

    // Move uploaded file to upload directory
    if (!move_uploaded_file($_FILES['image']['tmp_name'], $uploadedFile)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Failed to move uploaded file.']);
        exit;
    }

    // Process the uploaded image
    $imagePath = $uploadedFile;

    // Get image dimensions            
    list($width, $height, $type) = getimagesize($imagePath);

    // Calculate cropping dimensions for 1:1 aspect ratio
    $size = min($width, $height);
    $x = (int)(($width - $size) / 2); // Cast to int to avoid precision warning
    $y = (int)(($height - $size) / 2); // Cast to int to avoid precision warning

    // Create a square canvas
    $canvas = imagecreatetruecolor(570, 570);

    // Determine image type and create image resource
    switch ($type) {
        case IMAGETYPE_JPEG:
            $source = imagecreatefromjpeg($imagePath);
            break;
        case IMAGETYPE_PNG:
            $source = imagecreatefrompng($imagePath);
            break;
        case IMAGETYPE_GIF:
            $source = imagecreatefromgif($imagePath);
            break;
        default:
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Unsupported image type.']);
            exit;
    }

    // Crop and resize the image
    if (!imagecopyresampled($canvas, $source, 0, 0, $x, $y, 570, 570, $size, $size)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Failed to resize image.']);
        exit;
    }

    // Output resized image to a temporary file
    $tempFile = tempnam(sys_get_temp_dir(), 'cropped_image_');
    if (!imagejpeg($canvas, $tempFile, 90)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Failed to save resized image.']);
        exit;
    }

    // http_response_code(500);
    if (isset($_POST['action']) && !empty($_POST['action'])) {
        if ($_POST['action'] === "create") {

            $mergedImage = CreateFinalImage(
                $canvas,
                $full_name_input,
                $user_email_input,
                $contact_number_input,
                $promotion_star_level_input
            );


            header('Content-Type: application/json');
            echo json_encode(['success' => true, 'message' => 'Image processed successfully.', 'imageData' => $mergedImage]);

            // Clean up resources
            imagedestroy($source);
            imagedestroy($canvas);
            die();
        }
    }

    // Clean up resources
    imagedestroy($source);
    imagedestroy($canvas);

    // Output image data as base64
    $imageData = base64_encode(file_get_contents($tempFile));

    // Send the processed image data back as response
    header('Content-Type: application/json');
    echo json_encode(['success' => true, 'message' => 'Image processed successfully.', 'imageData' => $imageData]);

    // Clean up temporary files if needed
    unlink($uploadedFile);
    unlink($tempFile);
} else {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Failed to upload file.']);
    exit;
}

