require_relative 'tsv_buddy'
require 'yaml'
class FlipFlap
	
  # Do NOT create an initialize method
  def take_yaml(yml)
  	@data = YAML::load(yml)
  end
  def to_yaml 
	return @data.to_yaml
  end
	
end
