package tn.cnss.cooperation.employer.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeurId implements Serializable {
    private Long empMat;
    private Integer empCle;
}
