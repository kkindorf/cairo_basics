use debug::PrintTrait;
fn main() {
    let mut i: felt252 = 0;
    
    let result = loop {
        if i == 10 {
            break i * 2;
        }
        i += 1;
    };

    'the result is '.print();
    result.print();
}