module Income

using Pkg: TOML

export Earning, Salary, Schedule, extract, transform

"""
    Earning

Represents supertype of earnings received such as wages, salaries, 
profits, interest payments, rents, etcetera.
"""
abstract type Earning end

"""
    Schedule

Represents the enumerated type describing payment schedules.
"""
@enum Schedule weekly = 1 biweekly = 2 monthly = 3

"""
"""
struct Salary <: Earning
    gross::Float64
    schedule::Schedule
end

"Parses the given TOML file `file` and serializes it to a `Budget` composite type."
extract(file::AbstractString) = TOML.parsefile(file)

"Transforms the given dictionary `earnings` into a vector of `Earning` subtypes."
function transform(earnings::Dict{String,Any})
    
    # Transform and collect
    if haskey(earnings, "income") # && typeof(earnings["income"] == Array{Dict{String,Any},1})
        
        # Declare a variable that contains the collection of dictionaries
        income::Array{Dict{String,Any},1} = earnings["income"]

        # Construct and assign an uninitialized `Vector{fin.Income.Earning}`
        _earnings = Vector{Earning}[]
        @info _earnings

        # Extract values from key, construct new instances of `Earning` subtypes, and add to collection
        for i in income
            gross::Float64 = i["gross"]
            schedule::Schedule = Schedule(i["schedule"])
            s = Salary(gross, schedule)
            @info s
            # push!(_earnings, s)
        end
    end
end


# """
# """
# function fedtaxbrac(grossinc::Float64)::Int
#     @match grossinc begin
#         0:9700 => 1
#         9700:39475 => 2
#         39476:84200 => 3
        
#     end
#     # tax = 0.00
#     # nontaxed = grossinc
#     bracket = 1

#     if (grossinc > 9700.00)
        
#     else
#         return grossinc * 0.1 
#     end

#     if (grossinc )

#     # if/else construct? pattern matching? 
#     end

#     """
# """
#     function statetax(grossinc::Float64)::Float64
#     end

#     """
# """
#     function totaltax(grossinc::Float64)::Float64
#     end

#     """
# """
#     monthly(grossinc::Float64) = grossinc / 12

#     """
# """
#     netmonthly(netinc::Float64) = netinc / 12
# end

end # module