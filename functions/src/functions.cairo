use debug::PrintTrait;

fn another_function(x: felt252, y: felt252) {
    x.print();
    y.print();
}

fn main() {
    another_function('foo', 'bar');
}