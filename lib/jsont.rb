$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

class JsonT

  attr_reader :parent, :rules
  
  def initialize(rules)
    @rules = rules
    @rules.each do |r,v| 
      if r.index('self') != 0
        rules["self.#{r}"] = rules.delete(r)
      end
    end
  end
  
  def transform(target)
    @parent = target
    apply!('self', parent)
  end
  
  def apply!(target_path, target)
    case target
    when Array
      target.each_index do |i|
        target[i] = apply!("#{target_path}[*]", apply!("#{target_path}[#{i}]", target[i]))
      end
    when Hash
      target.each do |k, v|
        target[k] = apply!("#{target_path}.?", apply!("#{target_path}.#{k}", target[k]))
      end
    end
    
    if (rule = rules[target_path])
      if rule.respond_to?(:call)
        rule.call(target, :target_path => target_path)
      else
        rule.gsub(/\{([a-z0-9\$\.]+)\}/i) do |match|
          path = match[1,match.size - 2]
          n = case path[0]
          when ?$
            target
          else
            parent
          end
          path.gsub!(/^\$\.?/,'')

          if path.size > 0
            path.split('.').each do |piece|
              n = case piece
              when /^[0-9]+$/
                n[Integer(piece)]
              else
                n[piece]
              end
            end
          end
          n
        end
      end
    else
      target
    end
  end
end

