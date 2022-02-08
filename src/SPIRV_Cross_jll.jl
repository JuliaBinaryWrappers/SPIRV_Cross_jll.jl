# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule SPIRV_Cross_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("SPIRV_Cross")
JLLWrappers.@generate_main_file("SPIRV_Cross", UUID("b5475fc2-85c9-5de8-8430-71c9b732ec36"))
end  # module SPIRV_Cross_jll
