-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2020 at 02:08 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(56) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_categories`
--

INSERT INTO `news_categories` (`id`, `category_name`, `parent_id`) VALUES
(1, 'cricket', 0),
(2, 'football', 0);

-- --------------------------------------------------------

--
-- Table structure for table `news_category_relation`
--

CREATE TABLE `news_category_relation` (
  `id` int(11) NOT NULL,
  `news_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_category_relation`
--

INSERT INTO `news_category_relation` (`id`, `news_id`, `category_id`) VALUES
(50, 54, 2),
(51, 55, 1),
(52, 55, 2),
(57, 50, 1),
(58, 51, 1),
(67, 58, 1),
(68, 49, 2),
(69, 60, 2),
(73, 52, 1),
(74, 52, 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_news`
--

CREATE TABLE `post_news` (
  `id` int(128) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 NOT NULL,
  `details` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `image` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(128) COLLATE utf8_german2_ci NOT NULL,
  `status` enum('pending','approved','rejected','') COLLATE utf8_german2_ci DEFAULT 'pending',
  `news_category` varchar(64) COLLATE utf8_german2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Dumping data for table `post_news`
--

INSERT INTO `post_news` (`id`, `title`, `details`, `image`, `category`, `status`, `news_category`) VALUES
(7, 'সন্দেহে কিশোরগঞ্জের ভৈরবে তিন দিনে', 'করোনাভাইরাসে আক্রান্ত হতে পারে সন্দেহে কিশোরগঞ্জের ভৈরবে তিন দিনে মোট ৩৪ জনকে ‘হোম কোয়ারেন্টাইনে’ রাখা হয়েছে। ‘হোম কোয়ারেন্টাইনে’ রাখা ৩২ জন পুরুষ। তাঁরা সবাই বিদেশফেরত। বাকি দুজন নারী।\r\nপৌর ও ইউনিয়ন স্বাস্থ্য সহকারীরা হোম কোয়ারেন্টাইনের প্রধান পর্যবেক্ষক হিসেবে নেতৃত্ব দিচ্ছেন। করোনাভাইরাস প্রতিরোধ কমিটির পক্ষ থেকে সার্বক্ষণিক তাঁদের স্বাস্থ্যের খোঁজ ।', '33160ভৈরবে৩৪জন.png', 'topnews', 'pending', NULL),
(9, 'নিউজিল্যান্ডে আকস্মিক বন্যায় ', 'নিউজিল্যান্ডে আকস্মিক বন্যায় হাজারো মানুষ ঘরবাড়ি ছেড়েছে', 'নিউজিল্যান্ডে.png', 'topnews', 'pending', NULL),
(10, 'করোনার বিস্তার রোধে বিশ্ব স্বাস্থ্য সংস্থা', ': করোনাভাইরাসে আক্রান্ত হতে পারে সন্দেহে কিশোরগঞ্জের ভৈরবে তিন দিনে মোট ৩৪ জনকে ‘হোম কোয়ারেন্টাইনে’ রাখা হয়েছে। ‘হোম কোয়ারেন্টাইনে’ রাখা ৩২ জন পুরুষ। তাঁরা সবাই বিদেশফেরত। বাকি দুজন নারী। ', 'করোনাভাইরাসের.png', 'populernews', 'pending', NULL),
(11, ' সক্ষমতা বিবেচনা করে শিক্ষাক্রম ', 'শিক্ষার্থীর বয়স ও সক্ষমতা বিবেচনা করে শিক্ষাক্রম এবং তার আলোকে কোন শ্রেণির জন্য কয়টি বই হবে, তা ঠিক করে দেয় জাতীয় শিক্ষাক্রম ও পাঠ্যপুস্তক বোর্ড (এনসিটিবি)', 'পাঠ্যপুস্তক .png', 'topnews', 'pending', NULL),
(12, 'সিম-নিয়ে-সংকটের-আশঙ্কা-জিপির', 'পেঁয়াজের-মতো-সিম-নিয়ে-সংকটের-আশঙ্কা-জিপির', 'আশঙ্কা-জিপির.png', 'topnews', 'pending', NULL),
(13, 'অস্ট্রেলিয়ায় হত্যা করা হবে ১০ হাজার উট', 'অস্ট্রেলিয়ায় হত্যা করা হবে ১০ হাজার উট', 'হাজার উট.png', 'topnews', 'pending', NULL),
(14, 'জায়গা ধরে রাখার জন্য খেলেন মুশফিকুর রহিম। ', 'জাতীয় দলের হয়ে প্রতি ম্যাচেই জায়গা ধরে রাখার জন্য খেলেন মুশফিকুর রহিম। তাঁর দৃষ্টিতে শুধু সাকিব আল হাসান ও তামিম ইকবাল বাংলাদেশ দলে ‘অটোমেটিক চয়েজ’।', 'তামিম–সাকিবই.png', 'topnews', 'pending', NULL),
(15, 'তামিম ইকবালের বেতন আগে ছিল ', 'তামিম ইকবালের বেতন আগে ছিল মাসে ৪ লাখ টাকা। এখন সেটি বেড়ে হয়েছে ৬ লাখ ৩০ হাজার টাকা। মাসে ৪ লাখ টাকা পেতেন মুশফিকুর রহিমও। আজ বিসিবি ঘোষিত নতুন গ্রেডিং অনুযায়ী তিনি মাসে পাবেন ৬ লাখ ২০ হাজার টাকা করে।', '613209তামিমের বেতন.png', 'populernews', 'pending', NULL),
(16, 'করোনার বিস্তার রোধে সুযোগ তৈরি হয়েছে: বিশ্ব স্বাস্থ্য সংস্থা', 'করোনার বিস্তার রোধে সুযোগ তৈরি হয়েছে: বিশ্ব স্বাস্থ্য সংস্থা', 'করোনাভাইরাসের.png', 'topnews', 'pending', NULL),
(17, 'যুক্তরাষ্ট্রের কলোরাডো বিশ্ববিদ্যালয়ের ', 'যুক্তরাষ্ট্রের কলোরাডো বিশ্ববিদ্যালয়ের এক দল বিজ্ঞানী এমন এক ধরনের কংক্রিট তৈরি করেছেন, যা জীবন্ত সত্তার মতো কাজ করবে। পুনরুৎপাদনে সক্ষম এ কংক্রিট নির্মাণ খাতে এক বড় ধরনের পরিবর্তন নিয়ে আসছে।', 'কংক্রিটের জঙ্গলে.png', 'populernews', 'pending', NULL),
(18, 'মস্তিষ্কের মতো ডিভাইস', 'মস্তিষ্কের মতো ডিভাইস। ছবি: ন্যাশনাল ইনস্টিটিউট অব ম্যাটেরিয়াল সায়েন্স মানুষের মস্তিষ্কে যেভাবে তথ্য সংরক্ষিত হয়, সেভাবেই মেমোরি যন্ত্রে তথ্য সংরক্ষণ করা যাবে। সম্প্রতি এমনই একটি যন্ত্র উদ্ভাবনে কাজ করেছে আন্তর্জাতিক গবেষকেদের একটি দল।', 'মস্তিষ্কের মতো ডিভাইস.png', 'populernews', 'pending', NULL),
(19, ' সক্ষমতা বিবেচনা করে শিক্ষাক্রম ', 'শিক্ষার্থীর বয়স ও সক্ষমতা বিবেচনা করে শিক্ষাক্রম এবং তার আলোকে কোন শ্রেণির জন্য কয়টি বই হবে, তা ঠিক করে দেয় জাতীয় শিক্ষাক্রম ও পাঠ্যপুস্তক ', 'পাঠ্যপুস্তক .png', 'latestnews', 'pending', NULL),
(33, 'সন্দেহে কিশোরগঞ্জের ভৈরবে তিন দিনে', 'করোনাভাইরাসে আক্রান্ত হতে পারে সন্দেহে কিশোরগঞ্জের ভৈরবে তিন দিনে মোট ৩৪ জনকে ‘হোম কোয়ারেন্টাইনে’ রাখা হয়েছে। ‘হোম কোয়ারেন্টাইনে’ রাখা ৩২ জন পুরুষ। তাঁরা সবাই বিদেশফেরত। বাকি দুজন নারী।পৌর ও ইউনিয়ন স্বাস্থ্য সহকারীরা হোম কোয়ারেন্টাইনের প্রধান পর্যবেক্ষক হিসেবে নেতৃত্ব দিচ্ছেন। করোনাভাইরাস প্রতিরোধ কমিটির পক্ষ থেকে সার্বক্ষণিক তাঁদের স্বাস্থ্যের খোঁজ নেওয়া হচ্ছে।', 'ভৈরবে৩৪জন.png', 'populernews', 'pending', NULL),
(34, 'নিউজিল্যান্ডে আকস্মিক বন্যায়', 'নিউজিল্যান্ডে আকস্মিক বন্যায় হাজারো মানুষ ঘরবাড়ি ছেড়েছে', 'নিউজিল্যান্ডে.png', 'populernews', 'pending', NULL),
(35, 'করোনার বিস্তার রোধে সুযোগ তৈরি হয়েছে', 'করোনার বিস্তার রোধে সুযোগ তৈরি হয়েছে: বিশ্ব স্বাস্থ্য সংস্থা', 'করোনাভাইরাসের.png', 'populernews', 'pending', NULL),
(36, 'শিক্ষার্থীর বয়স ও সক্ষমতা বিবেচনা করে শিক্ষাক্রম', 'শিক্ষার্থীর বয়স ও সক্ষমতা বিবেচনা করে শিক্ষাক্রম এবং তার আলোকে কোন শ্রেণির জন্য কয়টি বই হবে, তা ঠিক করে দেয় জাতীয় শিক্ষাক্রম ও পাঠ্যপুস্তক বোর্ড (এনসিটিবি)', 'পাঠ্যপুস্তক .png', 'populernews', 'pending', NULL),
(37, 'এক দল বিজ্ঞানী এমন এক ধরনের কংক্রিট তৈরি করেছেন', 'যুক্তরাষ্ট্রের কলোরাডো বিশ্ববিদ্যালয়ের এক দল বিজ্ঞানী এমন এক ধরনের কংক্রিট তৈরি করেছেন, যা জীবন্ত সত্তার মতো কাজ করবে। পুনরুৎপাদনে সক্ষম এ কংক্রিট নির্মাণ খাতে এক বড় ধরনের পরিবর্তন নিয়ে আসছে।', 'কংক্রিটের জঙ্গলে.png', 'topnews', 'pending', NULL),
(38, 'মানুষের মস্তিষ্কে যেভাবে তথ্য সংরক্ষিত হয়', 'মস্তিষ্কের মতো ডিভাইস। ছবি: ন্যাশনাল ইনস্টিটিউট অব ম্যাটেরিয়াল সায়েন্স মানুষের মস্তিষ্কে যেভাবে তথ্য সংরক্ষিত হয়, সেভাবেই মেমোরি যন্ত্রে তথ্য সংরক্ষণ করা যাবে। সম্প্রতি এমনই একটি যন্ত্র উদ্ভাবনে কাজ করেছে আন্তর্জাতিক গবেষকেদের একটি দল।', 'মস্তিষ্কের মতো ডিভাইস.png', 'topnews', 'pending', NULL),
(39, 'সিম-নিয়ে-সংকটের-আশঙ্কা-জিপির', 'পেঁয়াজের-মতো-সিম-নিয়ে-সংকটের-আশঙ্কা-জিপির', 'আশঙ্কা-জিপির.png', 'populernews', 'pending', NULL),
(40, 'বিসিবি ঘোষিত নতুন গ্রেডিং অনুযায়ী ', 'তামিম ইকবালের বেতন আগে ছিল মাসে ৪ লাখ টাকা। এখন সেটি বেড়ে হয়েছে ৬ লাখ ৩০ হাজার টাকা। মাসে ৪ লাখ টাকা পেতেন মুশফিকুর রহিমও। আজ বিসিবি ঘোষিত নতুন গ্রেডিং অনুযায়ী তিনি মাসে পাবেন ৬ লাখ ২০ হাজার টাকা করে।', '207200তামিম–সাকিবই.png', 'topnews', 'pending', NULL),
(41, 'বাংলাদেশের ব্যাপারে খোঁজ খবর নিয়েই এসেছি', 'বাংলাদেশের ব্যাপারে খোঁজ খবর নিয়েই এসেছি', 'বাংলাদেশের ব্যাপারে.png', 'webnews', 'pending', NULL),
(42, 'প্রতি ম্যাচেই জায়গা ধরে রাখার জন্য', 'জাতীয় দলের হয়ে প্রতি ম্যাচেই জায়গা ধরে রাখার জন্য খেলেন মুশফিকুর রহিম। তাঁর দৃষ্টিতে শুধু সাকিব আল হাসান ও তামিম ইকবাল বাংলাদেশ দলে ‘অটোমেটিক চয়েজ’।', 'তামিম–সাকিবই.png', 'topnews', 'pending', NULL),
(43, '‘থর’-এর দুনিয়ায় ক্রিশ্চিয়ান বেল', 'বেলের অবশ্য মুখে কুলুপ। কোনো কথা হবে না এ নিয়ে, মার্ভেল আনুষ্ঠানিক ঘোষণা না করা পর্যন্ত অপেক্ষা। তাতে কী? অপেক্ষা কি আর বাধ মানে ভক্তদের আবেগ। সামাজিক যোগাযোগমাধ্যম থরকে কেন্দ্র করে ক্রিশ্চিয়ান বেলের ছবি দিয়ে সয়লাব।', 'বেলের অবশ্য .png', 'topnews', 'pending', NULL),
(44, 'সবচেয়ে বেশি তামিমের বেতন, এরপর মুশফিক', 'তামিম ইকবালের বেতন আগে ছিল মাসে ৪ লাখ টাকা। এখন সেটি বেড়ে হয়েছে ৬ লাখ ৩০ হাজার টাকা। মাসে ৪ লাখ টাকা পেতেন মুশফিকুর রহিমও। আজ বিসিবি ঘোষিত নতুন গ্রেডিং অনুযায়ী তিনি মাসে পাবেন ৬ লাখ ২০ হাজার টাকা করে।', '757897agriculture.png', 'latestnews', 'pending', NULL),
(45, 'অস্ট্রেলিয়া-নিউজিল্যান্ড ওয়ানডে সিরিজ বাতিল', 'করোনাভাইরাসের সংক্রমণ থেকে নিরাপদ থাকতে অস্ট্রেলিয়া-নিউজিল্যান্ড ওয়ানডে সিরিজ বাতিল হয়েছে। একটি ওয়ানডে খেলার পরই এ সিদ্ধান্ত নেওয়া হয়। ডেভিড ওয়ার্নার-অ্যারন ফিঞ্চদের এখন সাবধান থাকতে হচ্ছে।', 'ওয়ার্নার-ফিঞ্চ.png', 'topnews', 'pending', NULL),
(46, 'আইপিএল ও পিএসএলকে সমান নম্বর দিচ্ছেন ব্র্যাড হগ', 'তর্কটা চলে ভারত ও পাকিস্তানের ক্রিকেটপ্রেমীদের মধ্যে। অন্য দেশের ক্রিকেটপ্রেমীরাও এ তর্কে মজে থাকেন। দুনিয়ার সেরা ফ্র্যাঞ্চাইজি লিগ কোনটি? কেউ বলেন আইপিএল, কেউ বিগ ব্যাশ কেউ আবার পিএসএলের পক্ষে। ঘুরেফিরে এ তিনটি লিগের কথাই বেশি', 'সমানে সমান.png', 'topnews', 'pending', NULL),
(47, 'মুশফিকুর রহিম এই প্রথমবারের মতো প্রিমিয়ার লিগে খেলছেন ', 'মুশফিকুর রহিম এই প্রথমবারের মতো প্রিমিয়ার লিগে খেলছেন আবাহনী লিমিটেডের হয়ে। কাল দেশের অন্যতম জনপ্রিয় এ ক্লাবের জার্সিতে অভিষেকেই সেঞ্চুরি হাঁকিয়েছেন তিনি। পারটেক্সের বিপক্ষে এ ম্যাচে জয়ও পেয়েছে আকাশি-নীল শিবির।', 'সমর্থন ‘ত্যাগ.png', 'topnews', 'pending', NULL),
(48, 'হুট করেই অভ্যাস বদলে ফেলা কঠিন', ' কেউ কারও সঙ্গে হাত মেলালেন না। কেউ কেউ মুষ্টি মেলালেন, কেউ বা ব্যবহার করলেন কনুই। কিন্তু খেলার মধ্যে তো বটেই, খেলার পর দেখা গেল পুরোপুরি উল্টো চিত্র। একে অন্যকে জড়িয়ে ধরার ব্যাপারটি ঘটল। হাতও মেলালেন সবাই একে অন্যের সঙ্গে। ', 'প্রেসক্রিপশন.png', 'topnews', 'pending', NULL),
(49, 'তৃতীয় দফা পাকিস্তান সফরও স্থগিত করা হয়েছে', 'প্রাণঘাতী করোনাভাইরাসের সংক্রমণ থেকে বাঁচতে স্থগিত হয়ে যাচ্ছে একের পর এক সিরিজ-টুর্নামেন্ট। মহামারি করোনাভাইরাসের কারণে বাংলাদেশ দলের তৃতীয় দফা পাকিস্তান সফরও স্থগিত করা হয়েছে।\r\n\r\n', 'সফর স্থগিত.png', 'topnews', 'pending', NULL),
(50, 'মোহামেডান কোচ শন লেন। প্রথম আলো ফাইল ছবি', 'মোহামেডান কোচ শন লেন। প্রথম আলো ফাইল ছবি', 'জাদুর কাঠি.png', 'topnews', 'pending', NULL),
(51, 'উত্তর বারিধারাকে ৪-১ গোলে হারিয়েছে মোহামেডান', 'প্রিমিয়ার লিগে উত্তর বারিধারাকে ৪-১ গোলে হারিয়েছে মোহামেডান', 'জিতল মোহামেডান.png', 'topnews', 'pending', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_category_relation`
--
ALTER TABLE `news_category_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_news`
--
ALTER TABLE `post_news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news_category_relation`
--
ALTER TABLE `news_category_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `post_news`
--
ALTER TABLE `post_news`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
