module LazyUtils

export
    # reexport
    get_environments,
    get_projectfiles,
    get_pkg_version

include("PkgUtils.jl")
using .PkgUtils

end
