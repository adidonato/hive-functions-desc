# Get All Apache Hive Functions Description

Run these scripts to get all Apache Hive/Beeline functions described into a text file instead of manually running `describe function $function` for each one.

* Hive Version requires no edit.
* Beeline version requires jdbc connection string to be inserted in the first line of `get_beeline_func_description.sh`

Returns e.g.

`function_name
avg(x) - Returns the mean of a set of numbers`


## Usage

`./get_beeline_func_description.sh`

###or

`./get_hive_func_description.sh`

## License

These scripts are dedicated to the public domain. Use them, at own risk, as you please, with no restrictions whatsoever.
