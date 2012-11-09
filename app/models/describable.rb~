class Describable < ActiveRecord::Base

  has_many                        :descriptions, as: :describable
  accepts_nested_attributes_for   :descriptions, :allow_destroy => true
  attr_accessible                 :descriptions_attributes

  validate                        :one_description
  validate                        :one_per_language

  self.abstract_class = true

  def locate(atr)
    if descriptions.present?
      description = self.descriptions.where(language: I18n.locale.to_s)
      (description.blank?) ? descriptions.first.send(atr) : description.first.send(atr)
    else
      "TODO: Options (describable)"
    end
  end

  def description
    locate(:body)
  end

  def name
    locate(:name)
  end

  def names
    descriptions.pluck(:name).join(", ")
  end

private

  def one_description
    errors[:descriptions] << I18n.t('descriptions.form.errors.atleast_one') if descriptions.blank?
  end

  #TODO - not sure if there is a bug but you can't use where before save, presumably because the descriptions
  #are not yet in the database
  def one_per_language
    language_present = {}
    descriptions.each do |description|
      language_present[description.locale_id] = (language_present[description.locale_id].blank?) ? true :
                      errors[:descriptions] << I18n.t('descriptions.form.errors.duplicate_language')
    end
  end

end
