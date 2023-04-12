pragma solidity ^0.8.14;
contract lottery
{
   address manager;
   address[]  participants;
   uint public noofpart;
   uint public total_amount=0;
   uint public winner;
   function participate() public payable 
   {
       require(msg.value==1000000000000000000,"pay 1 eth to participate");
       participants.push(msg.sender);
       noofpart+=1;
       total_amount+=msg.value;
   }
   function win() public payable 
   {
       require(noofpart>=3,"Atleast 3 participants are required to declare the winner");
       uint i=random(noofpart);
       winner=i;
       address payable ad=payable(participants[i]); 
       ad.transfer(total_amount);
   }
   function random(uint number) private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender))) % number;
    }
}
