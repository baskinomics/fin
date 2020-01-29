module Statement

import CSV
import DataFrames
import Dates
import Match

using CSV
using DataFrames
using Dates
using Match

export extract, transform

"""
Creates a sanitized CSV file from the dirty Bank of America transaction
statement located at `path`.
"""
function extract(path::String)
    if isdir(path)
        throw(ArgumentError) # todo Implement own error type
    end

    # Read the file and extract the lines
    input = open(path)
    lines = readlines(input)

    # Extract the header and transactions
    sanitized = lines[7:7]
    transactions = lines[9:end]
    append!(sanitized, transactions)

    # note just read into df and return?
    # todo add unique id to filename
    io = open(joinpath(dirname(path), "clean-statement.csv"), "w+")
    for line in sanitized
        println(io, line)
    end;
    close(io)
end

"""
"""
function transform(path::String)
    df::DataFrame = CSV.read(path)
    DataFrames.rename!(df, :Date => :date)
    DataFrames.rename!(df, :Description => :description)
    DataFrames.rename!(df, :Amount => :amount)
    DataFrames.rename!(df, Symbol("Running Bal.") => :balance)
    DataFrames.insertcols!(df, 5, category = DataFrames.missings(size(df)[1])) # s = size(df)[1]
    return df
end

"""
"""
function write(directory::String, filename::String, df::DataFrame)
    CSV.write(joinpath(dirname(directory), string(filename, ".csv"), df))
end

# todo Needs work on implementation
# function categorize!(df::DataFrames.DataFrame)
#     c = String[]
#     for row in eachrow(df)
#         println(row)
#         println("Please enter a category:")
#         i = readline(stdin)
#         push!(c, i)
#     end
#     DataFrames.insertcols!(df, 5, category = c)
# end

"""
    read(path)

Reads a transformed statement.
"""
function read(path::String)
# Read into dataframe
# Return statement type
end

# todo categorize transaction function
struct Category
# todo
end

"""
Contains choice summary statistics for various budget metrics.
"""
struct Summary
    in::Float64
    exp::Float64
    meanexp::Float64
    std
    begindt
    enddt
end

end
