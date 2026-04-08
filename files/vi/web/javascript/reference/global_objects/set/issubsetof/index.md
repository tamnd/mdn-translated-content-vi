---
title: Set.prototype.isSubsetOf()
short-title: isSubsetOf()
slug: Web/JavaScript/Reference/Global_Objects/Set/isSubsetOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.isSubsetOf
sidebar: jsref
---

Phương thức **`isSubsetOf()`** của các instance {{jsxref("Set")}} nhận một set và trả về một boolean cho biết liệu tất cả các phần tử của set này có nằm trong set đã cho hay không.

## Cú pháp

```js-nolint
isSubsetOf(other)
```

### Tham số

- `other`
  - : Một đối tượng {{jsxref("Set")}}, hoặc đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects).

### Giá trị trả về

`true` nếu tất cả các phần tử trong set này cũng có trong `other`, và `false` nếu ngược lại.

## Mô tả

Trong ký hiệu toán học, _tập con_ (subset) được định nghĩa như sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>A</mi><mo>⊆</mo><mi>B</mi><mo stretchy="false">⇔</mo><mo>∀</mo><mi>x</mi><mo>∊</mo><mi>A</mi><mo>,</mo><mspace width="0.16666666666666666em"></mspace><mi>x</mi><mo>∊</mo><mi>B</mi></mrow><annotation encoding="TeX">A\subseteq B \Leftrightarrow \forall x\in A,\,x\in B</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Và bằng biểu đồ Venn:

![A Venn diagram with two circles. A is a subset of B because A is completely contained in B.](diagram.svg)

> [!NOTE]
> Quan hệ _tập con_ không phải là _tập con thực sự_, có nghĩa là `isSubsetOf()` trả về `true` nếu `this` và `other` chứa cùng các phần tử.

`isSubsetOf()` chấp nhận các đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects) làm tham số `other`. Nó yêu cầu {{jsxref("Operators/this", "this")}} phải là một instance {{jsxref("Set")}} thực sự, vì nó trực tiếp lấy dữ liệu cơ bản được lưu trữ trong `this` mà không gọi bất kỳ code người dùng nào. Sau đó, hành vi của nó phụ thuộc vào kích thước của `this` và `other`:

- Nếu có nhiều phần tử trong `this` hơn `other.size`, thì nó trả về `false` trực tiếp.
- Ngược lại, nó duyệt các phần tử trong `this`, và trả về `false` nếu bất kỳ phần tử `e` nào trong `this` khiến `other.has(e)` trả về giá trị [falsy](/en-US/docs/Glossary/Falsy). Ngược lại, nó trả về `true`.

## Ví dụ

### Sử dụng isSubsetOf()

Tập các bội số của 4 (<20) là tập con của các số chẵn (<20):

```js
const fours = new Set([4, 8, 12, 16]);
const evens = new Set([2, 4, 6, 8, 10, 12, 14, 16, 18]);
console.log(fours.isSubsetOf(evens)); // true
```

Tập số nguyên tố (<20) không phải tập con của tất cả số lẻ (<20), vì 2 là số nguyên tố nhưng không phải số lẻ:

```js
const primes = new Set([2, 3, 5, 7, 11, 13, 17, 19]);
const odds = new Set([3, 5, 7, 9, 11, 13, 15, 17, 19]);
console.log(primes.isSubsetOf(odds)); // false
```

Các tập tương đương là tập con của nhau:

```js
const set1 = new Set([1, 2, 3]);
const set2 = new Set([1, 2, 3]);
console.log(set1.isSubsetOf(set2)); // true
console.log(set2.isSubsetOf(set1)); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set.prototype.isSubsetOf` in `core-js`](https://github.com/zloirock/core-js#new-set-methods)
- [es-shims polyfill of `Set.prototype.isSubsetOf`](https://www.npmjs.com/package/set.prototype.issubsetof)
- {{jsxref("Set.prototype.difference()")}}
- {{jsxref("Set.prototype.intersection()")}}
- {{jsxref("Set.prototype.isDisjointFrom()")}}
- {{jsxref("Set.prototype.isSupersetOf()")}}
- {{jsxref("Set.prototype.symmetricDifference()")}}
- {{jsxref("Set.prototype.union()")}}
