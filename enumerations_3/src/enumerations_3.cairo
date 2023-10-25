use debug::PrintTrait;
//matches are exhaustive
// which means the enumeration you create needs to have every value accounted for in the match
// Options need to account for the some and none states in a match
fn plus_one(x: Option<u8>) -> Option<u8> {
    match x {
        Option::Some(val) => Option::Some(val+1),
        Option::None => Option::None

    }
}

fn main() {
    let five: Option<u8> = Option::Some(5);
    let six: Option<u8> = plus_one(five);
    six.unwrap().print();
    let none = plus_one(Option::None);
    none.unwrap().print();
}