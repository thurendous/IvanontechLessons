pragma solidity 0.7.5;
pragma abicoder v2;
import "./Ownable.sol";

contract MultisigWallet is Ownable {
    mapping(address => uint256) balance;

    function getOwner() public view returns (address) {
        return owner;
    }

    function transfer(
        address _from,
        address _to,
        uint256 _amount
    ) public returns (uint256) {}

    function deposit() public payable returns (uint256) {
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function getBalanceOfContract() public view returns (uint256) {
        return address(this).balance;
    }
}
