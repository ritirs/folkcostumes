package ee.bcs.folkcostumes.locationManagement.locationBalance;

import ee.bcs.folkcostumes.inventory.element.ElementDto;
import ee.bcs.folkcostumes.locationManagement.location.LocationDto;
import ee.bcs.folkcostumes.userManagement.user.UserDto;
import lombok.Data;

import java.io.Serializable;

@Data
public class LocationBalanceDto implements Serializable {
    private final Integer id;
    private final LocationDto location;
    private final ElementDto element;
    private final UserDto user;
    private final Integer quantity;
}
