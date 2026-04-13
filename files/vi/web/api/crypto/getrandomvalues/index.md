---
title: "Crypto: phương thức getRandomValues()"
short-title: getRandomValues()
slug: Web/API/Crypto/getRandomValues
page-type: web-api-instance-method
browser-compat: api.Crypto.getRandomValues
---

{{APIRef("Web Crypto API")}}{{AvailableInWorkers}}

Phương thức **`Crypto.getRandomValues()`** cho phép bạn lấy các giá trị ngẫu nhiên đủ mạnh về mặt mật mã.
Mảng được truyền làm tham số sẽ được điền bằng các số ngẫu nhiên (ngẫu nhiên theo nghĩa mật mã).

Để bảo đảm hiệu năng đủ tốt, các cách triển khai không dùng bộ sinh số ngẫu nhiên thực sự mà dùng bộ sinh số giả ngẫu nhiên được _khởi tạo hạt giống_ bằng một giá trị có đủ entropy.
Thuật toán bộ sinh số giả ngẫu nhiên (PRNG) có thể khác nhau giữa các {{Glossary("user agent", "trình duyệt")}}, nhưng phù hợp cho mục đích mật mã.

`getRandomValues()` là thành viên duy nhất của giao diện `Crypto` có thể dùng từ ngữ cảnh không bảo mật.

## Cú pháp

```js-nolint
getRandomValues(typedArray)
```

### Tham số

- `typedArray`
  - : Một {{jsxref("TypedArray")}} dựa trên số nguyên, có thể là một trong các kiểu sau: {{jsxref("Int8Array")}}, {{jsxref("Uint8Array")}},
    {{jsxref("Uint8ClampedArray")}}, {{jsxref("Int16Array")}}, {{jsxref("Uint16Array")}},
    {{jsxref("Int32Array")}}, {{jsxref("Uint32Array")}}, {{jsxref("BigInt64Array")}},
    {{jsxref("BigUint64Array")}} (nhưng **không phải** `Float16Array`, `Float32Array` hay `Float64Array`).
    Tất cả phần tử trong mảng sẽ bị ghi đè bằng các số ngẫu nhiên.

### Giá trị trả về

Chính mảng đã được truyền vào dưới dạng `typedArray`, nhưng nội dung của nó được thay bằng các số ngẫu nhiên mới sinh ra.
Lưu ý rằng `typedArray` được sửa đổi tại chỗ và không tạo bản sao.

### Ngoại lệ

- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu {{jsxref("TypedArray.byteLength", "byteLength")}} của `typedArray` vượt quá 65.536.

## Ghi chú về cách dùng

Hãy ưu tiên phương thức {{domxref("SubtleCrypto.generateKey", "generateKey()")}} để tạo khóa, vì phương thức này được bảo đảm chạy trong ngữ cảnh bảo mật.

Đặc tả Web Cryptography không quy định mức entropy tối thiểu bắt buộc.
Thay vào đó, các trình duyệt được khuyến nghị cung cấp entropy tốt nhất có thể khi tạo số ngẫu nhiên,
bằng cách dùng một bộ sinh số giả ngẫu nhiên được xác định rõ ràng và hiệu quả tích hợp ngay trong trình duyệt,
nhưng được khởi tạo hạt giống bằng các giá trị lấy từ một nguồn số giả ngẫu nhiên bên ngoài, chẳng hạn như
hàm sinh số ngẫu nhiên đặc thù của nền tảng, thiết bị Unix `/dev/urandom`, hoặc nguồn dữ liệu ngẫu nhiên hay giả ngẫu nhiên khác.

## Ví dụ

```js
const array = new Uint32Array(10);
self.crypto.getRandomValues(array);

console.log("Your lucky numbers:");
for (const num of array) {
  console.log(num);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- {{jsxref("Math.random")}}, một nguồn tạo số ngẫu nhiên không dùng cho mật mã.
