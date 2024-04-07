module main

include("blockchain.jl")

using .blockchain, JSON

bc = BlockChain()
t = Transaction(from=1, to=2, value=0.34)

add_block(bc, repr(t))

println(bc)

end