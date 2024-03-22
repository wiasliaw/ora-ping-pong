// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";

import {PingPong} from "../contract/PingPong.sol";

contract CounterScript is Script {
    uint256 private _deployer;
    PingPong private _pingPong;

    function setUp() external {
        _deployer = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.createSelectFork("sepolia");
        vm.startBroadcast(_deployer);
        _pingPong = new PingPong();
        vm.stopBroadcast();
    }
}
