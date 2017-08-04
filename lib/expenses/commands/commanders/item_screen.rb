require 'expenses/commands/commanders/screen'

module Expenses
  class ItemScreen < InspectScreen
    HELP = {
      quantity: "Press <red.bold>x/X</red.bold> to increase/decrease quantity or press <red.bold>e</red.bold> to edit.",
      unit_price: "Press <red.bold>e</red.bold> to edit.",
      unit: "Press <red.bold>e</red.bold> to edit.",
      desc: "Press <red.bold>e</red.bold> to edit.",
      total: "Press <red.bold>e</red.bold> to edit.",
      note: "Press <red.bold>n</red.bold> to edit.",
      tag: "Press <red.bold>#</red.bold> to set.",
      vale_la_pena: "Press <red.bold>v</red.bold>/<red.bold>V</red.bold> to cycle between values."
    }

    # We don't know the fee yet, that's what review is for.
    HIDDEN_ATTRIBUTES = []

    ATTRIBUTES_WITH_GUESSED_DEFAULTS = []
    EMPTY_ATTRIBUTES = []

    def initialize(item)
      @item = item
    end

    def run(commander, commander_window)
      super(commander, commander_window, 'Item') do
        @item.data
      end
    end
  end
end
