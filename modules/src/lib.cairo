use garden::vegetables::Asparagus;
use debug::PrintTrait;

mod garden;

fn main() {
    let Asparagus = Asparagus{color: 'green', tasty: true};
   let color = Asparagus.color;
   let tasty = Asparagus.tasty;
   color.print();
   if tasty  {
        'asparagus tastes good'.print();
   }
   else {
    'Asparagus is gross'.print(); 
   }
}
