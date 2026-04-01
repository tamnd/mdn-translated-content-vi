---
title: Set.prototype.intersection()
short-title: intersection()
slug: Web/JavaScript/Reference/Global_Objects/Set/intersection
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.intersection
sidebar: jsref
---

Phương thức **`intersection()`** của các instance {{jsxref("Set")}} nhận một set và trả về một set mới chứa các phần tử có trong cả set này và set đã cho.

## Cú pháp

```js-nolint
intersection(other)
```

### Tham số

- `other`
  - : Một đối tượng {{jsxref("Set")}}, hoặc đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects).

### Giá trị trả về

Một đối tượng {{jsxref("Set")}} mới chứa các phần tử có trong cả set này và `other`.

## Mô tả

Trong ký hiệu toán học, _giao_ (intersection) được định nghĩa như sau:

<!-- Note: the {} need to be double-escaped, once for Yari -->
<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>A</mi><mo>∩</mo><mi>B</mi><mo>=</mo><mo stretchy="false">{</mo><mi>x</mi><mo>∊</mo><mi>A</mi><mo>∣</mo><mi>x</mi><mo>∊</mo><mi>B</mi><mo stretchy="false">}</mo></mrow><annotation encoding="TeX">A\cap B = \\{x\in A\mid x\in B\\}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Và bằng biểu đồ Venn:

![A Venn diagram where two circles overlap. The intersection of A and B is the part where they overlap.](diagram.svg)

`intersection()` chấp nhận các đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects) làm tham số `other`. Nó yêu cầu {{jsxref("Operators/this", "this")}} phải là một instance {{jsxref("Set")}} thực sự, vì nó trực tiếp lấy dữ liệu cơ bản được lưu trữ trong `this` mà không gọi bất kỳ code người dùng nào. Sau đó, hành vi của nó phụ thuộc vào kích thước của `this` và `other`:

- Nếu có nhiều phần tử trong `this` hơn `other.size`, thì nó duyệt `other` bằng cách gọi phương thức `keys()` của nó, và xây dựng một set mới với tất cả các phần tử được tạo ra cũng có mặt trong `this`.
- Ngược lại, nó duyệt các phần tử trong `this`, và xây dựng một set mới với tất cả các phần tử `e` trong `this` khiến `other.has(e)` trả về giá trị [truthy](/en-US/docs/Glossary/Truthy).

Do cách triển khai này, hiệu quả của `intersection()` phần lớn phụ thuộc vào kích thước của set nhỏ hơn giữa `this` và `other` (giả sử các set có thể được truy cập trong thời gian dưới tuyến tính). Thứ tự các phần tử trong set được trả về giống như của set nhỏ hơn giữa `this` và `other`.

## Ví dụ

### Sử dụng intersection()

Ví dụ sau tính giao giữa tập số lẻ (<10) và tập số chính phương (<10). Kết quả là tập số lẻ là số chính phương.

```js
const odds = new Set([1, 3, 5, 7, 9]);
const squares = new Set([1, 4, 9]);
console.log(odds.intersection(squares)); // Set(2) { 1, 9 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set.prototype.intersection` in `core-js`](https://github.com/zloirock/core-js#new-set-methods)
- [es-shims polyfill of `Set.prototype.intersection`](https://www.npmjs.com/package/set.prototype.intersection)
- {{jsxref("Set.prototype.difference()")}}
- {{jsxref("Set.prototype.isDisjointFrom()")}}
- {{jsxref("Set.prototype.isSubsetOf()")}}
- {{jsxref("Set.prototype.isSupersetOf()")}}
- {{jsxref("Set.prototype.symmetricDifference()")}}
- {{jsxref("Set.prototype.union()")}}
