USE master;
GO

DROP DATABASE IF EXISTS TravelBookingDB;
CREATE DATABASE TravelBookingDB;
GO

USE TravelBookingDB;
GO

CREATE TABLE Tour_Guide (
    tourguide_id VARCHAR(10) PRIMARY KEY,
    tourguide_name VARCHAR(100)
);

CREATE TABLE Hotel (
    hotel_id VARCHAR(10) PRIMARY KEY,  
    hotel_name VARCHAR(100),
    hotel_city VARCHAR(50)
);

CREATE TABLE Tourist_Data (
    tourist_id VARCHAR(10) PRIMARY KEY,
    tourist_age INT,
    gender VARCHAR(10),
    tourist_place_of_birth VARCHAR(50), 
    tourist_province VARCHAR(50),
    number_of_travelers INT,
    tour_type VARCHAR(50),
    hotel_room_number INT,  
    visit_month VARCHAR(20)
);

CREATE TABLE Package_List (
    package_id VARCHAR(10) PRIMARY KEY,
    tourguide_id VARCHAR(10),
    hotel_id VARCHAR(10),
    package_price DECIMAL(15, 2),
    place_tourism1 VARCHAR(100),
    place_tourism2 VARCHAR(100),
    place_tourism3 VARCHAR(100),
    place_tourism4 VARCHAR(100),
    place_tourism5 VARCHAR(100),
    
    CONSTRAINT FK_Package_TourGuide FOREIGN KEY (tourguide_id) 
        REFERENCES Tour_Guide(tourguide_id) 
        ON UPDATE CASCADE ON DELETE SET NULL,
        
    CONSTRAINT FK_Package_Hotel FOREIGN KEY (hotel_id) 
        REFERENCES Hotel(hotel_id) 
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Tourist_Package_Rating (
    tourist_id VARCHAR(10),
    package_id VARCHAR(10),
    tourist_package_rating INT,
    
    PRIMARY KEY (tourist_id, package_id),
    CONSTRAINT FK_Rating_Tourist FOREIGN KEY (tourist_id) 
        REFERENCES Tourist_Data(tourist_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
        
    CONSTRAINT FK_Rating_Package FOREIGN KEY (package_id) 
        REFERENCES Package_List(package_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Tour_Guide (tourguide_id, tourguide_name) VALUES
('WIY0001', 'Gabriella Shafira Trisna'),
('WIY0002', 'Davina Oktaviani'),
('WIY0003', 'Matthew Rick'),
('WIY0004', 'John Doe'),
('WIY0005', 'Max Verstapen'),
('WIY0006', 'Michelle Liu'),
('WIY0007', 'Vendy Hans'),
('WIY0008', 'Melanie May'),
('WIY0009', 'Ivoine Ocha');

INSERT INTO Hotel (hotel_id, hotel_name, hotel_city) VALUES
('INN00001', 'Aloft', 'Jakarta'),
('INN00002', 'The Langham', 'Jakarta'),
('INN00003', 'The Rich Jogja Hotel', 'Yogyakarta'),
('INN00004', 'Grand Rohan', 'Yogyakarta'),
('INN00005', 'Boutique Hotel', 'Yogyakarta'),
('INN00006', 'eL Hotel Royale', 'Bandung'),
('INN00007', 'The Alana', 'Surabaya'),
('INN00008', 'Midtown Residence Marvell City', 'Surabaya'),
('INN00009', 'Hotel Dafam', 'Semarang'),
('INN00010', 'The Azana Hotel Airport', 'Semarang');

INSERT INTO Tourist_Data (tourist_id, tourist_age, gender, tourist_place_of_birth, tourist_province, number_of_travelers, tour_type, hotel_room_number, visit_month) VALUES
('U001', 21, 'Female', 'Semarang', 'Jawa Tengah', 5, 'Private', 2827, 'Maret'),
('U002', 21, 'Male', 'Bekasi', 'Jawa Barat', 4, 'Leisure', 1542, 'November'),
('U003', 23, 'Female', 'Cirebon', 'Jawa Barat', 2, 'Leisure', 1598, 'Juli'),
('U004', 21, 'Female', 'Bekasi', 'Jawa Barat', 5, 'Leisure', 675, 'Agustus'),
('U005', 20, 'Female', 'Lampung', 'Sumatera Selatan', 10, 'Join', 253, 'Februari'),
('U006', 18, 'Female', 'Jakarta Utara', 'DKI Jakarta', 9, 'Join', 1470, 'September'),
('U007', 39, 'Female', 'Jakarta Selatan', 'DKI Jakarta', 15, 'Join', 1122, 'Januari'),
('U008', 40, 'Female', 'Bandung', 'Jawa Barat', 5, 'Private', 2302, 'Maret'),
('U009', 39, 'Female', 'Surabaya', 'Jawa Timur', 4, 'Private', 427, 'Oktober'),
('U010', 39, 'Female', 'Bekasi', 'Jawa Barat', 4, 'Private', 515, 'Februari'),
('U011', 20, 'Female', 'Yogyakarta', 'DI Yogyakarta', 8, 'Join', 686, 'Agustus'),
('U012', 37, 'Male', 'Bogor', 'Jawa Barat', 9, 'Leisure', 993, 'November'),
('U013', 18, 'Male', 'Depok', 'Jawa Barat', 10, 'Leisure', 1365, 'September'),
('U014', 26, 'Male', 'Jakarta Pusat', 'DKI Jakarta', 10, 'Leisure', 762, 'December'),
('U015', 34, 'Female', 'Jakarta Timur', 'DKI Jakarta', 11, 'Leisure', 2212, 'Januari');

INSERT INTO Package_List (package_id, tourguide_id, hotel_id, package_price, place_tourism1, place_tourism2, place_tourism3, place_tourism4, place_tourism5) VALUES
('P0001', 'WIY0002', 'INN00001', 100000.00, 'Pulau Tidung', 'Pulau Bidadari', 'Pulau Pari', 'Pulau Pramuka', 'Pulau Pelangi'),
('P0002', 'WIY0001', 'INN00001', 200000.00, 'Kota Tua', 'Museum Bank Indonesia', 'Monas', 'Perpustakaan Nasional', 'Masjid Istiqlal'),
('P0003', 'WIY0002', 'INN00003', 150000.00, 'Pantai Glagah', 'Pantai Drini', 'Pantai Wediombo', 'Pantai Jogan', 'Pantai Ngrenehan'),
('P0004', 'WIY0003', 'INN00004', 300000.00, 'Kampung Wisata Taman Sari', 'Monumen Serangan Umum 1 Maret', 'Puncak Kebun Buah Mangunan', 'Watu Lumbung', 'Bunker Kaliadem Merapi'),
('P0005', 'WIY0004', 'INN00005', 250000.00, 'Watu Lumbung', 'Bunker Kaliadem Merapi', 'Goa Rancang Kencono', 'Pintoe Langit Dahromo', 'Wisata Kaliurang'),
('P0006', 'WIY0005', 'INN00006', 400000.00, 'Gunung Tangkuban Perahu', 'Gunung Papandayan', 'Gunung Manglayang', 'Curug Dago', 'Bukit Paralayang'),
('P0007', 'WIY0006', 'INN00006', 400000.00, 'Gunung Tangkuban Perahu', 'Gunung Papandayan', 'Gunung Manglayang', 'Curug Dago', 'Curug Batu Templek'),
('P0008', 'WIY0006', 'INN00006', 100000.00, 'Museum Geologi Bandung', 'Museum Sri Baduga', 'Museum Pendidikan Nasional', 'Taman Film', 'Museum Nike Ardilla'),
('P0009', 'WIY0007', 'INN00007', 225000.00, 'Rumah Batik', 'Jembatan Merah', 'Monumen Tugu Pahlawan', 'Monumen Jalesveva Jayamahe', 'Patung Sura dan Buaya'),
('P0010', 'WIY0004', 'INN00008', 150000.00, 'Monumen Tugu Pahlawan', 'Monumen Jalesveva Jayamahe', 'Patung Sura dan Buaya', 'Monumen Bambu Runcing Surabaya', 'House of Sampoerna'),
('P0011', 'WIY0009', 'INN00009', 100000.00, 'Monumen Palagan Ambarawa', 'Benteng Pendem', 'Museum Kereta Ambarawa', 'Kota Lama Semarang', 'Semarang Chinatown'),
('P0012', 'WIY0008', 'INN00010', 150000.00, 'Candi Gedong Songo', 'Grand Maerakaca', 'Lawang Sewu', 'Tirto Argo Siwarak', 'Wisata Eling Bening');

INSERT INTO Tourist_Package_Rating (tourist_id, package_id, tourist_package_rating) VALUES
('U001', 'P0002', 5),
('U002', 'P0001', 3),
('U004', 'P0002', 3),
('U007', 'P0003', 3),
('U008', 'P0004', 4),
('U010', 'P0005', 4),
('U011', 'P0003', 3),
('U012', 'P0005', 2),
('U013', 'P0004', 5),
('U014', 'P0003', 4),
('U015', 'P0007', 4);

USE TravelBookingDB; 
SELECT * FROM Tour_Guide;
SELECT * FROM Hotel;
SELECT * FROM Tourist_Data;
SELECT * FROM Package_List;
SELECT * FROM Tourist_Package_Rating;

SELECT 
    P.package_id,
    P.package_price,
    H.hotel_name,      
    H.hotel_city
FROM Package_List P
JOIN Hotel H ON P.hotel_id = H.hotel_id;