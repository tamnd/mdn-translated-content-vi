---
title: Credential Management API
slug: Web/API/Credential_Management_API
page-type: web-api-overview
browser-compat:
  - api.Credential
  - api.CredentialsContainer
  - api.FederatedCredential
  - api.PasswordCredential
spec-urls: https://w3c.github.io/webappsec-credential-management/
---

{{DefaultAPISidebar("Credential Management API")}}{{securecontext_header}}

Credential Management API cho phép một trang web tạo, lưu trữ và truy xuất {{glossary("credential", "thông tin xác thực")}}. Thông tin xác thực là một mục cho phép hệ thống đưa ra quyết định {{glossary("authentication", "xác thực")}}: ví dụ, để quyết định có đăng nhập người dùng vào một tài khoản hay không. Ta có thể xem nó như một bằng chứng mà người dùng trình bày với trang web để chứng minh rằng họ thực sự là người mà họ đang nhận là.

## Khái niệm và cách dùng

Giao diện trung tâm là {{domxref("CredentialsContainer")}}, được truy cập thông qua thuộc tính {{domxref("navigator.credentials")}} và cung cấp ba chức năng chính:

- {{domxref("CredentialsContainer.create", "create()")}}: tạo một thông tin xác thực mới.
- {{domxref("CredentialsContainer.store", "store()")}}: lưu một thông tin xác thực mới trên máy cục bộ.
- {{domxref("CredentialsContainer.get", "get()")}}: truy xuất một thông tin xác thực, sau đó có thể dùng để đăng nhập người dùng.

API này hỗ trợ bốn loại thông tin xác thực khác nhau, tất cả đều được biểu diễn dưới dạng lớp con của {{domxref("Credential")}}:

| Loại                        | Giao diện                                                                                          |
| --------------------------- | -------------------------------------------------------------------------------------------------- |
| Mật khẩu                    | {{domxref("PasswordCredential")}}                                                                  |
| Danh tính liên kết          | {{domxref("IdentityCredential")}}, {{domxref("FederatedCredential")}} (không còn được khuyến nghị) |
| Mật khẩu dùng một lần (OTP) | {{domxref("OTPCredential")}}                                                                       |
| Xác thực Web                | {{domxref("PublicKeyCredential")}}                                                                 |

Trang hướng dẫn [Các loại thông tin xác thực](/vi/docs/Web/API/Credential_Management_API/Credential_types) cung cấp phần tổng quan về các loại thông tin xác thực khác nhau và cách chúng được sử dụng.

## Giao diện

- {{domxref("Credential")}}
  - : Cung cấp thông tin về một thực thể như điều kiện tiên quyết cho một quyết định tin cậy.
- {{domxref("CredentialsContainer")}}
  - : Phơi bày các phương thức để yêu cầu thông tin xác thực và thông báo cho tác nhân người dùng khi các sự kiện đáng chú ý xảy ra, chẳng hạn như đăng nhập hoặc đăng xuất thành công. Giao diện này có thể truy cập qua `navigator.credentials`.
- {{domxref("FederatedCredential")}}
  - : Cung cấp thông tin về thông tin xác thực từ một nhà cung cấp danh tính liên kết, là một thực thể mà trang web tin tưởng để xác thực người dùng một cách chính xác và cung cấp API cho mục đích đó. [OpenID Connect](https://openid.net/developers/specs/) là một ví dụ của dạng khuôn khổ này.
- {{domxref("PasswordCredential")}}
  - : Cung cấp thông tin về một cặp tên người dùng/mật khẩu.

### Phần mở rộng cho các giao diện khác

- {{domxref("Navigator.credentials")}} {{ReadOnlyInline}}
  - : Trả về giao diện {{domxref("CredentialsContainer")}}, giao diện này phơi bày các phương thức để yêu cầu thông tin xác thực và thông báo cho tác nhân người dùng khi các sự kiện đáng chú ý xảy ra, chẳng hạn như đăng nhập hoặc đăng xuất thành công.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web Authentication API", "", "", "nocode")}}
- {{domxref("WebOTP API", "", "", "nocode")}}
- {{domxref("FedCM API", "Federated Credential Management (FedCM) API", "", "nocode")}}
