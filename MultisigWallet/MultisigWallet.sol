pragma solidity 0.7.5;
pragma abicoder v2;

contract Wallet {
    address[] public owners;
    uint256 limit;

    struct Transfer {
        uint256 amount;
        address payable receiver;
        uint256 approvals;
        bool hasBeenSent;
        uint256 id;
    }

    event TransferRequestCreated(
        uint256 _id,
        uint256 _amount,
        address _initiator,
        address _receiver
    );
    event ApprovalReicerved(uint256 _id, uint256 _approvals, address _approver);
    event TransferApproved(uint256 _id);

    Transfer[] transferRequests;

    mapping(address => mapping(uint256 => bool)) approvals;

    //Should only allow people in the owners list to continue the execution.
    modifier onlyOwners() {
        bool owner = false;
        for (uint256 i = 0; i < owners.length; i++) {
            if (msg.sender == owners[i]) {
                owner = true;
                break;
            }
        }
        require(owner);
        _;
    }

    //Should initialize the owners list and the limit
    constructor(address[] memory _owners, uint256 _limit) {
        owners = _owners;
        limit = _limit;
    }

    //Empty function
    function deposit() public payable {
        // nothing we need to do here.
    }

    //Create an instance of the Transfer struct and add it to the transferRequests array
    function createTransfer(uint256 _amount, address payable _receiver)
        public
        onlyOwners
    {
        emit TransferRequestCreated(
            transferRequests.length,
            _amount,
            msg.sender,
            _receiver
        ); // add this before the pushh for the correction of the length
        transferRequests.push(
            Transfer(_amount, _receiver, 0, false, transferRequests.length)
        );
    }

    //Set your approval for one of the transfer requests.
    //Need to update the Transfer object.
    //Need to update the mapping to record the approval for the msg.sender.
    //When the amount of approvals for a transfer has reached the limit, this function should send the transfer to the recipient.
    //An owner should not be able to vote twice.
    //An owner should not be able to vote on a tranfer request that has already been sent.
    function approve(uint256 _id) public onlyOwners {
        require(approvals[msg.sender][_id] == false, "you can only vote once.");
        require(
            transferRequests[_id].hasBeenSent == false,
            "The money has already been sent."
        );

        approvals[msg.sender][_id] = true;
        transferRequests[_id].approvals++;
        emit ApprovalReicerved(
            _id,
            transferRequests[_id].approvals,
            msg.sender
        );

        if (transferRequests[_id].approvals >= limit) {
            transferRequests[_id].hasBeenSent = true;
            transferRequests[_id].receiver.transfer(
                transferRequests[_id].amount
            );
            emit TransferApproved(_id);
        }
    }

    //Should return all transfer requests
    function getTransferRequests() public view returns (Transfer[] memory) {
        return transferRequests;
    }
}
