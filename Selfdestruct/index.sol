contract Kill {
  constructor() payable{}
	function kill() external {
    selfdestruct(payable(msg.sender));
  }

  function testCall() external pure returns (string memory){
    return "testCall";
  }
}

contract Helper {
  function getBalance() external view returns (uint) {
    return address(this).balance;
  }

	function kill(Kill _kill) external {
    _kill.kill();
  }
}