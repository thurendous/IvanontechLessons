pragma solidity 0.7.5;

contract Ownable {
    // address[] public owners;
    // uint256 limit;
    constructor() {
        address[] public owners;
        uint limit;

        struct Transfer{

        }
        Transfer[] transferRequests;
        mapping(address => mapping(uint => bool)) approvals;
        // mapping[address][transferID] => true/false
        owner = msg.sender;
    }

    function OnlyOwner() public {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }


    // function Multisig() public {
    //     require();
    // }
}
