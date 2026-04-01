---
title: Set.prototype.union()
short-title: union()
slug: Web/JavaScript/Reference/Global_Objects/Set/union
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.union
sidebar: jsref
---

Phương thức **`union()`** của các instance {{jsxref("Set")}} nhận một set và trả về một set mới chứa các phần tử có trong set này hoặc set đã cho, hoặc cả hai.

## Cú pháp

```js-nolint
union(other)
```

### Tham số

- `other`
  - : Một đối tượng {{jsxref("Set")}}, hoặc đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects).

### Giá trị trả về

Một đối tượng {{jsxref("Set")}} mới chứa các phần tử có trong set này hoặc `other`, hoặc cả hai.

## Mô tả

Trong ký hiệu toán học, _hợp_ (union) được định nghĩa như sau:

<!-- Note: the {} need to be double-escaped, once for Yari -->
<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>A</mi><mo>∪</mo><mi>B</mi><mo>=</mo><mo stretchy="false">{</mo><mi>x</mi><mo>∣</mo><mi>x</mi><mo>∊</mo><mi>A</mi><mtext>&nbsp;or&nbsp;</mtext><mi>x</mi><mo>∊</mo><mi>B</mi><mo stretchy="false">}</mo></mrow><annotation encoding="TeX">A\cup B = \\{x\mid x\in A\text{ or }x\in B\\}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Và bằng biểu đồ Venn:

![A Venn diagram where two circles overlap. The symmetric difference of A and B is the region contained by either or both circles.](diagram.svg)

`union()` chấp nhận các đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects) làm tham số `other`. Nó yêu cầu {{jsxref("Operators/this", "this")}} phải là một instance {{jsxref("Set")}} thực sự, vì nó trực tiếp lấy dữ liệu cơ bản được lưu trữ trong `this` mà không gọi bất kỳ code người dùng nào. Sau đó, nó duyệt `other` bằng cách gọi phương thức `keys()` của nó, và xây dựng một set mới với tất cả các phần tử trong `this`, theo sau là tất cả các phần tử trong `other` không có trong `this`.

Thứ tự các phần tử trong set được trả về là trước tiên là các phần tử trong `this` sau đó là các phần tử trong `other`.

## Ví dụ

### Sử dụng union()

Ví dụ sau tính hợp giữa tập số chẵn (<10) và tập số chính phương (<10). Kết quả là tập các số hoặc là số chẵn hoặc là số chính phương, hoặc cả hai.

```js
const evens = new Set([2, 4, 6, 8]);
const squares = new Set([1, 4, 9]);
console.log(evens.union(squares)); // Set(6) { 2, 4, 6, 8, 1, 9 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set.prototype.union` in `core-js`](https://github.com/zloirock/core-js#new-set-methods)
- [es-shims polyfill of `Set.prototype.union`](https://www.npmjs.com/package/set.prototype.union)
- {{jsxref("Set.prototype.difference()")}}
- {{jsxref("Set.prototype.intersection()")}}
- {{jsxref("Set.prototype.isDisjointFrom()")}}
- {{jsxref("Set.prototype.isSubsetOf()")}}
- {{jsxref("Set.prototype.isSupersetOf()")}}
- {{jsxref("Set.prototype.symmetricDifference()")}}
