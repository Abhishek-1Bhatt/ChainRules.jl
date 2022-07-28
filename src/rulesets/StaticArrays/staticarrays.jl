#####
##### constructors
#####

ChainRules.@non_differentiable (::Type{T} where {T<:Union{SArray, SizedArray}})(::UndefInitializer, args...)

function frule((_, ẋ), ::Type{T}, x::AbstractArray) where {T<:Union{SArray, SizedArray}}
    return SArray(x), SArray(ẋ)
end

function rrule(::Type{T}, x::AbstractArray) where {T<:Union{SArray, SizedArray}}
    project_x = ProjectTo(x)
    Array_pullback(ȳ) = (NoTangent(), project_x(ȳ))
    return SArray(x), Array_pullback
end