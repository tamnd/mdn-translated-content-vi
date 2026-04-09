---
title: AuthenticatorAssertionResponse
slug: Web/API/AuthenticatorAssertionResponse
page-type: web-api-interface
browser-compat: api.AuthenticatorAssertionResponse
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Giao diện **`AuthenticatorAssertionResponse`** của [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) chứa một [chữ ký số](/en-US/docs/Glossary/Signature/Security) từ khóa riêng của một thông tin xác thực WebAuthn cụ thể. Máy chủ của bên dựa vào (relying party) có thể xác minh chữ ký này để xác thực người dùng, ví dụ khi họ đăng nhập.

Một thể hiện đối tượng `AuthenticatorAssertionResponse` có trong thuộc tính {{domxref("PublicKeyCredential.response", "response")}} của đối tượng {{domxref("PublicKeyCredential")}} được trả về bởi lệnh gọi {{domxref("CredentialsContainer.get()", "navigator.credentials.get()")}} thành công.

Giao diện này kế thừa từ {{domxref("AuthenticatorResponse")}}.

{{InheritanceDiagram}}

> [!NOTE]
> Giao diện này bị giới hạn trong các ngữ cảnh cấp cao nhất. Việc dùng nó bên trong phần tử {{HTMLElement("iframe")}} sẽ không có tác dụng.

## Thuộc tính thể hiện

_Đồng thời kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("AuthenticatorResponse")}}._

- {{domxref("AuthenticatorAssertionResponse.authenticatorData")}} {{ReadOnlyInline}}
  - : Một {{jsxref("ArrayBuffer")}} chứa thông tin từ authenticator, chẳng hạn như mã băm Relying Party ID (rpIdHash), bộ đếm chữ ký, kết quả kiểm tra sự hiện diện của người dùng và các cờ xác minh người dùng, cùng mọi tiện ích mở rộng mà authenticator đã xử lý.
- {{domxref("AuthenticatorResponse.clientDataJSON")}} {{ReadOnlyInline}}
  - : Chứa bản tuần tự hóa tương thích JSON của dữ liệu được truyền từ trình duyệt tới authenticator để xác thực bằng thông tin xác thực này, tức là khi {{domxref("CredentialsContainer.get()")}} được gọi với tùy chọn `publicKey`. Dữ liệu này chứa một phần thông tin từ các tùy chọn truyền vào lệnh gọi `get()`, và một phần thông tin do trình duyệt kiểm soát.
- {{domxref("AuthenticatorAssertionResponse.signature")}} {{ReadOnlyInline}}
  - : Một chữ ký xác nhận trên {{domxref("AuthenticatorAssertionResponse.authenticatorData")}} và {{domxref("AuthenticatorResponse.clientDataJSON")}}. Chữ ký xác nhận được tạo bằng khóa riêng của cặp khóa đã được tạo trong lệnh gọi {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} ban đầu và được xác minh bằng khóa công khai của chính cặp khóa đó.
- {{domxref("AuthenticatorAssertionResponse.userHandle")}} {{ReadOnlyInline}}
  - : Một {{jsxref("ArrayBuffer")}} chứa một mã định danh người dùng không minh bạch, được chỉ định dưới dạng `user.id` trong các tùy chọn truyền vào lệnh gọi {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} ban đầu.

## Phương thức thể hiện

Không có.

## Ví dụ

Xem [Truy xuất thông tin xác thực khóa công khai](/en-US/docs/Web/API/CredentialsContainer/get#retrieving_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AuthenticatorAttestationResponse")}}: giao diện cho kiểu phản hồi được cung cấp khi tạo thông tin xác thực mới
- {{domxref("AuthenticatorResponse")}}: giao diện cha
