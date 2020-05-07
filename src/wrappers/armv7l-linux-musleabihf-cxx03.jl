# Autogenerated wrapper script for SPIRV_Cross_jll for armv7l-linux-musleabihf-cxx03
export libspirv_cross, spirv_cross

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libspirv_cross`
const libspirv_cross_splitpath = ["lib", "libspirv-cross-c-shared.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libspirv_cross_path = ""

# libspirv_cross-specific global declaration
# This will be filled out by __init__()
libspirv_cross_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libspirv_cross = "libspirv-cross-c-shared.so.0"


# Relative path to `spirv_cross`
const spirv_cross_splitpath = ["bin", "spirv-cross"]

# This will be filled out by __init__() for all products, as it must be done at runtime
spirv_cross_path = ""

# spirv_cross-specific global declaration
function spirv_cross(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(spirv_cross_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"SPIRV_Cross")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libspirv_cross_path = normpath(joinpath(artifact_dir, libspirv_cross_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libspirv_cross_handle = dlopen(libspirv_cross_path)
    push!(LIBPATH_list, dirname(libspirv_cross_path))

    global spirv_cross_path = normpath(joinpath(artifact_dir, spirv_cross_splitpath...))

    push!(PATH_list, dirname(spirv_cross_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

