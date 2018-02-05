67272_PATS_v1
==

This is a basic Rails app that was built as a class demonstration in the spring of 2018.  This first version of the project is designed help students become more familiar with the basics of the Rails 5.1 framework; future versions will add in additional features like searching (straight|phonetic|full-text), polymorphic associations, and interactive javascript interfaces.

The class is Application Design & Development (67-272) and is for students in [Information Systems at Carnegie Mellon University](https://67272.cmuis.net). We have posted this code on [github.com](https://github.com/profh) in a public directory so that (a) it is readily accessible to students and (b) that students will get a little familiarity with github.com.

This project does require the use of several gems to work properly. Check the Gemfile to see which gems are used. This project also assumes the user is running Ruby 2.4.x since that is what is used in the course.


Setup
--
The project requires a [Postgres database](https://www.postgresql.org/) because there are a number of database triggers that are installed via Rails migrations.  If you have a Windows laptop, there are decent postgres install instructions [here](https://wiki.postgresql.org/wiki/Running_%26_Installing_PostgreSQL_On_Native_Windows).  

Mac users are strongly encouraged to use the [Postgres App](https://postgresapp.com/) as it makes running postgres super simple.  However, installing the 'pg' gem (which Rails uses to connect to a postgres database) is a little tricky because it needs to know where `libpq-fe.h` is, as well as some other config files, and that's not obvious when using the Postgres App.  To handle this, before running `bundle install`, on the command line run the command `export CONFIGURE_ARGS="with-pg-include=/Applications/Postgres.app/Contents/MacOS/include/"` followed by `gem install pg -v=0.21.0`. Doing this will ensure the pg gem installs properly.

After postgres is installed and running, install all gems with the `bundle install` on the command line.  To set up the database and populate it with realistic sample records, run on the command line `rake db:populate`.  The populate script will remove any old databases, create new development and test databases, run all the migrations to set up the structure and add in the triggers, and then create 240 owners with over 450 pets and several thousand visits. (Every run will generate a different set of data.)

The populate script will also create a vet user to login into the system.  The username is 'vet' and the password is 'yodel' -- a tribute to VeggieTales' [The Yodeling Veterinarian of the Alps](https://www.youtube.com/watch?v=bUkpE16b56g).

*Two side notes on postgres*
1. 