/// Dto converter interface
abstract base class DtoConverter<TResult, TDto> {
  /// @nodoc
  const DtoConverter();

  /// Convert Dto.
  TResult convert(TDto dto);

  /// Convert Dto's list
  Iterable<TResult> convertMultiple(Iterable<TDto> dtoList) => dtoList.map(convert);
}
