use debug::PrintTrait;
// convert snapshot back into a regular value using desnap operator *

// using * generates a new variable for the current value

// which means ownership of the original value is not transferred 

#[derive(Copy, Drop)]
struct Rectangle {
    height: u64,
    width: u64
}

fn main() {
    let rec = Rectangle 
    { height: 3, width: 10 };
    let area = calculate_area(@rec);
    area.print();
}

fn calculate_area(rec: @Rectangle) -> u64 {
    *rec.height * *rec.width
}