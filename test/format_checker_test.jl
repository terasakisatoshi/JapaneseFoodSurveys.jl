@testitem "checker.jl" begin
    using Test
    using TOML
    using JapaneseFoodSurveys
    using JapaneseFoodSurveys: DataFormatError
    using JapaneseFoodSurveys: checktomlformat
    @testset "checktomlformat" begin
        valid_yakiniku = "references/poll/valid_yakiniku/Data.toml"
        toml = TOML.parsefile(valid_yakiniku)
        toml["favorite_food"] == "焼肉"
        @test checktomlformat(valid_yakiniku)
    end
    @testset "checktomlformat Exception" begin
        invalid_tomlfile1 = "references/poll/invalid1/Data.toml"
        @test_throws "JapaneseFoodSurveys.DataFormatError(\"Invalid value=Sushi found.\")" checktomlformat(
            invalid_tomlfile1,
        )

        invalid_tomlfile2 = "references/poll/invalid2/Data.toml"
        @test_throws TOML.ParserError checktomlformat(invalid_tomlfile2)
        @test_throws ["error: key already has a value", "favorite_food = \"Goma\""] checktomlformat(
            invalid_tomlfile2,
        )

        invalid_tomlfile3 = "references/poll/invalid3/Data.toml"
        @test_throws JapaneseFoodSurveys.DataFormatError("Unexpected key(s) Set([\"favorite_food\", \"unexpectedkey\"])") checktomlformat(
            invalid_tomlfile3,
        )
    end
end
