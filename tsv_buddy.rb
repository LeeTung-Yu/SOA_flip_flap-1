# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  require 'yaml'

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
      columns_names=[]
      lines=[]
      lines=tsv.split("\n")
      column_names=lines[0].split("\t")
      column_names.map!{|x| x.chomp}
      lines.shift
      lines.each do |line|
        values = line.split("\t")
        element=Hash.new
        columns_names.each_index do |index|
              element[column_names[index]]=values[index].chomp
        @data.push(element)
      end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
      
      column_names=@data[0].keys
      tsv_string=""
      column_names.each{|column_name| tsv_string.concat(column_name+"\t")}

      
      @data.each_index {|index| 
        temp_map = data[index]
        temp_map.each{|key,value| tsv_string.concat(value+"\t")}
        tsv_string.concat("\n")
      }
      return tsv_string
  end
end
