---
title: Nhận dạng liên kết
slug: Glossary/Federated_identity
page-type: glossary-definition
sidebar: glossarysidebar
---

**Hệ thống danh tính liên kết** (federated identity system) là hệ thống trong đó {{glossary("identity provider","nhà cung cấp danh tính (IdP)")}} đóng vai trò trung gian giữa người dùng và {{glossary("relying party","các bên phụ thuộc")}}, cho phép người dùng sử dụng một tập hợp {{glossary("credential","thông tin xác thực")}} duy nhất để xác thực với nhiều bên phụ thuộc khác nhau.

Theo truyền thống, trên web, người dùng đăng nhập vào một trang web bằng tên người dùng và mật khẩu, và mật khẩu được trang web xác minh so với bản sao được lưu trữ đúng cách (được {{glossary("hash function","băm")}} và {{glossary("salt","thêm muối")}} đúng cách) trên backend của trang web.

Trong mô hình này, nếu người dùng có nhiều tài khoản trên các trang web khác nhau, họ phải nhớ nhiều mật khẩu, và điều này khuyến khích các thực hành mật khẩu kém như sử dụng cùng một mật khẩu cho nhiều tài khoản.

Trong hệ thống danh tính liên kết, nhà cung cấp danh tính:

- quản lý thông tin xác thực của người dùng và có thể xác thực người dùng
- được nhiều trang web tin tưởng để đưa ra các xác nhận về danh tính của người dùng.

Người dùng sau đó có thể xác thực với nhà cung cấp danh tính, nhà cung cấp sẽ trả về một token cho trình duyệt của người dùng nếu xác thực thành công. Trình duyệt của người dùng sẽ gửi token đến trang web, trang web có thể xác minh rằng token đã được phát hành bởi IdP. Nếu xác minh thành công, trang web có thể đăng nhập người dùng.

Danh tính liên kết thường được cung cấp như một dịch vụ bởi các tập đoàn: ví dụ, người dùng có tài khoản Google, Microsoft hoặc Facebook có thể sử dụng chúng để đăng nhập vào nhiều trang web. Các trang web thường phải triển khai quy trình xác minh token đặc thù cho nhà cung cấp danh tính. Tuy nhiên, các tiêu chuẩn mở như [OpenID](https://en.wikipedia.org/wiki/OpenID), [OAuth](https://en.wikipedia.org/wiki/OAuth) và [SAML](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language) được sử dụng rộng rãi trong việc triển khai các hệ thống danh tính liên kết.

[Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API) cung cấp cơ chế bảo vệ quyền riêng tư được chuẩn hóa cho danh tính liên kết trên web.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Relying party")}}
  - {{glossary("Identity provider")}}
- [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API)
