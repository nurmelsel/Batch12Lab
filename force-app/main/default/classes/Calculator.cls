public with sharing class Calculator {
    public decimal dynamicCalulationMethod(decimal a, decimal b, String opType){
        switch on opType {
            when 'ADDITION' {		
                return a+b;
            }	
            when 'SUBSTRACTION' {		
                return a-b;
            }
            when 'DIVISION' {
                return a/b;
            }
            when 'MULTIPLICATION' {
                return a*b;
            }
            when else{
                return null;
            }
        }
    }

    // public decimal dynamicCalulationMethod(decimal x, decimal y, string operation) {
    //     if (operation=='ADDITION') {
    //         return x+y;
    //      }else if(operation=='SUBTRACTION'){
    //         return x-y;
    //      }else if(operation=='DIVISION'){
    //         return x/y;
    //      }else if(operation=='MULTIPLICATION'){
    //         return x*y;
    //      }
    //      else
    //      return null;
    //     }
}
