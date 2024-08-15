package ecom.boy.utility;

import ecom.boy.model.response.ErrorModel;
import ecom.boy.model.response.ResponseStatusCustomCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class BusinessException extends RuntimeException {
    private static final Logger log = LoggerFactory.getLogger(BusinessException.class);
    private String code;
    private Integer status;
    private String description;
    private ResponseStatusCustomCode res;

    public BusinessException(String code) {
        super(code);
        this.code = code;
    }

    public BusinessException(Integer status, String code) {
        super(code);
        this.code = code;
        this.status = status;
    }

    public BusinessException(Integer status, String code, String description) {
        super(code);
        this.code = code;
        this.status = status;
        this.description = description;
    }

    public BusinessException(ErrorModel model) {
        super(model.getCode());
        this.code = model.getCode();
        this.status = model.getStatus();
        this.description = model.getDescription();
    }

    public BusinessException(ErrorModel model, ResponseStatusCustomCode res) {
        super(model.getCode());
        this.code = model.getCode();
        this.status = model.getStatus();
        this.description = model.getDescription();
        this.res = res;
    }

    public BusinessException(ResponseStatusCustomCode res) {
        this.res = res;
    }

    public BusinessException(Integer status) {
        this.status = status;
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof BusinessException)) {
            return false;
        } else {
            BusinessException other = (BusinessException)o;
            if (!other.canEqual(this)) {
                return false;
            } else if (!super.equals(o)) {
                return false;
            } else {
                label61: {
                    Object this$status = this.getStatus();
                    Object other$status = other.getStatus();
                    if (this$status == null) {
                        if (other$status == null) {
                            break label61;
                        }
                    } else if (this$status.equals(other$status)) {
                        break label61;
                    }

                    return false;
                }

                label54: {
                    Object this$code = this.getCode();
                    Object other$code = other.getCode();
                    if (this$code == null) {
                        if (other$code == null) {
                            break label54;
                        }
                    } else if (this$code.equals(other$code)) {
                        break label54;
                    }

                    return false;
                }

                Object this$description = this.getDescription();
                Object other$description = other.getDescription();
                if (this$description == null) {
                    if (other$description != null) {
                        return false;
                    }
                } else if (!this$description.equals(other$description)) {
                    return false;
                }

                Object this$res = this.getRes();
                Object other$res = other.getRes();
                if (this$res == null) {
                    if (other$res != null) {
                        return false;
                    }
                } else if (!this$res.equals(other$res)) {
                    return false;
                }

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof BusinessException;
    }

    public int hashCode() {
        int PRIME = 1;
        int result = super.hashCode();
        Object $status = this.getStatus();
        result = result * 59 + ($status == null ? 43 : $status.hashCode());
        Object $code = this.getCode();
        result = result * 59 + ($code == null ? 43 : $code.hashCode());
        Object $description = this.getDescription();
        result = result * 59 + ($description == null ? 43 : $description.hashCode());
        Object $res = this.getRes();
        result = result * 59 + ($res == null ? 43 : $res.hashCode());
        return result;
    }

    public String getCode() {
        return this.code;
    }

    public Integer getStatus() {
        return this.status;
    }

    public String getDescription() {
        return this.description;
    }

    public ResponseStatusCustomCode getRes() {
        return this.res;
    }

    public void setCode(final String code) {
        this.code = code;
    }

    public void setStatus(final Integer status) {
        this.status = status;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public void setRes(final ResponseStatusCustomCode res) {
        this.res = res;
    }

    public String toString() {
        String var10000 = this.getCode();
        return "BusinessException(code=" + var10000 + ", status=" + this.getStatus() + ", description=" + this.getDescription() + ", res=" + this.getRes() + ")";
    }
}
