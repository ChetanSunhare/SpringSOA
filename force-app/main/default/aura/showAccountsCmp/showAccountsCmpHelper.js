({
	getAccounts : function(cmp) {
		var action = cmp.get('c.fetchAccounts');
        action.setCallback(this,function(result){
            console.log(result);
             var state = result.getState();
            if ( state === "SUCCESS") {
                cmp.set("v.accounts", result.getReturnValue());
            	console.log(result.getReturnValue());
            }     
        });
        $A.enqueueAction(action);
	}
})