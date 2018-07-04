# Winner
Welcome to my first project on github. 
My Application called Winner is about sharing predictions and analyses for sport events with other users. 
## Getting started
1. First, you have to import project to your IDE.
2. Next, you have to set up server. I used local Tomcat.
3. Now, connection to mySQL database
- set up a new database in your mySQL or import sample prepared by myself to mySQL. It's uploaded.
- open file "/src/main/resources/META-INF/persistence.xml".
Then set up name of database, user, password in:
```
<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/name_of_database" />
<property name="javax.persistence.jdbc.user" value="user" />
<property name="javax.persistence.jdbc.password" value="password" />
```
If you want you can use sample of database prepared by me. It's already uploaded -> winner.sql. Just import it to mySQL.

After this operation, application is ready to start

## Technologies used
- Java 8
- Spring (Framework, Data)
- JPA(Hibernate)
- mySQL
- .jsp
- Bootstrap
- jBcrypt

## Things to improve
- One of the first things I have to deal with is functionality of searcher input. Currently it takes exact order of teams.
- User should have their personal rating, not only the predictions
- many more

## Authors

* **Tymon Zietek** - *entire work*
