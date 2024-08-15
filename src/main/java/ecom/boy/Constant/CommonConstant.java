package ecom.boy.Constant;

public class CommonConstant {
    public static final Integer STATUS_CODE_500 = 500;
    public static final Integer STATUS_CODE_503 = 503;
    public static final Integer SUCCESS_CODE_200 = 200;
    public static final Integer STATUS_CODE_200 = 200;
    public static final Integer STATUS_CODE_400 = 400;
    public static final Integer STATUS_CODE_401 = 401;
    public static final Integer STATUS_CODE_403 = 403;
    public static final Integer STATUS_CODE_440 = 440;
    public static final Integer STATUS_CODE_404 = 404;
    public static final String ERR_PROFILE_DATA_NOT_FOUND_CODE = "B0006";
    public static final String ERR_PROFILE_DATA_NOT_FOUND_MESSAGE = "data not found";
    public static final String SUCCESS_CODE = "EBIZ1001";
    public static final String SUCCESS_DESCRIPTION = "success";
    public static final String ERR_VALIDATION = "ERR_VALIDATION";
    public static final String ERR_VALIDATION_DESC = "Validation is error.";
    public static final String ERR_INTERNAL = "ERR_INTERNAL";
    public static final String ERR_REDIS = "400 - Cannot get customer profile from Redis";
    public static final String ERR_EXTERNAL = "ERR_EXTERNAL";
    public static final String ERR_CENTER_SERVICE = "400 - Cannot get access token from center-service";
    public static final String ERR_INTERNAL_SERVER = "ERR_INTERNAL_SERVER";
    public static final String ERR_INTERNAL_SERVER_DESC = "Internal server error.";
    public static final String ERR_AUTHENTICATION = "Login Fail";
    public static final String AUTHENTICATION_FAIL_CODE = "AUTH0002";
    public static final String AUTHENTICATION_FAIL_DESC = "authentication fails.";
    public static final String FILE_NOTMATCH_CODE = "B0002";
    public static final String FILE_NOTMATCH_MSG = "Added file that doesn't meet the requirements.";
    public static final String FILE_UPSUPPORT_CODE = "B0003";
    public static final String FILE_UPSUPPORT_MSG = "Add unsupported attachments.";
    public static final String FILE_SIZEERROR_CODE = "B0004";
    public static final String FILE_SIZEERROR_MSG = "Add files that are larger than the requirements.";
    public static final String DATA_NOTFOUND_CODE = "B0006";
    public static final String DATA_NOTFOUND_MSG = "data not found";
    public static final String DATABASE_FAIL_CODE = "T0002";
    public static final String DATABASE_FAIL_MSG = "database fail";
    public static final String SENDMAIL_FAIL_CODE = "T0003";
    public static final String SENDMAIL_FAIL_MSG = "send email error.";
    public static final String DATABASE_BLOB_FAIL_CODE = "T0012";
    public static final String DATABASE_BLOB_FAIL_MSG = "get file from blob fail";
    public static final String CONVERT_FILE_FAIL_CODE = "T0013";
    public static final String CONVERT_FILE_FAIL_MSG = "convert file fail";
    public static final String INVALID_FIELD_CODE = "B0001";
    public static final String INVALID_FIELD_MSG =  "validate field fails.";
    public static final String OTP_STATUS_NOT_FOUND_CODE = "B0016";
    public static final String OTP_STATUS_NOT_FOUND_MSG =  "OTP Status not found.";
    public static final String PROCESS_NAME_DIRECTOR = "DIRECTOR_UPLOAD_DOCUMENT";
    public static final String REDIS_CONFIG_KEY = "CONFIG";
    public static final String REDIS_COUNTRY_KEY = "COUNTRY";
    public static final String REDIS_CONFIG_COUNTRY = "CONFIG::COUNTRY";
    public static final String REDIS_BUSINESS_TYPE_KEY = "BUSINESSTYPE";
    public static final String REDIS_CONFIG_BUSINESS_TYPE = "CONFIG::BUSINESSTYPES";
    public static final String REDIS_CONFIG_MAP = "CONFIG::MAP";
    public static final String REDIS_PROVINCE_KEY = "PROVINCE";
    public static final String REDIS_CONFIG_DISTRICT = "CONFIG::DISTRICT";
    public static final String REDIS_CONFIG_SUBDISTRICT = "CONFIG::SUBD::";
    public static final String REDIS_OTP_STS_TYPE = "OTP_STS";
    public static final int REDIS_EXPIRED_TIME = 2592000;
    public static final String API_KEY_ATTRIBUTE = "apiKey";
    public static final String API_SECRET_ATTRIBUTE = "apiSecret";
    public static final String REQUEST_UID_ATTRIBUTE = "requestUID";
    public static final String RESOURCE_OWNER_ATTRIBUTE = "resourceOwnerID";
    public static final String CORRELATION_ID = "correlationId";
    public static final String FORMAT_DATE_YYYYMMDD = "yyyyMMdd";
    public static final String FORMAT_DATE_YYYYMMDDHHmmss = "yyyy-MM-dd HH:mm:ss";

    public static final String ERR_DATA_WAS_CREATE_CODE = "B0009";
    public static final String ERR_DATA_WAS_CREATE_MESSAGE = "Data is was created";

    public static final String DATABASE_CONNECT_FAIL_CODE = "T0001";
    public static final String DATABASE_CONNECT_FAIL_MSG = "can’t connect database.";

    public static final String API_CONNECTION_ERROR_CODE = "T0005";
    public static final String API_CONNECTION_ERROR_MSG = "api connection error";
    public static final String API_RESPONSE_ERROR_CODE = "T0006";
    public static final String API_RESPONSE_ERROR_MSG = "api response error";
    public static final String DUPLICATE_DATE_ERROR_CODE = "B0007";
    public static final String DUPLICATE_DATE_ERROR_MSG = "duplicate data";
    public static final String RSA_ALGORITHM = "RSA";
    public static final String EBIZ_RSA_PUBLIC_KEY = "ebiz-rsa-public-key";
    public static final String EBIZ_RSA_PRIVATE_KEY = "ebiz-rsa-private-key";

    public static final String JWT_TOKEN_ISSUER = "EBIZ";
    public interface PROCESS_TYPE {
        public static final String REQUEST_LOAN_PROCESS = "REQUEST_LOAN_PROCESS";
        public static final String COMPANY_BANK_VERIFY = "COMPANY_BANK_VERIFY";
    }
    public static final String TENANT_ID = "Tenant01";
    public static final String LOAN_PURPOSE_CODE = "012102";
    public static final String LOAN_PURPOSE_DESC = "สินเชื่อเพื่อธุรกิจอื่นๆ";
    public static final String EMAIL_REGEX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public static final int LOC_PRE_APPROVE_SUCCESS = 1000;
    public static final String LOC_PRE_APPROVE_REQUEST_ERROR = "REQUEST_ERROR";
    public static final String LOC_PRE_APPROVE_PROCESSING = "PROCESSING";
    public static final String REFERENCE_CUSTOMER_SUB_TYPE = "CONFIG::CUSTOMERSUBTYPE";
    public static final String REFERENCE_CUSTOMER_TITLES = "CONFIG::TITLES";
    public static final int REDIS_EXPIRED_TIME_ONE_DAY = 86400;
    public static final String TABLE_JWT_SESSION = "JWT::SESSION";
    public static final String TABLE_SESSION_COMPANY = "SESSION::COMPANY";
    public static final String REDIS_CONFIG_PRODUCT = "CONFIG::PRODUCT";
    public static final String TABLE_CONFIG_PROFILEUSER = "CONFIG::PROFILEUSER";
    public static final String BACKOFFICE_APP_CODE = "EBIZ";
    //Jettharak k. add for default zone date when use getdate from zone
    public static final String BANKKOK = "Asia/Bangkok";
}
