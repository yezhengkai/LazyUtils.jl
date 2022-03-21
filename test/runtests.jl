using LazyUtils
using Test
using Pkg

@testset "LazyUtils" begin
    @testset "PkgUtils" begin
        environment = only([x for x in values(Pkg.dependencies()) if x.name == "LazyUtils"]).source
        projectfile = joinpath(environment, "Project.toml")
        environments = get_environments()
        projectfiles = get_projectfiles()
        @test any(occursin.(environment, environments))
        @test any(occursin.(projectfile, projectfiles))
        @test get_pkg_version("Test") === nothing
        @test Int(get_pkg_version("LazyUtils").major) == 0
    end

    @testset "ArrayUtils" begin
        v1 = [1:2]
        v2 = [2:4]
        @test ndgrid(v1) == v1
    end
end
