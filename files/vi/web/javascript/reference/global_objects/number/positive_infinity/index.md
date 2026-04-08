---
title: Number.POSITIVE_INFINITY
short-title: POSITIVE_INFINITY
slug: Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Number.POSITIVE_INFINITY
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Number.POSITIVE_INFINITY`** biểu diễn giá trị vô cực dương.

{{InteractiveExample("JavaScript Demo: Number.POSITIVE_INFINITY")}}

```js interactive-example
function checkNumber(bigNumber) {
  if (bigNumber === Number.POSITIVE_INFINITY) {
    return "Process number as Infinity";
  }
  return bigNumber;
}

console.log(checkNumber(Number.MAX_VALUE));
// Expected output: 1.7976931348623157e+308

console.log(checkNumber(Number.MAX_VALUE * 2));
// Expected output: "Process number as Infinity"
```

## Giá trị

Giống với giá trị của thuộc tính {{jsxref("Infinity")}} toàn cục.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Giá trị `Number.POSITIVE_INFINITY` hoạt động hơi khác so với vô cực toán học:

- Bất kỳ giá trị dương nào, kể cả `POSITIVE_INFINITY`, nhân với `POSITIVE_INFINITY` là `POSITIVE_INFINITY`.
- Bất kỳ giá trị âm nào, kể cả {{jsxref("Number/NEGATIVE_INFINITY", "NEGATIVE_INFINITY")}}, nhân với `POSITIVE_INFINITY` là {{jsxref("Number/NEGATIVE_INFINITY", "NEGATIVE_INFINITY")}}.
- Bất kỳ số dương nào chia cho `POSITIVE_INFINITY` là [không dương](https://en.wikipedia.org/wiki/Signed_zero) (như định nghĩa trong [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754)).
- Bất kỳ số âm nào chia cho `POSITIVE_INFINITY` là [không âm](https://en.wikipedia.org/wiki/Signed_zero) (như định nghĩa trong [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754).
- Không nhân với `POSITIVE_INFINITY` là {{jsxref("NaN")}}.
- {{jsxref("NaN")}} nhân với `POSITIVE_INFINITY` là {{jsxref("NaN")}}.
- `POSITIVE_INFINITY` chia cho bất kỳ giá trị âm nào trừ {{jsxref("Number/NEGATIVE_INFINITY", "NEGATIVE_INFINITY")}} là {{jsxref("Number/NEGATIVE_INFINITY", "NEGATIVE_INFINITY")}}.
- `POSITIVE_INFINITY` chia cho bất kỳ giá trị dương nào trừ `POSITIVE_INFINITY` là `POSITIVE_INFINITY`.
- `POSITIVE_INFINITY` chia cho {{jsxref("Number/NEGATIVE_INFINITY", "NEGATIVE_INFINITY")}} hoặc `POSITIVE_INFINITY` là {{jsxref("NaN")}}.
- `Number.POSITIVE_INFINITY > x` là true với mọi số _x_ không phải `POSITIVE_INFINITY`.

Bạn có thể sử dụng thuộc tính `Number.POSITIVE_INFINITY` để chỉ ra điều kiện lỗi trả về một số hữu hạn khi thành công. Tuy nhiên, {{jsxref("NaN")}} sẽ phù hợp hơn trong trường hợp đó.

Vì `POSITIVE_INFINITY` là thuộc tính tĩnh của {{jsxref("Number")}}, bạn luôn sử dụng nó là `Number.POSITIVE_INFINITY`, thay vì là thuộc tính của một giá trị số.

## Ví dụ

### Sử dụng POSITIVE_INFINITY

Trong ví dụ sau, biến `bigNumber` được gán một giá trị lớn hơn giá trị tối đa. Khi lệnh {{jsxref("Statements/if...else", "if")}} thực thi, `bigNumber` có giá trị `Infinity`, vì vậy `bigNumber` được đặt thành một giá trị dễ quản lý hơn trước khi tiếp tục.

```js
let bigNumber = Number.MAX_VALUE * 2;

if (bigNumber === Number.POSITIVE_INFINITY) {
  bigNumber = returnFinite();
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.NEGATIVE_INFINITY")}}
- {{jsxref("Number.isFinite()")}}
- {{jsxref("Infinity")}}
- {{jsxref("isFinite()")}}
