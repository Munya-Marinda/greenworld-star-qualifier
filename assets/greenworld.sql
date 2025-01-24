-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 24, 2025 at 07:10 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greenworld`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `price` text,
  `categories_text` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `title`, `price`, `categories_text`, `description`) VALUES
(1, 'https://img.munyathedev.com/greenworld_product_images/2ac32d8a3f790b9237818b3fd11bdbc4.jpeg', 'Kidney Tonifying Capsule (Women)', '585.99', '[\"Bone &amp; Joint Care\",\"Female Care\",\"Female Fertility Care\"]', '<p>It strengthens kidney and boosts immunity</p>'),
(2, 'https://img.munyathedev.com/greenworld_product_images/48f80a7702322645cc8c376c6152fc52.jpeg', 'NMN Longevity Capsules', '3071.00', '[\"Bone &amp; Joint Care\",\"Circulatory Care\",\"Skin Care\"]', '<p>NMN&nbsp;(nicotinamide mononucleotide) is currently one of the most researched and popular substances to slow down aging.<br> NMN is a substance that occurs naturally in our body.<br> NMN is a precursor to NAD+. NAD+ is a very important molecule for every cell in our body.<br> NAD+ is a substance that countless enzymes and proteins need to carry out their function.<br> For example, NAD+ is required for proper repair and maintenance of our DNA and epigenome (by enzymes like sirtuins and PARPs) (R).<br> What are some of the effects of NMN?</p>'),
(3, 'https://img.munyathedev.com/greenworld_product_images/55efd6cc08caec28b98458daa2485de9.png', 'Deep Sea Fish Oil Capsule', '488.00', '[\"Bone &amp; Joint Care\",\"Brain Care\",\"Cancer Care\",\"Circulatory Care\",\"Slimming Care\"]', '<p>Provides essential fatty acids; prevents cerebra- or cardiovascular diseases.</p>'),
(4, 'https://img.munyathedev.com/greenworld_product_images/58ca3e89aab2850d618c2388f12c3257.png', 'Compound Marrow Powder', '507.00', '[\"Bone &amp; Joint Care\",\"Brain Care\"]', '<p>It improves hematopoietic function, enhances memory and improves osteoporosis.</p>'),
(5, 'https://img.munyathedev.com/greenworld_product_images/5b42b7c377f432dc44a40bf657bf565c.jpeg', 'Danshen Combo Capsule', '371.00', '[\"Bone &amp; Joint Care\",\"Brain Care\",\"Circulatory Care\",\"Immune Care\",\"Nutrition Care\"]', '<p>It prevents thrombosis and myocardial damage, which can be used for atherosclerosis, angina pectoris or myocardial atrophy.</p>'),
(6, 'https://img.munyathedev.com/greenworld_product_images/6faa3b0c93b237b39471250f424a677e.jpeg', 'Kidney Tonifying Capsule (Men)', '585.00', '[\"Bone &amp; Joint Care\",\"Male Care\",\"Male Fertility Care\"]', '<p>It restores and enhances the detoxification and other functions of the kidney.</p>'),
(7, 'https://img.munyathedev.com/greenworld_product_images/a79028d23f7e1062a67d5332558ba361.png', 'COMPOUND CALCIUM NUTRIENT POWDER WITH BLOOD SUGAR', '430.00', '[\"Bone &amp; Joint Care\",\"Circulatory Care\",\"Skin Care\"]', '<p>Health Benefits:<br> 1. Supplement calcium<br> 2. Prevent &amp; alleviate osteoporosis.<br> 3. Increase bone density &amp; improve bone remodeling.<br> 4. Improve joint health<br> 5. Support growth &amp; development of children<br> Suitable for:<br> Adults with calcium deficiency<br> Women who want to prevent osteoporosis and/or arthritis<br> Men who want to strengthen bones &amp; joints<br> Adults with joint disorders<br> Pregnant women &amp; nursing mothers<br> Women after menopause<br> Men after 60 , Children,Adolescents<br> 1-2 sachet(s) each day<br> COMPOUND CALCIUM Nutrient Powder<br> Adults/Children</p>'),
(8, 'https://img.munyathedev.com/greenworld_product_images/c36db64bdc5818010facc7605a0576e9.jpeg', 'Joint Health Plus Capsule / Arthropower', '546.00', '[\"Bone &amp; Joint Care\"]', '<p>It helps alleviate the inflammation of the joints and muscles.</p>'),
(9, 'https://img.munyathedev.com/greenworld_product_images/ec2b1c8135cdb0d76c43e49d28b97444.png', 'Calcium Capsule', '317.00', '[\"Bone &amp; Joint Care\",\"Nutrition Care\"]', '<p>It supplements calcium and helps prevent osteoporosis.</p>'),
(10, 'https://img.munyathedev.com/greenworld_product_images/f1c9040923135ce94993bf0f48db9adf.png', 'Lecithin Capsule', '390.00', '[\"Bone &amp; Joint Care\",\"Cancer Care\"]', '<p>It improves intelligence, enhances memory, prevents senile dementia, nourishes skin and enhances beauty.</p>'),
(11, 'https://img.munyathedev.com/greenworld_product_images/084736c24b6dd4f6ac162b782b520645.png', 'Soy Power Capsule', '351.00', '[\"Female Care\",\"Female Fertility Care\"]', '<p>It prevents ovarian dysfunction, osteoporosis, breast hyperplasia and delays aging.</p>'),
(12, 'https://img.munyathedev.com/greenworld_product_images/11708148b9468da7b17c09219679b525.png', 'Balsam Pear Tea', '254.00', '[\"Diabetes Care\",\"Digestive Care\"]', '<p>It improves type 2 diabetes with its hypoglycaemic effect.</p>'),
(13, 'https://img.munyathedev.com/greenworld_product_images/170401abd86044e7cae74f15a6f2b311.jpeg', 'Ginkgo Biloba Capsule', '439.00', '[\"Brain Care\"]', '<p>It lowers the blood cholesterol, improves memory, counteracts the tissue damage due to anoxia and iron-deficiency, as well as delays aging.</p>'),
(14, 'https://img.munyathedev.com/greenworld_product_images/1854b2e939a06b79e92ef98358beebca0.jpg', 'Ovary Nutrition Capsule', '468.00', '[\"Female Care\"]', '<p>Brief： It regulates the estrogen level in two ways; relieves the symptoms of menopause; maintains vitality and delays aging.</p>'),
(15, 'https://img.munyathedev.com/greenworld_product_images/1947371cffda10db658cc00e53620f24.jpeg', 'Royal Jelly Capsule', '362.00', '[\"Female Care\",\"Female Fertility Care\",\"Male Care\",\"Male Fertility Care\",\"Skin Care\"]', '<p>It regulates the endocrine system, improves immunity and delays aging.</p>'),
(16, 'https://img.munyathedev.com/greenworld_product_images/25dce7145cafafcbb9c2b4f9f176e817.jpeg', 'Jinpure Tea', '254.00', '[\"Cancer Care\",\"Circulatory Care\",\"Immune Care\",\"Nutrition Care\"]', '<p>Jinpure tea stimulates the body’s defence mechanisms and increases the immune system’s general resistance, preventing virus breeding.<br> they are also suitable for mitigating various viral diseases, acting as antipyretic, antimicrobial and detoxifying agents.<br> Additionally, improve pulmonary ventilation, and help to improve slime and lung mucus.<br> in addition, they accelerate the body’s recovery after a number of illnesses and SVID-19 is no exception.<br> Jinpure capsule assists with<br> Flu<br> Cough<br> Closed Nose<br> Fever<br> High Temperature- viruses<br> Allergic reactions<br> Pain in the throat<br> chest Pain</p>'),
(17, 'https://img.munyathedev.com/greenworld_product_images/28e8d405af3ce57faa37a2cd9d0d7204.png', 'Pro-Slim Tea', '234.00', '[\"Slimming Care\"]', '<p>It accelerates the break-down of fat, reduces fat deposit, removes toxins and assists in weight loss.</p>'),
(18, 'https://img.munyathedev.com/greenworld_product_images/34770a6fb3bdf47ca986e41b0de8aab2.png', 'Blueberry Slimming Body Healthy Shake', '605.00', '[\"Slimming Care\"]', '<p>Benefits:<br> -A meal replacement for carbs food<br> _Replenish essential nutrients during the weight loss program<br> _Courteract free radicals generated during a detox program<br> _Rich in vitamins, provide efficient nutrients on a daily basis</p>'),
(19, 'https://img.munyathedev.com/greenworld_product_images/398b0851522ccd80e135d4dac04973cf.png', 'Ginseng RHs Capsule', '741.00', '[\"Cancer Care\",\"Immune Care\",\"Male Fertility Care\"]', '<p>Green World Ginseng RHs Capsule enhances the human body’s endurance to fatigue, improves immunity and counteracts tumour or cancer.</p>'),
(20, 'https://img.munyathedev.com/greenworld_product_images/3a96de2ba7b1d9954fd90837e678598.png', 'Slimming Capsule', '546.00', '[\"Immune Care\",\"Nutrition Care\",\"Skin Care\",\"Slimming Care\"]', '<p>1. Accelerates metabolism rate and breakdown of fat.<br> 2. Decreases the intake of calories by suppressing appetite<br> Suitable for:<br> For those on weight control program.<br> For those with elevated blood lipid.<br> For those with obesity.<br> 1-2 capsules each time, once in a day.</p>'),
(21, 'https://img.munyathedev.com/greenworld_product_images/3d4653b37599823677c87fdb26229133.png', 'HepatSure Capsule', '507.00', '[\"Detox Care\",\"Digestive Care\"]', '<p>Alleviates symptoms of acute and chronic hepatitis, fatty liver and liver cirrhosis;<br> Strengthens liver functions; promotes bile secretion and flow; reduces liver cell inflammation;<br> Prevents damage of liver cells by alcohol, chemical-heavy metal, medicine, toxins, the intoxication of food and environmental pollutants;<br> Promotes the regeneration and repair of liver cells.</p>'),
(22, 'https://img.munyathedev.com/greenworld_product_images/3d7767bc19db222c7bf528dc33453bac.png', 'Pine Pollen Tea', '274.00', '[\"Female Care\",\"Male Care\",\"Skin Care\"]', '<p>Adjust gastrointestinal functions; improve digestion; delay aging and alleviate fatigue.</p>'),
(23, 'https://img.munyathedev.com/greenworld_product_images/3db14635e895e5c86540e1bec2c68c64.jpeg', 'Clear Cjj Fresh Drink', '195.00', '[\"Detox Care\",\"Slimming Care\"]', '<p>Brief:it helps the colon detoxification and creates a friendly environment in large intestine for a balanced intestinal flora</p>'),
(24, 'https://img.munyathedev.com/greenworld_product_images/48e9359a70101cf7f01529efe25240b3.png', 'Glucoblock Capsule', '351.00', '[\"Diabetes Care\",\"Digestive Care\"]', '<p>It regulates the blood sugar level.</p>'),
(25, 'https://img.munyathedev.com/greenworld_product_images/48f771288825fb63a2ab01febdbaceb0.png', 'Uterus Cleansing Pill', '624.00', '[\"Female Care\",\"Female Fertility Care\"]', '<p>The Green World Uterus Cleansing Pill is a product that brings great benefits to its users (women). Women are usually vulnerable to many gynaecological illnesses associated with the anatomical and physiological characteristics of their bodies. The pill is able to instantly relieve the burning, stinging, rawness, irritation and pain of female private parts. It also gradually alleviates the chronic, inflammatory conditions such as vulvitis, vaginitis, cervical erosion, endometritis, salpingitis and pelvic infection.</p>'),
(26, 'https://img.munyathedev.com/greenworld_product_images/4cd3988c546e07cb2b5979b4fe28e7cb.jpeg', 'Sanitary Napkin Extra Length', '100.00', '[\"Female Care\"]', '<p>SMILIFE Sanitary Napkin-Your personal nursing specialist during menstruation</p>'),
(27, 'https://img.munyathedev.com/greenworld_product_images/4f2751f395ddd8df7b04666410d44dda.png', 'Clear Lung Tea', '273.00', '[\"Cancer Care\",\"Circulatory Care\",\"Immune Care\"]', '<p>It helps expel the harmful substances together with the sputum from the lungs and enhances the lungs’ immunity.<br> Details<br> The lung is an organ responsible for ventilation and gas exchange, a vital function to maintaining life. Air pollution leads to various harmful substances depositing in lung tissues with every breath we take, which, causes a series of respiratory diseases. Green World Clear Lung Tea can enhance lungs’ detoxification by expelling the harmful substances inhaled into the lungs. It may boost the immunity of the lungs and give them a thorough cleansing by expelling the harmful substances together with the sputum.</p>'),
(28, 'https://img.munyathedev.com/greenworld_product_images/616889310fb26bcf45aa970c1416a352.png', 'Breast Care Tea', '293.00', '[\"Cancer Care\",\"Female Care\"]', '<p>For prevention and alleviation of breast disorders such as hyperplasia of mammary glands and breast tumor.</p>'),
(29, 'https://img.munyathedev.com/greenworld_product_images/63286723ad43239bc0cc5647b74bd87b.png', 'Sanitary Napkin for Night Use', '100.00', '[\"Female Care\"]', '<p>SMILIFE Sanitary Napkin-Your personal nursing specialist during menstruation</p>'),
(30, 'https://greenworldsa.co.za/wp-content/uploads/2024/04/WhatsApp-Image-2024-04-11-at-7.18.56-PM-1-600x600.jpeg', 'Sanitary Napkin for the Day Use', '50.00', '[\"Female Care\"]', '<p>SMILIFE Sanitary Napkin-Your personal nursing specialist during menstruation</p>'),
(31, 'https://img.munyathedev.com/greenworld_product_images/64264b95d9efac73b06b9a231edd36ef.png', 'Lipid Care Tea', '273.00', '[\"Brain Care\",\"Circulatory Care\"]', '<p>It lowers the blood lipid level and helps control body weight.</p>'),
(32, 'https://img.munyathedev.com/greenworld_product_images/6fd14c006fdf4bc80cd7c623c109b86e.jpeg', 'Ganoderma Plus Capsule', '449.00', '[\"Cancer Care\",\"Female Fertility Care\",\"Immune Care\"]', '<p>Green World Ganoderma Plus Capsule battles against cancer by boosting the immune system. It also mitigates liver damage and improves the regeneration of liver cells.</p>'),
(33, 'https://img.munyathedev.com/greenworld_product_images/7c0d8f14dff5ee6860778257972af61c.jpeg', 'Ishine Capsule', '429.00', '[\"Brain Care\"]', '<p>It tranquillizes, soothes the nerves, induces sleep and improves sleep quality.</p>'),
(34, 'https://img.munyathedev.com/greenworld_product_images/7d8ffbf396d14e8c9e19f4074ae9b318.png', 'In-Cleansing Tea', '254.00', '[\"Detox Care\",\"Digestive Care\",\"Slimming Care\"]', '<p>It lubricates the wall of large intestine; helps defecation of stubborn stool; improves detoxification and constipation.<br> Size：4 g x 16 sachets<br> Details<br> The herbal ingredients of Green World In-Cleansing Tea prevent the stubborn stool from sticking onto the wall of the large intestine. This herbal tea helps healthy bowel movement thus enhancing defecation and detoxification, an effective solution for constipation.</p>'),
(35, 'https://img.munyathedev.com/greenworld_product_images/7f729975e385e8b2efff6450b4045aaf.jpeg', 'Jinpure Capsule', '429.00', '[\"Circulatory Care\",\"Detox Care\",\"Immune Care\",\"Nutrition Care\"]', '<p>Jinpure Capsule stimulates the body’s defence mechanisms and increases the immune system’s general resistance, preventing virus breeding.<br> they are also suitable for mitigating various viral diseases, acting as antipyretic, antimicrobial and detoxifying agents.<br> Additionally, improve pulmonary ventilation, and help to strengthen slime and lung mucus.<br> in addition, they accelerate the body’s recovery after a number of illnesses and SVID-19 is no exception.<br> Jinpure capsule assists with<br> Flu<br> Cough<br> Closed Nose<br> Fever<br> High Temperature- viruses<br> Allergic reactions<br> Pain in the throat<br> chest Pain</p>'),
(36, 'https://img.munyathedev.com/greenworld_product_images/837d946ff0023a0caca61f7d1a87b1b3.png', 'Balsam Pear Tablet', '429.00', '[\"Digestive Care\"]', '<p>Brief：It regulates the blood sugar level.</p>'),
(37, 'https://img.munyathedev.com/greenworld_product_images/84017b58896f8783073bed74ed28dfa9.png', 'Vigpower Capsule', '510.00', '[\"Male Care\",\"Male Fertility Care\"]', '<p>It improves the generation of sperm and enhances sexual function in men.</p>'),
(38, 'https://img.munyathedev.com/greenworld_product_images/88c848f09540dae83244591cb77fc6db.jpeg', 'Zinc Tablet (for Children)', '176.00', '[\"Immune Care\",\"Nutrition Care\"]', '<p>It prevents and improves zinc deficiency in children.</p>'),
(39, 'https://img.munyathedev.com/greenworld_product_images/895a40c506a8b7e3b68c7abdcbf5d361.png', 'Detoxin Pad', '390.00', '[\"Detox Care\",\"Female Care\"]', '<p>It detoxifies by pumping out the pathogens such as dampness and toxins of the body through the acupoints on the sole.</p>'),
(40, 'https://img.munyathedev.com/greenworld_product_images/8e20e1ba4fc118db76cdb53eefc06380.jpeg', 'Chitosan Capsule', '468.00', '[\"Diabetes Care\"]', '<p>A detoxifier, a fat magnet, an immune enhancer and a cancer fighter.</p>'),
(41, 'https://img.munyathedev.com/greenworld_product_images/91b8d38b81ce86186bcebf9860a3ee90.jpeg', 'Cordyceps Plus Capsule', '390.00', '[\"Cancer Care\",\"Immune Care\",\"Male Care\",\"Male Fertility Care\"]', '<p>It is featured with health benefits such as enhancing lungs, strengthening kidney, inhibiting bacteria and battling against cancer.</p>'),
(42, 'https://img.munyathedev.com/greenworld_product_images/9aa1bcb3ab349c13cf6d4e06d4fc13eb.jpeg', 'Multi-Vitamins Tablet (for Adults)', '449.00', '[\"Immune Care\",\"Nutrition Care\"]', '<p>It supplements the daily essential vitamin intake.</p>'),
(43, 'https://img.munyathedev.com/greenworld_product_images/9bf5604cc8e5b8fe3c5d998c9ce4045a.png', 'Aloe Vera Plus Capsule', '410.00', '[\"Detox Care\",\"Digestive Care\",\"Skin Care\"]', '<p>A detoxifier and antioxidant inhibiting the bacterial growth and improving immunity.</p>'),
(44, 'https://img.munyathedev.com/greenworld_product_images/a1104405b2a5ebb97be899cca6fc0d8a.jpeg', 'Propolis Plus Capsule', '527.00', '[\"Female Care\"]', '<p>Regulates immunity, and with antimicrobial properties.</p>'),
(45, 'https://img.munyathedev.com/greenworld_product_images/aa43f641d323999ac3ed4be13f20e19b.jpeg', 'Vitamin C Tablet', '234.00', '[\"Immune Care\",\"Nutrition Care\",\"Skin Care\"]', '<p>It supplements daily vitamin C intake.</p>'),
(46, 'https://img.munyathedev.com/greenworld_product_images/b59d5bc7727ecabfd503f25bff95f84c.png', 'Kuding Plus Tea', '234.00', '[\"Circulatory Care\",\"Detox Care\",\"Female Fertility Care\"]', '<p>It alleviates inflammation, helps detoxification, relieves pain, and lowers blood pressure and lipid levels.</p>'),
(47, 'https://img.munyathedev.com/greenworld_product_images/c31b221e3efc2cbc2380f5e566a2020b.png', 'Gastric Health Tablet', '312.00', '[\"Digestive Care\"]', '<p>It improves digestion and gastrointestinal movement by restoring the functions of the smooth muscles in intestine.</p>'),
(48, 'https://img.munyathedev.com/greenworld_product_images/c44d350a57b3fea0711d3cf948083bd5.png', 'Calcium Tablet (for Children)', '123.00', '[\"Digestive Care\",\"Immune Care\",\"Nutrition Care\",\"Packages\"]', '<p>It strengthens growth of the bones and teeth and helps build up bone density.</p>'),
(49, 'https://img.munyathedev.com/greenworld_product_images/ca2fee7aace527e314c5adfad0299a84.png', 'Herbs Toothpaste', '146.00', '[\"Female Care\",\"Male Care\"]', '<p>The product provides all-in-one dental care. It refreshes your breath and whitens your teeth.</p>'),
(50, 'https://img.munyathedev.com/greenworld_product_images/cb503493d347cc9a53d682ce23468eb5.png', 'Super Nutrition', '893.00', '[\"Immune Care\",\"Nutrition Care\"]', '<p>It provides us nutrients, strengthens the health, and helps adjust the blood pressure, blood sugar and blood lipid.</p>'),
(51, 'https://img.munyathedev.com/greenworld_product_images/cc93a262a9b81919734f83e515672c7f.png', 'Spirulina Plus Capsule', '410.00', '[\"Diabetes Care\",\"Digestive Care\",\"Nutrition Care\"]', '<p>Balance nutrient intake, protect the gastric mucosa, improve the sub-health status, regulate immunity and reduce the harmful effects of electromagnetic radiation.</p>'),
(52, 'https://img.munyathedev.com/greenworld_product_images/cd241adecc0fed6e24b69d8853e4260f.png', 'Blueberry Juice', '430.00', '[\"Cancer Care\",\"Immune Care\",\"Nutrition Care\",\"Skin Care\"]', '<p>It provides you with a delicious and convenient beverage that improves your immunity, alleviates eye strain, nourishes your skin and delays ageing.</p>'),
(53, 'https://img.munyathedev.com/greenworld_product_images/d2d9806d3957416641822919f5846be8.jpeg', 'Zinc Tablet (for Adults)', '312.00', '[\"Female Fertility Care\",\"Male Fertility Care\"]', '<p>It supplements daily zinc intake.</p>'),
(54, 'https://img.munyathedev.com/greenworld_product_images/ee2fd1f31ddf22c108002afdab27a37c.png', 'Protein Powder', '683.00', '[\"Nutrition Care\"]', '<p>It provides us with daily requirement of proteins.<br> Details<br> Extracted from plant sources, this product contains all amino acids required by human body, 22 amino acids among which 9 are essential. Green World Protein Powder sufficiently provides the daily requirement of proteins and is low in calories and fat. It is free of cholesterol, hormones, and antibodies, generally found in animal proteins. With high solubility and absorbability, it can be taken with milk, beverage, water, or used to cook soup or broth.</p>'),
(55, 'https://img.munyathedev.com/greenworld_product_images/f251e7896a6db8d26928141d2dff55de.jpeg', 'ProstaSure Capsule', '641.00', '[\"Male Care\"]', '<p>It strengthens kidney, promotes fitness, prevents and alleviates prostate disorders.</p>'),
(56, 'https://img.munyathedev.com/greenworld_product_images/f74e9c4b87573b1e232820a0a6525007.png', 'A-Power Capsule', '780.00', '[\"Cancer Care\",\"Immune Care\"]', '<p>It boosts immunity.</p>'),
(57, 'https://img.munyathedev.com/greenworld_product_images/fd4fc73e7743030f30d1d5c3620295c0.png', 'Garlic Oil Capsule', '439.00', '[\"Brain Care\",\"Immune Care\"]', '<p>It has anti-microbial properties; lowers blood lipid, blood sugar and blood pressure; prevents atherosclerosis</p>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
