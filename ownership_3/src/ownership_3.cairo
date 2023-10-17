// the destruct trait

// allows values to be squashed once they go out of scope
// squash is when multiple values are added to a type that has the multiple inserts of the same key
// destruct forces the cairo compiler to only use the last entry of a key in the type
// the destruct trait calls the squash function under the hood

use debug::PrintTrait;

#[derive(Destruct)]
struct A {
    dict: Felt252Dict<u128>
}

fn main() {
    let mut dictionaryTypeA = A { dict: Default::default() };

    dictionaryTypeA.dict.insert('foo', 100);
    dictionaryTypeA.dict.insert('bar', 200);
    dictionaryTypeA.dict.insert('bar', 300);

    // bar key returns 300 since the the dictionary for type A has been squashed by the compiler
    dictionaryTypeA.dict.get('bar').print()
}