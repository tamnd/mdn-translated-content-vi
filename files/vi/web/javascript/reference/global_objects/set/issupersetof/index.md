---
title: Set.prototype.isSupersetOf()
short-title: isSupersetOf()
slug: Web/JavaScript/Reference/Global_Objects/Set/isSupersetOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.isSupersetOf
sidebar: jsref
---

Phương thức **`isSupersetOf()`** của các instance {{jsxref("Set")}} nhận một set và trả về một boolean cho biết liệu tất cả các phần tử của set đã cho có nằm trong set này hay không.

## Cú pháp

```js-nolint
isSupersetOf(other)
```

### Tham số

- `other`
  - : Một đối tượng {{jsxref("Set")}}, hoặc đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects).

### Giá trị trả về

`true` nếu tất cả các phần tử trong `other` cũng có trong set này, và `false` nếu ngược lại.

## Mô tả

Trong ký hiệu toán học, _tập cha_ (superset) được định nghĩa như sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>A</mi><mo>⊇</mo><mi>B</mi><mo stretchy="false">⇔</mo><mo>∀</mo><mi>x</mi><mo>∊</mo><mi>B</mi><mo>,</mo><mspace width="0.16666666666666666em"></mspace><mi>x</mi><mo>∊</mo><mi>A</mi></mrow><annotation encoding="TeX">A\supseteq B \Leftrightarrow \forall x\in B,\,x\in A</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Và bằng biểu đồ Venn:

![A Venn diagram with two circles. A is a superset of B because B is completely contained in A.](diagram.svg)

> [!NOTE]
> Quan hệ _tập cha_ không phải là _tập cha thực sự_, có nghĩa là `isSupersetOf()` trả về `true` nếu `this` và `other` chứa cùng các phần tử.

`isSupersetOf()` chấp nhận các đối tượng [set-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_objects) làm tham số `other`. Nó yêu cầu {{jsxref("Operators/this", "this")}} phải là một instance {{jsxref("Set")}} thực sự, vì nó trực tiếp lấy dữ liệu cơ bản được lưu trữ trong `this` mà không gọi bất kỳ code người dùng nào. Sau đó, hành vi của nó phụ thuộc vào kích thước của `this` và `other`:

- Nếu có ít phần tử trong `this` hơn `other.size`, thì nó trả về `false` trực tiếp.
- Ngược lại, nó duyệt `other` bằng cách gọi phương thức `keys()` của nó, và nếu bất kỳ phần tử nào trong `other` không có trong `this`, nó trả về `false` (và đóng iterator `keys()` bằng cách gọi phương thức `return()` của nó). Ngược lại, nó trả về `true`.

## Ví dụ

### Sử dụng isSupersetOf()

Tập số chẵn (<20) là tập cha của các bội số của 4 (<20):

```js
const evens = new Set([2, 4, 6, 8, 10, 12, 14, 16, 18]);
const fours = new Set([4, 8, 12, 16]);
console.log(evens.isSupersetOf(fours)); // true
```

Tập tất cả số lẻ (<20) không phải tập cha của số nguyên tố (<20), vì 2 là số nguyên tố nhưng không phải số lẻ:

```js
const primes = new Set([2, 3, 5, 7, 11, 13, 17, 19]);
const odds = new Set([3, 5, 7, 9, 11, 13, 15, 17, 19]);
console.log(odds.isSupersetOf(primes)); // false
```

Các tập tương đương là tập cha của nhau:

```js
const set1 = new Set([1, 2, 3]);
const set2 = new Set([1, 2, 3]);
console.log(set1.isSupersetOf(set2)); // true
console.log(set2.isSupersetOf(set1)); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set.prototype.isSupersetOf` in `core-js`](https://github.com/zloirock/core-js#new-set-methods)
- [es-shims polyfill of `Set.prototype.isSupersetOf`](https://www.npmjs.com/package/set.prototype.issupersetof)
- {{jsxref("Set.prototype.difference()")}}
- {{jsxref("Set.prototype.intersection()")}}
- {{jsxref("Set.prototype.isDisjointFrom()")}}
- {{jsxref("Set.prototype.isSubsetOf()")}}
- {{jsxref("Set.prototype.symmetricDifference()")}}
- {{jsxref("Set.prototype.union()")}}
