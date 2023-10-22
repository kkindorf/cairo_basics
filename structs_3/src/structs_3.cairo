// methods can be set to structures
// methods always use self as the first parameter which represents the instance of the type the method is called from 


use debug::PrintTrait;
#[derive(Copy, Drop)]
struct Rectangle {
    width: u64, 
    height: u64
}

// trait block is a signature of the method we want to implement
// traits are not linked to a specific type, the self paramater determines which type the trait is used with
trait RectangleTrait {
    fn area(self: @Rectangle) -> u64;
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;
}

// impl block defines the behavior of the methods being implemented
impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        (*self.width) * (*self.height)
    }

    // can_hold takes in 2 rectangle instances, and if self height and self width is larger than other, return true
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50 };
    let rect2 = Rectangle { width: 10, height: 40 };
    let rect3 = Rectangle { width: 60, height: 20 };
    rect1.area().print();
    rect1.can_hold(@rect2).print(); // true
    rect1.can_hold(@rect3).print() // false
}