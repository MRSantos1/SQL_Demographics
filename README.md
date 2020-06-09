# SQL_Demographics

The following repository is a project done for a data integration project at my current place of employment. What was requested was a demographic file  that needed to be created for an outside agency who needed student demographic data. In addition to the normal demographic data pull, (name, address, gender, birthdate) 15 extra blank fields needed to be added in as placeholders for the receiving party for additional notation.

To create the data, drop statements were used to clear previous entries, use of joins, and MAX cases were used in order to retrieve the most current student data.

Once the table was created, automation then had to be programmed on it so a csv could be created from the table. Microsoft Visual Studio has many UI-based tools to help accomplish this task. In MS visual studio, SQL and Data Flow tasks were added to complete this function. 
