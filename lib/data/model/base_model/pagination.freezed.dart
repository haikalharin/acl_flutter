// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  int? get totalElements => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  bool? get last => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  bool? get first => throw _privateConstructorUsedError;
  Sort? get sort => throw _privateConstructorUsedError;
  int? get numberOfElements => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call(
      {int? totalElements,
      int? totalPages,
      bool? last,
      int? size,
      int? number,
      bool? first,
      Sort? sort,
      int? numberOfElements,
      bool? empty});

  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalElements = freezed,
    Object? totalPages = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? first = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? empty = freezed,
  }) {
    return _then(_value.copyWith(
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Sort?,
      numberOfElements: freezed == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SortCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $SortCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaginationCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$_PaginationCopyWith(
          _$_Pagination value, $Res Function(_$_Pagination) then) =
      __$$_PaginationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalElements,
      int? totalPages,
      bool? last,
      int? size,
      int? number,
      bool? first,
      Sort? sort,
      int? numberOfElements,
      bool? empty});

  @override
  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$_PaginationCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$_Pagination>
    implements _$$_PaginationCopyWith<$Res> {
  __$$_PaginationCopyWithImpl(
      _$_Pagination _value, $Res Function(_$_Pagination) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalElements = freezed,
    Object? totalPages = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? first = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? empty = freezed,
  }) {
    return _then(_$_Pagination(
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Sort?,
      numberOfElements: freezed == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Pagination implements _Pagination {
  const _$_Pagination(
      {required this.totalElements,
      required this.totalPages,
      required this.last,
      required this.size,
      required this.number,
      required this.first,
      required this.sort,
      required this.numberOfElements,
      required this.empty});

  factory _$_Pagination.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationFromJson(json);

  @override
  final int? totalElements;
  @override
  final int? totalPages;
  @override
  final bool? last;
  @override
  final int? size;
  @override
  final int? number;
  @override
  final bool? first;
  @override
  final Sort? sort;
  @override
  final int? numberOfElements;
  @override
  final bool? empty;

  @override
  String toString() {
    return 'Pagination(totalElements: $totalElements, totalPages: $totalPages, last: $last, size: $size, number: $number, first: $first, sort: $sort, numberOfElements: $numberOfElements, empty: $empty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pagination &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.numberOfElements, numberOfElements) ||
                other.numberOfElements == numberOfElements) &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalElements, totalPages, last,
      size, number, first, sort, numberOfElements, empty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      __$$_PaginationCopyWithImpl<_$_Pagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination(
      {required final int? totalElements,
      required final int? totalPages,
      required final bool? last,
      required final int? size,
      required final int? number,
      required final bool? first,
      required final Sort? sort,
      required final int? numberOfElements,
      required final bool? empty}) = _$_Pagination;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$_Pagination.fromJson;

  @override
  int? get totalElements;
  @override
  int? get totalPages;
  @override
  bool? get last;
  @override
  int? get size;
  @override
  int? get number;
  @override
  bool? get first;
  @override
  Sort? get sort;
  @override
  int? get numberOfElements;
  @override
  bool? get empty;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

Sort _$SortFromJson(Map<String, dynamic> json) {
  return _Sort.fromJson(json);
}

/// @nodoc
mixin _$Sort {
  bool? get unsorted => throw _privateConstructorUsedError;
  bool? get sorted => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortCopyWith<Sort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortCopyWith<$Res> {
  factory $SortCopyWith(Sort value, $Res Function(Sort) then) =
      _$SortCopyWithImpl<$Res, Sort>;
  @useResult
  $Res call({bool? unsorted, bool? sorted, bool? empty});
}

/// @nodoc
class _$SortCopyWithImpl<$Res, $Val extends Sort>
    implements $SortCopyWith<$Res> {
  _$SortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unsorted = freezed,
    Object? sorted = freezed,
    Object? empty = freezed,
  }) {
    return _then(_value.copyWith(
      unsorted: freezed == unsorted
          ? _value.unsorted
          : unsorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      sorted: freezed == sorted
          ? _value.sorted
          : sorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortCopyWith<$Res> implements $SortCopyWith<$Res> {
  factory _$$_SortCopyWith(_$_Sort value, $Res Function(_$_Sort) then) =
      __$$_SortCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? unsorted, bool? sorted, bool? empty});
}

/// @nodoc
class __$$_SortCopyWithImpl<$Res> extends _$SortCopyWithImpl<$Res, _$_Sort>
    implements _$$_SortCopyWith<$Res> {
  __$$_SortCopyWithImpl(_$_Sort _value, $Res Function(_$_Sort) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unsorted = freezed,
    Object? sorted = freezed,
    Object? empty = freezed,
  }) {
    return _then(_$_Sort(
      unsorted: freezed == unsorted
          ? _value.unsorted
          : unsorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      sorted: freezed == sorted
          ? _value.sorted
          : sorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sort implements _Sort {
  const _$_Sort(
      {required this.unsorted, required this.sorted, required this.empty});

  factory _$_Sort.fromJson(Map<String, dynamic> json) => _$$_SortFromJson(json);

  @override
  final bool? unsorted;
  @override
  final bool? sorted;
  @override
  final bool? empty;

  @override
  String toString() {
    return 'Sort(unsorted: $unsorted, sorted: $sorted, empty: $empty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sort &&
            (identical(other.unsorted, unsorted) ||
                other.unsorted == unsorted) &&
            (identical(other.sorted, sorted) || other.sorted == sorted) &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unsorted, sorted, empty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortCopyWith<_$_Sort> get copyWith =>
      __$$_SortCopyWithImpl<_$_Sort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortToJson(
      this,
    );
  }
}

abstract class _Sort implements Sort {
  const factory _Sort(
      {required final bool? unsorted,
      required final bool? sorted,
      required final bool? empty}) = _$_Sort;

  factory _Sort.fromJson(Map<String, dynamic> json) = _$_Sort.fromJson;

  @override
  bool? get unsorted;
  @override
  bool? get sorted;
  @override
  bool? get empty;
  @override
  @JsonKey(ignore: true)
  _$$_SortCopyWith<_$_Sort> get copyWith => throw _privateConstructorUsedError;
}
