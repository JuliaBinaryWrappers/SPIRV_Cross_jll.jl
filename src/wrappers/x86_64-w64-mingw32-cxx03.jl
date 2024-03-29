# Autogenerated wrapper script for SPIRV_Cross_jll for x86_64-w64-mingw32-cxx03
export libspirv_cross, spirv_cross

JLLWrappers.@generate_wrapper_header("SPIRV_Cross")
JLLWrappers.@declare_library_product(libspirv_cross, "libspirv-cross-c-shared.dll")
JLLWrappers.@declare_executable_product(spirv_cross)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libspirv_cross,
        "bin\\libspirv-cross-c-shared.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        spirv_cross,
        "bin\\spirv-cross.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
