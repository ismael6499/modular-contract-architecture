// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

interface IResult{

    function setResultado(uint256 num_) external;

    function setFee(uint256 newFee_) external;
    
    function setAdmin(address newAdmin_) external;
}