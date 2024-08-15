package ecom.boy.model.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import java.io.Serializable;
import java.time.ZonedDateTime;

@JsonInclude(Include.NON_NULL)
public class ResponseStatusCustomCode implements Serializable {
    private String code;
    private Integer status;
    private String description;
    private String funcNm;
    private String rsAppID;
    private String rsUserID;
    private String rsChannel;
    private String rqUID;
    private ZonedDateTime rqDt;
    private ZonedDateTime rsDt;
    private String diffDt;

    public static ResponseStatusCustomCodeBuilder builder() {
        return new ResponseStatusCustomCodeBuilder();
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

    public String getFuncNm() {
        return this.funcNm;
    }

    public String getRsAppID() {
        return this.rsAppID;
    }

    public String getRsUserID() {
        return this.rsUserID;
    }

    public String getRsChannel() {
        return this.rsChannel;
    }

    public String getRqUID() {
        return this.rqUID;
    }

    public ZonedDateTime getRqDt() {
        return this.rqDt;
    }

    public ZonedDateTime getRsDt() {
        return this.rsDt;
    }

    public String getDiffDt() {
        return this.diffDt;
    }

    public ResponseStatusCustomCode setCode(final String code) {
        this.code = code;
        return this;
    }

    public ResponseStatusCustomCode setStatus(final Integer status) {
        this.status = status;
        return this;
    }

    public ResponseStatusCustomCode setDescription(final String description) {
        this.description = description;
        return this;
    }

    public ResponseStatusCustomCode setFuncNm(final String funcNm) {
        this.funcNm = funcNm;
        return this;
    }

    public ResponseStatusCustomCode setRsAppID(final String rsAppID) {
        this.rsAppID = rsAppID;
        return this;
    }

    public ResponseStatusCustomCode setRsUserID(final String rsUserID) {
        this.rsUserID = rsUserID;
        return this;
    }

    public ResponseStatusCustomCode setRsChannel(final String rsChannel) {
        this.rsChannel = rsChannel;
        return this;
    }

    public ResponseStatusCustomCode setRqUID(final String rqUID) {
        this.rqUID = rqUID;
        return this;
    }

    public ResponseStatusCustomCode setRqDt(final ZonedDateTime rqDt) {
        this.rqDt = rqDt;
        return this;
    }

    public ResponseStatusCustomCode setRsDt(final ZonedDateTime rsDt) {
        this.rsDt = rsDt;
        return this;
    }

    public ResponseStatusCustomCode setDiffDt(final String diffDt) {
        this.diffDt = diffDt;
        return this;
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof ResponseStatusCustomCode)) {
            return false;
        } else {
            ResponseStatusCustomCode other = (ResponseStatusCustomCode)o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label143: {
                    Object this$status = this.getStatus();
                    Object other$status = other.getStatus();
                    if (this$status == null) {
                        if (other$status == null) {
                            break label143;
                        }
                    } else if (this$status.equals(other$status)) {
                        break label143;
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

                label122: {
                    Object this$funcNm = this.getFuncNm();
                    Object other$funcNm = other.getFuncNm();
                    if (this$funcNm == null) {
                        if (other$funcNm == null) {
                            break label122;
                        }
                    } else if (this$funcNm.equals(other$funcNm)) {
                        break label122;
                    }

                    return false;
                }

                label115: {
                    Object this$rsAppID = this.getRsAppID();
                    Object other$rsAppID = other.getRsAppID();
                    if (this$rsAppID == null) {
                        if (other$rsAppID == null) {
                            break label115;
                        }
                    } else if (this$rsAppID.equals(other$rsAppID)) {
                        break label115;
                    }

                    return false;
                }

                Object this$rsUserID = this.getRsUserID();
                Object other$rsUserID = other.getRsUserID();
                if (this$rsUserID == null) {
                    if (other$rsUserID != null) {
                        return false;
                    }
                } else if (!this$rsUserID.equals(other$rsUserID)) {
                    return false;
                }

                Object this$rsChannel = this.getRsChannel();
                Object other$rsChannel = other.getRsChannel();
                if (this$rsChannel == null) {
                    if (other$rsChannel != null) {
                        return false;
                    }
                } else if (!this$rsChannel.equals(other$rsChannel)) {
                    return false;
                }

                label94: {
                    Object this$rqUID = this.getRqUID();
                    Object other$rqUID = other.getRqUID();
                    if (this$rqUID == null) {
                        if (other$rqUID == null) {
                            break label94;
                        }
                    } else if (this$rqUID.equals(other$rqUID)) {
                        break label94;
                    }

                    return false;
                }

                label87: {
                    Object this$rqDt = this.getRqDt();
                    Object other$rqDt = other.getRqDt();
                    if (this$rqDt == null) {
                        if (other$rqDt == null) {
                            break label87;
                        }
                    } else if (this$rqDt.equals(other$rqDt)) {
                        break label87;
                    }

                    return false;
                }

                Object this$rsDt = this.getRsDt();
                Object other$rsDt = other.getRsDt();
                if (this$rsDt == null) {
                    if (other$rsDt != null) {
                        return false;
                    }
                } else if (!this$rsDt.equals(other$rsDt)) {
                    return false;
                }

                Object this$diffDt = this.getDiffDt();
                Object other$diffDt = other.getDiffDt();
                if (this$diffDt == null) {
                    if (other$diffDt != null) {
                        return false;
                    }
                } else if (!this$diffDt.equals(other$diffDt)) {
                    return false;
                }

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof ResponseStatusCustomCode;
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
        Object $funcNm = this.getFuncNm();
        result = result * 59 + ($funcNm == null ? 43 : $funcNm.hashCode());
        Object $rsAppID = this.getRsAppID();
        result = result * 59 + ($rsAppID == null ? 43 : $rsAppID.hashCode());
        Object $rsUserID = this.getRsUserID();
        result = result * 59 + ($rsUserID == null ? 43 : $rsUserID.hashCode());
        Object $rsChannel = this.getRsChannel();
        result = result * 59 + ($rsChannel == null ? 43 : $rsChannel.hashCode());
        Object $rqUID = this.getRqUID();
        result = result * 59 + ($rqUID == null ? 43 : $rqUID.hashCode());
        Object $rqDt = this.getRqDt();
        result = result * 59 + ($rqDt == null ? 43 : $rqDt.hashCode());
        Object $rsDt = this.getRsDt();
        result = result * 59 + ($rsDt == null ? 43 : $rsDt.hashCode());
        Object $diffDt = this.getDiffDt();
        result = result * 59 + ($diffDt == null ? 43 : $diffDt.hashCode());
        return result;
    }

    public String toString() {
        String var10000 = this.getCode();
        return "ResponseStatusCustomCode(code=" + var10000 + ", status=" + this.getStatus() + ", description=" + this.getDescription() + ", funcNm=" + this.getFuncNm() + ", rsAppID=" + this.getRsAppID() + ", rsUserID=" + this.getRsUserID() + ", rsChannel=" + this.getRsChannel() + ", rqUID=" + this.getRqUID() + ", rqDt=" + this.getRqDt() + ", rsDt=" + this.getRsDt() + ", diffDt=" + this.getDiffDt() + ")";
    }

    public ResponseStatusCustomCode(final String code, final Integer status, final String description, final String funcNm, final String rsAppID, final String rsUserID, final String rsChannel, final String rqUID, final ZonedDateTime rqDt, final ZonedDateTime rsDt, final String diffDt) {
        this.code = code;
        this.status = status;
        this.description = description;
        this.funcNm = funcNm;
        this.rsAppID = rsAppID;
        this.rsUserID = rsUserID;
        this.rsChannel = rsChannel;
        this.rqUID = rqUID;
        this.rqDt = rqDt;
        this.rsDt = rsDt;
        this.diffDt = diffDt;
    }

    public ResponseStatusCustomCode() {
    }

    public static class ResponseStatusCustomCodeBuilder {
        private String code;
        private Integer status;
        private String description;
        private String funcNm;
        private String rsAppID;
        private String rsUserID;
        private String rsChannel;
        private String rqUID;
        private ZonedDateTime rqDt;
        private ZonedDateTime rsDt;
        private String diffDt;

        ResponseStatusCustomCodeBuilder() {
        }

        public ResponseStatusCustomCodeBuilder code(final String code) {
            this.code = code;
            return this;
        }

        public ResponseStatusCustomCodeBuilder status(final Integer status) {
            this.status = status;
            return this;
        }

        public ResponseStatusCustomCodeBuilder description(final String description) {
            this.description = description;
            return this;
        }

        public ResponseStatusCustomCodeBuilder funcNm(final String funcNm) {
            this.funcNm = funcNm;
            return this;
        }

        public ResponseStatusCustomCodeBuilder rsAppID(final String rsAppID) {
            this.rsAppID = rsAppID;
            return this;
        }

        public ResponseStatusCustomCodeBuilder rsUserID(final String rsUserID) {
            this.rsUserID = rsUserID;
            return this;
        }

        public ResponseStatusCustomCodeBuilder rsChannel(final String rsChannel) {
            this.rsChannel = rsChannel;
            return this;
        }

        public ResponseStatusCustomCodeBuilder rqUID(final String rqUID) {
            this.rqUID = rqUID;
            return this;
        }

        public ResponseStatusCustomCodeBuilder rqDt(final ZonedDateTime rqDt) {
            this.rqDt = rqDt;
            return this;
        }

        public ResponseStatusCustomCodeBuilder rsDt(final ZonedDateTime rsDt) {
            this.rsDt = rsDt;
            return this;
        }

        public ResponseStatusCustomCodeBuilder diffDt(final String diffDt) {
            this.diffDt = diffDt;
            return this;
        }

        public ResponseStatusCustomCode build() {
            return new ResponseStatusCustomCode(this.code, this.status, this.description, this.funcNm, this.rsAppID, this.rsUserID, this.rsChannel, this.rqUID, this.rqDt, this.rsDt, this.diffDt);
        }

        public String toString() {
            return "ResponseStatusCustomCode.ResponseStatusCustomCodeBuilder(code=" + this.code + ", status=" + this.status + ", description=" + this.description + ", funcNm=" + this.funcNm + ", rsAppID=" + this.rsAppID + ", rsUserID=" + this.rsUserID + ", rsChannel=" + this.rsChannel + ", rqUID=" + this.rqUID + ", rqDt=" + this.rqDt + ", rsDt=" + this.rsDt + ", diffDt=" + this.diffDt + ")";
        }
    }
}
