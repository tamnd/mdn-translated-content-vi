---
title: Web Crypto API
slug: Web/API/Web_Crypto_API
page-type: web-api-overview
browser-compat: api.Crypto
---

{{DefaultAPISidebar("Web Crypto API")}}{{securecontext_header}}{{AvailableInWorkers}}

**Web Crypto API** là một giao diện cho phép script sử dụng các primitive mật mã để xây dựng hệ thống có dùng mật mã.

Một số trình duyệt trước đây đã triển khai một giao diện gọi là {{domxref("Crypto")}} mà chưa được định nghĩa rõ ràng hoặc không an toàn về mặt mật mã.
Để tránh nhầm lẫn, các phương thức và thuộc tính của giao diện này đã bị loại bỏ khỏi các trình duyệt triển khai Web Crypto API, và mọi phương thức của Web Crypto API đều có sẵn trên một giao diện mới: {{domxref("SubtleCrypto")}}.
Thuộc tính {{domxref("Crypto.subtle")}} cung cấp quyền truy cập vào một đối tượng triển khai nó.

> [!WARNING]
> Web Crypto API cung cấp một số primitive mật mã cấp thấp. Rất dễ dùng sai chúng, và các cạm bẫy liên quan có thể rất tinh vi.
>
> Ngay cả khi giả định bạn dùng đúng các hàm mật mã cơ bản, việc quản lý khóa an toàn và thiết kế hệ thống bảo mật tổng thể vẫn cực kỳ khó làm đúng, và thường thuộc phạm vi của các chuyên gia bảo mật.
>
> Sai sót trong thiết kế và triển khai hệ thống bảo mật có thể khiến bảo mật của hệ thống hoàn toàn vô hiệu.
>
> Hãy học và thử nghiệm, nhưng đừng bảo đảm hoặc ngụ ý tính an toàn của sản phẩm bạn làm ra trước khi một người am hiểu chủ đề này xem xét kỹ lưỡng. [Crypto 101 Course](https://www.crypto101.io/) có thể là một nơi tốt để bắt đầu tìm hiểu về thiết kế và triển khai hệ thống an toàn.

## Giao diện

- {{domxref("Crypto")}}
  - : Cung cấp các tính năng mật mã cơ bản, chẳng hạn bộ sinh số ngẫu nhiên đủ mạnh về mặt mật mã, và quyền truy cập vào các primitive mật mã thông qua đối tượng {{domxref("SubtleCrypto")}}.
    Một đối tượng kiểu này có thể được truy cập trong global scope bằng {{domxref("Window.crypto")}} hoặc {{domxref("WorkerGlobalScope.crypto")}}.
- {{domxref("SubtleCrypto")}}
  - : Đại diện cho một đối tượng cung cấp các hàm mật mã cấp thấp cho việc tạo khóa, mã hóa, giải mã, bọc và mở khóa, v.v.
- {{domxref("CryptoKey")}}
  - : Đại diện cho một {{glossary("key", "khóa mật mã")}} thu được từ một trong các phương thức của {{domxref("SubtleCrypto")}} như {{domxref("SubtleCrypto.generateKey", "generateKey()")}}, {{domxref("SubtleCrypto.deriveKey", "deriveKey()")}}, {{domxref("SubtleCrypto.importKey", "importKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey", "unwrapKey()")}}.

### Các dictionary

- {{domxref("AesCbcParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi dùng thuật toán [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc).
- {{domxref("AesCtrParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi dùng thuật toán [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr).
- {{domxref("AesGcmParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi dùng thuật toán [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm).
- {{domxref("AesKeyGenParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.generateKey()")}} khi tạo khóa AES, tức là khi thuật toán được xác định là một trong [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc), [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr), [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm), hoặc [AES-KW](/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw).
- {{domxref("CryptoKeyPair")}}
  - : Đại diện cho một cặp khóa công khai và riêng tư dùng cho thuật toán mật mã bất đối xứng.
- {{domxref("EcKeyGenParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.generateKey()")}} khi tạo bất kỳ cặp khóa dựa trên đường cong elliptic nào, tức là khi thuật toán được xác định là [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa) hoặc [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh).
- {{domxref("EcKeyImportParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.importKey()")}} hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi tạo bất kỳ cặp khóa dựa trên đường cong elliptic nào, tức là khi thuật toán được xác định là [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa) hoặc [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh).
- {{domxref("EcdhKeyDeriveParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.deriveKey()")}} khi dùng thuật toán [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh).
- {{domxref("EcdsaParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.sign()")}} hoặc {{domxref("SubtleCrypto.verify()")}} khi dùng thuật toán [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa).
- {{domxref("HkdfParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.deriveKey()")}} khi dùng thuật toán [HKDF](/en-US/docs/Web/API/SubtleCrypto/deriveKey#hkdf).
- {{domxref("HmacImportParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.importKey()")}} hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi tạo khóa cho thuật toán [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac).
- {{domxref("HmacKeyGenParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.generateKey()")}} khi tạo khóa cho thuật toán [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac).
- {{domxref("Pbkdf2Params")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.deriveKey()")}} khi dùng thuật toán [PBKDF2](/en-US/docs/Web/API/SubtleCrypto/deriveKey#pbkdf2).
- {{domxref("RsaHashedImportParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.importKey()")}} hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi nhập bất kỳ cặp khóa dựa trên RSA nào, tức là khi thuật toán được xác định là [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5), [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss), hoặc [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep).
- {{domxref("RsaHashedKeyGenParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.generateKey()")}} khi tạo bất kỳ cặp khóa dựa trên RSA nào, tức là khi thuật toán được xác định là [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5), [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss), hoặc [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep).
- {{domxref("RsaOaepParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi dùng thuật toán [RSA_OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep).
- {{domxref("RsaPssParams")}}
  - : Đại diện cho đối tượng nên được truyền vào tham số `algorithm` cho {{domxref("SubtleCrypto.sign()")}} hoặc {{domxref("SubtleCrypto.verify()")}} khi dùng thuật toán [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss).

### Phần mở rộng cho các giao diện khác

- {{domxref("Window.crypto")}}
  - : Đại diện cho đối tượng {{domxref("Crypto")}} gắn với global object trong phạm vi luồng chính.
- {{domxref("WorkerGlobalScope.crypto")}}
  - : Đại diện cho đối tượng {{domxref("Crypto")}} gắn với global object trong phạm vi worker.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
