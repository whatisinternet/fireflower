/*
 * There are a number of concepts that I'm going to give overviews for but for in depth information
 * I would strongly recommend reading the Rust book. It's great, and free!
 *
 * The book can be found here: https://doc.rust-lang.org/book/
 */

#![deny(warnings, unused_variables, unsafe_code, unused_extern_crates)]

#[allow(unused_variables)]
#[macro_use] extern crate ruru;

extern crate inflector;
use inflector::Inflector;

use ruru::{Class, Object, RString};

methods!(
    RString,
    _itself,

    fn to_snake_case(test: RString) -> RString {
        RString::new(&test.unwrap_or(RString::new("")).to_string().to_snake_case())
    }

    // fn to_camel_case(test: RString) -> RString {
    // }
);

#[no_mangle]
pub extern "C" fn init_fireflower() {
    Class::from_existing("Case").define(|itself| {
        itself.def("_to_snake_case", to_snake_case);
        // itself.def("_to_camel_case", to_camel_case);
    });
}
