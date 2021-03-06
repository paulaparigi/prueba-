public class CustomUserController {

    public PageReference save() {
    
        String inputString = customUser.Password__c;
        String md5Coded = EncodingUtil.convertToHex(Crypto.generateDigest('MD5', Blob.valueOf(inputString)));
        
        List<CustomUser__c> customU = [select Id, Email__c from CustomUser__c WHERE Email__c = :customUser.Email__c];
        
       
        customUser.Password__c = md5Coded ;
       /* CustomRole__c customerRole;
        customerRole = [select Id from CustomRole__c WHERE Name = 'Customer' LIMIT 1];
        customUser.Role__c = customerRole.Id;
        Insert customUser;*/        
        
        Pagereference login = Page.CustomLogin;
        if(customU.size() > 0)
        {
        	login.getParameters().put('mid', '2');
        }else
        {
        	login.getParameters().put('mid', '1');
        }
       
        
        
   		return login;       
    }
    
    
    public CustomUser__c customUser {
    get {
      if (customUser == null)
      {
        customUser = new CustomUser__c();
      }
      return customUser ;
    }
    set;
  }
    
}