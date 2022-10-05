(define (domain Cooking)
    (:requirements [:strips] [:adl])
    (:types
        object place - type
        human foodBasket product1 product2 switcher tableware kettle fruit - object 
        room location - place
    )
     
    (:predicates
        (at ?x - object ?loc - location)
        (in ?loc - location ?r - room)
        (FridgeClose ?s - switcher)
        (FOpen)
        (half-readiness1)
        (half-readiness2)
        (have ?p  - product1)
        (hot ?pr  - product2)
        (Ready1)
        (the_dish_is_ready)
        (run ?k - kettle)
        (tea)
        (tr ?f - fruit)
        (take)
        (attributed)

    )    
    
    (:action Go
        :parameters(?x - location ?y - location ?r - room)
        :precondition(and (at Cooker ?x) (not (= ?x ?y)) (in ?x ?r) (in ?y ?r)) 
        :effect(and (not(at Cooker ?x)) (at Cooker ?y))
    )
    
    (:action OpenFridge
        :parameters(?s - switcher ?x - location)
        :precondition(and (at Cooker ?x) (not(FOpen)) (at ?s ?x)) 
        :effect(and (FOpen)(not(FridgeClose ?s)))
    )
    
    (:action CloseFridge
        :parameters(?s - switcher ?x - location)
        :precondition(and (at Cooker ?x) (FOpen) (at ?s ?x))
        :effect(and (FridgeClose ?s) (not(FOpen)))
    )
    
    (:action Delivery1
        :parameters(?p - product1 ?x - location ?y  - location)
        :precondition(and (at Cooker ?x) (at pot ?y) (at ?p ?x) (not (= ?x ?y)) (FOpen))
        :effect(and (not(at Cooker ?x)) (at Cooker ?y) (not(at ?p ?x)) (at ?p ?y))
    )
    
    (:action FoodPreparation
        :parameters(?x  - location ?y  - location)
        :precondition(and (at Cooker ?x) (at pot ?x) (at carrot ?x) (at potato ?x) (at eggs ?x) (at plate ?y))
        :effect(and (not(at Cooker ?x)) (at Cooker ?y) (not(at carrot ?x)) (at carrot ?y) (not(at potato ?x)) 
                        (at potato ?y) (not(at eggs ?y)) (at eggs ?y) (half-readiness1))
    )
    
    (:action Ready
        :parameters(?x  - location)
        :precondition(and (half-readiness1) (at Cooker ?x) (at carrot ?x) (at potato ?x) (at eggs ?x) (at plate ?x))
        :effect(and (Ready1) (not(FOpen)))
    )
    
    (:action Delivery2
        :parameters(?pr - product2 ?x  - location ?y  - location)
        :precondition(and (at Cooker ?x) (at ?pr ?x) (at plate ?y) (not (= ?x ?y)) (Ready1) (FOpen))
        :effect(and (not(at Cooker ?x)) (at Cooker ?y) (not(at ?pr ?x)) (at ?pr ?y))
    )
    
    (:action Ready_
        :parameters(?x  - location)
        :precondition(and (half-readiness1) (at Cooker ?x) (at cucumbers ?x) (at green_peas ?x) (at sausage ?x) 
                                (at mayonnaise ?x) (at sour_cream ?x) (at plate ?x))
        :effect(and (half-readiness2))
    )

    (:action Cooking
        :parameters(?x  - location)
        :precondition(and (at Cooker ?x) (at plate ?x) (half-readiness1) (Ready1) (half-readiness2))
        :effect(and (the_dish_is_ready))
    )
    
    (:action Tea
        :parameters(?x  - location ?y  - location ?k - kettle)
        :precondition(and (at Cooker ?x) (at ?k ?y))
        :effect(and (tea) (at Cooker ?y) (not(at Cooker ?x)))
    )
    
    (:action Take
        :parameters(?x  - location ?y  - location ?f - fruit ?s - switcher)
        :precondition(and (at Cooker ?x) (at ?f ?y) (FOpen) (at ?s ?y))
        :effect(and (take) (at Cooker ?y) (not(at Cooker ?x)))
    )
    
    (:action Attributed
        :parameters(?x  - location ?y  - location ?f - fruit)
        :precondition(and (take) (at Cooker ?x) (at ?f ?x) (at Child ?y))
        :effect(and (attributed) (not(at Cooker ?x)) (at Cooker ?y) (at ?f ?y))
    )
    
    
    )