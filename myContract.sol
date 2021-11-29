pragma solidity ^0.4.0;



interface Regulator{

    function canWithdraw(uint amount) external returns (bool);
    function canDeposit(uint amount) external returns (bool);

}


//  create a corporative society smart contract.
//  In this smart contract on the creator can do transaction
// create Member, deposit, withdraw,check
// all members can see your balance. 
//Note: this contract is just for learning 



contract Corperative{


struct Member{

    string name;
    uint balance;
    uint weeklyPay;
}

    address private owner;
    mapping (string=>Member) members;
   

    constructor() public{
        owner = msg.sender;
    }


    function createMember(string _name, uint due) public{
            Member memory _member = Member({name:_name,balance:0, weeklyPay:due});
            members[_name]= _member;
    }



    function deposit(uint amount,string name) public{
    
        require(owner == msg.sender);
            members[name].balance += amount;
    
    }

    function withdraw(uint amount,string name) public {
        require(owner == msg.sender);
        if((members[name].balance -amount) >= 0){
             members[name].balance -= amount;
        }else{
            revert();
        }
           
    }

    function checkBalance(string name)public view returns (uint) {
        return members[name].balance;
    }

    // function canWithdraw(uint amount) public  returns (bool) {
        
    //     return (balance - amount) >= 0; 
    // }

    // function canDeposit(uint amount) public returns (bool){
    //     return weeklyPay ==amount;
    // }

   
}
