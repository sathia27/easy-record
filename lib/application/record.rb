module Record
  $records = {} unless defined? $records

  def self.track(instance = nil)
    return if instance.nil?

    if $records.map(&:first).include?(instance.class.name)
      $records[instance.class.name].push(instance)
    else
      $records[instance.class.name] = [instance]
    end
  end

  def self.untrack(instance)
    index = $records.index(instance)
    $records.delete_at(index) unless index.nil?
    $records
  end

  def self.of(class_name)
    $records[class_name]
  end
end
