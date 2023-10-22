use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64
}

// the print trait needs to be implemented
// for our Rectangle type
// if we want to do something like rectangle.print() we need to implement Cairo's print trait for the Rectangle type
impl RectanglePrintImpl of PrintTrait<Rectangle> {
    fn print(self: Rectangle) {
        self.width.print();
        self.height.print();
    }
}

fn main() {
    let mut rectangle = Rectangle { width: 30, height: 10 };
    let area = area(rectangle);
    area.print(); // 300
    rectangle.print();
    // width prints
    // height prints

}

fn area(rectangle: Rectangle) -> u64 {
    rectangle.width * rectangle.height
}