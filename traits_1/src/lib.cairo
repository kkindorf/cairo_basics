// traits specify functionality blueprints that can be implemented
// the blueprint contains a set of function signatures containing type annotations

use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64
}

#[derive(Copy, Drop)]
struct Circle {
    radius: u64
}

// trait ShapeGeometry<T> {
//     fn boundary(self: Rectangle) -> u64;
//     fn area(self: Rectangle) -> u64;
// }

// a trait can be implemented using the impl keyword with the name of your implementation followed bt the of keyword

// you can write implementations directly without defining the corresponding trait. this is possible with the #[generate_trait] attribute on the implementation. this attribute tells the compiler to generate the trait for the declared implementation without us needing to define the trait ourselves

#[generate_trait]
impl RectangleGeometry of RectangleGeometryTrait {
    fn boundary(self: Rectangle) -> u64 {
        2 * (self.height + self.width)
    }
    fn area(self: Rectangle) -> u64 {
        self.height * self.width
    }
 }

fn main() {
    let rect = Rectangle { width: 20, height: 10 };
    let area1 = rect.area();
    area1.print(); // 200

    // rect.area() can also be written like this...
    let area2 = RectangleGeometry::area(rect);
    area2.print(); // 200

    

}