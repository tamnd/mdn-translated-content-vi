---
title: Math.clz32()
short-title: clz32()
slug: Web/JavaScript/Reference/Global_Objects/Math/clz32
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.clz32
sidebar: jsref
---

Phương thức tĩnh **`Math.clz32()`** trả về số bit 0 ở đầu trong biểu diễn nhị phân 32-bit của một số.

{{InteractiveExample("JavaScript Demo: Math.clz32()")}}

```js interactive-example
// 00000000000000000000000000000001
console.log(Math.clz32(1));
// Expected output: 31

// 00000000000000000000000000000100
console.log(Math.clz32(4));
// Expected output: 29

// 00000000000000000000001111101000
console.log(Math.clz32(1000));
// Expected output: 22
```

## Cú pháp

```js-nolint
Math.clz32(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Số bit 0 ở đầu trong biểu diễn nhị phân 32-bit của `x`.

## Mô tả

`clz32` là viết tắt của **C**ount**L**eading**Z**eros**32** (đếm số bit 0 đứng đầu trong 32 bit).

Nếu `x` không phải là số, nó sẽ được chuyển đổi thành số trước, sau đó chuyển đổi thành số nguyên không dấu 32-bit.

Nếu số nguyên không dấu 32-bit đã chuyển đổi là `0`, trả về `32`, vì tất cả các bit đều là `0`. Nếu bit quan trọng nhất là `1` (tức là số lớn hơn hoặc bằng 2<sup>31</sup>), trả về `0`.

Hàm này đặc biệt hữu ích cho các hệ thống biên dịch sang JS, như [Emscripten](https://emscripten.org/).

## Ví dụ

### Sử dụng Math.clz32()

```js
Math.clz32(1); // 31
Math.clz32(1000); // 22
Math.clz32(); // 32

const stuff = [
  NaN,
  Infinity,
  -Infinity,
  0,
  -0,
  false,
  null,
  undefined,
  "foo",
  {},
  [],
];
stuff.every((n) => Math.clz32(n) === 32); // true

Math.clz32(true); // 31
Math.clz32(3.5); // 30
```

### Triển khai hàm Count Leading Ones và các biến thể

Hiện tại không có hàm `Math.clon` (đếm số bit 1 ở đầu — gọi là "clon", không phải "clo", vì "clo" và "clz" dễ nhầm lẫn, đặc biệt với những người không dùng tiếng Anh). Tuy nhiên, hàm `clon` có thể dễ dàng tạo ra bằng cách đảo bit của một số rồi truyền kết quả vào `Math.clz32`. Điều này hoạt động vì nghịch đảo của 1 là 0 và ngược lại. Như vậy, việc đảo bit sẽ đảo chiều số lượng bit 0 (từ `Math.clz32`), khiến `Math.clz32` đếm số bit 1 thay vì đếm số bit 0.

Xét từ 32-bit sau:

```js
const a = 32776; // 00000000000000001000000000001000 (16 leading zeros)
Math.clz32(a); // 16

const b = ~32776; // 11111111111111110111111111110111 (32776 inverted, 0 leading zeros)
Math.clz32(b); // 0 (this is equal to how many leading one's there are in a)
```

Sử dụng logic này, hàm `clon` có thể được tạo như sau:

```js
const clz = Math.clz32;

function clon(integer) {
  return clz(~integer);
}
```

Hơn nữa, kỹ thuật này có thể được mở rộng để tạo hàm "Count Trailing Zeros" không nhảy, như thấy bên dưới. Hàm `ctrz` lấy AND bitwise của số nguyên với phần bù hai. Nhờ cơ chế hoạt động của phần bù hai, tất cả các bit 0 ở cuối sẽ chuyển thành 1, và khi cộng 1 sẽ được nhớ cho đến khi gặp bit `0` đầu tiên (lúc đầu là `1`). Tất cả các bit cao hơn giữ nguyên và là nghịch đảo của các bit tương ứng trong số nguyên ban đầu. Do đó, khi thực hiện AND bitwise với số nguyên ban đầu, tất cả các bit cao hơn trở thành `0`, có thể đếm bằng `clz`. Số bit 0 ở cuối, cộng với bit `1` đầu tiên, cộng với các bit dẫn đầu đếm bởi `clz`, tổng cộng là 32.

```js
function ctrz(integer) {
  integer >>>= 0; // coerce to Uint32
  if (integer === 0) {
    // skipping this step would make it return -1
    return 32;
  }
  integer &= -integer; // equivalent to `int = int & (~int + 1)`
  return 31 - clz(integer);
}
```

Sau đó, hàm "Count Trailing Ones" có thể được định nghĩa như sau:

```js
function ctron(integer) {
  return ctrz(~integer);
}
```

Các hàm trợ giúp này có thể đưa vào module [asm.js](/en-US/docs/Games/Tools/asm.js) để cải thiện hiệu năng tiềm năng.

```js
const countTrailsMethods = (function (stdlib, foreign, heap) {
  "use asm";
  const clz = stdlib.Math.clz32;

  // count trailing zeros
  function ctrz(integer) {
    integer = integer | 0; // coerce to an integer
    if ((integer | 0) == 0) {
      // skipping this step would make it return -1
      return 32;
    }
    // Note: asm.js doesn't have compound assignment operators such as &=
    integer = integer & -integer; // equivalent to `int = int & (~int + 1)`
    return (31 - clz(integer)) | 0;
  }

  // count trailing ones
  function ctron(integer) {
    integer = integer | 0; // coerce to an integer
    return ctrz(~integer) | 0;
  }

  // asm.js demands plain objects:
  return { ctrz: ctrz, ctron: ctron };
})(window, null, null);

const { ctrz, ctron } = countTrailsMethods;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.clz32` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.clz32`](https://www.npmjs.com/package/math.clz32)
- {{jsxref("Math")}}
- {{jsxref("Math.imul")}}
