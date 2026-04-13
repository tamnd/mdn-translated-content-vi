---
title: Crypto
slug: Web/API/Crypto
page-type: web-api-interface
browser-compat: api.Crypto
---

{{APIRef("Web Crypto API")}}{{AvailableInWorkers}}

Giao diện **`Crypto`** biểu diễn các tính năng mật mã cơ bản có sẵn trong ngữ cảnh hiện tại.
Nó cho phép truy cập vào một bộ sinh số ngẫu nhiên đủ mạnh về mặt mật mã và các nguyên hàm mật mã.

`Crypto` có sẵn trong window thông qua thuộc tính {{domxref("Window.crypto")}} và trong worker thông qua thuộc tính {{domxref("WorkerGlobalScope.crypto")}}.

## Thuộc tính thể hiện

- {{domxref("Crypto.subtle")}} {{ReadOnlyInline}} {{SecureContext_inline}}
  - : Trả về một đối tượng {{domxref("SubtleCrypto")}}, cung cấp quyền truy cập vào các nguyên hàm mật mã phổ biến, như băm, ký, mã hóa hoặc giải mã.

## Phương thức thể hiện

- {{domxref("Crypto.getRandomValues()")}}
  - : Điền các giá trị ngẫu nhiên đủ an toàn về mặt mật mã vào {{ jsxref("TypedArray") }} được truyền vào.
- {{domxref("Crypto.randomUUID()")}} {{SecureContext_inline}}
  - : Trả về một UUID v4 được tạo ngẫu nhiên với độ dài 36 ký tự.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bảo mật web](/en-US/docs/Web/Security)
- [Ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts)
- [Các tính năng bị giới hạn trong ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts)
- [Bảo mật tầng vận chuyển](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security)
- [Strict-Transport-Security](/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security)
