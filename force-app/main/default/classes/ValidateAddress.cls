public  class ValidateAddress {
   public void validateHomeAddress(){
    string houseName='Huzur Apt';
    string streetName='Sun Street';
    string cityName='Istanbul';
    string stateName='Marmara';
    String stateISOCode='11b';
    string countryName='Turkey';
    string countryISOCode='22m';

    integer strLength=streetName.length();
    system.debug(strLength);
    system.debug(streetName.contains(houseName));
    system.debug(streetName.contains(stateISOCode));
    system.debug(stateISOCode.toUpperCase());
    system.debug(countryISOCode.toUpperCase());
    system.debug(countryName.toUpperCase());
    system.debug(cityName.toLowerCase());
    system.debug(stateName.toLowerCase());
    string data1=houseName+' '+streetName+' '+cityName+' '+stateName+' '+countryName;
    system.debug(data1);

   }
}
