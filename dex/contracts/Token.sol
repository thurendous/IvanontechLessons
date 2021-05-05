pragma solidity >=0.4.22 <0.8.3;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Link is ERC20 {
    constructor() ERC20("chainlink", "Link") {
        _mint(msg.sender, 1000);
    }
}
