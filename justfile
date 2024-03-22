contract-compile:
  @forge compile

contract-deploy:
  @forge script script/PingPong.s.sol --rpc-url sepolia --broadcast --verify
