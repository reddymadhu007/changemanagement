contract features:
1. Contract owner will register users with their ethereum addresses and their location.

2. Admin will give permissions to users based on topic user will participate. 
 
  2.1 for giving permission user has should be registered first.

3. User will give his feedback on topic and sentence.
  3.1 user can give feedback only once.

4. Admin can track topic wise status: 1.approval score for topic.
                                      2.users participated in particular topic.
 
5. User can check their permission for topic wise before participating.

  //  mapping(string=>address) votedusers;
future extensions:

1. we can register multiple addresses at once.
2. we can change ownership of admin.
3. we can give access-permissions based on topic to multiple addresses at once.



testing contract:

1. to compile locally install (truffle,ganache,solc).
2. open ganache and copy localhost path and paste  address in host 
networks: {
  
    development: {
     host: "",     // Localhost (default: none)
                // Standard Ethereum port (default: none)
     network_id: "5777", 
     websockets: true        // Any network (default: none)
    },

  
 },

4. run 'truffle compile' for compiling smart contracts and then truffle migrate.

<!-- for onile deploying and checking conditions -->
for  online deploy on remix ide (online browser) https://remix.ethereum.org/

1. deploy the contract and admin will be the deployed contracts.

2. Register the users by providing their ethereum address and location in registermember.admin canot register himself.

3. from admin ethereum account give permission to one of registered user account with topic name in giveaccesstoparticipate function.admin account canot give permission to their aaccount

4. from user account  provide topic name and feedback in feedback function.you can only give feedback once.

5. you can check topic status by providing topic name in gettopicwiseaddress function.

    --- if topic status ==0 topic is not registered
    --- if topic status ==1 topic is approved
    --- if topic status ==2 topic is not approved.

  -- address:it will display all the ethereum adress participated in that topic.  

  -- approval score : if approval score is positive then majority users have given feedback positively
                      
                      if approval score is negative then majority users have given feedback negatively. 
