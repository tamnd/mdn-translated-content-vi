---
title: "TypeError: invalid Array.prototype.sort argument"
slug: Web/JavaScript/Reference/Errors/Array_sort_argument
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid Array.prototype.sort argument" xảy ra khi đối số của {{jsxref("Array.prototype.sort()")}} (và các phương thức liên quan: {{jsxref("Array.prototype.toSorted()")}}, {{jsxref("TypedArray.prototype.sort()")}}, {{jsxref("TypedArray.prototype.toSorted()")}}) không phải là {{jsxref("undefined")}} hoặc một hàm so sánh các toán hạng của nó.

## Thông báo

```plain
TypeError: The comparison function must be either a function or undefined (V8-based)

TypeError: invalid Array.prototype.sort argument (Firefox)
TypeError: non-function passed to Array.prototype.toSorted (Firefox)
TypeError: invalid %TypedArray%.prototype.sort argument (Firefox)

TypeError: Array.prototype.sort requires the comparator argument to be a function or undefined (Safari)
TypeError: Array.prototype.toSorted requires the comparator argument to be a function or undefined (Safari)
TypeError: TypedArray.prototype.sort requires the comparator argument to be a function or undefined (Safari)
TypeError: TypedArray.prototype.toSorted requires the comparator argument to be a function or undefined (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Đối số của {{jsxref("Array.prototype.sort()")}} (và các phương thức liên quan: {{jsxref("Array.prototype.toSorted()")}}, {{jsxref("TypedArray.prototype.sort()")}}, {{jsxref("TypedArray.prototype.toSorted()")}}) phải là {{jsxref("undefined")}} hoặc một hàm so sánh các toán hạng của nó.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
[1, 3, 2].sort(5); // TypeError
students.toSorted("name"); // TypeError
```

### Trường hợp hợp lệ

```js example-good
[1, 3, 2].sort(); // [1, 2, 3]
[1, 3, 2].sort((a, b) => a - b); // [1, 2, 3]
students.toSorted((a, b) => a.name.localeCompare(b.name));
```

## Xem thêm

- {{jsxref("Array.prototype.sort()")}}
- {{jsxref("Array.prototype.toSorted()")}}
- {{jsxref("TypedArray.prototype.sort()")}}
- {{jsxref("TypedArray.prototype.toSorted()")}}
