pragma solidity ^0.8.3;

contract test2 {
    struct Entity {
        uint256 data;
        address _address;
    }

    Entity[] public entities;

    function addEntity(address entityAddress, uint256 entityData)
        public
        returns (Entity memory)
    {
        Entity memory newEntity;
        newEntity.entityAddress = entityAddress;
        newEntity.data = entityData;
        entities.push(newEntity);
        return entities[entities.length - 1];
    }
}
