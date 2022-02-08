# Autogenerated wrapper script for SPIRV_Cross_jll for armv6l-linux-musleabihf-cxx11
export libspirv_cross, spirv_cross

JLLWrappers.@generate_wrapper_header("SPIRV_Cross")
JLLWrappers.@declare_library_product(libspirv_cross, "libspirv-cross-c-shared.so.0")
JLLWrappers.@declare_executable_product(spirv_cross)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libspirv_cross,
        "lib/libspirv-cross-c-shared.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        spirv_cross,
        "bin/spirv-cross",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
