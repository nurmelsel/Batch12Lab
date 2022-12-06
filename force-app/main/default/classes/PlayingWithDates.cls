public  class PlayingWithDates {
  
    public void printDateOutput(){


        date todayDate =date.today();
        system.debug(todayDate);
        date futureDate= date.newInstance(2789,11, 5);
        system.debug(futureDate);
        date pastDate = date.newInstance(1459,3, 4);
        system.debug(pastDate);
        integer dayInt=21;
        integer monthInt=4;
        integer yearInt= 2022;
        date newDate= date.newInstance(yearInt, monthInt, dayInt);
        system.debug(newDate);

    }
}
