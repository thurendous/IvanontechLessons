# Abstract
In this project, I built a Multisig Wallet Smart Contract. A multisig wallet is a wallet where multiple "signatures" or approvals are needed for an outgoing transfer to take place. As an example, I could create a multisig wallet with me and my 2 friends. I configure the wallet such that it requires at least 2 of us to sign any transfer before it is valid. Anyone can deposit funds into this wallet. But as soon as we want to spend funds, it requires 2/3 approvals.  


Here are the requirements of the smart contract wallet you will be building  

- Anyone should be able to deposit ether into the smart contract  

- The contract creator should be able to input (1): the addresses of the owners and (2):  the numbers of approvals required for a transfer, in the constructor. For example, input 3 addresses and set the approval limit to 2. 

- Anyone of the owners should be able to create a transfer request. The creator of the transfer request will specify what amount and to what address the transfer will be made.

- Owners should be able to approve transfer requests.

- When a transfer request has the required approvals, the transfer should be sent. 

 

Please post any questions and answers regarding the Multisig Wallet Project here:

https://forum.ivanontech.com/t/project-multisig-wallet/27222


# SIDE NOTE BY MYSELF:
- Need to add some requires to check about the Contract. 
  - i.e. check the transfer amount should be less than the contract balance. or not it can break.
  - check the owner address cannot be the same. Like there can be 2 same account to be added to the "owners" address so that it will break. 
