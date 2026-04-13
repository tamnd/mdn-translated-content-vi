---
title: AesCtrParams
slug: Web/API/AesCtrParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-AesCtrParams
---

{{ APIRef("Web Crypto API") }}

**`AesCtrParams`** là một dictionary của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API), đại diện cho đối tượng cần truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi dùng thuật toán [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr).

AES là một bộ mã khối, nghĩa là nó chia thông điệp thành các khối và mã hóa từng khối một. Trong chế độ CTR, mỗi khi một khối của thông điệp được mã hóa, một khối dữ liệu bổ sung sẽ được trộn vào. Khối bổ sung này được gọi là "counter block".

Giá trị của một counter block đã cho tuyệt đối không được dùng quá một lần với cùng một khóa:

- Với một thông điệp dài _n_ khối, phải dùng một counter block khác nhau cho mỗi khối.
- Nếu cùng một khóa được dùng để mã hóa nhiều hơn một thông điệp, phải dùng một counter block khác nhau cho tất cả các khối trên tất cả các thông điệp.

Thông thường, điều này được thực hiện bằng cách chia giá trị counter block ban đầu thành hai phần nối tiếp nhau:

- Một {{Glossary("Nonce", "nonce")}} (tức là một số chỉ được dùng một lần). Phần nonce của khối giữ nguyên cho mọi khối trong thông điệp. Mỗi khi có một thông điệp mới cần được mã hóa, một nonce mới sẽ được chọn. Nonce không cần phải bí mật, nhưng không được tái sử dụng với cùng một khóa.
- Một bộ đếm. Phần này của khối được tăng lên mỗi khi một khối được mã hóa.

Hiểu một cách đơn giản: nonce phải đảm bảo counter block không bị tái sử dụng từ thông điệp này sang thông điệp khác, còn bộ đếm phải đảm bảo counter block không bị tái sử dụng trong cùng một thông điệp.

> [!NOTE]
> Xem [Phụ lục B của tiêu chuẩn NIST SP800-38A](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf#%5B%7B%22num%22%3A70%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22Fit%22%7D%5D) để biết thêm thông tin.

## Thuộc tính thể hiện

- `name`
  - : Một chuỗi. Giá trị này phải được đặt thành `AES-CTR`.
- `counter`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} - giá trị ban đầu của counter block. Giá trị này phải dài 16 byte (kích thước khối AES). `length` bit ngoài cùng bên phải của khối này được dùng cho bộ đếm, còn phần còn lại được dùng cho nonce. Ví dụ, nếu `length` được đặt thành 64, thì nửa đầu của `counter` là nonce và nửa sau được dùng cho bộ đếm.
- `length`
  - : Một `Number` - số bit trong counter block được dùng cho bộ đếm thực sự. Bộ đếm phải đủ lớn để không bị tràn: nếu thông điệp dài `n` khối và bộ đếm dài `m` bit, thì điều kiện sau phải đúng: `n <= 2^m`. Tiêu chuẩn [NIST SP800-38A](https://csrc.nist.gov/pubs/sp800/38/a/final), vốn định nghĩa CTR, gợi ý rằng bộ đếm nên chiếm một nửa counter block (xem [Phụ lục B.2](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf#%5B%7B%22num%22%3A73%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22Fit%22%7D%5D)), vì vậy với AES thì nó sẽ là 64.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.encrypt()")}} và {{domxref("SubtleCrypto.decrypt()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "AES-CTR" cho các phương thức {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} sẽ hỗ trợ kiểu này.

## Xem thêm

- Chế độ CTR được định nghĩa trong mục 6.5 của [tiêu chuẩn NIST SP800-38A](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf#%5B%7B%22num%22%3A70%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22Fit%22%7D%5D).
- {{domxref("SubtleCrypto.encrypt()")}}.
- {{domxref("SubtleCrypto.decrypt()")}}.
- {{domxref("SubtleCrypto.wrapKey()")}}.
- {{domxref("SubtleCrypto.unwrapKey()")}}.
