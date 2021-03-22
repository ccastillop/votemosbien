module PartyHelper
  def logo(party, size: [64, 64] )
    image_tag(party.logo.variant(resize_and_pad: size )) if party.logo.variable?
  end
end