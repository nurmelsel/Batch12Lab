// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

Planets r1=new Planets();
r1.planetName='Earth';
r1.positionNumber=3;
r1.noOfMoons=1;
system.debug(r1);

Planets r2=new Planets();
r2.planetName='Jupiter';
r2.positionNumber=5;
r2.noOfMoons=6;
system.debug(r2);