use debug::PrintTrait;
fn main() {
    let num = 3;
    if num == 5 {
        'condition was true'.print();
    }
    else if  num == 3 {
        'number is 3'.print();
    }
    else {
        'condition was false'.print();
    }
}