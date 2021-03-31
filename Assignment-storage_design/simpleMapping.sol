pragma solidity 0.8.3;

contract test {
    struct Entity {
        uint256 data;
        address _address;
        bool isEntity;
    }

    mapping(address => Entity) newMapping;

    function addEntity(uint data, address addre) public {
        require(isEntity);
        mapping[msg.sender].data = data;
        mapping[msg.sender]._address = addre;
        mapping[msg.sender].isEntity = true;
    }

    function isEntity (address entityAddress) public view returns(bool success) {
        return newMapping[entityAddress].isEntity;
    }

    function updateEntity(uint data) public {
        require(isEntity);
        entityStructs[entityAddress].entityData = data;
    }
}
