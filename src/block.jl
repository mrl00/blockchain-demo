module block

export Block

using Dates, SHA, JSON

struct Block
    index::UInt32
    data::String
    timestamp::DateTime
    previous_hash::String
    hash::String
end

Block(index=0x1, data="genesis", previous_hash=gen_hash("genesis"); timestamp=Dates.now()) =
    Block(index,
        data,
        timestamp,
        previous_hash,
        gen_hash(string(index, data, timestamp, previous_hash)))


Base.show(io::IO, block::Block) = print(io, JSON.json(block))

gen_hash(data::String) = bytes2hex(sha256(data))

end