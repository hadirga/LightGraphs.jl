@testset "Random Vertex Cover" begin
  
    g3 = StarGraph(5)
    for g in testgraphs(g3)
        c = @inferred(vertex_cover(g, RandomVertexCover()))
        @test (length(c)== 2 && (c[1] == 1 || c[2] == 1))
    end

    g4 = CompleteGraph(5)
    for g in testgraphs(g4)
        c = @inferred(vertex_cover(g, RandomVertexCover()))
        @test length(c)== 4 #All except one vertex 
    end
    
    g5 = PathGraph(5)
    for g in testgraphs(g5)
        c = @inferred(vertex_cover(g, RandomVertexCover()))
        sort!(c)
        @test (c == [1, 2, 3, 4] || c == [1, 2, 4, 5] || c == [2, 3, 4, 5])
    end
end
