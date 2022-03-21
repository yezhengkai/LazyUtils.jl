using LazyUtils
using Documenter

DocMeta.setdocmeta!(LazyUtils, :DocTestSetup, :(using LazyUtils); recursive=true)

makedocs(;
    modules=[LazyUtils],
    authors="Zheng-Kai Ye <supon3060@gmail.com> and contributors",
    repo="https://github.com/yezhengkai/LazyUtils.jl/blob/{commit}{path}#{line}",
    sitename="LazyUtils.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://yezhengkai.github.io/LazyUtils.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/yezhengkai/LazyUtils.jl",
    devbranch="main",
)
