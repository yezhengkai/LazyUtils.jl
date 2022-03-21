using LazyUtils
using Test
using Pkg

@testset "LazyUtils" begin
    @testset "PkgUtils" begin
        environment = joinpath(Pkg.envdir(), "v$(VERSION.major).$(VERSION.minor)")
        projectfile = joinpath(environment, "Project.toml")
        environments = get_environments()
        projectfiles = get_projectfiles()
        @test any(occursin.(environment, environments)) || environments === nothing
        @test any(occursin.(projectfile, projectfiles)) || projectfiles === nothing
        @test get_pkg_version("Test") === nothing
        @test Int(get_pkg_version("LazyUtils").major) == 0
    end

    @testset "ArrayUtils" begin
        v1 = [1:2]
        v2 = [2:4]
        @test ndgrid(v1) == v1
    end
end
