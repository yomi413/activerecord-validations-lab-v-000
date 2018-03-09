class MyValidator < ActiveModel::Validator
  def validate(record, number)
    unless record.title.include?
      "Won't Believe" || "Secret" || "Top #{number}" || "Guess"
      record.errors[:title] << "Title is not valid."
    end
  end
end
