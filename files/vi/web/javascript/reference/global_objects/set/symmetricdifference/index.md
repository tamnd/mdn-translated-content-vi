---
title: Set.prototype.symmetricDifference()
short-title: symmetricDifference()
slug: Web/JavaScript/Reference/Global_Objects/Set/symmetricDifference
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.symmetricDifference
sidebar: jsref
---

Phương thức **`symmetricDifference()`** của các instance {{jsxref("Set")}} nhận một set và trả về một set mới chứa các phần tử có trong set này hoặc set đã cho, nhưng không có trong cả hai.

## Cú pháp

```js-nolint
symmetricDifference(other)
```

### Tham số

- `other`
  - : Một đối tượng {{jsxref("Set")}}, hoặc đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects).

### Giá trị trả về

Một đối tượng {{jsxref("Set")}} mới chứa các phần tử có trong set này hoặc `other`, nhưng không có trong cả hai.

## Mô tả

Trong ký hiệu toán học, _hiệu đối xứng_ (symmetric difference) được định nghĩa như sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>A</mi><mo>⊖</mo><mi>B</mi><mo>=</mo><mo stretchy="false">(</mo><mi>A</mi><mo>∖</mo><mi>B</mi><mo stretchy="false">)</mo><mo>∪</mo><mo stretchy="false">(</mo><mi>B</mi><mo>∖</mo><mi>A</mi><mo stretchy="false">)</mo></mrow><annotation encoding="TeX">A\ominus B = (A\setminus B)\cup(B\setminus A)</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Và bằng biểu đồ Venn:

![A Venn diagram where two circles overlap. The symmetric difference of A and B is the region contained by either circle but not both.](diagram.svg)

`symmetricDifference()` chấp nhận các đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects) làm tham số `other`. Nó yêu cầu {{jsxref("Operators/this", "this")}} phải là một instance {{jsxref("Set")}} thực sự, vì nó trực tiếp lấy dữ liệu cơ bản được lưu trữ trong `this` mà không gọi bất kỳ code người dùng nào. Sau đó, nó duyệt `other` bằng cách gọi phương thức `keys()` của nó, và xây dựng một set mới với tất cả các phần tử trong `this` không thấy trong `other`, và tất cả các phần tử trong `other` không thấy trong `this`.

Thứ tự các phần tử trong set được trả về là trước tiên là các phần tử trong `this` sau đó là các phần tử trong `other`.

## Ví dụ

### Sử dụng symmetricDifference()

Ví dụ sau tính hiệu đối xứng giữa tập số chẵn (<10) và tập số chính phương (<10). Kết quả là tập các số hoặc là số chẵn hoặc là số chính phương, nhưng không phải cả hai.

```js
const evens = new Set([2, 4, 6, 8]);
const squares = new Set([1, 4, 9]);
console.log(evens.symmetricDifference(squares)); // Set(5) { 2, 6, 8, 1, 9 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set.prototype.symmetricDifference` in `core-js`](https://github.com/zloirock/core-js#new-set-methods)
- [es-shims polyfill of `Set.prototype.symmetricDifference`](https://www.npmjs.com/package/set.prototype.symmetricdifference)
- {{jsxref("Set.prototype.difference()")}}
- {{jsxref("Set.prototype.intersection()")}}
- {{jsxref("Set.prototype.isDisjointFrom()")}}
- {{jsxref("Set.prototype.isSubsetOf()")}}
- {{jsxref("Set.prototype.isSupersetOf()")}}
- {{jsxref("Set.prototype.union()")}}
