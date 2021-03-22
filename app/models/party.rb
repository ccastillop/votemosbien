class Party < ApplicationRecord
  has_many :candidates
  has_one :answer, as: :answerer
  validates :name, presence: true
  has_one_attached :logo

  def to_s
    name
  end

  def self.import
    require 'open-uri'
    puts "Cargando datos de Partido"
    File.open( Rails.root.join('db', 'data', 'parties.txt') , "r").each_slice(10).with_index do |batch, idx1|
      batch = batch.map(&:strip)
      if party = Party.where('lower(name) = ?', batch[0].downcase).first 
        enrollment_date = batch[2].split("/")

        filename = File.basename(URI.parse(batch[1]).path)
        file = URI.open(batch[1])
        party.logo.attach(io: file, filename: filename)

        party.update(
          enrollment_date: "#{enrollment_date[2]}/#{enrollment_date[1]}/#{enrollment_date[0]}",
          address: batch[3],
          phones: batch[4].split(","),
          web: batch[5],
          email: batch[6],
          agents: [batch[7], batch[8], batch[9]].compact
        )
        print "."
      else
        print "x"
      end
      puts " "
    end
  end
  
end
