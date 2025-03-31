// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataType {
   uint public positiveNumber = 100;
   int public negativeNumber = -50;
   address public recipient;
   bool public isActive = true;
   address public wallet = address(0);
   bytes32 public fixedData = "0xabcdef123456";
   bytes public dynamicData;
   enum State {Created, Active, Inactive}
   State public currentState = State.Active;

   constructor(address _recipient) {
       recipient = _recipient;
   }

   function setState(State _state) public returns(State){
       currentState = _state;
       return currentState;
   }

   function getDynamicDataLength() public view returns(uint){
       return dynamicData.length;
   }

   function setDynamicData(bytes memory _data) public returns (bytes memory){
       dynamicData = _data;
       return dynamicData;
   }

   function getDynamicDataAsString() public view returns(string memory){
       return string(dynamicData);
   }

   function setFixedData(bytes32 _data) public returns(bytes32){
       require(_data.length <= 32, "Data must be 32 bytes or less");
       fixedData = _data;
       return fixedData;
   }

   function setWallet(address _recipient) public returns(address){
       wallet = _recipient;
       recipient = _recipient;
       return recipient;
   }

   function getWallet() public view returns(address){
       return wallet;
   }

   function setPositiveNumber(uint _number) public returns(uint){
       positiveNumber = _number;
       return positiveNumber;
   }

   function setNegativeNumber(int _number) public returns(int){
       negativeNumber = _number;
       return negativeNumber;
   }

   function setNumber() public returns (uint, int) {
       setPositiveNumber(500);
       setNegativeNumber(-200);
       return (positiveNumber, negativeNumber);
   }

   function toggleActive() public {
       isActive = !isActive;
   }

   function getActive() public view returns(bool){
       return isActive;
   }

   function getDetails() public view returns(uint, int, bool, address, address, bytes32, bytes memory, State){
       return (positiveNumber, negativeNumber, isActive, wallet, recipient, fixedData, dynamicData, currentState);
   }
}
