---
title: Pbkdf2Params
slug: Web/API/Pbkdf2Params
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-Pbkdf2Params
---

{{ APIRef("Web Crypto API") }}

Dictionary **`Pbkdf2Params`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng nên được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.deriveKey()")}} khi sử dụng thuật toán [PBKDF2](/en-US/docs/Web/API/SubtleCrypto/deriveKey#pbkdf2).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên được đặt thành `PBKDF2`.
- `hash`
  - : Một chuỗi hoặc một đối tượng chứa một thuộc tính duy nhất có tên `name` với giá trị chuỗi. Đây là định danh cho [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest) để sử dụng. Nên là một trong các giá trị sau:
    - `SHA-256`: chọn thuật toán [SHA-256](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-384`: chọn thuật toán [SHA-384](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-512`: chọn thuật toán [SHA-512](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).

    > [!WARNING]
    > `SHA-1` được coi là dễ bị tấn công trong hầu hết các ứng dụng mật mã, nhưng vẫn được coi là an toàn trong PBKDF2. Tuy nhiên, nên tránh sử dụng nó ở mọi nơi, vì vậy trừ khi bạn cần dùng `SHA-1`, đừng sử dụng. Hãy sử dụng thuật toán digest khác thay thế.

- `salt`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}. Nên là một giá trị ngẫu nhiên hoặc giả ngẫu nhiên có ít nhất 16 byte. Không giống như tài liệu khóa đầu vào được truyền vào [`deriveKey()`](/en-US/docs/Web/API/SubtleCrypto/deriveKey), `salt` không cần phải giữ bí mật.
- `iterations`
  - : Một `Number` đại diện cho số lần hàm hash sẽ được thực thi trong `deriveKey()`. Điều này xác định mức độ tốn kém về mặt tính toán (tức là chậm) của thao tác `deriveKey()`. Trong ngữ cảnh này, chậm là tốt vì nó làm cho tốn kém hơn cho kẻ tấn công khi chạy {{Glossary("dictionary attack")}} chống lại các khóa. Hướng dẫn chung ở đây là sử dụng nhiều lần lặp nhất có thể, với điều kiện duy trì mức hiệu suất chấp nhận được cho ứng dụng của bạn.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.deriveKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "PBKDF2" cho phương thức {{domxref("SubtleCrypto.deriveKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.deriveKey()")}}.
