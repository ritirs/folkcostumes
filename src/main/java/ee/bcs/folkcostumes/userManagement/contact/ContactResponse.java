package ee.bcs.folkcostumes.userManagement.contact;

import ee.bcs.folkcostumes.userManagement.user.UserDto;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;

@Data
public class ContactResponse implements Serializable {
    private String firstname;
    private String lastname;
    private String email;
    private String telephone;
    private LocalDate birthDate;
    private String address;
    private Integer userId;
}
