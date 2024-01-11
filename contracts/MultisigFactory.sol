pragma solidity ^0.8.20;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./MultisigWallet.sol";

contract MultisigFactory {
    address immutable multisgImplementation;

    mapping(address user => address[] multisigs) public userMultisigs;

    constructor() {
        multisgImplementation = address(new MultisigWallet());
    }

    function createMultisig(
        address[] memory _owners,
        uint _numConfirmationsRequired
    ) external returns (address) {
        address clone = address(Clones.clone(multisgImplementation));
        MultisigWallet(payable(clone)).configureMultisig(_owners, _numConfirmationsRequired);

        for (uint i = 0; i < _owners.length; i++) {
            userMultisigs[_owners[i]].push(clone);
        }

        return clone;
    }

    function getUserMultisigs(address _user) public view returns (address[] memory) {
        return userMultisigs[_user];
    }
}
