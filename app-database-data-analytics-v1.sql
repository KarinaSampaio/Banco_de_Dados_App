CREATE DATABASE APP;
USE APP;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    registration_date TIMESTAMP
);

CREATE TABLE Pages (
    page_id INT PRIMARY KEY,
    page_name VARCHAR(100) UNIQUE,
    url VARCHAR(200)
);

CREATE TABLE User_Details (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    birthdate DATE,
    gender VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    user_id INT,
    page_id INT,
    event_type VARCHAR(50),
    event_timestamp TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (page_id) REFERENCES Pages(page_id)
);

CREATE TABLE Campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100) UNIQUE,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15, 2)
);

CREATE TABLE Campaign_Events (
    campaign_event_id INT PRIMARY KEY,
    campaign_id INT,
    event_id INT,
    event_timestamp TIMESTAMP,
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Referral_Programs (
    referral_program_id INT PRIMARY KEY,
    program_name VARCHAR(100) UNIQUE,
    start_date DATE,
    end_date DATE,
    referral_bonus DECIMAL(15, 2)
);

CREATE TABLE Referrals (
    referral_id INT PRIMARY KEY,
    referring_user_id INT,
    referred_user_id INT,
    referral_program_id INT,
    referral_timestamp TIMESTAMP,
    FOREIGN KEY (referring_user_id) REFERENCES Users(user_id),
    FOREIGN KEY (referred_user_id) REFERENCES Users(user_id),
    FOREIGN KEY (referral_program_id) REFERENCES Referral_Programs(referral_program_id)
);

CREATE TABLE Ad_Campaigns (
    ad_campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100) UNIQUE,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15, 2)
);

CREATE TABLE Ad_Events (
    ad_event_id INT PRIMARY KEY,
    user_id INT,
    ad_campaign_id INT,
    event_type VARCHAR(50),
    event_timestamp TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (ad_campaign_id) REFERENCES Ad_Campaigns(ad_campaign_id)
);

CREATE TABLE Devices (
    device_id INT PRIMARY KEY,
    device_type VARCHAR(50),
    os VARCHAR(50),
    os_version VARCHAR(50),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE User_Activities (
    activity_id INT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(50),
    activity_timestamp TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);