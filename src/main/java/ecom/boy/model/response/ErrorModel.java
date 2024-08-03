package ecom.boy.model.response;

public class ErrorModel {
    private String code;
    private Integer status;
    private String description;

    public ErrorModel() {
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

    public void setCode(final String code) {
        this.code = code;
    }

    public void setStatus(final Integer status) {
        this.status = status;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof ErrorModel)) {
            return false;
        } else {
            ErrorModel other = (ErrorModel)o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label47: {
                    Object this$status = this.getStatus();
                    Object other$status = other.getStatus();
                    if (this$status == null) {
                        if (other$status == null) {
                            break label47;
                        }
                    } else if (this$status.equals(other$status)) {
                        break label47;
                    }

                    return false;
                }

                Object this$code = this.getCode();
                Object other$code = other.getCode();
                if (this$code == null) {
                    if (other$code != null) {
                        return false;
                    }
                } else if (!this$code.equals(other$code)) {
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

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof ErrorModel;
    }

    public int hashCode() {
        int PRIME = 1;
        int result = 1;
        Object $status = this.getStatus();
        result = result * 59 + ($status == null ? 43 : $status.hashCode());
        Object $code = this.getCode();
        result = result * 59 + ($code == null ? 43 : $code.hashCode());
        Object $description = this.getDescription();
        result = result * 59 + ($description == null ? 43 : $description.hashCode());
        return result;
    }

    public String toString() {
        String var10000 = this.getCode();
        return "ErrorModel(code=" + var10000 + ", status=" + this.getStatus() + ", description=" + this.getDescription() + ")";
    }
}
