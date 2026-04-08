---
title: Math.acos()
short-title: acos()
slug: Web/JavaScript/Reference/Global_Objects/Math/acos
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.acos
sidebar: jsref
---

Phương thức tĩnh **`Math.acos()`** trả về arccos (tính bằng radian) của một số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>∀</mo><mi>x</mi><mo>∊</mo><mo stretchy="false">[</mo><mrow><mo>−</mo><mn>1</mn></mrow><mo>,</mo><mn>1</mn><mo stretchy="false">]</mo><mo>,</mo><mspace width="0.2777777777777778em"></mspace><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚊𝚌𝚘𝚜</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><mo lspace="0em" rspace="0em">arccos</mo><mo stretchy="false">(</mo><mi>x</mi><mo stretchy="false">)</mo><mo>=</mo><mtext>the unique&nbsp;</mtext><mi>y</mi><mo>∊</mo><mo stretchy="false">[</mo><mn>0</mn><mo>,</mo><mi>π</mi><mo stretchy="false">]</mo><mtext>&nbsp;such that&nbsp;</mtext><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>y</mi><mo stretchy="false">)</mo><mo>=</mo><mi>x</mi></mrow><annotation encoding="TeX">\forall x \in [{-1}, 1],\;\mathtt{\operatorname{Math.acos}(x)} = \arccos(x) = \text{the unique } y \in [0, \pi] \text{ such that } \cos(y) = x</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.acos()")}}

```js interactive-example
// Calculates angle of a right-angle triangle in radians
function calcAngle(adjacent, hypotenuse) {
  return Math.acos(adjacent / hypotenuse);
}

console.log(calcAngle(8, 10));
// Expected output: 0.6435011087932843

console.log(calcAngle(5, 3));
// Expected output: NaN
```

## Cú pháp

```js-nolint
Math.acos(x)
```

### Tham số

- `x`
  - : Một số trong khoảng từ -1 đến 1 (bao gồm hai đầu mút), biểu thị giá trị cosine của góc.

### Giá trị trả về

Arccos (góc tính bằng radian, trong khoảng từ 0 đến π bao gồm hai đầu mút) của `x`. Nếu `x` nhỏ hơn -1 hoặc lớn hơn 1, trả về {{jsxref("NaN")}}.

## Mô tả

Vì `acos()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.acos()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.acos()

```js
Math.acos(-2); // NaN
Math.acos(-1); // 3.141592653589793 (π)
Math.acos(0); // 1.5707963267948966 (π/2)
Math.acos(0.5); // 1.0471975511965979 (π/3)
Math.acos(1); // 0
Math.acos(2); // NaN
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.asin()")}}
- {{jsxref("Math.atan()")}}
- {{jsxref("Math.atan2()")}}
- {{jsxref("Math.cos()")}}
- {{jsxref("Math.sin()")}}
- {{jsxref("Math.tan()")}}
- CSS {{cssxref("acos()")}} function
