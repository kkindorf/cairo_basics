// use keyword allows you to create shortcuts to a path

mod front_of_house;

//hosting is a valid name within the scope of the module where it is declared using the use keyword
mod customer {
    use restaurant_2::front_of_house::hosting;
    fn eat_at_restaurant() {
    // use hosting to access its functions
    hosting::add_to_waitlist();
    }
}


fn deliver_order() {}

mod back_of_house {
    fn fix_incorrect_order() {
        cook_order();
        //use super to allow the current module access to functions declared in its parent scope
        super::deliver_order();
    }
    fn cook_order() {}
}

fn main() {}