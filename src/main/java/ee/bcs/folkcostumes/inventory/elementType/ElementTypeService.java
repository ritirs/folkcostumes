package ee.bcs.folkcostumes.inventory.elementType;

import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

@Service
public class ElementTypeService {

    @Resource private ElementTypeMapper elementTypeMapper;
    @Resource private ElementTypeRepository elementTypeRepository;

    public ElementTypeDto addNewElementType(ElementTypeDto request) {
        ElementType newElementType = elementTypeMapper.elementTypeDtoToElementType(request);
        elementTypeRepository.save(newElementType);
        ElementTypeDto elementTypeDto = elementTypeMapper.elementTypeToElementTypeDto(newElementType);
        return elementTypeDto;

    }

    public List<ElementTypeDto> findAllElementTypes() {
        List<ElementType> elementTypes = elementTypeRepository.findAll();
        List<ElementTypeDto> elementTypeDtos = elementTypeMapper.elementTypesToElementTypeDtos(elementTypes);
        return elementTypeDtos;
    }


    public ElementType findElementTypesByName(String elementTypeRequest) {
        ElementType elementType = elementTypeRepository.findByElementTypeIsLikeIgnoreCase(elementTypeRequest);
        ElementTypeDto response = elementTypeMapper.elementTypesToElementTypeDtos();
        return response;
    }
}