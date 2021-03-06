package ee.bcs.folkcostumes.inventory.elementInCostume;

import ee.bcs.folkcostumes.inventory.costume.CostumeService;
import ee.bcs.folkcostumes.inventory.element.Element;
import ee.bcs.folkcostumes.inventory.element.ElementService;
import ee.bcs.folkcostumes.inventory.elementType.ElementType;
import ee.bcs.folkcostumes.userManagement.user.User;
import ee.bcs.folkcostumes.validation.ValidationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

@Service
public class ElementInCostumeService {

    @Resource
    private ElementService elementService;
    @Resource
    private CostumeService costumeService;
    @Resource
    private ElementInCostumeRepository elementInCostumeRepository;
    @Resource
    private ElementInCostumeMapper elementInCostumeMapper;
    @Resource
    private ValidationService validationService;

    public List<ElementInCostume> getAllElementsInCostumes() {
        List<ElementInCostume> elementsInCostumes = elementInCostumeRepository.findAll();
//        return elementInCostumeMapper.elementsInCostumeToElementCostumeRequests(elementsInCostumes);
        return elementsInCostumes;
    }

    //    EI TÖÖTA!
    public List<ElementInCostumeRequest> getElementsByTypeName(String elementTypeName) {
        ElementType type = elementService.getElementTypeByName(elementTypeName);
        List<ElementInCostume> elementsInCostumes = elementInCostumeRepository.findByElement_ElementType(type);
        Boolean answer = elementInCostumeRepository.existsByElement_ElementType(type);
        validationService.elementTypeExistsInElementsInCostumes(answer, elementTypeName);

//        return elementInCostumeMapper.elementsInCostumeToElementCostumeRequests(elementsInCostumes);
//        return elementsInCostumes;
        return null;
    }
}

//        List<Element> elements = elementService.getElementsByTypeName(elementTypeName);