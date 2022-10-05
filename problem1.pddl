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
        (at Fridge_open l2)
        (at Fridge_close l2)
        (at potato l2)
        (at carrot l2)
        (at eggs l2)
        (at cucumbers l2)
        (at green_peas l2)
        (at sausage l2)
        (at mayonnaise l2)
        (at sour_cream l2)
        (at plate l1)
        (at pot l3)
        
    )
    
    (:goal
        (and (the_dish_is_ready))
    )
)