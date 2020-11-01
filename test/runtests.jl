using LazyUtils
using Test
using Pkg

@testset "LazyUtils" begin
    @testset "PkgUtils" begin
        environment = joinpath(Pkg.envdir(), "v$(VERSION.major).$(VERSION.minor)")
        projectfile = joinpath(environment, "Project.toml")
        environments = get_environments();
        projectfiles = get_projectfiles();
        @test any(occursin.(environment, environments))
        @test any(occursin.(projectfile, projectfiles))
    end
end
