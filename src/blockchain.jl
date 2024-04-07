module blockchain

include("block.jl")
include("transaction.jl")

using .block, .transaction, JSON, Dates

export BlockChain, add_block, Transaction

mutable struct BlockChain
    blocks::Vector{Block}
    next_index::UInt32
end

BlockChain(; blocks=Vector{Block}([Block()]), next_index=2) =
    BlockChain(blocks, next_index)

function add_block(bc::BlockChain, data::String)
    block = Block(bc.next_index, data, bc.blocks[end].hash)
    bc.next_index += 1
    push!(bc.blocks, block)
end

Base.show(io::IO, bc::BlockChain) = print(io, JSON.json(bc))

end # module blockchain
