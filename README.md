Find List Select
=======================

This Plugin was originally made by someone else. If you are the original author please email me. (demersus@gmail.com) and I will be sure to add you to the contributor list.

I have tweaked it to suit my needs.

Use
--------------------

`Model.find_list`

This plugin adds a method which can be overidden in your models called 'find_list'
The purpose of this method is to export the data so it is suitable for use in form helpers for filling a select list.
It creates less strain on the database by pulling only the name and id columns. 

 * These are configureable by passing the following options:
   `Model.find_list :display => 'name field', :id => 'primary key field`



Installation
---------------------

`rails plugin install git://github.com/demersus/find_list_select.git`

Or for Rails 2 users:

`script/plugin install git://github.com/demersus/find_list_select.git`


Contributors
--------------------

# Unknown
# Nik Petersen (Demersus)

