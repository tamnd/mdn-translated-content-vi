---
title: AesGcmParams
slug: Web/API/AesGcmParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-AesGcmParams
---

{{ APIRef("Web Crypto API") }}

**`AesGcmParams`** là một dictionary của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API), đại diện cho đối tượng cần truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi dùng thuật toán [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm).

Để biết chi tiết về cách cung cấp các giá trị phù hợp cho tham số này, xem đặc tả cho AES-GCM: [NIST SP800-38D](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38d.pdf), đặc biệt là mục 5.2.1.1 về Dữ liệu đầu vào.

## Thuộc tính thể hiện

- `name`
  - : Một chuỗi. Giá trị này phải được đặt thành `AES-GCM`.
- `iv`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa vector khởi tạo. Giá trị này phải là duy nhất cho mọi thao tác mã hóa thực hiện với cùng một khóa. Nói cách khác: không bao giờ tái sử dụng IV với cùng một khóa. Đặc tả AES-GCM khuyến nghị IV nên dài 96 bit và thường chứa các bit từ một bộ sinh số ngẫu nhiên. [Mục 8.2 của đặc tả](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38d.pdf#%5B%7B%22num%22%3A65%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C0%2C792%2Cnull%5D) trình bày các phương pháp tạo IV. Lưu ý rằng IV không cần phải bí mật, chỉ cần duy nhất: vì vậy, ví dụ, việc truyền nó công khai cùng với thông điệp đã mã hóa là hoàn toàn chấp nhận được.
- `additionalData` {{optional_inline}}
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}. Đây là dữ liệu bổ sung sẽ không được mã hóa nhưng sẽ được xác thực cùng với dữ liệu đã mã hóa. Nếu `additionalData` được cung cấp ở đây thì cùng dữ liệu đó cũng phải được cung cấp trong lời gọi tương ứng tới [`decrypt()`](/en-US/docs/Web/API/SubtleCrypto/decrypt): nếu dữ liệu truyền vào lời gọi `decrypt()` không khớp với dữ liệu gốc, quá trình giải mã sẽ ném ra một ngoại lệ. Điều này cho bạn một cách để xác thực dữ liệu liên quan mà không cần mã hóa nó.

    Độ dài bit của `additionalData` phải nhỏ hơn `2^64 - 1`.

    Thuộc tính `additionalData` là tùy chọn và có thể bị bỏ qua mà không làm ảnh hưởng đến an toàn của thao tác mã hóa.

- `tagLength` {{optional_inline}}
  - : Một `Number`. Giá trị này quyết định kích thước, tính bằng bit, của thẻ xác thực được tạo trong thao tác mã hóa và được dùng để xác thực trong quá trình giải mã tương ứng.

    Đặc tả [Web Crypto API](https://w3c.github.io/webcrypto/#aes-gcm-operations-encrypt) yêu cầu giá trị này phải là một trong các giá trị sau: 32, 64, 96, 104, 112, 120, hoặc 128. Mặt khác, đặc tả AES-GCM khuyến nghị giá trị nên là 96, 104, 112, 120, hoặc 128, dù 32 hoặc 64 bit có thể chấp nhận được trong một số ứng dụng. Để biết thêm hướng dẫn, xem [Phụ lục C](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38d.pdf#%5B%7B%22num%22%3A92%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C0%2C792%2Cnull%5D) của ấn phẩm NIST về "Recommendation for Block Cipher Modes of Operation".

    `tagLength` là tùy chọn và mặc định là 128 nếu không được chỉ định.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.encrypt()")}} và {{domxref("SubtleCrypto.decrypt()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "AES-GCM" cho các phương thức {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} sẽ hỗ trợ kiểu này.

## Xem thêm

- {{domxref("SubtleCrypto.encrypt()")}}.
- {{domxref("SubtleCrypto.decrypt()")}}.
- {{domxref("SubtleCrypto.wrapKey()")}}.
- {{domxref("SubtleCrypto.unwrapKey()")}}.
