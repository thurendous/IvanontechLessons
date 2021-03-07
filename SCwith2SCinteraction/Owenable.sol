pragma solidity 0.7.5;

contract Ownable {
    address internal owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}
