---
title: Set.prototype.difference()
short-title: difference()
slug: Web/JavaScript/Reference/Global_Objects/Set/difference
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.difference
sidebar: jsref
---

Phương thức **`difference()`** của các instance {{jsxref("Set")}} nhận một set và trả về một set mới chứa các phần tử có trong set này nhưng không có trong set đã cho.

## Cú pháp

```js-nolint
difference(other)
```

### Tham số

- `other`
  - : Một đối tượng {{jsxref("Set")}}, hoặc đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects).

### Giá trị trả về

Một đối tượng {{jsxref("Set")}} mới chứa các phần tử có trong set này nhưng không có trong `other`.

## Mô tả

Trong ký hiệu toán học, _hiệu_ (difference) được định nghĩa như sau:

<!-- Note: the {} need to be double-escaped, once for Yari -->
<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>A</mi><mo>∖</mo><mi>B</mi><mo>=</mo><mo stretchy="false">{</mo><mi>x</mi><mo>∊</mo><mi>A</mi><mo>∣</mo><mi>x</mi><mo>∉</mo><mi>B</mi><mo stretchy="false">}</mo></mrow><annotation encoding="TeX">A\setminus B = \\{x\in A\mid x\notin B\\}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Và bằng biểu đồ Venn:

![A Venn diagram where two circles overlap. The difference of A and B is the part of A that is not overlapping B.](diagram.svg)

`difference()` chấp nhận các đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects) làm tham số `other`. Nó yêu cầu {{jsxref("Operators/this", "this")}} phải là một instance {{jsxref("Set")}} thực sự, vì nó trực tiếp lấy dữ liệu cơ bản được lưu trữ trong `this` mà không gọi bất kỳ code người dùng nào. Sau đó, hành vi của nó phụ thuộc vào kích thước của `this` và `other`:

- Nếu có nhiều phần tử trong `this` hơn `other.size`, thì nó duyệt `other` bằng cách gọi phương thức `keys()` của nó, và xây dựng một set mới với tất cả các phần tử trong `this` không thấy trong `other`.
- Ngược lại, nó duyệt các phần tử trong `this`, và xây dựng một set mới với tất cả các phần tử `e` trong `this` khiến `other.has(e)` trả về giá trị [falsy](/en-US/docs/Glossary/Falsy).

Thứ tự các phần tử trong set được trả về giống như trong `this`.

## Ví dụ

### Sử dụng difference()

Ví dụ sau tính hiệu giữa tập số lẻ (<10) và tập số chính phương (<10). Kết quả là tập số lẻ không phải số chính phương.

```js
const odds = new Set([1, 3, 5, 7, 9]);
const squares = new Set([1, 4, 9]);
console.log(odds.difference(squares)); // Set(3) { 3, 5, 7 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set.prototype.difference` in `core-js`](https://github.com/zloirock/core-js#new-set-methods)
- [es-shims polyfill of `Set.prototype.difference`](https://www.npmjs.com/package/set.prototype.difference)
- {{jsxref("Set.prototype.intersection()")}}
- {{jsxref("Set.prototype.isDisjointFrom()")}}
- {{jsxref("Set.prototype.isSubsetOf()")}}
- {{jsxref("Set.prototype.isSupersetOf()")}}
- {{jsxref("Set.prototype.symmetricDifference()")}}
- {{jsxref("Set.prototype.union()")}}
