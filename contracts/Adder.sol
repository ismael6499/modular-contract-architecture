// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

import "./interfaces/IResult.sol";

contract Adder{
    
    address public resultAddress;
    address public admin;
    uint256 public fee;

    modifier onlyAdmin() {
        if(msg.sender != admin) revert();
        _;
    }

    constructor(address resultAddress_, address admin_){
        resultAddress = resultAddress_;
        admin = admin_;
        fee = 5;
    }

    function addition(uint256 num1_, uint256 num2_) external {
        uint256 result = num1_ + num2_;
        IResult(resultAddress).setResultado(result);
    }

    function setFee(uint256 newFee_) external onlyAdmin {
        fee = newFee_;
    }

    function setAdmin(address newAdmin_) external onlyAdmin {
        admin = newAdmin_;
    }

}