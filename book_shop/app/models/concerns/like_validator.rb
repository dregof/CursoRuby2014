class LikeValidator < ActiveModel::Validator

  def validate(record)
    klass = record.class
    if klass.respond_to?(:name) &&
       klass.where("name LIKE '%#{record.name}%'").size > 0
      record.errors[:name] << "tiene un valor similar"
    end
  end

end
