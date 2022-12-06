public with sharing class Dog {
    public string name;
    public string color;
    public integer age;
    public static integer count;
    public Dog() {
        count++;
        age=1;
        checkAge();
        showCount();

    }
    public Dog(String nm,String cl, integer ag){
        name =nm;
        color=cl;
        age=ag;
        count++;
        checkAge();
        showCount();
    }
     public static void showCount(){
            System.debug(count);

        }
        public void checkAge(){
            if (0<= age && age <=1) {
                System.debug('puppy dog');
                
            }else if (1<= age && age <=3) {
                System.debug('young dog');
                
            } else if (3<= age && age <=5) {
                System.debug('adult dog');
                
            } else{
                System.debug('old dog');
            }
        }
}
