package ecom.boy.utility;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.response.CustomErrorResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
@Slf4j
public class CustomExceptionHandler {

    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<CustomErrorResponse> handleBusinessException(BusinessException ex) {
        CustomErrorResponse errorResponse = new CustomErrorResponse();
        errorResponse.setCode(ex.getCode());
        errorResponse.setStatus(ex.getStatus());
        errorResponse.setMessage(ex.getDescription());
        return new ResponseEntity<>(errorResponse, HttpStatus.valueOf(ex.getStatus()));
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public ResponseEntity<CustomErrorResponse> handleMissingParams(MissingServletRequestParameterException ex) {
        CustomErrorResponse errorResponse = new CustomErrorResponse();
        errorResponse.setCode(CommonConstant.INVALID_FIELD_CODE);
        errorResponse.setStatus(CommonConstant.STATUS_CODE_400);
        errorResponse.setMessage(CommonConstant.INVALID_FIELD_MSG);
        return new ResponseEntity<>(errorResponse, HttpStatus.valueOf(CommonConstant.STATUS_CODE_400));
//        return "Required parameter '" + ex.getParameterName() + "' is missing";
    }

}
