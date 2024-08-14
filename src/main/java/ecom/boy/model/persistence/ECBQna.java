package ecom.boy.model.persistence;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "ecbqna")
@Data
public class ECBQna {
    @Id
    @Column(name = "qnaid")
    private int qnaid;

    @Column(name = "itemcode")
    private String itemcode;

    @Column(name = "username")
    private String username;

    @Column(name = "question")
    private String question;

    @Column(name = "answer")
    private String answer;
}
