-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 09 2023 г., 08:56
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bike-store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bikes`
--

CREATE TABLE `bikes` (
  `id` int NOT NULL COMMENT 'bike id',
  `brand_id` int NOT NULL COMMENT 'brand',
  `category_id` int NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'model',
  `color_id` int NOT NULL COMMENT 'color',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'bike description',
  `price` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `bikes`
--

INSERT INTO `bikes` (`id`, `brand_id`, `category_id`, `model`, `color_id`, `description`, `price`, `image`) VALUES
(1, 3, 2, 'Pupa', 4, 'Super bike, bro!', 20000000, NULL),
(2, 1, 4, 'Vulgaro', 3, 'A long path...', 3000000, NULL),
(3, 5, 7, 'Jacobson, Gusikowski and Raynor', 7, 'Vel dolores deserunt et. Dolorum quia maxime eius in. Inventore sunt cum quibusdam ab debitis.', 5507452, '0'),
(4, 6, 8, 'Walter, Hintz and Ankunding', 8, 'Tempora cupiditate est quibusdam vel consequatur ut et. Voluptates ipsam quibusdam odio illum.', 1047983, '0'),
(5, 7, 9, 'Hessel-Steuber', 9, 'Dignissimos nulla pariatur odit et odio sit. Magni rem pariatur quas minima eius ratione dolores repellat.', 8644967, '0'),
(6, 8, 10, 'Spencer, Hessel and Rutherford', 10, 'Asperiores iusto eos est atque quaerat. Ullam sit aperiam dolorum et ad quod totam. Qui nihil eos autem.', 5920025, '0'),
(7, 9, 11, 'Hartmann, Conroy and Lind', 11, 'Aut sit voluptatem eveniet et tempora laboriosam. Tempore magnam tempore laboriosam libero est dolore quasi.', 6864602, '0'),
(8, 10, 12, 'Cormier, Leuschke and Kshlerin', 12, 'Eius rem similique sed impedit quia voluptas. Fuga velit explicabo voluptatem nisi.', 8262619, '0'),
(9, 11, 13, 'Bogisich LLC', 13, 'Natus ea et ullam et. Nihil voluptates vel perspiciatis sint ipsum est aliquid. Vitae tenetur pariatur est assumenda.', 9775074, '0'),
(10, 12, 14, 'Koss-Jaskolski', 14, 'Sunt possimus praesentium voluptates iusto cum dolorum. Iure non minus quo quo. Maxime dicta assumenda dolores tenetur.', 6699321, '0'),
(11, 13, 15, 'Grimes, Stroman and Treutel', 15, 'Earum iusto rerum et at sint id. Ut ipsa facere non explicabo. Est officiis id aut occaecati et.', 7730180, '0'),
(12, 14, 16, 'McDermott, Brown and Crona', 16, 'Quo impedit dolorem animi iste quia. Voluptas ipsum voluptatem est odit accusantium tenetur voluptate.', 8596833, '0'),
(13, 15, 17, 'Rice-Marquardt', 17, 'Modi quaerat ex aspernatur animi et dolor. Quia et qui beatae eos impedit sunt. Veniam eos nisi a quia.', 8952000, '0'),
(14, 16, 18, 'Quitzon-Wolf', 18, 'Veniam aliquid consequatur et praesentium. Asperiores velit sed qui cum fugit ullam dicta itaque.', 1268412, '0'),
(15, 17, 19, 'Hyatt, Brekke and Kertzmann', 19, 'Rerum quia quia voluptas aliquam velit. Rerum commodi ut illo voluptatem. Porro quibusdam eligendi architecto nam.', 2308402, '0'),
(16, 18, 20, 'Eichmann, Dicki and Miller', 20, 'Impedit non non eos. Voluptas veniam rerum qui aut a. Quo qui modi porro pariatur occaecati.', 7453562, '0'),
(17, 19, 21, 'Shanahan-Bradtke', 21, 'Dolorem debitis qui voluptate nobis facilis qui optio. Est molestiae reprehenderit ea et cupiditate.', 8445488, '0'),
(18, 20, 22, 'Fritsch Ltd', 22, 'Labore ut repellat et ad. Molestias hic est commodi cupiditate ut. Aliquam qui error perspiciatis facilis ea quisquam.', 2952630, '0'),
(19, 21, 23, 'Lockman, Farrell and Kerluke', 23, 'In rerum illum aut quos. Et sed enim praesentium. Sequi totam sunt vel possimus molestiae qui earum molestias.', 3949718, '0'),
(20, 22, 24, 'McClure, Waters and O\'Reilly', 24, 'Sit necessitatibus velit illum non. Eos voluptatem iste odio id. Maxime fugit dolores fuga.', 5717247, '0'),
(21, 23, 25, 'O\'Kon, Von and Durgan', 25, 'Eum enim est odio impedit ut animi. Dolorum dicta est laudantium ex. Et doloremque quis voluptate eos.', 4270567, '0'),
(22, 24, 26, 'Bruen-Roob', 26, 'Soluta eos voluptate dignissimos adipisci. Repellendus earum debitis aut quis itaque.', 1804117, '0'),
(23, 25, 27, 'Kris-Wehner', 27, 'Inventore esse dolore aut delectus ducimus saepe rem rerum. Blanditiis veniam dolor sed.', 2066790, '0'),
(24, 26, 28, 'Kub-Berge', 28, 'Quia quae officia placeat dolorem. Sunt perspiciatis consequatur fugiat provident. Repudiandae omnis nisi et modi.', 2806691, '0'),
(25, 27, 29, 'Crist, Zulauf and Swift', 29, 'Et iste qui saepe impedit. Quia rerum culpa temporibus animi nihil et. Quae aut nesciunt nemo aperiam.', 2206479, '0'),
(26, 28, 30, 'Auer, Bailey and Bode', 30, 'Error neque magni earum possimus quis. Eveniet repellendus sit velit aliquam.', 5428438, '0'),
(27, 29, 31, 'Zemlak, Ondricka and Stanton', 31, 'Harum optio soluta vel quasi blanditiis quo. Non voluptatibus quisquam modi minus autem pariatur ut.', 9294378, '0'),
(28, 30, 32, 'McCullough-Farrell', 32, 'Cupiditate ducimus architecto officiis sint ipsa. Est reiciendis totam et non.', 2532493, '0'),
(29, 31, 33, 'Gaylord, Kihn and Rath', 33, 'Illo quisquam fugit dolores quo qui quas. Magnam rerum sint ut molestiae eligendi voluptatem repellendus.', 3215613, '0'),
(30, 32, 34, 'Tromp, Schuster and Zboncak', 34, 'Non qui aut ea tempore natus. Reiciendis eum sapiente sit molestiae. Accusantium sed consectetur libero beatae.', 2033902, '0'),
(31, 33, 35, 'Lebsack-Macejkovic', 35, 'Sed sunt omnis esse sunt velit. Aspernatur id beatae soluta. Ut quia esse quae qui ad.', 7624928, '0'),
(32, 34, 36, 'Dicki LLC', 36, 'Aliquid dolores sed nam eum nihil ut qui at. Beatae fugit et animi voluptas a et.', 2190433, '0'),
(33, 35, 37, 'McKenzie-Kerluke', 37, 'Itaque sunt et alias voluptatem at. Aliquam aut ex nihil illo. Dolores est repellat laboriosam quibusdam.', 8133709, '0'),
(34, 36, 38, 'Gibson, West and Wiegand', 38, 'Et et eum quod inventore. Et omnis voluptatem sint aliquid facilis impedit. Quia quam sit culpa nisi omnis.', 8448819, '0'),
(35, 37, 39, 'Senger Group', 39, 'Deserunt ipsum quia ea velit ea sapiente. Aut et qui magni magnam velit facere facere dolorem.', 1566667, '0'),
(36, 38, 40, 'Anderson-Runte', 40, 'Quo sed qui temporibus. Fugiat rerum reprehenderit omnis qui sed quibusdam eos.', 5723185, '0'),
(37, 39, 41, 'Becker Group', 41, 'Odio officia aut dolor omnis dolor. Et nobis molestias quam nulla voluptate.', 9182127, '0'),
(38, 40, 42, 'Cormier-Johnston', 42, 'Dolorem ea vel consequatur eveniet fugit sed similique. Saepe omnis et qui est ratione.', 2566598, '0'),
(39, 41, 43, 'Ratke PLC', 43, 'Reiciendis cupiditate ut sint id voluptatibus eveniet enim ut. Et et molestias eaque. Aut praesentium est saepe.', 1787886, '0'),
(40, 42, 44, 'Dach-Rempel', 44, 'Eius nesciunt ipsa ex culpa. Fugit modi ut sint.', 4689185, '0'),
(41, 43, 45, 'Leannon Ltd', 45, 'Officia unde eveniet ea debitis quo. Quia voluptatem doloremque quia assumenda sed. Optio dolorum quaerat qui nulla.', 8746421, '0'),
(42, 44, 46, 'Bergstrom-Wuckert', 46, 'Et occaecati id molestiae illo. Porro ut et temporibus voluptas tenetur est ab. Iure nemo et vel aut.', 9892554, '0'),
(43, 45, 47, 'Bosco-Johnston', 47, 'Illo aut sit in assumenda voluptate iusto. Eius dolores hic velit possimus atque maiores et. Sed rerum doloremque qui.', 9649028, '0'),
(44, 46, 48, 'Jacobs, Hane and Halvorson', 48, 'Voluptates ea corrupti exercitationem. Numquam qui illo voluptas dolor unde.', 3326062, '0'),
(45, 47, 49, 'Huel Ltd', 49, 'Et odit minus saepe. Praesentium voluptatem saepe sit possimus. Non voluptas nemo minus.', 3930644, '0'),
(46, 48, 50, 'Waters-Kuvalis', 50, 'Earum omnis totam minima et quibusdam. Ut quo id nihil sequi. Eum sed enim ut quo nostrum voluptates.', 3036696, '0'),
(47, 49, 51, 'Mayer PLC', 51, 'Repellat aut consequuntur distinctio et temporibus sed ut. Quam ipsum quam rerum consequatur ad perspiciatis dolorem.', 5651995, '0'),
(48, 50, 52, 'Rippin, Bins and Wiegand', 52, 'Illo fuga ut possimus. Quia sunt doloribus alias facere alias. Hic facere et temporibus et hic inventore ipsam.', 1402270, '0'),
(49, 51, 53, 'Von-Tillman', 53, 'Natus non vitae asperiores magnam aut. Quam sequi dolores earum optio veritatis at veniam.', 6052311, '0'),
(50, 52, 54, 'Jerde-Kovacek', 54, 'In ad eum aperiam ut magni quas. Asperiores odio tenetur ratione sed esse.', 9717026, '0'),
(51, 53, 55, 'Tremblay-Green', 55, 'Sint qui minima nemo tempore. Quibusdam odit ex harum et. Magni rerum nam sint ullam enim libero itaque.', 7789316, '0'),
(52, 54, 56, 'Quitzon Inc', 56, 'Ex qui ea perspiciatis in repellendus laborum. Sunt modi consequatur omnis. Corrupti eveniet qui sunt recusandae.', 8940087, '0'),
(53, 55, 57, 'Reynolds Inc', 57, 'Occaecati porro ad quibusdam sint non. Et autem doloribus omnis optio. Esse vero voluptas velit placeat exercitationem.', 4957324, '0'),
(54, 56, 58, 'Oberbrunner and Sons', 58, 'Sed ut et optio facilis. Quisquam recusandae iure aspernatur incidunt. Quae cupiditate assumenda eligendi eos.', 9182549, '0'),
(55, 57, 59, 'Oberbrunner, Kemmer and Hagenes', 59, 'Et porro fugit reiciendis consequatur. In aut pariatur et doloribus sed.', 8057074, '0'),
(56, 58, 60, 'Wintheiser, Stanton and West', 60, 'Perferendis omnis delectus cum eligendi minima. Odio et quia vitae est. Libero aperiam veritatis sed libero quae earum.', 1482752, '0'),
(57, 59, 61, 'Baumbach-Renner', 61, 'Pariatur voluptatibus rem placeat ratione asperiores illum iusto. Repellat corrupti impedit quisquam aut ducimus qui.', 3437567, '0'),
(58, 60, 62, 'Schuppe-Gulgowski', 62, 'Cumque vero aut odit est omnis sit. Voluptatem hic nemo iusto incidunt vel. Consequuntur adipisci non odio non a.', 1000393, '0'),
(59, 61, 63, 'Gaylord Inc', 63, 'Sunt quo rem libero itaque. Qui aliquam sit eos ipsam dolore consequatur et. Aut ex tempora sed aut non et.', 3515970, '0'),
(60, 62, 64, 'Wilderman-Kemmer', 64, 'Et ab eum nihil illo impedit sunt. Dicta dolorem quaerat veniam.', 9449497, '0'),
(61, 63, 65, 'Bruen, Walsh and Labadie', 65, 'Inventore deleniti et cupiditate voluptatibus. Fugiat ad delectus enim et officia fugit. Placeat sunt facilis iste.', 6190597, '0'),
(62, 64, 66, 'Walter, Christiansen and Mayer', 66, 'Et sit voluptas et. Amet voluptas pariatur minus porro aliquid facilis. Quia sed enim voluptatum modi quod odit.', 2435032, '0'),
(63, 65, 67, 'O\'Conner, Harber and Dickens', 67, 'Ad aut nulla iusto sed repellat repudiandae magni. Quidem quo ut occaecati qui quia. Dolores ullam commodi autem.', 1197874, '0'),
(64, 66, 68, 'Quigley, Russel and Mueller', 68, 'Maiores dolor earum molestias consequatur ut quia. Doloribus est amet tempora incidunt veritatis.', 5307160, '0'),
(65, 67, 69, 'Hodkiewicz, Crooks and Marks', 69, 'Odio occaecati ipsum est error ipsam quo quod. Rerum officiis odio unde libero enim quia.', 2133964, '0'),
(66, 68, 70, 'Mitchell-Wolf', 70, 'Quia est enim voluptatem illo. Aut assumenda facilis fugit rem. Magni nostrum delectus dolor molestiae.', 3913829, '0'),
(67, 69, 71, 'Zulauf, Stracke and Kreiger', 71, 'Facere amet ullam quis fuga praesentium hic amet. Possimus fuga illum iusto ab.', 6431639, '0'),
(68, 70, 72, 'Becker and Sons', 72, 'Minus itaque et in sed. Sunt deserunt doloremque magnam repudiandae soluta. Aliquid id inventore quo vel natus.', 5318343, '0'),
(69, 71, 73, 'Stokes, Nolan and Hyatt', 73, 'Consectetur velit aut velit voluptatem. Ullam voluptatem molestiae et quas et. Dolor dolorem cupiditate et.', 5536080, '0'),
(70, 72, 74, 'Conroy, Schneider and Stark', 74, 'Qui ipsa consequatur omnis in rem. Eum cupiditate itaque et consectetur aut praesentium. Omnis rerum modi eius dolorum.', 3423929, '0'),
(71, 73, 75, 'Schuppe-Bartell', 75, 'Eveniet atque perspiciatis sapiente asperiores ut. Consequatur vitae sint ullam ducimus fuga culpa itaque.', 1161084, '0'),
(72, 74, 76, 'Stroman, Treutel and Strosin', 76, 'Asperiores aspernatur aspernatur perferendis. Non voluptatem ea iusto vel non enim.', 4238417, '0'),
(73, 75, 77, 'Hauck-Greenfelder', 77, 'Cum id facere omnis eos eos. Maxime sint ducimus debitis ex veritatis alias cum. Est et eum doloribus sunt totam.', 7173231, '0'),
(74, 76, 78, 'Abbott, Ullrich and Davis', 78, 'Earum accusantium et quia commodi itaque. Maiores impedit voluptatem minima eligendi voluptas eos.', 4586611, '0'),
(75, 77, 79, 'Kilback-Labadie', 79, 'Deleniti eveniet et reiciendis accusamus. Et fugit id fugiat molestiae laborum ut inventore.', 1434712, '0'),
(76, 78, 80, 'Christiansen and Sons', 80, 'Neque ipsam hic porro sunt blanditiis. Velit ipsam nam voluptatem deserunt. Quia praesentium et modi aut placeat.', 7685772, '0'),
(77, 79, 81, 'Robel PLC', 81, 'Ut aut dolor distinctio aut suscipit veritatis. Accusamus veritatis ut ut et. Est harum et optio similique.', 2769887, '0'),
(78, 80, 82, 'Sanford, Cummerata and Rau', 82, 'Facere quos ut fuga magnam quo quis cum eum. Id debitis quo iusto vero ut repudiandae.', 9951462, '0'),
(79, 81, 83, 'Howell, Monahan and Wunsch', 83, 'Suscipit facere ducimus iste eligendi id. Eum ut amet debitis. Consequuntur sint rerum eius eligendi asperiores.', 9629065, '0'),
(80, 82, 84, 'Ondricka and Sons', 84, 'Voluptas dolores quia ut sint velit. Vel delectus reiciendis ea maiores fuga voluptas. Modi magnam dolor vel aut.', 1454541, '0'),
(81, 83, 85, 'Torp, Blick and Ferry', 85, 'Impedit non vel doloremque eum. Sit quia ut velit et et. Tempore eos enim hic voluptatum qui non eos ea.', 9157032, '0'),
(82, 84, 86, 'Brakus-Reinger', 86, 'Et ipsum ut harum fuga. Nulla quae reprehenderit maxime fugiat placeat ex. Saepe aliquam dolore alias repellat.', 6723587, '0'),
(83, 85, 87, 'Zemlak Group', 87, 'Animi culpa omnis expedita. Nesciunt et illo ut animi vel fugiat quisquam.', 6321026, '0'),
(84, 86, 88, 'Simonis, Botsford and Veum', 88, 'Rem nostrum velit vero impedit at iste. Aut eligendi velit temporibus repudiandae sint quia nesciunt.', 6779845, '0'),
(85, 87, 89, 'Gutmann Inc', 89, 'Vel aut officiis dolorem placeat qui et. Ut magni ducimus consequatur aperiam. In vel inventore dicta animi velit quis.', 8696925, '0'),
(86, 88, 90, 'Nitzsche PLC', 90, 'Mollitia ut ea modi dolorum. Voluptates qui dicta et ex. Sed tempora eum eligendi qui impedit.', 3093491, '0'),
(87, 89, 91, 'Lueilwitz-Sipes', 91, 'Et ea ut omnis iusto reprehenderit est. Et sit dolorem autem facere dolore quia.', 6319905, '0'),
(88, 90, 92, 'Spencer-Glover', 92, 'Reprehenderit ad ullam hic quos voluptas. Cumque dolorum quos aliquam error odio impedit similique.', 3554634, '0'),
(89, 91, 93, 'Crooks, Powlowski and Howell', 93, 'Aut vero voluptate rerum iste. Reprehenderit odio sint architecto ut.', 8755268, '0'),
(90, 92, 94, 'Zulauf and Sons', 94, 'Sint non aut nostrum quia. Voluptate repellat consequatur eligendi maxime et.', 4622539, '0'),
(91, 93, 95, 'Grady-Stiedemann', 95, 'Animi accusantium est explicabo fugiat nemo itaque qui. Et quam itaque odit totam aspernatur soluta.', 8762861, '0'),
(92, 94, 96, 'Gusikowski Group', 96, 'Ullam necessitatibus aut quod. Sequi iusto porro maiores. Voluptatibus esse rem vel est id.', 8297587, '0'),
(93, 95, 97, 'Breitenberg-Wilkinson', 97, 'Neque ullam et esse porro temporibus hic. Possimus maxime qui ipsum ex.', 3626000, '0'),
(94, 96, 98, 'Dare-Quitzon', 98, 'Voluptas doloribus vitae sunt tempore. Doloribus eaque ut aut odio. Non tenetur inventore provident nihil non.', 8502917, '0'),
(95, 97, 99, 'Hermiston Ltd', 99, 'Voluptatem fugiat vitae voluptas asperiores sit ab. Deserunt quia aut velit. Voluptatum adipisci aut aut cum.', 8955931, '0'),
(96, 98, 100, 'Koch LLC', 100, 'Reiciendis culpa ducimus quis illum qui fuga ipsam. Vel illo deleniti omnis. Dolorem enim facere repellendus minima.', 1927535, '0'),
(97, 99, 101, 'Cronin, Parker and King', 101, 'Eaque itaque necessitatibus facere in. Dicta nisi magnam et. Deleniti voluptatibus cupiditate voluptatibus.', 4916495, '0'),
(98, 100, 102, 'Huels and Sons', 102, 'Quae quod aut doloremque enim. Nam aut totam dolores et. Ut laboriosam unde eius quia et voluptatem et.', 6644711, '0'),
(99, 101, 103, 'Rodriguez Ltd', 103, 'Neque voluptatem eum quia est illum. Quam eaque at vel magni in eveniet alias. Unde labore consectetur rerum et.', 3677975, '0'),
(100, 102, 104, 'Barton, Hand and Johns', 104, 'Facilis ut ea error. Aut nihil reprehenderit laborum sit aperiam corporis ut. Earum et omnis recusandae sit et.', 2071053, '0'),
(101, 103, 105, 'Ernser, Raynor and Rowe', 105, 'Quam expedita occaecati dolor eum quisquam. Consequatur voluptatem eos qui et veniam voluptate voluptate.', 8516329, '0'),
(102, 104, 106, 'White-Lakin', 106, 'Aut fugit est consequatur ipsa quod. Consequatur sequi nisi id animi. Aut debitis sunt delectus sit.', 6800839, '0'),
(103, 105, 107, 'Cormier, Lind and Ziemann', 107, 'Porro ut odio architecto in illum. Magni eum ut sequi ut voluptas culpa quam.', 2597033, '0'),
(104, 106, 108, 'Luettgen-Kling', 108, 'Voluptas tenetur voluptate quasi rem dolore maxime. Dolores quo sed delectus libero non commodi enim.', 1549070, '0'),
(105, 107, 109, 'Wiegand, Williamson and Wisozk', 109, 'Consequatur fugiat occaecati at eveniet. Eum fuga nulla reprehenderit nisi non. Mollitia in blanditiis eum.', 8640881, '0'),
(106, 108, 110, 'West, Schoen and Purdy', 110, 'Ullam neque et inventore ea. Beatae quo suscipit eius inventore voluptatibus eos. Sit nihil sapiente dolorem.', 5619981, '0'),
(107, 109, 111, 'Larson-Wiza', 111, 'Suscipit iure quia autem omnis. Repellendus facere in dolorem beatae tempore sed. Eius dolores ab autem ab veritatis.', 4142375, '0'),
(108, 110, 112, 'Goodwin Inc', 112, 'Cum accusantium quis rem. Aliquid a autem nihil sed. Nisi in magnam optio ut eos perspiciatis quidem quia.', 2809612, '0'),
(109, 111, 113, 'Jerde and Sons', 113, 'Facilis quis neque corrupti. Aliquam quaerat nihil commodi. Dolorem libero voluptatem totam voluptatem expedita.', 3786975, '0'),
(110, 112, 114, 'Ullrich-Leannon', 114, 'Quia quae natus officia nihil cumque eum tempore. Eos in qui eaque non. Commodi atque provident dolorum qui et.', 9867954, '0'),
(111, 113, 115, 'Gerhold Group', 115, 'Ut ab quia aut corporis et. Nostrum corrupti itaque animi quasi. Impedit similique magni ea culpa omnis saepe quia.', 8292998, '0'),
(112, 114, 116, 'Harvey, Ruecker and Skiles', 116, 'Consequatur repellat molestias totam rerum distinctio. Quia eius iure dolor dolor ut.', 4889874, '0'),
(113, 115, 117, 'Ankunding, McCullough and Medhurst', 117, 'Quasi qui dolores alias qui dolorem autem perferendis. Totam nihil hic voluptas quaerat aut.', 7769617, '0'),
(114, 116, 118, 'Emard Ltd', 118, 'Libero consectetur quia modi in eveniet deleniti. Reiciendis eos aut et nemo saepe corrupti sit.', 4391537, '0'),
(115, 117, 119, 'Yundt-Reichert', 119, 'Blanditiis quis alias eos tempore aut est quod. Repellat qui quia ut quia.', 5791161, '0'),
(116, 118, 120, 'Volkman, Gerhold and Fritsch', 120, 'Dolorem explicabo voluptate odit fuga. Quaerat molestias eaque iusto voluptatibus inventore quaerat illo.', 9999202, '0'),
(117, 119, 121, 'O\'Reilly, Weissnat and Kunze', 121, 'Omnis dolorum veniam fuga facere deserunt. Eum ut consequatur sint occaecati repellat. Quae ducimus vel ea.', 2728120, '0'),
(118, 120, 122, 'Rutherford-Bailey', 122, 'Sed impedit rem rerum. Numquam distinctio dolorum aut velit.', 2300754, '0'),
(119, 121, 123, 'Ebert, Johns and Anderson', 123, 'Aperiam qui molestiae vel non similique reprehenderit. Aut perferendis velit accusamus voluptatem expedita at.', 4970783, '0'),
(120, 122, 124, 'Nikolaus and Sons', 124, 'Nisi voluptatibus et fugit tempore nihil nostrum. Quidem eum in et. Dolores nesciunt dicta tenetur quo.', 5742886, '0'),
(121, 123, 125, 'Flatley, Wilderman and Yundt', 125, 'Corporis sit qui vel itaque voluptatem voluptas. Minima vitae quod tenetur ipsam rerum illo nam. Cum et quis quo.', 8035874, '0'),
(122, 124, 126, 'Nienow, Dickens and Steuber', 126, 'Dolores qui excepturi sed eius consequatur. Quis rerum et debitis. Nihil nihil deleniti minus odit.', 3073563, '0'),
(123, 125, 127, 'Runolfsson Inc', 127, 'Molestiae sed explicabo pariatur odit. Accusantium harum esse consequatur amet ut inventore. Mollitia non fugit porro.', 2324202, '0'),
(124, 126, 128, 'Johns-Toy', 128, 'Culpa sapiente assumenda vel. Qui sit earum et labore vero id. Similique sunt perspiciatis natus qui.', 7634101, '0'),
(125, 127, 129, 'Conn-Feil', 129, 'Et omnis et dolore qui. Esse provident sit sed. Aut sunt officia saepe rerum. Dolorem est et qui rerum et sint.', 1045558, '0'),
(126, 128, 130, 'Hyatt-Abbott', 130, 'Culpa dolorum voluptates nesciunt soluta laudantium ut. Eligendi nihil quis dolorem fugit et. Libero qui non eum enim.', 3838900, '0'),
(127, 129, 131, 'O\'Kon, Brekke and Wisozk', 131, 'In esse omnis explicabo aut. Earum quos natus non soluta est sint et. Quia et distinctio nihil officia quam.', 3429026, '0'),
(128, 130, 132, 'Goldner-Luettgen', 132, 'Porro qui eaque enim autem. Natus est aut dolor explicabo et.', 8386336, '0'),
(129, 131, 133, 'Hills-Ankunding', 133, 'Minima qui distinctio nulla in. Voluptate sed ipsum corrupti aliquam molestias.', 3443931, '0'),
(130, 132, 134, 'Schimmel, Kertzmann and Marvin', 134, 'Magnam repellendus blanditiis ut quia quam fugit. Autem enim occaecati numquam sunt sed sit magni autem.', 3786003, '0'),
(131, 133, 135, 'Fadel LLC', 135, 'Est praesentium pariatur eius id. Quasi quia et nemo eos nobis repudiandae et. Aut qui soluta non.', 5803456, '0'),
(132, 134, 136, 'Jerde-Littel', 136, 'Optio aliquam ut eum debitis repellendus quaerat. Nihil soluta ex ut dolore. Voluptatum aut ducimus et et ipsum.', 3863956, '0'),
(133, 135, 137, 'Johnson, Barrows and Friesen', 137, 'Nulla quis porro optio nisi enim. Repudiandae delectus aut delectus temporibus ad. Officia et nam vero.', 8080016, '0'),
(134, 136, 138, 'Bradtke-Daniel', 138, 'Delectus ut et aut voluptas ut pariatur et. Laboriosam molestiae et et dolores fuga.', 6794974, '0'),
(135, 137, 139, 'Baumbach, Cartwright and Toy', 139, 'Necessitatibus et ut rem. Nihil dignissimos reiciendis ad aut deleniti. Qui consequatur qui nisi itaque.', 5865178, '0'),
(136, 138, 140, 'Shanahan, Haag and Reynolds', 140, 'Necessitatibus eos eum dicta veritatis veritatis repudiandae voluptates eius. Amet aut omnis ratione tempore.', 1444883, '0'),
(137, 139, 141, 'Heidenreich, Swaniawski and Bosco', 141, 'Quia dolores rerum laudantium ratione. Dolorum unde dolor nostrum eos. Error dolor maxime nesciunt voluptatum ratione.', 4007080, '0'),
(138, 140, 142, 'Keebler LLC', 142, 'Quo et provident aspernatur. Laboriosam eius non ea. Assumenda ut asperiores provident est exercitationem qui.', 3117960, '0'),
(139, 141, 143, 'Oberbrunner and Sons', 143, 'In dignissimos praesentium quibusdam omnis sequi fuga rem. Provident quia totam voluptas perspiciatis magni qui.', 5832644, '0'),
(140, 142, 144, 'Hane Group', 144, 'Et dignissimos eveniet praesentium unde harum. Iste ut voluptate eum et. Est accusamus magni provident eos.', 6611594, '0'),
(141, 143, 145, 'Pfannerstill Inc', 145, 'Aut et voluptas molestiae. Ut explicabo est eius dolores quasi eos. Non autem ex doloribus et tenetur labore et.', 8037584, '0'),
(142, 144, 146, 'Bauch, Kris and Stokes', 146, 'Et animi alias sequi voluptatem id. Et natus omnis quae inventore nisi voluptatum qui.', 1256437, '0'),
(143, 145, 147, 'McGlynn-Wiegand', 147, 'Aut vitae ad non sunt ratione possimus alias. Eveniet incidunt dolore dolor dolores.', 8584608, '0'),
(144, 146, 148, 'Hagenes, Schroeder and Thompson', 148, 'In impedit in non quia. Ea et eum id esse totam rerum magni.', 9571970, '0'),
(145, 147, 149, 'Cummings, Corwin and Fahey', 149, 'Sit suscipit voluptatibus cum sapiente in minima. Recusandae et rem aut quo. Harum nisi sit cumque nemo.', 8347734, '0'),
(146, 148, 150, 'Schoen-Kertzmann', 150, 'Qui ea ipsum explicabo. Inventore fugiat est natus deleniti beatae optio suscipit. Quo voluptatem et porro.', 7988131, '0'),
(147, 149, 151, 'Stoltenberg, Schoen and Hegmann', 151, 'Dolorem aut corrupti eius quo ad et. Molestiae est sed doloribus sit neque. Odio et facilis cum nihil ad.', 5621940, '0'),
(148, 150, 152, 'Weber-Schmeler', 152, 'Odit eaque illum maxime neque voluptas voluptatem. In hic sint earum ut. Vero quas enim totam et.', 5690620, '0'),
(149, 151, 153, 'Medhurst Ltd', 153, 'Et voluptatem ut odio optio iusto. Sunt nihil neque rerum in. Minima aut et veniam nobis. Nostrum quod hic sit.', 3755972, '0'),
(150, 152, 154, 'Fay and Sons', 154, 'Omnis numquam perferendis similique. Laudantium nam voluptas aut aspernatur consequatur. Ipsum voluptatem dolores eos.', 9949044, '0'),
(151, 153, 155, 'Rosenbaum, Schamberger and Labadie', 155, 'Ad enim accusamus et. Quo iste dolorum officia nam. Est assumenda necessitatibus sit enim odit excepturi autem.', 9177019, '0'),
(152, 154, 156, 'Barton, Reichel and Beer', 156, 'Unde rerum assumenda dicta sapiente. Saepe error et aliquam quis pariatur labore et. Qui quo voluptatem alias autem.', 7547879, '0'),
(153, 155, 157, 'Collins and Sons', 157, 'Id aut voluptate ut fugit. Odio vel consequatur assumenda dolor laborum est. Dignissimos molestiae neque quis ad.', 3392846, '0'),
(154, 156, 158, 'Grady LLC', 158, 'Sint esse quae dolores qui consequatur. Dolorem quod natus repudiandae soluta.', 1521786, '0'),
(155, 157, 159, 'Emmerich-Raynor', 159, 'Ut officia sequi pariatur hic consequatur nisi. Dolores laboriosam dolore deleniti vitae. Eos vitae est nostrum.', 4638517, '0'),
(156, 158, 160, 'Schoen LLC', 160, 'Nemo aut itaque nihil illo totam. Magni qui nam cum quo. Sint laboriosam nisi sunt illum sit repellendus quaerat quos.', 1839323, '0'),
(157, 159, 161, 'Stark, Littel and Gusikowski', 161, 'Maiores architecto consequatur animi adipisci deserunt quisquam cumque. Laboriosam earum maxime deserunt quam.', 5017043, '0'),
(158, 160, 162, 'Bauch, Grant and Witting', 162, 'Odio voluptatem voluptas fugit animi quisquam totam. Vel sit voluptatem consequatur distinctio rerum ut.', 6438158, '0'),
(159, 161, 163, 'Ritchie LLC', 163, 'Perferendis sed qui omnis eligendi optio. Molestiae autem quos vel ut. Amet voluptas voluptas ea eos aut dicta vel.', 3754005, '0'),
(160, 162, 164, 'Lebsack, Ferry and Wilkinson', 164, 'Earum qui repellendus itaque iure. Deleniti porro perferendis sunt debitis.', 5244112, '0'),
(161, 163, 165, 'Howe-Crooks', 165, 'Nisi voluptatem debitis quia occaecati. Omnis atque aperiam est velit. Enim quae vitae eius saepe.', 3695938, '0'),
(162, 164, 166, 'Littel PLC', 166, 'Sed nam sed non sed qui vitae. Nisi sunt dicta sit eius error corporis quis. Unde libero aut nam sed velit nobis.', 7853431, '0'),
(163, 165, 167, 'Conn-Harris', 167, 'Amet fuga est voluptatem culpa neque est commodi libero. Esse autem dolorem non consequuntur quibusdam aut.', 6280031, '0'),
(164, 166, 168, 'Cronin-Stracke', 168, 'Qui exercitationem amet pariatur est eum. Repellendus numquam incidunt beatae doloremque. Ut dolores sit quia.', 1223812, '0'),
(165, 167, 169, 'Gusikowski-Boyle', 169, 'Quibusdam laboriosam dolores atque voluptatibus id. Assumenda voluptas et laudantium magnam sint.', 4816318, '0'),
(166, 168, 170, 'Casper Group', 170, 'Eos veniam excepturi magni eius dolorem illum. Enim autem suscipit suscipit saepe. Et et ipsam est totam autem.', 9007631, '0'),
(167, 169, 171, 'Barton and Sons', 171, 'Et perspiciatis omnis et error unde recusandae. Rem tenetur est vitae eos culpa. Autem quam deserunt aut ut nam.', 7716508, '0'),
(168, 170, 172, 'Pagac Inc', 172, 'Occaecati iure ipsum ex ipsum deleniti fugit. Doloribus laboriosam omnis accusamus et quaerat commodi.', 2208958, '0'),
(169, 171, 173, 'Lueilwitz-Jaskolski', 173, 'Voluptas impedit nam debitis ut explicabo doloribus ab ab. Quasi repudiandae et veniam qui officiis voluptatem tempore.', 2535776, '0'),
(170, 172, 174, 'Rempel LLC', 174, 'Modi molestiae est eligendi. Est magnam culpa omnis quia et. Non vel et beatae ratione deleniti quaerat numquam.', 2320862, '0'),
(171, 173, 175, 'Beatty, Lind and Kuhn', 175, 'Exercitationem eius et ducimus vero asperiores dolorem saepe quas. A est dignissimos dicta.', 2239581, '0'),
(172, 174, 176, 'Little Group', 176, 'Et laudantium vel alias dolores. Delectus eos occaecati doloremque qui. Ducimus voluptatibus beatae provident at.', 6804102, '0'),
(173, 175, 177, 'Walker-Dibbert', 177, 'Vitae quia nesciunt velit velit. Et dolores voluptate voluptas earum deleniti. Nostrum ex perspiciatis officiis et.', 4144736, '0'),
(174, 176, 178, 'Turner PLC', 178, 'Et omnis exercitationem fugiat qui sit. Occaecati labore fuga sed harum et in aut. Quia est culpa ea sed quia enim.', 7889111, '0'),
(175, 177, 179, 'Hamill-Price', 179, 'Adipisci sapiente consequatur esse dolores odit. Sequi quia omnis distinctio maxime voluptas animi.', 9570186, '0'),
(176, 178, 180, 'Kirlin-Veum', 180, 'Et in atque soluta omnis eaque. Et quisquam quo qui aspernatur non accusantium. Quia voluptatem mollitia dolor dolorem.', 4986898, '0'),
(177, 179, 181, 'Hoeger Ltd', 181, 'Consequatur qui voluptates recusandae quisquam distinctio rerum. Necessitatibus explicabo totam ullam facere.', 9830605, '0'),
(178, 180, 182, 'Ledner Inc', 182, 'Dolorem ullam rerum laboriosam ad. Officiis rem autem quia at omnis odio. Id quas ea sit consequatur.', 7635994, '0'),
(179, 181, 183, 'Krajcik, Paucek and Sauer', 183, 'Velit eos cupiditate sit aut qui velit. Explicabo sint neque qui dolorem magnam at ipsa.', 2765206, '0'),
(180, 182, 184, 'Price, Rolfson and Marvin', 184, 'Aut neque numquam voluptates ut. Aut quisquam ea repellendus ea rem sit ipsam aut.', 3933430, '0'),
(181, 183, 185, 'Howell-Skiles', 185, 'Est similique cum eos et. Delectus sunt sunt expedita non est. Voluptatem sit nobis neque fugit est consequatur cumque.', 9820681, '0'),
(182, 184, 186, 'Wintheiser-Wilderman', 186, 'Odit quibusdam aut eos consequuntur nisi et. Qui ut iusto qui consectetur eligendi.', 1967211, '0'),
(183, 185, 187, 'Breitenberg, Kling and Williamson', 187, 'Quasi qui et sint. Ea eaque sit commodi sapiente ullam. Illo nemo veritatis nesciunt perspiciatis aut dolores id.', 6550092, '0'),
(184, 1, 2, 'Mountain Bike', 3, 'A high-performance mountain bike for off-road adventures', 1500, NULL),
(185, 1, 2, 'Mountain Bike', 3, 'A high-performance mountain bike for off-road adventures', 1500, NULL),
(186, 1, 2, 'Mountain Bike', 3, 'A high-performance mountain bike for off-road adventures', 1500, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Subano'),
(2, 'Merida'),
(3, 'Lupa'),
(4, 'Pupa'),
(5, 'Huel LLC'),
(6, 'Yost, Anderson and Langosh'),
(7, 'Veum, Effertz and Farrell'),
(8, 'Morissette PLC'),
(9, 'Hagenes LLC'),
(10, 'Johnson Ltd'),
(11, 'Strosin Ltd'),
(12, 'Kris, Anderson and Jaskolski'),
(13, 'Baumbach Ltd'),
(14, 'Bogan-Veum'),
(15, 'Parisian-Rogahn'),
(16, 'Rogahn, Bogisich and Konopelski'),
(17, 'Nader LLC'),
(18, 'Murphy PLC'),
(19, 'Kertzmann, Schmidt and Wiza'),
(20, 'Klein, Keebler and Ebert'),
(21, 'Pagac and Sons'),
(22, 'Heathcote, Frami and Heller'),
(23, 'Reynolds, Hansen and Gottlieb'),
(24, 'Schamberger-Dietrich'),
(25, 'Gleason, Jast and O\'Hara'),
(26, 'Bins Group'),
(27, 'Rath, Kshlerin and Nicolas'),
(28, 'Deckow-McCullough'),
(29, 'Schultz, Halvorson and Cassin'),
(30, 'Hilpert, Cummings and Turcotte'),
(31, 'Steuber Group'),
(32, 'Rutherford, Quitzon and Stoltenberg'),
(33, 'Spinka-Orn'),
(34, 'Schinner Ltd'),
(35, 'Raynor-Bernier'),
(36, 'Fisher Group'),
(37, 'Muller Ltd'),
(38, 'Adams, Osinski and Bergnaum'),
(39, 'Barton-Lang'),
(40, 'Von-Hettinger'),
(41, 'Sauer Inc'),
(42, 'Conn, Monahan and Schulist'),
(43, 'Klein-Kling'),
(44, 'Beer Inc'),
(45, 'Cassin LLC'),
(46, 'Reichel and Sons'),
(47, 'Runte LLC'),
(48, 'Kunde-Cremin'),
(49, 'Heathcote and Sons'),
(50, 'Braun, Will and Willms'),
(51, 'Kris-Pouros'),
(52, 'Zemlak-Kunde'),
(53, 'Kohler, Raynor and Johnson'),
(54, 'Steuber, Jaskolski and Zulauf'),
(55, 'Hagenes, Auer and Harber'),
(56, 'O\'Keefe-Pouros'),
(57, 'Crona Group'),
(58, 'Simonis Inc'),
(59, 'Kohler-Boehm'),
(60, 'Deckow-Boyle'),
(61, 'Cronin-Russel'),
(62, 'Gusikowski, Ruecker and Goldner'),
(63, 'Ziemann, Windler and Nitzsche'),
(64, 'Spinka LLC'),
(65, 'Hand-Funk'),
(66, 'Larson Group'),
(67, 'Leffler, Emmerich and DuBuque'),
(68, 'Schultz, Padberg and Skiles'),
(69, 'Tremblay, Lang and Gerhold'),
(70, 'Schowalter, Durgan and Thompson'),
(71, 'Hills-Cole'),
(72, 'Gutmann PLC'),
(73, 'Sanford-Emard'),
(74, 'Cassin Inc'),
(75, 'Brekke, Hayes and Gleason'),
(76, 'Klocko, Lynch and Douglas'),
(77, 'Hahn Ltd'),
(78, 'Turcotte, Abbott and O\'Connell'),
(79, 'Schaefer-Windler'),
(80, 'Sawayn-Wilderman'),
(81, 'Franecki Inc'),
(82, 'Rohan-Swaniawski'),
(83, 'Wehner-Flatley'),
(84, 'Hansen and Sons'),
(85, 'Langosh Group'),
(86, 'Hintz, Hamill and Reichel'),
(87, 'Lueilwitz Inc'),
(88, 'Mertz-Brakus'),
(89, 'Kub-Dibbert'),
(90, 'Jaskolski, Connelly and Dickens'),
(91, 'Conroy-Stoltenberg'),
(92, 'Eichmann-McLaughlin'),
(93, 'Hahn, O\'Kon and Jerde'),
(94, 'Mayer PLC'),
(95, 'Russel PLC'),
(96, 'Glover, Balistreri and Hayes'),
(97, 'Lehner, Steuber and Welch'),
(98, 'Lind-Wisoky'),
(99, 'Kling, Fritsch and Walker'),
(100, 'Kuhlman PLC'),
(101, 'Jast Inc'),
(102, 'Bayer-DuBuque'),
(103, 'Johns, Roob and Lehner'),
(104, 'Abernathy Ltd'),
(105, 'Pagac PLC'),
(106, 'Green PLC'),
(107, 'Mraz-Gutkowski'),
(108, 'Pollich Ltd'),
(109, 'Little, Emmerich and Hessel'),
(110, 'Herman, Klein and Corwin'),
(111, 'Hansen LLC'),
(112, 'Greenfelder-Pfeffer'),
(113, 'Schneider Group'),
(114, 'Bernier and Sons'),
(115, 'Rodriguez Inc'),
(116, 'Gislason Inc'),
(117, 'Konopelski, Ruecker and Ledner'),
(118, 'Pollich Ltd'),
(119, 'Bechtelar PLC'),
(120, 'Padberg-Brakus'),
(121, 'Gusikowski, Jacobi and Reynolds'),
(122, 'Keeling-Welch'),
(123, 'Champlin-Schroeder'),
(124, 'Zemlak, Kuvalis and Auer'),
(125, 'Ward, Johnson and Ankunding'),
(126, 'Glover Ltd'),
(127, 'Dickinson-Larkin'),
(128, 'Lowe-Abbott'),
(129, 'Kuhic, Lakin and Greenfelder'),
(130, 'Jerde LLC'),
(131, 'Renner, Waelchi and Welch'),
(132, 'Ryan-Hill'),
(133, 'Hermann, Stoltenberg and Blanda'),
(134, 'Bosco LLC'),
(135, 'Schmitt, Bashirian and Schumm'),
(136, 'O\'Hara Ltd'),
(137, 'Beatty, Cormier and Dickens'),
(138, 'Cummerata LLC'),
(139, 'Homenick, Wehner and Jones'),
(140, 'Rodriguez-Keebler'),
(141, 'Friesen, Bernhard and Heaney'),
(142, 'Becker, Sawayn and Grant'),
(143, 'Nader PLC'),
(144, 'Hoeger-Bins'),
(145, 'Daniel-Schmeler'),
(146, 'Thiel LLC'),
(147, 'Beer-Frami'),
(148, 'Williamson Ltd'),
(149, 'Kulas-Hagenes'),
(150, 'Williamson Group'),
(151, 'Romaguera, Nikolaus and Gutmann'),
(152, 'Hartmann and Sons'),
(153, 'Mayert, O\'Conner and Fay'),
(154, 'Cassin, Kunze and Hackett'),
(155, 'Cole Ltd'),
(156, 'Hickle, Upton and Gaylord'),
(157, 'Schneider Ltd'),
(158, 'Aufderhar-Walter'),
(159, 'Botsford, West and Terry'),
(160, 'Conn, Schinner and Bartell'),
(161, 'Shields PLC'),
(162, 'Cronin Inc'),
(163, 'Cronin, Douglas and Christiansen'),
(164, 'Skiles-Friesen'),
(165, 'Ziemann, Balistreri and Hodkiewicz'),
(166, 'Dicki, Beahan and Greenholt'),
(167, 'Lesch, Wilderman and Feest'),
(168, 'Durgan Inc'),
(169, 'Hauck LLC'),
(170, 'Cronin-Carroll'),
(171, 'Swift-Crooks'),
(172, 'Klocko, Aufderhar and Reilly'),
(173, 'Kuhlman, Rohan and Hodkiewicz'),
(174, 'Koelpin and Sons'),
(175, 'Hegmann, Dibbert and Beier'),
(176, 'Brakus, Wehner and Reilly'),
(177, 'Mills, Carroll and Herman'),
(178, 'Wisozk-Langworth'),
(179, 'Lesch-Simonis'),
(180, 'Upton Ltd'),
(181, 'Gleichner, Braun and Kub'),
(182, 'Gleichner-Hoeger'),
(183, 'Hodkiewicz Group'),
(184, 'Thiel, Schaefer and Moore'),
(185, 'Ernser-Wilkinson');

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL COMMENT 'check id',
  `user_id` int NOT NULL COMMENT 'client id',
  `updated_at` date DEFAULT NULL COMMENT 'date of change',
  `created_at` date DEFAULT NULL COMMENT 'date of creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cart_bikes`
--

CREATE TABLE `cart_bikes` (
  `id` int NOT NULL,
  `bike_id` int NOT NULL COMMENT 'FK from bikes',
  `cart_id` int NOT NULL COMMENT 'FK from cart, cart related to client',
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'MTB'),
(2, 'BMX'),
(3, 'Dirt'),
(4, 'Roadbike'),
(5, 'Downhill'),
(6, 'Trail'),
(7, 'Fugiat.'),
(8, 'Eos.'),
(9, 'Sit.'),
(10, 'Labore.'),
(11, 'Numquam.'),
(12, 'Sint quia.'),
(13, 'Voluptas.'),
(14, 'Dolore.'),
(15, 'Ea eius.'),
(16, 'Laborum.'),
(17, 'Incidunt.'),
(18, 'Veritatis.'),
(19, 'Qui.'),
(20, 'Ea quo.'),
(21, 'Impedit.'),
(22, 'Quidem.'),
(23, 'Odio.'),
(24, 'Vel et.'),
(25, 'Tempore.'),
(26, 'Dicta.'),
(27, 'Aut ea.'),
(28, 'Et.'),
(29, 'Nesciunt.'),
(30, 'In.'),
(31, 'Et.'),
(32, 'Rerum aut.'),
(33, 'Soluta.'),
(34, 'Minima.'),
(35, 'Harum.'),
(36, 'Dolor.'),
(37, 'Illo.'),
(38, 'Molestiae.'),
(39, 'Nostrum.'),
(40, 'Quis.'),
(41, 'Sint.'),
(42, 'Dolorem.'),
(43, 'Tempore.'),
(44, 'Et.'),
(45, 'Ex rerum.'),
(46, 'Harum.'),
(47, 'Et ut.'),
(48, 'At.'),
(49, 'Dolor cum.'),
(50, 'Assumenda.'),
(51, 'Magnam.'),
(52, 'Fugiat.'),
(53, 'Quisquam.'),
(54, 'Error.'),
(55, 'Placeat.'),
(56, 'Soluta.'),
(57, 'Veniam ut.'),
(58, 'Enim.'),
(59, 'Et ut eum.'),
(60, 'Voluptas.'),
(61, 'Unde.'),
(62, 'Laborum.'),
(63, 'Magnam.'),
(64, 'Sunt fuga.'),
(65, 'Enim.'),
(66, 'Ullam.'),
(67, 'Enim.'),
(68, 'Velit.'),
(69, 'Vitae.'),
(70, 'Earum.'),
(71, 'Sit.'),
(72, 'A eum.'),
(73, 'Enim.'),
(74, 'Ut sunt.'),
(75, 'Excepturi.'),
(76, 'Enim ut.'),
(77, 'Alias.'),
(78, 'Id illum.'),
(79, 'Impedit.'),
(80, 'Voluptas.'),
(81, 'Aut sequi.'),
(82, 'Culpa.'),
(83, 'Dicta.'),
(84, 'Officia.'),
(85, 'Tenetur.'),
(86, 'At odit.'),
(87, 'Quidem.'),
(88, 'Eligendi.'),
(89, 'Quia sunt.'),
(90, 'Ab ullam.'),
(91, 'Tenetur.'),
(92, 'Sed quis.'),
(93, 'Qui eius.'),
(94, 'Aut fuga.'),
(95, 'Sapiente.'),
(96, 'Qui sed.'),
(97, 'Suscipit.'),
(98, 'Illum.'),
(99, 'Et.'),
(100, 'Eligendi.'),
(101, 'Optio.'),
(102, 'Sed.'),
(103, 'Molestias.'),
(104, 'Eius.'),
(105, 'Sint.'),
(106, 'Veritatis.'),
(107, 'Ex cum.'),
(108, 'Aut.'),
(109, 'Labore.'),
(110, 'Illo et.'),
(111, 'Rerum.'),
(112, 'Placeat.'),
(113, 'Sunt id.'),
(114, 'Et est.'),
(115, 'In.'),
(116, 'Non.'),
(117, 'Magnam.'),
(118, 'Ullam.'),
(119, 'Dicta quo.'),
(120, 'Minus.'),
(121, 'Accusamus.'),
(122, 'Eveniet.'),
(123, 'Assumenda.'),
(124, 'Sint.'),
(125, 'Qui eius.'),
(126, 'Provident.'),
(127, 'Nisi vero.'),
(128, 'Quam ut.'),
(129, 'Ea.'),
(130, 'Unde fuga.'),
(131, 'Sint.'),
(132, 'Aut alias.'),
(133, 'Placeat.'),
(134, 'Enim id.'),
(135, 'Quaerat.'),
(136, 'Quia.'),
(137, 'Quasi ut.'),
(138, 'Qui.'),
(139, 'Aut qui.'),
(140, 'Facilis.'),
(141, 'Rerum.'),
(142, 'Voluptas.'),
(143, 'Nemo.'),
(144, 'In ut.'),
(145, 'Neque.'),
(146, 'Possimus.'),
(147, 'Sunt.'),
(148, 'Optio.'),
(149, 'Veniam.'),
(150, 'Et autem.'),
(151, 'Hic.'),
(152, 'Ab.'),
(153, 'Autem.'),
(154, 'Doloribus.'),
(155, 'Qui quo.'),
(156, 'Minima.'),
(157, 'Est.'),
(158, 'In.'),
(159, 'Iure quia.'),
(160, 'Culpa ad.'),
(161, 'Expedita.'),
(162, 'Incidunt.'),
(163, 'Sed qui.'),
(164, 'Dolores.'),
(165, 'Quod.'),
(166, 'Odio qui.'),
(167, 'Est nobis.'),
(168, 'Quas.'),
(169, 'Ducimus.'),
(170, 'Quae.'),
(171, 'Nobis.'),
(172, 'Ut autem.'),
(173, 'Molestiae.'),
(174, 'Dolorem.'),
(175, 'Laborum.'),
(176, 'Et rerum.'),
(177, 'Veniam.'),
(178, 'Atque sit.'),
(179, 'Qui.'),
(180, 'Nesciunt.'),
(181, 'Quia.'),
(182, 'Omnis qui.'),
(183, 'Dolor.'),
(184, 'Ut cumque.'),
(185, 'Deserunt.'),
(186, 'Voluptas.'),
(187, 'Fugiat.');

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id`, `name`) VALUES
(1, 'red'),
(2, 'yellow'),
(3, 'green'),
(4, 'blue'),
(5, 'black'),
(6, 'white'),
(7, 'Magenta'),
(8, 'OldLace'),
(9, 'Teal'),
(10, 'MediumTurquoise'),
(11, 'FloralWhite'),
(12, 'DarkRed'),
(13, 'DarkCyan'),
(14, 'FireBrick'),
(15, 'Yellow'),
(16, 'RosyBrown'),
(17, 'Tomato'),
(18, 'Teal'),
(19, 'RosyBrown'),
(20, 'Chocolate'),
(21, 'Purple'),
(22, 'LightCyan'),
(23, 'LightGray'),
(24, 'SkyBlue'),
(25, 'LemonChiffon'),
(26, 'SlateGray'),
(27, 'GoldenRod'),
(28, 'Red'),
(29, 'BlanchedAlmond'),
(30, 'OldLace'),
(31, 'PapayaWhip'),
(32, 'SkyBlue'),
(33, 'NavajoWhite'),
(34, 'Gray'),
(35, 'Snow'),
(36, 'PapayaWhip'),
(37, 'LightGoldenRodYellow'),
(38, 'MediumSeaGreen'),
(39, 'ForestGreen'),
(40, 'Cyan'),
(41, 'SaddleBrown'),
(42, 'DarkMagenta'),
(43, 'Orange'),
(44, 'Cyan'),
(45, 'DarkMagenta'),
(46, 'LavenderBlush'),
(47, 'SeaGreen'),
(48, 'Moccasin'),
(49, 'LightSteelBlue'),
(50, 'OldLace'),
(51, 'Lime'),
(52, 'Moccasin'),
(53, 'Peru'),
(54, 'Darkorange'),
(55, 'Black'),
(56, 'Plum'),
(57, 'Bisque'),
(58, 'OldLace'),
(59, 'GoldenRod'),
(60, 'LightBlue'),
(61, 'CadetBlue'),
(62, 'LawnGreen'),
(63, 'Olive'),
(64, 'LightSteelBlue'),
(65, 'Plum'),
(66, 'GhostWhite'),
(67, 'DarkTurquoise'),
(68, 'DodgerBlue'),
(69, 'DarkBlue'),
(70, 'PeachPuff'),
(71, 'Tan'),
(72, 'DodgerBlue'),
(73, 'DarkGoldenRod'),
(74, 'Gainsboro'),
(75, 'Cyan'),
(76, 'PaleGreen'),
(77, 'RoyalBlue'),
(78, 'Violet'),
(79, 'DarkOliveGreen'),
(80, 'LightBlue'),
(81, 'Tomato'),
(82, 'Orange'),
(83, 'Crimson'),
(84, 'LightCyan'),
(85, 'SteelBlue'),
(86, 'PaleGreen'),
(87, 'SpringGreen'),
(88, 'Peru'),
(89, 'PaleGreen'),
(90, 'SeaShell'),
(91, 'DarkSeaGreen'),
(92, 'DimGrey'),
(93, 'MediumPurple'),
(94, 'Chocolate'),
(95, 'MediumSlateBlue'),
(96, 'PaleVioletRed'),
(97, 'Sienna'),
(98, 'Maroon'),
(99, 'PaleGreen'),
(100, 'LightSlateGray'),
(101, 'LemonChiffon'),
(102, 'Green'),
(103, 'Linen'),
(104, 'IndianRed'),
(105, 'CornflowerBlue'),
(106, 'Teal'),
(107, 'Lime'),
(108, 'Peru'),
(109, 'DarkSeaGreen'),
(110, 'Magenta'),
(111, 'DeepPink'),
(112, 'MediumSeaGreen'),
(113, 'Chocolate'),
(114, 'DarkSlateBlue'),
(115, 'PapayaWhip'),
(116, 'AntiqueWhite'),
(117, 'Tomato'),
(118, 'LightGreen'),
(119, 'OrangeRed'),
(120, 'MediumVioletRed'),
(121, 'SpringGreen'),
(122, 'Aqua'),
(123, 'Red'),
(124, 'MediumSlateBlue'),
(125, 'Moccasin'),
(126, 'MintCream'),
(127, 'Purple'),
(128, 'Linen'),
(129, 'Maroon'),
(130, 'MediumSpringGreen'),
(131, 'LightSteelBlue'),
(132, 'Silver'),
(133, 'SpringGreen'),
(134, 'Linen'),
(135, 'HotPink'),
(136, 'LightSlateGray'),
(137, 'DarkTurquoise'),
(138, 'DarkMagenta'),
(139, 'DarkOliveGreen'),
(140, 'Thistle'),
(141, 'Red'),
(142, 'DarkBlue'),
(143, 'MediumVioletRed'),
(144, 'GhostWhite'),
(145, 'Coral'),
(146, 'MidnightBlue'),
(147, 'Gray'),
(148, 'Indigo'),
(149, 'DarkOrchid'),
(150, 'Khaki'),
(151, 'GoldenRod'),
(152, 'DeepSkyBlue'),
(153, 'DarkBlue'),
(154, 'Gainsboro'),
(155, 'DarkOliveGreen'),
(156, 'Chocolate'),
(157, 'SaddleBrown'),
(158, 'Snow'),
(159, 'Navy'),
(160, 'AntiqueWhite'),
(161, 'AntiqueWhite'),
(162, 'MediumVioletRed'),
(163, 'LightSlateGray'),
(164, 'DarkSlateBlue'),
(165, 'LightBlue'),
(166, 'Ivory'),
(167, 'NavajoWhite'),
(168, 'MediumSeaGreen'),
(169, 'DeepSkyBlue'),
(170, 'DarkOrchid'),
(171, 'Blue'),
(172, 'Beige'),
(173, 'Ivory'),
(174, 'SeaGreen'),
(175, 'NavajoWhite'),
(176, 'Turquoise'),
(177, 'Wheat'),
(178, 'Plum'),
(179, 'MediumTurquoise'),
(180, 'Chartreuse'),
(181, 'LightBlue'),
(182, 'DarkGray'),
(183, 'MediumPurple'),
(184, 'Moccasin'),
(185, 'Snow'),
(186, 'Linen'),
(187, 'DeepSkyBlue'),
(188, 'Pofdsf');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'ид клиента, кто купил товар',
  `price` int NOT NULL COMMENT 'summary price for an order',
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Created' COMMENT 'order status',
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_bikes`
--

CREATE TABLE `order_bikes` (
  `id` int NOT NULL COMMENT 'for reviews checking',
  `order_id` int NOT NULL,
  `bike_id` int NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` text COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_general_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `tokenable_id` int NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `name`, `token`, `abilities`, `expires_at`, `tokenable_id`, `tokenable_type`, `updated_at`, `created_at`, `last_used_at`) VALUES
(28, 'auth_token', '32c61212a450cfd62d6b92bc17068a2e5691077dd228b29b0fe0cb9002bd8217', '[\"*\"]', '2023-06-09 23:21:47', 326, 'App\\Models\\User', '2023-06-09 00:21:25', '2023-06-08 23:21:47', '2023-06-09 00:21:25'),
(29, 'auth_token', 'cdfbc5f8a5763b3ca8687f11b9e7a85e314e96ab40eb4f34eadfd90f6619934e', '[\"*\"]', '2023-06-10 00:28:54', 326, 'App\\Models\\User', '2023-06-09 00:28:54', '2023-06-09 00:28:54', NULL),
(30, 'auth_token', '121461116bd054ed7e2c2e7d33dd240c5e0fae9904408c6f7ac98eb1a3caa57b', '[\"*\"]', '2023-06-10 00:29:35', 326, 'App\\Models\\User', '2023-06-09 02:46:37', '2023-06-09 00:29:35', '2023-06-09 02:46:37'),
(31, 'auth_token', '589c07f9d88a1c1926b7d9549315d7a6c27630d45ef0f4643095cbb02a8edc87', '[\"*\"]', '2023-06-10 00:31:14', 325, 'App\\Models\\User', '2023-06-09 00:31:52', '2023-06-09 00:31:14', '2023-06-09 00:31:52'),
(32, 'auth_token', '22e8c3ae49cfb3eb4850da3db396536519caae3eb6eed7d24acddf9a158ec50e', '[\"*\"]', '2023-06-10 00:56:39', 325, 'App\\Models\\User', '2023-06-09 01:59:30', '2023-06-09 00:56:39', '2023-06-09 01:59:30');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL COMMENT 'ид обзора',
  `bike_id` int NOT NULL COMMENT 'bike id',
  `user_id` int NOT NULL COMMENT 'client id',
  `text` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'текст обзора',
  `rating` int NOT NULL COMMENT 'рейтинг, оставленный клиентом',
  `created_at` date DEFAULT NULL COMMENT 'date of creation',
  `updated_at` date DEFAULT NULL COMMENT 'date of change '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `bike_id`, `user_id`, `text`, `rating`, `created_at`, `updated_at`) VALUES
(1, 186, 326, 'This bike is amazing!', 5, '2023-06-09', '2023-06-09');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT 'id клиента',
  `role_id` int NOT NULL DEFAULT '1' COMMENT 'role_id = 1 => user',
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'имя клиента',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'почта клиента',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'телефон клиента',
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'пароль',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `phone`, `password`, `remember_token`) VALUES
(203, 1, 'Pamela Cassin II', 'gleichner.tamia@example.com', '79536163209', '$2y$10$U59ioQG0A1TDkalre2Fi4euVpp/WrJ9JozLwSEVf3NSO4.pQGX5PS', ''),
(204, 1, 'Cortney Kemmer', 'hoeger.emelie@example.org', '79539867450', '$2y$10$zMcQ/iufPHQ8EdKmzgIqNOrqd/P3sQBSCCCZ9tYO67qtwaEkZQouq', ''),
(205, 1, 'Myriam Luettgen', 'fstoltenberg@example.net', '79533677050', '$2y$10$RinZnzNcRLSz64oodPNp7eAvcFOJvhOico6izEtSaDqEpwa8ye1q.', ''),
(206, 1, 'Lisa Daugherty', 'fraynor@example.com', '79539728024', '$2y$10$2pW/TZh2Dy7JAHO3Wp.O8e6tiGRB3cQl0uVSP9HM/gZMUS9B69lrO', ''),
(207, 1, 'Norene Schuster', 'hartmann.allie@example.com', '79532454676', '$2y$10$x65./mHLXIkmnBYsnI.eG.C/1ZaA7wEB0PogNw9qEa3FyWIQE9cMe', ''),
(208, 1, 'Lisa O\'Hara', 'bayer.ofelia@example.net', '79531982432', '$2y$10$4QH40pkIufyDJrRLjhOmdez.URjhR9I.7IGuYCVcKelGA53TWZvb6', ''),
(209, 1, 'Dr. Jaqueline Blick', 'ali62@example.com', '79539881426', '$2y$10$/QhLVucYX5NcUAIOozOvOeta9vtpDPOnSH6kl7sOUO1IKsO.cLPGG', ''),
(210, 1, 'Ayden Yundt', 'xbrakus@example.com', '79537062548', '$2y$10$lSy8Gu0081Pf9jYarIdw0.kH1jcTzjP63QfCYxgg2/jxSQuqqhwvm', ''),
(211, 1, 'Edison Halvorson', 'vjones@example.com', '79537882349', '$2y$10$OYnSSL7tpxIq5uZGRI/gQe9iK7YvB16wyGzYK7N.1y84hSJ3TRzEq', ''),
(212, 1, 'Garnett Green', 'hkiehn@example.com', '79532172645', '$2y$10$9hA9Thr92.kq9AQmbEU.AukArfn41XElsJe2z5KDwjzVhLLLdUx5u', ''),
(213, 1, 'Ramon Weimann', 'dcollins@example.net', '79538994272', '$2y$10$NB2crYQkrNjbI0fOJz.yZuvUeGwChcXs3tR.ygvi1BUya3RWmgunq', ''),
(214, 1, 'Garth Nolan', 'harvey.berta@example.org', '79537963008', '$2y$10$/3i7PIV.f/RljgtBxzteYunI25FQ8bi4gjX98Jl2ErxU08Cg.cB7m', ''),
(215, 1, 'Reymundo Padberg IV', 'alvina70@example.com', '79534725370', '$2y$10$A9RAYIYC/.PL.PFKWsEFhuYs/ynv1kkKcK64aDSBd3w.Pklx5c/Lq', ''),
(216, 1, 'Cameron Mills', 'elroy.kovacek@example.com', '79535321050', '$2y$10$z0raV/v5jEvK6aVlspZOjenNcNirah37Tj/BN8oEmR2CP2xrIRMlu', ''),
(217, 1, 'Cheyanne Harris Jr.', 'brempel@example.org', '79535756924', '$2y$10$vYudldF2XfcwX4fChdNKd.aHelw8fcDHi00mUn34AKcBiJCQqGqeC', ''),
(218, 1, 'Elisabeth Rau', 'ilangworth@example.net', '79530907105', '$2y$10$AiLoNmWWhuwnSqqgc24R8.Uau0MrAL8R4.bXVetraBYvRuUXFNIjW', ''),
(219, 1, 'Clementine Stehr', 'howe.wilhelm@example.org', '79533450803', '$2y$10$Y3Ta70.2ERDqBD3Mpw3tD.eZZifhOCh2fVSCCYpcekeosmL0HJjwu', ''),
(220, 1, 'Adrain Yundt Sr.', 'zulauf.damian@example.com', '79533583311', '$2y$10$nVndzPHqKyqhPkaJbJjuWO2mrw/sVnpQjrk4tsyDCSuYNH6hkQiju', ''),
(221, 1, 'Okey Walker I', 'gregg.adams@example.org', '79536302488', '$2y$10$.QXfNEIQ/fAI6/zZARn3iesriz.TYI5DhfsaVKcfcwQegUsiSdCl2', ''),
(222, 1, 'Amara Howell', 'demond.gleichner@example.com', '79534536571', '$2y$10$P99oK2Vnz6vm9Ncug.BqLOgc2Rb/zRjZXQ/WnfpligQ.yn439ht.K', ''),
(223, 1, 'Dr. Miller Kessler', 'christina84@example.org', '79530942570', '$2y$10$UxbB0Iy3vw7.8v5XgzJaE.mb2NHhzNy9ax7zzZ68C.nevCLz8NTtS', ''),
(224, 1, 'Jaleel Aufderhar IV', 'zboncak.burley@example.com', '79537170958', '$2y$10$F44vPj1m4D0qPyOnAbchOOLfWWLaTjjnsrF/6lLmELGxFmbGnC/p.', ''),
(225, 1, 'Prof. Devon O\'Hara I', 'mbogisich@example.org', '79530893570', '$2y$10$6EeqEayR4MmeAPyyc.vSr.oWYOuDUl50Xm27z4rY0DsW/IMyHgTr.', ''),
(226, 1, 'Thad Schneider', 'qankunding@example.org', '79533185139', '$2y$10$4DcakPQBwmCvttxMHz/6nOosnq5x42hbcMqAPXfEI1KsfJrzcxHaK', ''),
(227, 1, 'Dr. Aglae Kuhic', 'znader@example.com', '79532790705', '$2y$10$ShHhn9u6b0tRlgCugNp.G.JFpHzN9mTl7k2PE9ZxhhCRuCGUEEN/a', ''),
(228, 1, 'Aditya Stiedemann', 'damore.jolie@example.net', '79533823742', '$2y$10$NfpGgmLvRcyYi0GXMxp2Me9lfJJ1jT/ShnBe7gkBRsCmwDLs1ac9K', ''),
(229, 1, 'Dennis Turcotte', 'faye34@example.net', '79537447076', '$2y$10$nLAXwK75xeSWLvli34epZeaiyEeeJ0rlqf/.0Yauh1kpU1nlSL.2C', ''),
(230, 1, 'Rodrick Kub', 'wunsch.marge@example.org', '79533943765', '$2y$10$lvtMJCerToCVtD6KaBDaq.xtByWd8C2hgHnw4MKEKCPcKeleqK4Z2', ''),
(231, 1, 'Tiara Ward', 'vkoelpin@example.com', '79538996547', '$2y$10$/vndbHhBTTU4kgvbLOxkte2D0qfxkFGI2clHlCUO8T/nbSnftuZVu', ''),
(232, 1, 'Cordia Stamm', 'pwuckert@example.com', '79536897782', '$2y$10$xu5KqQbeqz5/.qdZMeM4SO/gTC3mdR6VfHL48NX.rX.dQurOHMBC6', ''),
(233, 1, 'Caden Torphy', 'cathryn92@example.org', '79537000125', '$2y$10$mebtEijKh0RXMo0e0MAOZuo7B01.mdOLVFW5TJMctnU52Icr5UTr2', ''),
(234, 1, 'Lori Funk', 'armani69@example.org', '79538689009', '$2y$10$142qeA3BmKwv7S5aneP/Mu9NDhBw/Z0iXozrn3UBClmOGuug925U.', ''),
(235, 1, 'Athena Bailey', 'jcormier@example.net', '79535619033', '$2y$10$lDnNr27FY/FIao4NYZXpie2otwMSN5mQ6CFlHqZ1Gr5RfosoULxU2', ''),
(236, 1, 'Kacey Murphy', 'ifranecki@example.net', '79535353856', '$2y$10$HaTvdvMvsB7Uk/D.qMMGEeW3AhZ3bNVNJQxd7TcGf8yNOt6PD0feS', ''),
(237, 1, 'Sarah Stiedemann V', 'adaline.herman@example.net', '79530594666', '$2y$10$m5xUp6LZISEEWf4Hl3zQGufM2r96u4E/5PUilsy3MmSYaZ80mPt9i', ''),
(238, 1, 'Jordan Veum', 'waelchi.stephania@example.com', '79530168653', '$2y$10$lxIxaTdtlQr3.RAZsKcv/OGlAwwsNS6.44FhCo4r9J0zw/qdt6A16', ''),
(239, 1, 'Garnet Dicki', 'lucy75@example.net', '79530271547', '$2y$10$mGE3d9Qsn2LteXEPx6WLSupTHe5kGwpg1a8XlXXLbSmzJEoGKhHgq', ''),
(240, 1, 'Mr. Timmothy Wisoky', 'crystal.gutmann@example.net', '79536331452', '$2y$10$3fdTzp85XvbwDmjISiCXKeUs0P1oBiznWktbK369caHXysNuRhvJ.', ''),
(241, 1, 'Lacey Walsh V', 'gladyce.vonrueden@example.org', '79537725972', '$2y$10$sHM/EYvpxBIo0uHt9I6jR.W0bSQU3w3Doam/pHN.g6PZT01ZWFvUq', ''),
(242, 1, 'Omari Lynch', 'toney.padberg@example.org', '79537668731', '$2y$10$S3hOoAAwNO0Uw/oVi9u4bOBGtykxl79LRjLMvVi8Soh8Zi1m6SJFy', ''),
(243, 1, 'Kristian Kling', 'naomie48@example.org', '79538482759', '$2y$10$bLOUltivYPpfB6dlY7eIj.z1uhoK/.RXUZvobTbxMMFxRRkApHyH.', ''),
(244, 1, 'Orlando Cassin Sr.', 'rowena.goyette@example.net', '79536048855', '$2y$10$KhSZh62YavK8LCVpgkHLYeYJ4fgYLKgK/ywTlmL16Sif2X5rnPSsu', ''),
(245, 1, 'Ms. Jaida Kihn V', 'padberg.claud@example.org', '79538424362', '$2y$10$aNJUI9pBJO5vubLuV3kAF.QnGvIY3qFGz30K3EE32La5fZZed1OIm', ''),
(246, 1, 'Miss Valentina Huel I', 'ulises15@example.com', '79537282802', '$2y$10$tsKomZunFlAXfj7OxDrrlekbyGDhO2BihswqmGF8MxTxVygqBBPGO', ''),
(247, 1, 'Christelle DuBuque', 'hahn.solon@example.net', '79534711860', '$2y$10$ORnI6wYpjhgj9mtVaf5wreXQQ0vj6oaoXF2hnk7LNU465jRa299g2', ''),
(248, 1, 'Dr. Milo O\'Kon DDS', 'sarina92@example.net', '79536873847', '$2y$10$UZIpLOOC4PmWyHeGV.EH6uEVqZdMpEh3OtXQ3uFmNVlqcvU39WwNS', ''),
(249, 1, 'Alanis Heidenreich IV', 'phomenick@example.com', '79532243639', '$2y$10$IHIWJyVP.S3miSzI4r6oP.LBMu9IqCivPVuQ7esm3LOMLC/yszoCu', ''),
(250, 1, 'Jennifer Lynch', 'zulauf.sonny@example.org', '79535358289', '$2y$10$QUj24/oW7hN/.dqNYkrcZeg1sz2GMuCRT8BLVBtsci7V4la089x.K', ''),
(251, 1, 'Casimir Nienow', 'christopher64@example.org', '79535030238', '$2y$10$2YF9bkNHSKrV7jh4iza1Y.4dXp9LhfioYKNDf76cY6zkvW5kjBzd.', ''),
(252, 1, 'Meaghan Senger', 'deshaun46@example.com', '79535882593', '$2y$10$9bIBDVsh/j0jU/QMjIFWIudmsO5TbSWRY7wtn0AJW4F3VbdD3n2M6', ''),
(253, 1, 'Philip Hagenes', 'harmony.goodwin@example.com', '79530501763', '$2y$10$5VWa8wtHnWy843KPtR1ExuajKZhTLsOhPMQgul29J/ihuEuWLKiXe', ''),
(254, 1, 'Connie Weissnat IV', 'daisha51@example.org', '79531824034', '$2y$10$5LQjcCm1CGIHOx0PIQGpDOJdNmooqph0NCGM/yzHJT2KBiaKRjo1C', ''),
(255, 1, 'Mr. Daron Weissnat V', 'georgiana.jacobs@example.net', '79534847976', '$2y$10$Fz5gucIJYlV60TG1k9XL5OXwelzpaTCgwpPlitIpif2Q7oQjAl3fO', ''),
(256, 1, 'Glenda Fritsch', 'maximillian67@example.net', '79535081130', '$2y$10$Iw3V921YzXSqkEWcsECAi.QgASL5hEkzkleMGqCjibB9NSKqc5ZyG', ''),
(325, 1, 'khgjkghjkg', 'kjhgkghj@example.com', '79442341233', '$2y$10$G7i3nEKN7mkVF2fspgu5.OaKI9JJbbZfLrtw3DNuloK97H5oWk3za', NULL),
(326, 2, 'kjghghjk', 'jhklhjklhkj@example.com', '79442341233', '$2y$10$DuR28ME/ifqW1.6bQBna7.NxFNBA4HJQsiUlEy3I5rXRJyKtc/LW2', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`user_id`);

--
-- Индексы таблицы `cart_bikes`
--
ALTER TABLE `cart_bikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bike_id` (`bike_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`user_id`);

--
-- Индексы таблицы `order_bikes`
--
ALTER TABLE `order_bikes`
  ADD KEY `bike_id` (`bike_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_access_tokens_ibfk_1` (`tokenable_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bike_id` (`bike_id`),
  ADD KEY `client_id` (`user_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bikes`
--
ALTER TABLE `bikes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'bike id', AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'check id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cart_bikes`
--
ALTER TABLE `cart_bikes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ид обзора', AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id клиента', AUTO_INCREMENT=327;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bikes`
--
ALTER TABLE `bikes`
  ADD CONSTRAINT `bikes_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bikes_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bikes_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cart_bikes`
--
ALTER TABLE `cart_bikes`
  ADD CONSTRAINT `cart_bikes_ibfk_1` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_bikes_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_bikes`
--
ALTER TABLE `order_bikes`
  ADD CONSTRAINT `order_bikes_ibfk_1` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_bikes_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD CONSTRAINT `personal_access_tokens_ibfk_1` FOREIGN KEY (`tokenable_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
