#####
##### constructors
#####

ChainRules.@non_differentiable (::Type{T} where {T<:SArray})(::UndefInitializer, args...)

function frule((_, ẋ), ::Type{T}, x::AbstractArray) where {T<:SArray}
    return T(x), T(ẋ)
end

function rrule(::Type{T}, x::AbstractArray) where {T<:SArray}
    project_x = ProjectTo(x)
    Array_pullback(ȳ) = (NoTangent(), project_x(ȳ))
    return T(x), Array_pullback
end