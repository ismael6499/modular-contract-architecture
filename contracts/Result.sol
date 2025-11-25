// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

contract Result{
    uint256 public result;
    address public admin;
    uint256 public fee;

    modifier onlyAdmin() {
        if(tx.origin != admin) revert();
        _;
    }

    constructor(address admin_){
        admin = admin_;
        fee = 5;
    }

    function setResultado (uint256 num_) external{
        result = num_;
    }

    function setFee(uint256 newFee_) external onlyAdmin {
        fee = newFee_;
    }
    
    function setAdmin(address newAdmin_) external onlyAdmin {
        admin = newAdmin_;
    }
}