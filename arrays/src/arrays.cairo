use array::ArrayTrait;
use debug::PrintTrait;

fn main() {
    let mut a = ArrayTrait::new();
    a.append(0);
    a.append(1);
    a.append(2);

    let first_value = a.pop_front().unwrap();
    first_value.print();

   
        let mut arr = ArrayTrait::new();
        arr.append(1);
        arr.append(2);
        let first = *arr.at(0);
        let second = *arr.at(0 + 1);
        first.print();
        second.print();

        let mut b = ArrayTrait::new();
        b.append(100);
        let index_to_access = 0;
        match b.get(index_to_access) {
            Option::Some(x) => {
                let val = *x.unbox();
                val.print();
            },
            Option::None(_) => {
                let mut data = ArrayTrait::new();
                data.append('out of bounds');
                panic(data);
            }
        }

        b.len().print();
        arr.len().print();
        let a = ArrayTrait::<u32>::new();
        a.is_empty().print();


  

}