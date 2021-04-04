pragma solidity 0.8.3;

contract test {
    mapping(address => uint256) balance;

    function withdraw() public {
        require(balance[msg.sender] > 0);
        msg.sender.send(balance[msg.sender]);
        balance[smg.sender] = 0;
    }
}
