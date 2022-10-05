(define (problem Problem1)
    (:domain Cooking)
    (:objects
        Cooker Child - human
        kitchen living_room - room
        l1 l2 l3 l4 l5 - location
        eggs potato carrot - product1
        cucumbers green_peas sausage mayonnaise sour_cream - product2
        orange apple - fruit
        Fridge_open Fridge_close - switcher
        plate pot - tableware
        kettle1 - kettle

    )
    
    (:init
        (in l1 kitchen)
        (in l2 kitchen)
        (in l3 kitchen)
        (in l4 kitchen)
        (in l5 living_room)
        (at Cooker l1)
        (at Child l5)
        (at Fridge_open l2)
        (at Fridge_close l2)
        (at kettle1 l4)
        (at apple l2)
        (at orange l2)
        
    )
    
    (:goal
        (and (attributed))
    )
)