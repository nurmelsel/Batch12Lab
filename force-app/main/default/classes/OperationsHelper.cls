public  class OperationsHelper {
    public decimal largestOutOfTwoNumbers(decimal a, decimal b){
        if(a > b){
            //returning a only if it is greater than b
            return a;
        }
        return b;//returning the decimal data type value
    }

    // public decimal largestOutOfTwoNumbers2(decimal a, decimal b){
    //     return math.max(a, b);
    // }
    
    public decimal smallestOutOfTwoNumbers(decimal a, decimal b, decimal c){
        if(a <=b && a <=c){
            return a;
        }
        else if(b <=a && b< =c){
            return b;
        }
        return c;
    }

    // public decimal smallestOutOfTwoNumbers2(decimal a, decimal b, decimal c){
    //     decimal x = Math.min(a,b);
    //     return Math.min(x, c);
    // }

    public Integer sumofPositiveIntegers(Integer n){
        Integer sum;
        if(n<0){
            //checking if the n is negative then showing the debig message
            //sum = null;
            system.debug('We are not calculating the sum for negative numbers');
        } else {
            //does calculation only when i is +ve.
            sum = 0;
            for(Integer i = 1; i <= n; i++){
                sum = sum + i;
                //sum += i;
            }
        }
        return sum;
    }
}
