Daytrippers

This app is deployed at: https://philly-daytrippers.herokuapp.com/

A site to share and review day trips to take in and around Philadelphia, PA

Users can add, edit, and delete their own content from the site as well as view and review content posted by others.  There is also vote functionality, users can up or down vote each other's reviews.

Michael Del Zotto
Hannah Green
Brett Holland
Mark Stahl

This app uses Ruby on Rails on the backend with a React.js front end.  PostgreSQL was used for the database.  Devise user authentication is used to verify users, including email verification. The carrierwave, fog, and mini magick gems were used with an avatar uploader to resize profile photos to thumbnails.  The app runs on foreman, localhost:5000.


[![Build Status](https://codeship.com/projects/8d06ba60-084d-0136-da1b-46f3ea952830/status?branch=master)
[![Code Climate](https://codeclimate.com/github/hannahwgreen/daytrippers/badges/gpa.svg)](https://codeclimate.com/github/hannahwgreen/daytrippers)
[![Coverage Status](https://s3.amazonaws.com/assets.coveralls.io/badges/coveralls_91.svg)](https://coveralls.io/github/hannahwgreen/daytrippers?branch=master&service=github)
