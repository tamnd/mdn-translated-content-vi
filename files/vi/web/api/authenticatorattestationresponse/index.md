---
title: AuthenticatorAttestationResponse
slug: Web/API/AuthenticatorAttestationResponse
page-type: web-api-interface
browser-compat: api.AuthenticatorAttestationResponse
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Giao diện **`AuthenticatorAttestationResponse`** của [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) là kết quả của việc đăng ký thông tin xác thực WebAuthn. Nó chứa thông tin về thông tin xác thực mà máy chủ cần để thực hiện các phép xác nhận WebAuthn, chẳng hạn như mã định danh thông tin xác thực và khóa công khai của nó.

Một đối tượng `AuthenticatorAttestationResponse` có sẵn trong thuộc tính {{domxref("PublicKeyCredential.response", "response")}} của đối tượng {{domxref("PublicKeyCredential")}} được trả về từ lệnh gọi {{domxref("CredentialsContainer.create()")}} thành công.

Giao diện này kế thừa từ {{domxref("AuthenticatorResponse")}}.

{{InheritanceDiagram}}

> [!NOTE]
> Giao diện này bị giới hạn trong các ngữ cảnh cấp cao nhất. Việc dùng các tính năng của nó bên trong phần tử {{HTMLElement("iframe")}} sẽ không có tác dụng.

## Thuộc tính thực thể

_Đồng thời kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("AuthenticatorResponse")}}._

- {{domxref("AuthenticatorAttestationResponse.attestationObject")}} {{ReadOnlyInline}}
  - : Một {{jsxref("ArrayBuffer")}} chứa dữ liệu authenticator và một attestation statement cho cặp khóa mới do authenticator tạo ra.

- {{domxref("AuthenticatorResponse.clientDataJSON")}} {{ReadOnlyInline}}
  - : Được kế thừa từ {{domxref("AuthenticatorResponse")}}, thuộc tính này chứa biểu diễn tuần tự tương thích JSON của dữ liệu được truyền từ trình duyệt tới authenticator để tạo thông tin xác thực này, tức là khi {{domxref("CredentialsContainer.create()")}} được gọi với tùy chọn `publicKey`. Dữ liệu này chứa một phần thông tin từ các tùy chọn được truyền vào lệnh gọi `create()`, và một phần thông tin do trình duyệt kiểm soát.

## Phương thức thực thể

- {{domxref("AuthenticatorAttestationResponse.getAuthenticatorData()")}}
  - : Trả về một {{jsxref("ArrayBuffer")}} chứa dữ liệu authenticator nằm trong thuộc tính {{domxref("AuthenticatorAttestationResponse.attestationObject")}}.
- {{domxref("AuthenticatorAttestationResponse.getPublicKey()")}}
  - : Trả về một {{jsxref("ArrayBuffer")}} chứa `SubjectPublicKeyInfo` dạng DER của thông tin xác thực mới (xem [Subject Public Key Info](https://www.rfc-editor.org/rfc/rfc5280#section-4.1.2.7)), hoặc `null` nếu không có sẵn.
- {{domxref("AuthenticatorAttestationResponse.getPublicKeyAlgorithm()")}}
  - : Trả về một số bằng với một [COSE Algorithm Identifier](https://www.iana.org/assignments/cose/cose.xhtml#algorithms), biểu thị thuật toán mật mã được dùng cho thông tin xác thực mới.
- {{domxref("AuthenticatorAttestationResponse.getTransports()")}}
  - : Trả về một mảng chuỗi mô tả các phương thức truyền tải nào (ví dụ: `usb`, `nfc`) được cho là được authenticator hỗ trợ. Mảng có thể rỗng nếu thông tin này không có sẵn.

## Ví dụ

Xem [Creating a public key credential](/en-US/docs/Web/API/CredentialsContainer/create#creating_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AuthenticatorAssertionResponse")}}: giao diện cho kiểu phản hồi được cung cấp khi truy xuất một thông tin xác thực hiện có
- {{domxref("AuthenticatorResponse")}}: giao diện cha
