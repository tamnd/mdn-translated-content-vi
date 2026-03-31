---
title: Math.atan2()
short-title: atan2()
slug: Web/JavaScript/Reference/Global_Objects/Math/atan2
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.atan2
sidebar: jsref
---

Phương thức tĩnh **`Math.atan2()`** trả về góc (tính bằng radian) trong mặt phẳng giữa trục x dương và tia từ (0, 0) đến điểm (x, y), tương ứng với `Math.atan2(y, x)`.

{{InteractiveExample("JavaScript Demo: Math.atan2()")}}

```js interactive-example
function calcAngleDegrees(x, y) {
  return (Math.atan2(y, x) * 180) / Math.PI;
}

console.log(calcAngleDegrees(5, 5));
// Expected output: 45

console.log(calcAngleDegrees(10, 10));
// Expected output: 45

console.log(calcAngleDegrees(0, 10));
// Expected output: 90
```

## Cú pháp

```js-nolint
Math.atan2(y, x)
```

### Tham số

- `y`
  - : Tọa độ y của điểm.
- `x`
  - : Tọa độ x của điểm.

### Giá trị trả về

Góc tính bằng radian (trong khoảng từ -π đến π, bao gồm hai đầu mút) giữa trục x dương và tia từ (0, 0) đến điểm (x, y).

## Mô tả

Phương thức `Math.atan2()` đo góc θ ngược chiều kim đồng hồ (tính bằng radian) giữa trục x dương và điểm `(x, y)`. Lưu ý rằng hàm này nhận đối số theo thứ tự tọa độ y trước, tọa độ x sau.

![Sơ đồ biểu diễn góc được trả về bởi atan2(y, x)](atan2.png)

`Math.atan2()` nhận hai đối số riêng biệt `x` và `y`, trong khi [`Math.atan()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan) nhận tỷ lệ giữa hai đối số đó. `Math.atan2(y, x)` khác với `Math.atan(y / x)` trong các trường hợp sau:

| `x`                  | `y`         | `Math.atan2(y, x)` | `Math.atan(y / x)` |
| -------------------- | ----------- | ------------------ | ------------------ |
| `Infinity`           | `Infinity`  | π / 4              | `NaN`              |
| `Infinity`           | `-Infinity` | -π / 4             | `NaN`              |
| `-Infinity`          | `Infinity`  | 3π / 4             | `NaN`              |
| `-Infinity`          | `-Infinity` | -3π / 4            | `NaN`              |
| 0                    | 0           | 0                  | `NaN`              |
| 0                    | -0          | -0                 | `NaN`              |
| < 0 (including `-0`) | 0           | π                  | 0                  |
| < 0 (including `-0`) | -0          | -π                 | 0                  |
| `-Infinity`          | > 0         | π                  | -0                 |
| -0                   | > 0         | π / 2              | -π / 2             |
| `-Infinity`          | < 0         | -π                 | 0                  |
| -0                   | < 0         | -π / 2             | π / 2              |

Ngoài ra, đối với các điểm ở góc phần tư thứ hai và thứ ba (`x < 0`), `Math.atan2()` sẽ trả về góc nhỏ hơn <math><semantics><mrow><mo>-</mo><mfrac><mi>π</mi><mn>2</mn></mfrac></mrow><annotation encoding="TeX">-\frac{\pi}{2}</annotation></semantics></math> hoặc lớn hơn <math><semantics><mfrac><mi>π</mi><mn>2</mn></mfrac><annotation encoding="TeX">\frac{\pi}{2}</annotation></semantics></math>.

Vì `atan2()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.atan2()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.atan2()

```js
Math.atan2(90, 15); // 1.4056476493802699
Math.atan2(15, 90); // 0.16514867741462683
```

### Sự khác biệt giữa Math.atan2(y, x) và Math.atan(y / x)

Đoạn script sau in ra tất cả các đầu vào tạo ra sự khác biệt giữa `Math.atan2(y, x)` và `Math.atan(y / x)`.

```js
const formattedNumbers = new Map([
  [-Math.PI, "-π"],
  [(-3 * Math.PI) / 4, "-3π/4"],
  [-Math.PI / 2, "-π/2"],
  [-Math.PI / 4, "-π/4"],
  [Math.PI / 4, "π/4"],
  [Math.PI / 2, "π/2"],
  [(3 * Math.PI) / 4, "3π/4"],
  [Math.PI, "π"],
  [-Infinity, "-∞"],
  [Infinity, "∞"],
]);

function format(template, ...args) {
  return String.raw(
    { raw: template },
    ...args.map((num) =>
      (Object.is(num, -0)
        ? "-0"
        : (formattedNumbers.get(num) ?? String(num))
      ).padEnd(5),
    ),
  );
}

console.log(`| x     | y     | atan2 | atan  |
|-------|-------|-------|-------|`);

for (const x of [-Infinity, -1, -0, 0, 1, Infinity]) {
  for (const y of [-Infinity, -1, -0, 0, 1, Infinity]) {
    const atan2 = Math.atan2(y, x);
    const atan = Math.atan(y / x);
    if (!Object.is(atan2, atan)) {
      console.log(format`| ${x} | ${y} | ${atan2} | ${atan} |`);
    }
  }
}
```

Kết quả xuất ra:

```plain
| x     | y     | atan2 | atan  |
|-------|-------|-------|-------|
| -∞    | -∞    | -3π/4 | NaN   |
| -∞    | -1    | -π    | 0     |
| -∞    | -0    | -π    | 0     |
| -∞    | 0     | π     | -0    |
| -∞    | 1     | π     | -0    |
| -∞    | ∞     | 3π/4  | NaN   |
| -1    | -∞    | -π/2  | π/2   |
| -1    | -1    | -3π/4 | π/4   |
| -1    | -0    | -π    | 0     |
| -1    | 0     | π     | -0    |
| -1    | 1     | 3π/4  | -π/4  |
| -1    | ∞     | π/2   | -π/2  |
| -0    | -∞    | -π/2  | π/2   |
| -0    | -1    | -π/2  | π/2   |
| -0    | -0    | -π    | NaN   |
| -0    | 0     | π     | NaN   |
| -0    | 1     | π/2   | -π/2  |
| -0    | ∞     | π/2   | -π/2  |
| 0     | -0    | -0    | NaN   |
| 0     | 0     | 0     | NaN   |
| ∞     | -∞    | -π/4  | NaN   |
| ∞     | ∞     | π/4   | NaN   |
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.acos()")}}
- {{jsxref("Math.asin()")}}
- {{jsxref("Math.atan()")}}
- {{jsxref("Math.cos()")}}
- {{jsxref("Math.sin()")}}
- {{jsxref("Math.tan()")}}
- CSS {{cssxref("atan2()")}} function
