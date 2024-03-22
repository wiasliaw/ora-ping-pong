// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract PingPong {
    uint256 public requestId;

    mapping(uint256 => bool) public fulfilledResult;

    event Request(uint256 _requestId);

    function ping() external {
        unchecked {
            requestId++;
        }
        emit Request(requestId);
    }

    function fulfilled(uint256 _requestId) external {
        fulfilledResult[_requestId] = true;
    }
}
