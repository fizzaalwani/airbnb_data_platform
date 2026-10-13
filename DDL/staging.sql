CREATE FILE FORMAT IF NOT EXISTS csv_format
  TYPE = 'CSV' 
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

  AIRBNB.STAGING.AIRBNB_STAGEAIRBNB.STAGING.AIRBNB_STAGE
CREATE OR REPLACE STAGE airbnb_stage
FILE_FORMAT = csv_format;

LIST @airbnb_stage;

COPY INTO hosts
FROM @airbnb_stage
FILES = ('hosts.csv')
FILE_FORMAT = (FORMAT_NAME = csv_format);

COPY INTO listings
FROM @airbnb_stage
FILES = ('listings.csv')
FILE_FORMAT = (FORMAT_NAME = csv_format);

COPY INTO bookings
FROM @airbnb_stage
FILES = ('bookings.csv')
FILE_FORMAT = (FORMAT_NAME = csv_format);
