module LazyUtils

export get_environments,
    get_projectfiles,
    get_pkg_version,
    ndgrid,
    meshgrid

include("PkgUtils.jl")
include("ArrayUtils.jl")
using .PkgUtils
using .ArrayUtils

end
