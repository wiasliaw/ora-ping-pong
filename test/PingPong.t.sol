// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {PingPong} from "../contract/PingPong.sol";

contract TestPingPong is Test {
    PingPong private _pingPong;

    event Request(uint256 _requestId);

    function setUp() external {
        _pingPong = new PingPong();
    }

    function testPingPong() public {
        vm.expectEmit(false, false, false, false);
        emit Request(1);
        _pingPong.ping();
    }
}
