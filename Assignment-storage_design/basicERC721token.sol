pragma solidity ^0.8.0;

contract Kittycontract {
    // 名字
    string public constant name = "TestKitties";
    // 简称字母
    string public constant symbol = "TK";

    // 这个eveent应该是要跟前端接的目的而存在
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    event Birth(
        address owner,
        uint256 kittenId,
        uint256 mumId,
        uint256 dadId,
        uint256 genes
    );

    struct Kitty {
        uint256 genes;
        uint64 birthTime;
        uint32 mumId;
        uint32 dadId;
        uint16 generation;
    }

    // 这时创建一个kitty的一个array
    Kitty[] kitties;
    //这里是创建了一个mapping，用来控制id对应的用户
    mapping(uint256 => address) public kittyIndexToOwner;
    //这里是创建了一个mapping，记录用户的拥有数量
    mapping(address => uint256) ownershipTokenCount;

    function balanceOf(address owner) external view returns (uint256 balance) {
        // 这里来算出来用户的拥有的数量
        return ownershipTokenCount[owner];
    }

    function totalSupply() public view returns (uint256) {
        // 这里是总供应量的计算数值
        return kitties.length;
    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        // 这里是返回kitty的返回的数值的。
        return kittyIndexToOwner[_tokenId];
    }

    function transfer(address _to, uint256 _tokenId) external {
        // 检测是否地址是000地址
        require(_to != address(0));
        // 检测是否是送给现在的合约地址的。如果是就不允许。
        require(_to != address(this));
        // 检测交易提出者是否拥有这个id的东西
        require(_owns(msg.sender, _tokenId));
        // 进行交易
        _transfer(msg.sender, _to, _tokenId);
    }

    //这个是获取全部的摸个地址的拥有猫咪的方法。
    function getAllCatsFor(address _owner)
        external
        view
        returns (uint256[] memory cats)
    {
        uint256[] memory result = new uint256[](ownershipTokenCount[_owner]);
        uint256 counter = 0;
        for (uint256 i = 0; i < kitties.length; i++) {
            if (kittyIndexToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }

    // 创建0代的猫咪
    function createKittyGen0(uint256 _genes) public returns (uint256) {
        return _createKitty(0, 0, 0, _genes, msg.sender);
    }

    // 创建猫咪的方法。(私有方法，不让外部调用)
    function _createKitty(
        uint256 _mumId,
        uint256 _dadId,
        uint256 _generation,
        uint256 _genes,
        address _owner
    ) private returns (uint256) {
        Kitty memory _kitty =
            Kitty({
                genes: _genes,
                birthTime: uint64(block.timestamp),
                mumId: uint32(_mumId),
                dadId: uint32(_dadId),
                generation: uint16(_generation)
            });

        kitties.push(_kitty);

        uint256 newKittenId = kitties.length - 1;

        emit Birth(_owner, newKittenId, _mumId, _dadId, _genes);

        _transfer(address(0), _owner, newKittenId);

        return newKittenId;
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _tokenId
    ) internal {
        ownershipTokenCount[_to]++;

        kittyIndexToOwner[_tokenId] = _to;

        if (_from != address(0)) {
            ownershipTokenCount[_from]--;
        }

        // Emit the transfer event.
        emit Transfer(_from, _to, _tokenId);
    }

    function _owns(address _claimant, uint256 _tokenId)
        internal
        view
        returns (bool)
    {
        return kittyIndexToOwner[_tokenId] == _claimant;
    }
}
