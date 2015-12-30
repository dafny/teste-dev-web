class Dog < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  validates :breed_id, :color, :amount, :age, :gender, :size, :photo, presence: true

  belongs_to :breed
  has_many :purchases_dogs

  enum size: {
    mini: "Mini",
    small: "Pequeno Porte",
    medium: "Médio Porte",
    big: "Grande Porte"
  }
  enum gender: {
    m: "Macho",
    f: "Fêmea"
  }

  def self.search(search)
    if search.present?
      joins(:breed)
      .where("LOWER(breeds.name) LIKE LOWER(?)", "%#{search}%")
    else
      where(nil)
    end
  end
end
