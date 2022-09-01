using KanekoExperimentsCesar
using Documenter

DocMeta.setdocmeta!(KanekoExperimentsCesar, :DocTestSetup, :(using KanekoExperimentsCesar); recursive=true)

makedocs(;
    modules=[KanekoExperimentsCesar],
    authors="Isaia Nisoli nisoli@im.ufrj.br and contributors",
    repo="https://github.com/orkolorko/KanekoExperimentsCesar.jl/blob/{commit}{path}#{line}",
    sitename="KanekoExperimentsCesar.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://orkolorko.github.io/KanekoExperimentsCesar.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/orkolorko/KanekoExperimentsCesar.jl",
    devbranch="main",
)
