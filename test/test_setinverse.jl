# This file is a part of InverseFunctions.jl, licensed under the MIT License (MIT).

using Test
using InverseFunctions


@testset "setinverse" begin
    @test @inferred(setinverse(sin, asin)) === InverseFunctions.FunctionWithInverse(sin, asin)
    @test @inferred(setinverse(sin, setinverse(asin, sqrt))) === InverseFunctions.FunctionWithInverse(sin, asin)
    @test @inferred(setinverse(setinverse(sin, sqrt), asin)) === InverseFunctions.FunctionWithInverse(sin, asin)
    @test @inferred(setinverse(setinverse(sin, asin), setinverse(asin, sqrt))) === InverseFunctions.FunctionWithInverse(sin, asin)

    InverseFunctions.test_inverse(setinverse(sin, asin), π/4)
    InverseFunctions.test_inverse(setinverse(asin, sin), 0.5)
end
