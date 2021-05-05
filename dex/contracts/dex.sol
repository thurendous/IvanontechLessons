pragma solidity >=0.4.22 <=0.8.3;
pragma experimental ABIEncoderV2;

import "./wallet.sol";

contract Dex is Wallet {
    enum Side {BUY, SELL}

    struct Order {
        uint256 id;
        address trader;
        // bool buyOrder; // true or false
        bool buyOrder;
        bytes32 ticker;
        uint256 amount;
        uint256 price;
    }

    mapping(bytes32 => mapping(uint256 => Order[])) public orderBook;

    function getOrderBook(bytes32 ticker, Side side)
        public
        view
        returns (Order[] memory)
    {
        return orderBook[ticker][uint256(side)];
    }

    // getOrderBook(byte32("LINK"), Side.BUY);
    // function createLimitOrder() {}
}
