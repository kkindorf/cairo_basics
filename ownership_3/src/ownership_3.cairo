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
    A { dict: Default::default() };
    let mut dictionaryInserts: Felt252Dict<u64> = Default::default();
    dictionaryInserts.insert('foo', 100);
    dictionaryInserts.insert('bar', 200);
    dictionaryInserts.insert('bar', 300);

    // bar key returns 300 since the the dictionary for type A has been squashed by the compiler
    dictionaryInserts.get('bar').print()
}