CREATE TABLE user_login_details
(
  user_email VARCHAR(500) NOT NULL,
  user_id INT NOT NULL,
  password VARCHAR(500) NOT NULL,
  phone_no VARCHAR(500) NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE business_login_details
(
  business_id INT NOT NULL,
  business_email_id VARCHAR(500) NOT NULL,
  contact_no VARCHAR(500) NOT NULL,
  password VARCHAR(500) NOT NULL,
  PRIMARY KEY (business_id)
);

CREATE TABLE product_details
(
  product_id INT NOT NULL,
  product_description VARCHAR(500) NOT NULL,
  product_name VARCHAR(500) NOT NULL,
  brand_name VARCHAR(500) NOT NULL,
  product_category VARCHAR(500) NOT NULL,
  product_price VARCHAR(500) NOT NULL,
  product_unit VARCHAR(500) NOT NULL,
  key_words VARCHAR(500) NOT NULL,
  company_logo VARCHAR(500) NOT NULL,
  product_images VARCHAR(500) NOT NULL,
  product_brochure VARCHAR(500) NOT NULL,
  business_id INT NOT NULL,
  type VARCHAR(500) NOT NULL,
  PRIMARY KEY (product_id),
  UNIQUE (business_id)
);

CREATE TABLE review_details
(
  review_id INT NOT NULL,
  review VARCHAR(1000) NOT NULL,
  ratings VARCHAR(500) NOT NULL,
  review_heading VARCHAR(500) NOT NULL,
  time DATE NOT NULL,
  PRIMARY KEY (review_id)
);

CREATE TABLE gives
(
  user_id INT NOT NULL,
  review_id INT NOT NULL,
  PRIMARY KEY (user_id, review_id),
  FOREIGN KEY (user_id) REFERENCES user_login_details(user_id),
  FOREIGN KEY (review_id) REFERENCES review_details(review_id)
);

CREATE TABLE business_details
(
  business_id INT NOT NULL,
  legal_name VARCHAR(500) NOT NULL,
  business_email_id VARCHAR(500) NOT NULL,
  business_category VARCHAR(500) NOT NULL,
  gst_no VARCHAR(500) NOT NULL,
  pan_no VARCHAR(500) NOT NULL,
  bank_deatils VARCHAR(500) NOT NULL,
  contact_no VARCHAR(500) NOT NULL,
  business_tagline VARCHAR(500) NOT NULL,
  password VARCHAR(500) NOT NULL,
  PRIMARY KEY (business_id),
  FOREIGN KEY (business_id) REFERENCES business_login_details(business_id)
);

CREATE TABLE user_details
(
  user_id INT NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone_no VARCHAR(500) NOT NULL,
  user_email_id VARCHAR(500) NOT NULL,
  password VARCHAR(500)NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES user_login_details(user_id)
);

CREATE TABLE consist_of
(
  product_id INT NOT NULL,
  business_id INT NOT NULL,
  PRIMARY KEY (product_id, business_id),
  FOREIGN KEY (product_id) REFERENCES product_details(product_id),
  FOREIGN KEY (business_id) REFERENCES business_details(business_id)
);

CREATE TABLE has
(
  review_id INT NOT NULL,
  business_id INT NOT NULL,
  PRIMARY KEY (review_id, business_id),
  FOREIGN KEY (review_id) REFERENCES review_details(review_id),
  FOREIGN KEY (business_id) REFERENCES business_details(business_id)
);

CREATE TABLE business_details_business_address
(
  business_address INT NOT NULL,
  business_id INT NOT NULL,
  PRIMARY KEY (business_address, business_id),
  FOREIGN KEY (business_id) REFERENCES business_details(business_id)
);