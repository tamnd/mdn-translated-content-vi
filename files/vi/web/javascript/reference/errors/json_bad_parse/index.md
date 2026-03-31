---
title: "SyntaxError: JSON.parse: bad parsing"
slug: Web/JavaScript/Reference/Errors/JSON_bad_parse
page-type: javascript-error
sidebar: jssidebar
---

Các ngoại lệ JavaScript được ném ra bởi {{jsxref("JSON.parse()")}} xảy ra khi chuỗi không thể được phân tích cú pháp dưới dạng JSON.

## Thông báo

```plain
SyntaxError: JSON.parse: unterminated string literal
SyntaxError: JSON.parse: bad control character in string literal
SyntaxError: JSON.parse: bad character in string literal
SyntaxError: JSON.parse: bad Unicode escape
SyntaxError: JSON.parse: bad escape character
SyntaxError: JSON.parse: unterminated string
SyntaxError: JSON.parse: no number after minus sign
SyntaxError: JSON.parse: unexpected non-digit
SyntaxError: JSON.parse: missing digits after decimal point
SyntaxError: JSON.parse: unterminated fractional number
SyntaxError: JSON.parse: missing digits after exponent indicator
SyntaxError: JSON.parse: missing digits after exponent sign
SyntaxError: JSON.parse: exponent part is missing a number
SyntaxError: JSON.parse: unexpected end of data
SyntaxError: JSON.parse: unexpected keyword
SyntaxError: JSON.parse: unexpected character
SyntaxError: JSON.parse: end of data while reading object contents
SyntaxError: JSON.parse: expected property name or '}'
SyntaxError: JSON.parse: end of data when ',' or ']' was expected
SyntaxError: JSON.parse: expected ',' or ']' after array element
SyntaxError: JSON.parse: end of data when property name was expected
SyntaxError: JSON.parse: expected double-quoted property name
SyntaxError: JSON.parse: end of data after property name when ':' was expected
SyntaxError: JSON.parse: expected ':' after property name in object
SyntaxError: JSON.parse: end of data after property value in object
SyntaxError: JSON.parse: expected ',' or '}' after property value in object
SyntaxError: JSON.parse: expected ',' or '}' after property-value pair in object literal
SyntaxError: JSON.parse: property names must be double-quoted strings
SyntaxError: JSON.parse: expected property name or '}'
SyntaxError: JSON.parse: unexpected character
SyntaxError: JSON.parse: unexpected non-whitespace character after JSON data
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

{{jsxref("JSON.parse()")}} phân tích cú pháp một chuỗi dưới dạng JSON. Chuỗi này phải là JSON hợp lệ và sẽ ném ra lỗi này nếu gặp cú pháp không đúng.

## Ví dụ

### JSON.parse() không cho phép dấu phẩy cuối

Cả hai dòng đều sẽ ném ra SyntaxError:

```js example-bad
JSON.parse("[1, 2, 3, 4,]");
JSON.parse('{"foo": 1,}');
// SyntaxError JSON.parse: unexpected character
// at line 1 column 14 of the JSON data
```

Bỏ dấu phẩy cuối để phân tích cú pháp JSON đúng cách:

```js example-good
JSON.parse("[1, 2, 3, 4]");
JSON.parse('{"foo": 1}');
```

### Tên thuộc tính phải là chuỗi được đặt trong dấu nháy kép

Bạn không thể dùng dấu nháy đơn quanh tên thuộc tính, ví dụ như 'foo'.

```js example-bad
JSON.parse("{'foo': 1}");
// SyntaxError: JSON.parse: expected property name or '}'
// at line 1 column 2 of the JSON data
```

Thay vào đó hãy viết "foo":

```js example-good
JSON.parse('{"foo": 1}');
```

### Số 0 đứng đầu và dấu chấm thập phân

Bạn không thể dùng số 0 đứng đầu, ví dụ như 01, và dấu chấm thập phân phải được theo sau bởi ít nhất một chữ số.

```js example-bad
JSON.parse('{"foo": 01}');
// SyntaxError: JSON.parse: expected ',' or '}' after property value
// in object at line 1 column 2 of the JSON data

JSON.parse('{"foo": 1.}');
// SyntaxError: JSON.parse: unterminated fractional number
// at line 1 column 2 of the JSON data
```

Thay vào đó chỉ viết 1 mà không có số 0 và sử dụng ít nhất một chữ số sau dấu chấm thập phân:

```js example-good
JSON.parse('{"foo": 1}');
JSON.parse('{"foo": 1.0}');
```

## Xem thêm

- {{jsxref("JSON")}}
- {{jsxref("JSON.parse()")}}
- {{jsxref("JSON.stringify()")}}
