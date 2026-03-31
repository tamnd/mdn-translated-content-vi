---
title: Number.NEGATIVE_INFINITY
short-title: NEGATIVE_INFINITY
slug: Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Number.NEGATIVE_INFINITY
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Number.NEGATIVE_INFINITY`** biểu diễn giá trị vô cực âm.

{{InteractiveExample("JavaScript Demo: Number.NEGATIVE_INFINITY")}}

```js interactive-example
function checkNumber(smallNumber) {
  if (smallNumber === Number.NEGATIVE_INFINITY) {
    return "Process number as -Infinity";
  }
  return smallNumber;
}

console.log(checkNumber(-Number.MAX_VALUE));
// Expected output: -1.7976931348623157e+308

console.log(checkNumber(-Number.MAX_VALUE * 2));
// Expected output: "Process number as -Infinity"
```

## Giá trị

Giống với giá trị âm của thuộc tính {{jsxref("Infinity")}} toàn cục.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Giá trị `Number.NEGATIVE_INFINITY` hoạt động hơi khác so với vô cực toán học:

- Bất kỳ giá trị dương nào, kể cả {{jsxref("Number/POSITIVE_INFINITY", "POSITIVE_INFINITY")}}, nhân với `NEGATIVE_INFINITY` là `NEGATIVE_INFINITY`.
- Bất kỳ giá trị âm nào, kể cả `NEGATIVE_INFINITY`, nhân với `NEGATIVE_INFINITY` là {{jsxref("Number/POSITIVE_INFINITY", "POSITIVE_INFINITY")}}.
- Bất kỳ giá trị dương nào chia cho `NEGATIVE_INFINITY` là [không âm](https://en.wikipedia.org/wiki/Signed_zero) (như định nghĩa trong [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754)).
- Bất kỳ giá trị âm nào chia cho `NEGATIVE_INFINITY` là [không dương](https://en.wikipedia.org/wiki/Signed_zero) (như định nghĩa trong [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754)).
- Không nhân với `NEGATIVE_INFINITY` là {{jsxref("NaN")}}.
- {{jsxref("NaN")}} nhân với `NEGATIVE_INFINITY` là {{jsxref("NaN")}}.
- `NEGATIVE_INFINITY` chia cho bất kỳ giá trị âm nào trừ `NEGATIVE_INFINITY` là {{jsxref("Number/POSITIVE_INFINITY", "POSITIVE_INFINITY")}}.
- `NEGATIVE_INFINITY` chia cho bất kỳ giá trị dương nào trừ {{jsxref("Number/POSITIVE_INFINITY", "POSITIVE_INFINITY")}} là `NEGATIVE_INFINITY`.
- `NEGATIVE_INFINITY` chia cho `NEGATIVE_INFINITY` hoặc {{jsxref("Number/POSITIVE_INFINITY", "POSITIVE_INFINITY")}} là {{jsxref("NaN")}}.
- `x > Number.NEGATIVE_INFINITY` là true với mọi số _x_ không phải `NEGATIVE_INFINITY`.

Bạn có thể sử dụng thuộc tính `Number.NEGATIVE_INFINITY` để chỉ ra điều kiện lỗi trả về một số hữu hạn khi thành công. Tuy nhiên, {{jsxref("NaN")}} sẽ phù hợp hơn trong trường hợp đó.

Vì `NEGATIVE_INFINITY` là thuộc tính tĩnh của {{jsxref("Number")}}, bạn luôn sử dụng nó là `Number.NEGATIVE_INFINITY`, thay vì là thuộc tính của một giá trị số.

## Ví dụ

### Sử dụng NEGATIVE_INFINITY

Trong ví dụ sau, biến `smallNumber` được gán một giá trị nhỏ hơn giá trị tối thiểu. Khi lệnh {{jsxref("Statements/if...else", "if")}} thực thi, `smallNumber` có giá trị `-Infinity`, vì vậy `smallNumber` được đặt thành một giá trị dễ quản lý hơn trước khi tiếp tục.

```js
let smallNumber = -Number.MAX_VALUE * 2;

if (smallNumber === Number.NEGATIVE_INFINITY) {
  smallNumber = returnFinite();
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.POSITIVE_INFINITY")}}
- {{jsxref("Number.isFinite()")}}
- {{jsxref("Infinity")}}
- {{jsxref("isFinite()")}}
