module transaction

using JSON

export Transaction

struct Transaction
    from::Int32
    to::Int32
    value::Float64
end

Transaction(; from, to, value) = Transaction(from, to, value)

Base.show(io::IO, t::Transaction) = print(io, JSON.json(t))

end