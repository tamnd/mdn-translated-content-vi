---
title: Math.random()
short-title: random()
slug: Web/JavaScript/Reference/Global_Objects/Math/random
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.random
sidebar: jsref
---

Phương thức tĩnh **`Math.random()`** trả về một số thực dấu phẩy động giả ngẫu nhiên lớn hơn hoặc bằng 0 và nhỏ hơn 1, với phân phối gần đều trên khoảng đó — bạn có thể nhân với phạm vi mong muốn. Quá trình triển khai chọn seed ban đầu cho thuật toán tạo số ngẫu nhiên; người dùng không thể chọn hoặc đặt lại seed này.

> [!NOTE]
> `Math.random()` _không_ cung cấp số ngẫu nhiên an toàn về mặt mật mã. Không dùng cho bất kỳ thứ gì liên quan đến bảo mật. Thay vào đó, hãy dùng Web Crypto API, cụ thể là phương thức {{domxref("Crypto.getRandomValues()")}}.

{{InteractiveExample("JavaScript Demo: Math.random()")}}

```js interactive-example
function getRandomInt(max) {
  return Math.floor(Math.random() * max);
}

console.log(getRandomInt(3));
// Expected output: 0, 1 or 2

console.log(getRandomInt(1));
// Expected output: 0

console.log(Math.random());
// Expected output: a number from 0 to <1
```

## Cú pháp

```js-nolint
Math.random()
```

### Tham số

Không có.

### Giá trị trả về

Một số thực dấu phẩy động giả ngẫu nhiên trong khoảng từ 0 (bao gồm) đến 1 (không bao gồm).

## Ví dụ

Lưu ý rằng vì các số trong JavaScript là số thực dấu phẩy động IEEE 754 với hành vi làm tròn về chẵn, các phạm vi trong các hàm bên dưới (trừ hàm cho chính `Math.random()`) không hoàn toàn chính xác. Thông thường, giới hạn trên đã nêu không thể đạt được, nhưng nếu `Math.random()` trả về số rất gần 1, khoảng cách nhỏ có thể không biểu diễn được ở giá trị lớn nhất yêu cầu, khiến giới hạn trên có thể bị đạt đến.

### Lấy số ngẫu nhiên từ 0 (bao gồm) đến 1 (không bao gồm)

```js
function getRandom() {
  return Math.random();
}
```

### Lấy số ngẫu nhiên giữa hai giá trị

Ví dụ này trả về số ngẫu nhiên giữa các giá trị đã chỉ định. Giá trị trả về không nhỏ hơn (và có thể bằng) `min`, và nhỏ hơn (và khác) `max`.

```js
function getRandomArbitrary(min, max) {
  return Math.random() * (max - min) + min;
}
```

### Lấy số nguyên ngẫu nhiên giữa hai giá trị

Ví dụ này trả về số _nguyên_ ngẫu nhiên giữa các giá trị đã chỉ định. Giá trị không nhỏ hơn `min` (hoặc số nguyên lớn hơn `min` tiếp theo nếu `min` không phải số nguyên), và nhỏ hơn (nhưng khác) `max`.

```js
function getRandomInt(min, max) {
  const minCeiled = Math.ceil(min);
  const maxFloored = Math.floor(max);
  return Math.floor(Math.random() * (maxFloored - minCeiled) + minCeiled); // The maximum is exclusive and the minimum is inclusive
}
```

> [!NOTE]
> Có thể bạn muốn dùng [`Math.round()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round) để thực hiện điều này, nhưng làm vậy sẽ khiến các số ngẫu nhiên của bạn tuân theo phân phối không đồng đều, điều này có thể không phù hợp với nhu cầu của bạn.

### Lấy số nguyên ngẫu nhiên giữa hai giá trị, bao gồm cả hai đầu mút

Trong khi hàm `getRandomInt()` ở trên bao gồm giá trị tối thiểu nhưng không bao gồm giá trị tối đa, hàm `getRandomIntInclusive()` bên dưới bao gồm cả hai đầu mút.

```js
function getRandomIntInclusive(min, max) {
  const minCeiled = Math.ceil(min);
  const maxFloored = Math.floor(max);
  return Math.floor(Math.random() * (maxFloored - minCeiled + 1) + minCeiled); // The maximum is inclusive and the minimum is inclusive
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Crypto.getRandomValues()")}}
