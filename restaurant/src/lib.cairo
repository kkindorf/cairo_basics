// front of house modules and functions for a restaurant
// modules can be nested within each other as necessary for easier reading

mod front_of_house {
    mod hosting {
        fn add_to_waitlist() {}

        fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}
        fn serve_order() {}
        fn take_payment() {}
    }
}

fn eat_at_restaurant() {
    // absolute path for module traversing
   restaurant::front_of_house::hosting::add_to_waitlist(); 

   //relative path
   front_of_house::hosting::add_to_waitlist();
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

fn main(){}