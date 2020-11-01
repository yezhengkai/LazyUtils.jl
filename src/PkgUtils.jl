module PkgUtils

using Pkg
using TOML

export 
    get_environments,
    get_projectfiles


# inspired from Pkg.jl/src/Pkg.jl
pkgdir(depot = Pkg.depots1()) = joinpath(depot, "packages")
const MANIFEST_USAGE = joinpath(Pkg.logdir(), "manifest_usage.toml")

function get_environments()::Array{String, 1}
    _mani = TOML.parsefile(MANIFEST_USAGE)
    _mani = collect(keys(_mani))
    mask = .~occursin.(pkgdir(), _mani) .& .~occursin.(tempdir(), _mani)
    return dirname.(_mani[mask])
end


# Rewrite from DrWatson.jl/src/project_setup.jl
function findprojectfile(dir::AbstractString = pwd())
    # look for project file in current dir and parents
    home = homedir()
    while true
        # Base.project_names return ("JuliaProject.toml", "Project.toml")
        for proj in Base.project_names
            file = joinpath(dir, proj)
            Base.isfile_casesensitive(file) && return file  # return file instead of dir
        end
        # bail at home directory
        dir == home && break
        # bail at root directory
        old, dir = dir, dirname(dir)
        dir == old && break
    end
    @warn "Could not find find a project file by recursively checking "*
    "given `path` and its parents. Returning `nothing` instead."
    return nothing
end

function get_projectfiles()::Array{Union{Nothing, String}, 1}
    envpath = get_environments()
    return findprojectfile.(envpath)
end

end