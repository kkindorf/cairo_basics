use debug::PrintTrait;

//mutable references are mutable values 
// of the original. passing mutable values returns the ownership to the caller
// refs allow you to mutate the original value passed
// and keep ownership of the mutated value

#[derive(Copy, Drop)]
struct Rectangle {
    height: u64,
    width: u64
}

fn main() {
    // we must make rec mutable with mut before using ref
    let mut rec = Rectangle { height: 3, width: 10 };
    flip(ref rec);
    rec.height.print();
    rec.width.print();
}

fn flip(ref rec: Rectangle) {
    let temp = rec.height;
    rec.height = rec.width;
    rec.width = temp;
}