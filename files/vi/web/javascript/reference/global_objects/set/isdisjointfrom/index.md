---
title: Set.prototype.isDisjointFrom()
short-title: isDisjointFrom()
slug: Web/JavaScript/Reference/Global_Objects/Set/isDisjointFrom
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.isDisjointFrom
sidebar: jsref
---

Phương thức **`isDisjointFrom()`** của các instance {{jsxref("Set")}} nhận một set và trả về một boolean cho biết set này có không có phần tử chung nào với set đã cho hay không.

## Cú pháp

```js-nolint
isDisjointFrom(other)
```

### Tham số

- `other`
  - : Một đối tượng {{jsxref("Set")}}, hoặc đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects).

### Giá trị trả về

`true` nếu set này không có phần tử chung nào với `other`, và `false` nếu ngược lại.

## Mô tả

Hai set là _rời nhau_ (disjoint) nếu chúng không có phần tử chung. Trong ký hiệu toán học:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>A</mi><mtext>&nbsp;is disjoint from&nbsp;</mtext><mi>B</mi><mo stretchy="false">⇔</mo><mi>A</mi><mo>∩</mo><mi>B</mi><mo>=</mo><mi>∅</mi></mrow><annotation encoding="TeX">A\text{ is disjoint from }B \Leftrightarrow A\cap B = \empty</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Và bằng biểu đồ Venn:

![A Venn diagram with two circles. A and B are disjoint because the circles have no region of overlap.](diagram.svg)

`isDisjointFrom()` chấp nhận các đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects) làm tham số `other`. Nó yêu cầu {{jsxref("Operators/this", "this")}} phải là một instance {{jsxref("Set")}} thực sự, vì nó trực tiếp lấy dữ liệu cơ bản được lưu trữ trong `this` mà không gọi bất kỳ code người dùng nào. Sau đó, hành vi của nó phụ thuộc vào kích thước của `this` và `other`:

- Nếu có nhiều phần tử trong `this` hơn `other.size`, thì nó duyệt `other` bằng cách gọi phương thức `keys()` của nó, và nếu bất kỳ phần tử nào trong `other` có trong `this`, nó trả về `false` (và đóng iterator `keys()` bằng cách gọi phương thức `return()` của nó). Ngược lại, nó trả về `true`.
- Ngược lại, nó duyệt các phần tử trong `this`, và trả về `false` nếu bất kỳ phần tử `e` nào trong `this` khiến `other.has(e)` trả về giá trị [truthy](/en-US/docs/Glossary/Truthy). Ngược lại, nó trả về `true`.

Do cách triển khai này, hiệu quả của `isDisjointFrom()` phần lớn phụ thuộc vào kích thước của set nhỏ hơn giữa `this` và `other` (giả sử các set có thể được truy cập trong thời gian dưới tuyến tính).

## Ví dụ

### Sử dụng isDisjointFrom()

Tập số chính phương (<20) rời nhau với tập số nguyên tố (<20), vì một số chính phương theo định nghĩa có thể phân tích thành tích của hai số nguyên, trong khi 1 cũng không được coi là số nguyên tố:

```js
const primes = new Set([2, 3, 5, 7, 11, 13, 17, 19]);
const squares = new Set([1, 4, 9, 16]);
console.log(primes.isDisjointFrom(squares)); // true
```

Tập số chính phương (<20) không rời nhau với tập số hợp (<20), vì tất cả số chính phương khác 1 theo định nghĩa là số hợp:

```js
const composites = new Set([4, 6, 8, 9, 10, 12, 14, 15, 16, 18]);
const squares = new Set([1, 4, 9, 16]);
console.log(composites.isDisjointFrom(squares)); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set.prototype.isDisjointFrom` in `core-js`](https://github.com/zloirock/core-js#new-set-methods)
- [es-shims polyfill of `Set.prototype.isDisjointFrom`](https://www.npmjs.com/package/set.prototype.isdisjointfrom)
- {{jsxref("Set.prototype.difference()")}}
- {{jsxref("Set.prototype.intersection()")}}
- {{jsxref("Set.prototype.isSubsetOf()")}}
- {{jsxref("Set.prototype.isSupersetOf()")}}
- {{jsxref("Set.prototype.symmetricDifference()")}}
- {{jsxref("Set.prototype.union()")}}
