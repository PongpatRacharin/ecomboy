package ecom.boy.model.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class CustomErrorResponse {

    private String code;
    private Integer status;
    private String message;

    public CustomErrorResponse() {}

}
