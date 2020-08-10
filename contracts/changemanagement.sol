  pragma solidity ^0.5.1;
  contract changemanagement{ 
      
      //change is taken as topic.
      address public admin;
      
      //account who deploys contract will be admin
      constructor() public{
          admin=msg.sender;
      }
      
      
    
      
      //with the help of this function 
      modifier onlyadmin () {
  require( admin==msg.sender,"only admin has access to this function");
  _;
}







      //struct containing members list
      struct members{
          address memberaddress;
          string memberlocation;
          bool hasaccess;
          bool isregistered;
          
         }
         
         
         
         
         
     // string[][] topicvisevotes;
      //storing all the members details
      mapping(address=>members) memberslist;
      mapping(address=>mapping(string=>members))public topicwisepermission;
     // mapping(address=>mapping(string=>members))public memlisttopicwise;
      
      
      
      
      
      
      
      //admin will register new members
      function registermember(address _memberaddress,string memory _memberlocation)public  {
          require(msg.sender!=_memberaddress,"admin cannot register himself");
          memberslist[_memberaddress].memberaddress=_memberaddress;
          memberslist[_memberaddress].memberlocation=_memberlocation;
           memberslist[_memberaddress].isregistered=true;
         // memlisttopicwise[_memberaddress][]
      }
      
      
      
      
      
      //only admin can give access user to participate in disscusion
      function giveaccesstoparticipate(address _memberaddress,string memory _topicname)public onlyadmin{
           require(msg.sender!=_memberaddress,"admin cannot participate in disscusion");
          require(  memberslist[_memberaddress].isregistered==true,"user not registered");
         //  memberslist[_memberaddress].hasaccess=true;
           
           topicwisepermission[_memberaddress][_topicname].hasaccess=true;
      }
      
      
      
     
      
      
      
      
      //struct containing topic details
      struct topics{
          address[] feedbackgivenaddress;
          string membername;
          string topicname;
          int approvalscore;
          bool feedbacktatus;
          topicstatus st;
        //  mapping(string=>address) votedusers;
           }
   
   
   
      
      enum topicstatus{dummy,approved,notapproved,ommited}
      topicstatus st;
      
      
      
    
      
      //mapping all the users that gave feedback to topics
      
      mapping(address=>mapping(string=>topics)) feedbackgiventopics;
      
      
      //mapping approval votes for topics
      
      mapping(string=>topics) topicapprovalstatus;
      
  
    
 
 
         
      //group members will give feedback on topic they disscused
      
      function feedback(string memory _topicname,string memory _feedback)public {
          require(feedbackgiventopics[msg.sender][_topicname].feedbacktatus==false,"feedback can only be given once");
          require(   topicwisepermission[msg.sender][_topicname].hasaccess==true,"your access has not approved by admin");
          feedbackgiventopics[msg.sender][_topicname].feedbacktatus=true;
         topicapprovalstatus[_topicname].feedbackgivenaddress.push(msg.sender);
     
  
      
      
      
      
      
      bytes memory bs=bytes(_feedback);
      uint count=0;
     // uint checkcount;
     for(uint i=0;i<bs.length;i++){
         if (bs[i]=='a'){
             count=count+1;
         }
          if (bs[i]=='e'){
              count=count+1;
         }
         if (bs[i]=='i'){
              count=count+1;
         }
         if(bs[i]=='o'){
              count=count+1;
         }
         if(bs[i]=='u'){
           count=count+1;   
         }
         
     }



     if(count%2==0){
   
        topicapprovalstatus[_topicname].approvalscore++;
        topicapprovalstatus[_topicname].st=topicstatus.approved;
        
        
                   }
     
    else if(count%2!=0)
             {
      topicapprovalstatus[_topicname].approvalscore--;
      topicapprovalstatus[_topicname].st=topicstatus.notapproved;
      
      
             }
             
             else if (topicapprovalstatus[_topicname].approvalscore==0){
                 topicapprovalstatus[_topicname].st=topicstatus.ommited;
                 
                 
                //  topicapprovalstatus[_topicname].address.push(feedbackgivenaddress(msg.sender));
             }
              
      }
  
   
         
 function gettopicwiseaddress(string memory _topicname)public onlyadmin view returns(address[] memory users,int _approvalscore,topicstatus){
     return (topicapprovalstatus[_topicname].feedbackgivenaddress,  topicapprovalstatus[_topicname].approvalscore,topicapprovalstatus[_topicname].st);
 } 
      
     
     
      
      
      
  
  }
      
   
 
  
  
  
  
  
  
    
  