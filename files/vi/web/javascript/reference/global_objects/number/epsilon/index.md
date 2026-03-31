---
title: Number.EPSILON
short-title: EPSILON
slug: Web/JavaScript/Reference/Global_Objects/Number/EPSILON
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Number.EPSILON
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Number.EPSILON`** biểu diễn sự khác biệt giữa 1 và số dấu phẩy động nhỏ nhất lớn hơn 1.

{{InteractiveExample("JavaScript Demo: Number.EPSILON")}}

```js interactive-example
const result = Math.abs(0.2 - 0.3 + 0.1);

console.log(result);
// Expected output: 2.7755575615628914e-17

console.log(result < Number.EPSILON);
// Expected output: true
```

## Giá trị

2<sup>-52</sup>, hay xấp xỉ `2.2204460492503130808472633361816E-16`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

`Number.EPSILON` là sự khác biệt giữa 1 và số tiếp theo lớn hơn có thể biểu diễn trong định dạng Number, vì [định dạng dấu phẩy động độ chính xác đôi](https://en.wikipedia.org/wiki/Double_precision_floating-point_format) chỉ có 52 bit để biểu diễn [phần định trị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_encoding), và bit thấp nhất có giá trị 2<sup>-52</sup>.

Lưu ý rằng độ chính xác tuyệt đối của số dấu phẩy động giảm khi số lớn hơn, vì số mũ tăng trong khi độ chính xác của phần định trị vẫn như cũ. {{jsxref("Number.MIN_VALUE")}} là số dương nhỏ nhất có thể biểu diễn, nhỏ hơn nhiều so với `Number.EPSILON`.

Vì `EPSILON` là thuộc tính tĩnh của {{jsxref("Number")}}, bạn luôn sử dụng nó là `Number.EPSILON`, thay vì là thuộc tính của một giá trị số.

## Ví dụ

### Kiểm tra sự bằng nhau

Bất kỳ hệ thống mã hóa số nào chiếm hữu một số bit hữu hạn, dù cơ số nào bạn chọn (ví dụ: thập phân hoặc nhị phân), đều _nhất thiết_ không thể biểu diễn chính xác tất cả các số, vì bạn đang cố gắng biểu diễn một số điểm vô hạn trên đường số bằng một lượng bộ nhớ hữu hạn. Ví dụ, hệ cơ số 10 (thập phân) không thể biểu diễn chính xác 1/3, và hệ cơ số 2 (nhị phân) không thể biểu diễn chính xác `0.1`. Do đó, ví dụ `0.1 + 0.2` không bằng chính xác `0.3`:

```js
console.log(0.1 + 0.2); // 0.30000000000000004
console.log(0.1 + 0.2 === 0.3); // false
```

Vì lý do này, thường được khuyến nghị rằng **các số dấu phẩy động không bao giờ nên được so sánh với `===`**. Thay vào đó, chúng ta có thể coi hai số là bằng nhau nếu chúng _đủ gần_ nhau. Hằng số `Number.EPSILON` thường là một ngưỡng hợp lý cho lỗi nếu phép tính xung quanh độ lớn của `1`, vì `EPSILON` về bản chất xác định độ chính xác của số "1".

```js
function equal(x, y) {
  return Math.abs(x - y) < Number.EPSILON;
}

const x = 0.2;
const y = 0.3;
const z = 0.1;
console.log(equal(x + z, y)); // true
```

Tuy nhiên, `Number.EPSILON` không phù hợp cho bất kỳ phép tính nào hoạt động trên độ lớn lớn hơn. Nếu dữ liệu của bạn ở độ lớn 10<sup>3</sup>, phần thập phân sẽ có độ chính xác nhỏ hơn nhiều so với `Number.EPSILON`:

```js
function equal(x, y) {
  return Math.abs(x - y) < Number.EPSILON;
}

const x = 1000.1;
const y = 1000.2;
const z = 2000.3;
console.log(x + y); // 2000.3000000000002; error of 10^-13 instead of 10^-16
console.log(equal(x + y, z)); // false
```

Trong trường hợp này, cần một ngưỡng chấp nhận lỗi lớn hơn. Vì các số được so sánh có độ lớn khoảng `2000`, một hệ số nhân như `2000 * Number.EPSILON` tạo ra đủ ngưỡng chấp nhận cho trường hợp này.

```js
function equal(x, y, tolerance = Number.EPSILON) {
  return Math.abs(x - y) < tolerance;
}

const x = 1000.1;
const y = 1000.2;
const z = 2000.3;
console.log(equal(x + y, z, 2000 * Number.EPSILON)); // true
```

Ngoài độ lớn, điều quan trọng là phải xem xét _độ chính xác_ của đầu vào. Ví dụ, nếu các số được thu thập từ đầu vào biểu mẫu và giá trị đầu vào chỉ có thể điều chỉnh theo bước `0.1` (tức là [`<input type="number" step="0.1">`](/en-US/docs/Web/HTML/Reference/Attributes/step)), thường hợp lý hơn khi cho phép ngưỡng lớn hơn nhiều, chẳng hạn như `0.01`, vì dữ liệu chỉ có độ chính xác `0.1`.

> [!NOTE]
> Điều quan trọng cần ghi nhớ: đừng chỉ đơn giản sử dụng `Number.EPSILON` làm ngưỡng kiểm tra sự bằng nhau. Hãy sử dụng ngưỡng phù hợp với độ lớn và độ chính xác của các số bạn đang so sánh.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.EPSILON` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.EPSILON`](https://www.npmjs.com/package/es-constants)
- {{jsxref("Number")}}
