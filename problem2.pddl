(define (problem Problem2)
    (:domain Cooking)
    (:objects
        Cooker - human
        kitchen living_room - room
        l1 l2 l3 l4 - location
        eggs potato carrot - product1
        cucumbers green_peas sausage mayonnaise sour_cream - product2
        Fridge_open Fridge_close - switcher
        plate pot - tableware
        kettle1 - kettle

    )
    
    (:init
        (in l1 kitchen)
        (in l2 kitchen)
        (in l3 kitchen)
        (in l4 living_room)
        (at Cooker l1)
        (at kettle1 l4)
    )
    
    (:goal
        (and (tea))
    )
)