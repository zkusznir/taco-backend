# frozen_string_literal: true

class OfferRepresenter
  class << self

    # TODO: Hardcoded for now
    def for(group)
      {
        id: group.id,
        offer: {
          name: "Oferta rodzina",
          details: "Wybrana specjalnie dla Ciebi",
          rrso_percentage: 6,
          dynamic_interest_percentage: 0,
        }
      }
    end
  end
end
