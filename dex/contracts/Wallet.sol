pragma solidity >=0.6.0 <=0.8.3;
import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract Wallet is Ownable {
    using SafeMath for uint256;
    // information of the tokens
    struct Token {
        bytes32 ticker;
        address tokenAddress; // need to do transfer calls, and need the interface
    }
    mapping(bytes32 => Token) public tokenMapping; // get them quickly by mapping
    bytes32[] public tokenList; // looping through
    // balances of the users.
    mapping(address => mapping(bytes32 => uint256)) public balances;

    // here you can use string also, but you cannot compare string with each other. That's why we use this bytes32.

    function addToken(bytes32 ticker, address tokenAddress) external onlyOwner {
        tokenMapping[ticker] = Token(ticker, tokenAddress);
        tokenList.push(ticker);
    }

    modifier tokenExists(bytes32 ticker) {
        require(
            tokenMapping[ticker].tokenAddress != address(0),
            "Token does not exist"
        ); // here we check if the address is initialised. Cuz the default is 0x00
        _;
    }

    function deposit(uint256 amount, bytes32 ticker)
        external
        tokenExists(ticker)
    {
        balances[msg.sender][ticker] = balances[msg.sender][ticker].add(amount);
        IERC20(tokenMapping[ticker].tokenAddress).transferFrom(
            msg.sender,
            address(this),
            amount
        );
    }

    function withdraw(uint256 amount, bytes32 ticker)
        external
        tokenExists(ticker)
    {
        // require(tokenMapping[ticker].tokenAddress != address(0));
        require(
            balances[msg.sender][ticker] >= amount,
            "Balances not sufficient"
        );
        balances[msg.sender][ticker] = balances[msg.sender][ticker].sub(amount);
        IERC20(tokenMapping[ticker].tokenAddress).transfer(msg.sender, amount);
    }
}
