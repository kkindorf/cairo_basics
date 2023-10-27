
// generic traits. we usually want to use traits when we want multiple types to implement a functionality in a standard way. to do this, we use generic types when defining traits


use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Rectangle {
    height: u64,
    width: u64
}

#[derive(Copy, Drop)]
struct Circle {
    radius: u64
}

// T is used as an alias type which is provided during implementation
trait ShapeGeometry<T> {
    fn boundary(self: T) -> u64;
    fn area(self: T) -> u64;
}

impl RectangleGeometry of ShapeGeometry<Rectangle> {
    fn boundary(self: Rectangle) -> u64 {
        2 * (self.height + self.width)
    }
    fn area(self: Rectangle) -> u64 {
        self.height * self.width
    }
}

impl CircleGeometry of ShapeGeometry<Circle> {
    fn boundary(self: Circle) -> u64 {
        (2 * 314 * self.radius) / 100
    }
    fn area(self: Circle) -> u64 {
        (314 * self.radius * self.radius) / 100
    }
}



fn main() {
    let rect = Rectangle { height: 5, width: 7 };
    rect.area().print();
    rect.boundary().print();
    let circ = Circle { radius: 5 };
    circ.area().print();
    circ.boundary().print();

}
