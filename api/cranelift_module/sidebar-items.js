initSidebarItems({"constant":[["VERSION","Version number of this crate."]],"enum":[["FuncOrDataId","A declared name may refer to either a function or data declaration"],["Init","This specifies how data is to be initialized."],["Linkage","Linkage refers to where an entity is defined and who can see it."],["ModuleError","Error messages for all `Module` methods"]],"fn":[["default_libcall_names","Default names for `ir::LibCall`s. A function by this name is imported into the object as part of the translation of a `ir::ExternalName::LibCall` variant."]],"struct":[["DataContext","This is to data objects what cranelift_codegen::Context is to functions."],["DataDescription","A description of a data object."],["DataId","A data object identifier for use in the `Module` interface."],["FuncId","A function identifier for use in the `Module` interface."],["ModuleCompiledFunction","Information about the compiled function."],["ModuleDeclarations","This provides a view to the state of a module which allows `ir::ExternalName`s to be translated into `FunctionDeclaration`s and `DataDeclaration`s."],["RelocRecord","A record of a relocation to perform."],["TrapSite","Record of the arguments cranelift passes to `TrapSink::trap`."]],"trait":[["Module","A `Module` is a utility for collecting functions and data objects, and linking them together."]],"type":[["ModuleResult","A convenient alias for a `Result` that uses `ModuleError` as the error type."]]});