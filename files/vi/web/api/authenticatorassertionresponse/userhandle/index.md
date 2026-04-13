---
title: "AuthenticatorAssertionResponse: thuộc tính userHandle"
short-title: userHandle
slug: Web/API/AuthenticatorAssertionResponse/userHandle
page-type: web-api-instance-property
browser-compat: api.AuthenticatorAssertionResponse.userHandle
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`userHandle`** của giao diện {{domxref("AuthenticatorAssertionResponse")}} là một đối tượng {{jsxref("ArrayBuffer")}} cung cấp một mã định danh không minh bạch cho người dùng tương ứng. Máy chủ của bên dựa vào có thể dùng mã định danh này để liên kết tài khoản người dùng với các thông tin xác thực tương ứng và dữ liệu khác của họ.

Giá trị này được chỉ định dưới dạng `user.id` trong các tùy chọn truyền vào lệnh gọi {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} ban đầu.

## Giá trị

Một đối tượng {{jsxref("ArrayBuffer")}} biểu diễn mã định danh cho người dùng hiện tại. Giá trị này không nhằm để con người đọc được. Bên dựa vào nên bảo đảm rằng `user.id` được truyền vào lệnh gọi `create()` ban đầu **không** chứa bất kỳ thông tin nhận dạng cá nhân nào (ví dụ tên người dùng, email hoặc số điện thoại).

Đối với các lệnh gọi {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} được thực hiện với thuộc tính `allowCredentials` không rỗng, `userHandle` được trả về có thể là `null`.

## Ví dụ

Xem [Truy xuất thông tin xác thực khóa công khai](/en-US/docs/Web/API/CredentialsContainer/get#retrieving_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CredentialsContainer.create()")}} thiết lập giá trị của thuộc tính này
