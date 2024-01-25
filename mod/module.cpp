// Copyright  malassenet@gmail.com my_module

export module my_module;
// Rem: Put a lot of stuff in the primary module no need to split
// Rem: we could have an implementation cpp file(s) that will only
// `module my_module`

// No implicit namespace, should probably add it here

// functions
export char const *my_function() { return "Hello Mods!"; }
//
// Beware cannot export static
// export static void no_internal_linkage();

// types
export class SomeType;

// templates
export template <typename T> T combine(T n1, T n2);

export template <typename T> class MyTemplatedType;

// namespace
export namespace a {
void is_exported();
}

// Should work but not able to compile with
// `g++ -fmodule-ts main.cpp mod/module.cpp`
// namespace a {
// void is_NOT_exported();
// void will_be_exported_in_b();
// } // namespace a
//
// // Rexport
// export namespace b {
// using a::will_be_exported_in_b();
// }

// Group export
export {
  void will_be_group_exported();
  void another_will_be_group_exported();
  struct GrouExportedStruct {};
}
