use dict::Felt252DictTrait;
use nullable::{nullable_from_box, match_nullable, FromNullableResult};


fn main() {
    let mut d: Felt252Dict<Nullable<Span<felt252>>> = Default::default();
    let mut a = ArrayTrait::new();
    a.append(9);
    a.append(10);
    a.append(11);

    d.insert(0, nullable_from_box(BoxTrait::new(a.span())));

    let val = d.get(0);
    let span = match match_nullable(val) {
        FromNullableResult::Null(()) => panic_with_felt252('no value found'),
        FromNullableResult::NotNull(val) => val.unbox(),

    };
    assert(*span.at(0) == 9, 'Expecting 9');
    assert(*span.at(1) == 10, 'Expecting 10');
    assert(*span.at(2) == 12, 'expecting 12');

}