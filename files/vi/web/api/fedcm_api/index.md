---
title: Federated Credential Management (FedCM) API
slug: Web/API/FedCM_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.IdentityCredential
---

{{SeeCompatTable}}{{DefaultAPISidebar("FedCM API")}}

**Federated Credential Management API** (hay _FedCM API_) cung cấp một cơ chế tiêu chuẩn để các {{glossary("Identity provider", "nhà cung cấp danh tính")}} (IdP) triển khai các dịch vụ liên danh tính trên web theo cách bảo vệ quyền riêng tư, mà không cần sử dụng [cookie của bên thứ ba](/vi/docs/Web/Privacy/Guides/Third-party_cookies) và chuyển hướng. Điều này bao gồm một JavaScript API cho phép sử dụng xác thực liên danh cho các hoạt động như đăng nhập hoặc đăng ký trên một trang web.

## Các khái niệm FedCM

Liên danh tính là việc ủy quyền xác thực người dùng từ một trang web yêu cầu đăng ký hoặc đăng nhập người dùng, chẳng hạn như trang thương mại điện tử hoặc mạng xã hội (còn gọi là {{glossary("Relying party", "bên dựa vào")}} hay RP), đến một nhà cung cấp danh tính đáng tin cậy của bên thứ ba (IdP) như Google, Facebook/Meta, GitHub, v.v.

Các RP có thể tích hợp với các IdP, cho phép người dùng đăng nhập bằng các tài khoản đã đăng ký với IdP. Việc liên danh tính thông qua một nhóm nhỏ các IdP chuyên dụng đã cải thiện khả năng xác thực trên web về mặt bảo mật, sự tin tưởng của người dùng và trải nghiệm người dùng, so với việc mỗi trang tự quản lý việc đăng nhập với tên người dùng và mật khẩu riêng.

Vấn đề là liên danh tính truyền thống dựa vào {{htmlelement("iframe")}}, chuyển hướng và cookie của bên thứ ba, những tính năng này cũng được sử dụng để theo dõi người dùng của bên thứ ba. Các trình duyệt đang hạn chế việc sử dụng các tính năng này nhằm bảo vệ quyền riêng tư của người dùng, nhưng hệ quả là khiến các trường hợp sử dụng hợp lệ, không theo dõi trở nên khó triển khai hơn, trong đó có liên danh tính.

Điều này ảnh hưởng đến đăng nhập liên danh nói chung, cũng như các trường hợp sử dụng liên danh tính cụ thể hơn:

- [OIDC front-channel logout](https://openid.net/specs/openid-connect-frontchannel-1_0.html): Luồng này yêu cầu IDP nhúng nhiều `<iframe>` RP, vốn dựa vào cookie RP.
- Social Widgets: Để cung cấp các widget xã hội, cookie của bên thứ ba IdP phải được cung cấp từ nguồn gốc cấp cao nhất của RP.
- Personalized buttons: Việc hiển thị thông tin đăng nhập được cá nhân hóa trên {{htmlelement("button")}} trong nguồn gốc RP được triển khai dưới dạng `<iframe>` IdP yêu cầu cookie của bên thứ ba.
- Làm mới phiên mà không cần điều hướng cấp cao nhất hoặc cửa sổ popup.

FedCM nhằm giải quyết vấn đề này, cung cấp một cơ chế chuyên dụng cho các luồng liên danh tính trên web, và cho phép các trình duyệt hỗ trợ cung cấp các phần tử UI đặc biệt trên RP, cho phép người dùng chọn một tài khoản IdP để sử dụng khi đăng nhập.

Có hai phần khi sử dụng FedCM API, được đề cập trong các hướng dẫn liên kết bên dưới:

1. [Tích hợp IdP với FedCM](/vi/docs/Web/API/FedCM_API/IDP_integration) — những gì nhà cung cấp danh tính cần cung cấp để RP có thể tích hợp với nó.
2. [Đăng nhập liên danh RP](/vi/docs/Web/API/FedCM_API/RP_sign-in) — chức năng FedCM mà RP cần sử dụng để đăng nhập người dùng bằng tài khoản IdP của họ. Một yêu cầu đăng nhập liên danh FedCM được khởi tạo bằng phương thức {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}}.

> [!NOTE]
> [Google Sign In](https://developers.google.com/identity/gsi/web/guides/overview) là một ví dụ về IdP đã hỗ trợ FedCM. [Di chuyển sang FedCM](https://developers.google.com/identity/gsi/web/guides/fedcm-migration) cung cấp hướng dẫn cho các RP muốn di chuyển ứng dụng hiện có sử dụng Google Sign In sang đăng nhập liên danh.

## Tích hợp Permissions Policy và hỗ trợ `<iframe>`

{{httpheader("Permissions-Policy/identity-credentials-get", "identity-credentials-get")}} [Permissions-Policy](/vi/docs/Web/HTTP/Guides/Permissions_Policy) có thể được sử dụng để kiểm soát quyền sử dụng FedCM.
Cụ thể hơn, nó cho phép sử dụng các phương thức sau:

- {{domxref("CredentialsContainer.get()")}}
- {{domxref("IdentityCredential.disconnect_static", "IdentityCredential.disconnect()")}}
- {{domxref("IdentityProvider.getUserInfo_static", "IdentityProvider.getUserInfo()")}}

Nhà phát triển có thể cấp quyền rõ ràng cho {{htmlelement("iframe")}} sử dụng FedCM thông qua thuộc tính `allow`:

```html
<iframe src="3rd-party.example" allow="identity-credentials-get"></iframe>
```

Việc khả dụng của FedCM trong `<iframe>` cho phép một số trường hợp sử dụng:

- Các trang web lớn hơn sẽ không muốn script đăng nhập của bên thứ ba giành quyền kiểm soát khung cấp cao nhất; thay vào đó họ muốn thêm script đó và gọi FedCM từ bên trong {{htmlelement("iframe")}}.
- Một số `<iframe>` có thể tự yêu cầu xác thực liên danh.

## Interface

- {{domxref("IdentityCredential")}}
  - : Đại diện cho thông tin xác thực danh tính người dùng phát sinh từ việc xác thực liên danh thành công. Một lệnh gọi {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}} thành công bao gồm tùy chọn `identity` sẽ trả về một phiên bản {{domxref("IdentityCredential")}}.
- {{domxref("IdentityCredentialError")}}
  - : Đại diện cho lỗi xác thực cho biết tác nhân người dùng không nhận được xác nhận danh tính sau khi người dùng yêu cầu xác thực bằng thông tin xác thực liên danh.
- {{domxref("IdentityProvider")}}
  - : Đại diện cho một IdP và cung cấp quyền truy cập vào thông tin cũng như chức năng liên quan.
- {{domxref("NavigatorLogin")}}
  - : Định nghĩa chức năng đăng nhập cho IdP, bao gồm phương thức {{domxref("NavigatorLogin.setStatus", "Navigator.login.setStatus()")}} để [cập nhật trạng thái đăng nhập IdP](/vi/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api).

## Mở rộng cho các interface khác

- {{domxref("CredentialsContainer.get()")}}, tùy chọn `identity`.
  - : `identity` là một đối tượng chứa chi tiết về IdP liên danh mà trang web bên dựa vào (RP) có thể sử dụng để đăng nhập người dùng. Nó khiến lệnh gọi `get()` khởi tạo yêu cầu để người dùng đăng nhập vào RP bằng IdP.
- {{domxref("Navigator.login")}}
  - : Cung cấp quyền truy cập vào đối tượng {{domxref("NavigatorLogin")}} của trình duyệt.

## Tiêu đề HTTP

- {{httpheader("Set-Login")}}
  - : Cung cấp cơ chế HTTP để [cập nhật trạng thái đăng nhập](/vi/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api) qua HTTP.

## Ví dụ

Về mã ví dụ, xem:

- [Triển khai giải pháp danh tính với FedCM ở phía Nhà cung cấp danh tính](https://developer.chrome.com/docs/identity/fedcm/implement/identity-provider) trên developer.chrome.com (2025)
- [Triển khai giải pháp danh tính với FedCM ở phía Bên dựa vào](https://developer.chrome.com/docs/identity/fedcm/implement/relying-party) trên developer.chrome.com (2025)

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview)
