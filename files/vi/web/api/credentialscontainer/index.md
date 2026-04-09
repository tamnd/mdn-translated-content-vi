---
title: CredentialsContainer
slug: Web/API/CredentialsContainer
page-type: web-api-interface
browser-compat: api.CredentialsContainer
---

{{APIRef("Credential Management API")}}{{securecontext_header}}

Giao diện **`CredentialsContainer`** của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API) cung cấp các phương thức để yêu cầu thông tin xác thực và thông báo cho user agent khi các sự kiện như đăng nhập hoặc đăng xuất thành công xảy ra. Có thể truy cập giao diện này từ {{domxref('Navigator.credentials')}}.

## Thuộc tính thể hiện

Không có.

## Phương thức thể hiện

- {{domxref("CredentialsContainer.create()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với một thể hiện {{domxref("Credential")}} mới dựa trên các tùy chọn đã cung cấp, hoặc `null` nếu không thể tạo đối tượng `Credential`. Trong các trường hợp ngoại lệ, {{jsxref("Promise")}} có thể bị từ chối.
- {{domxref("CredentialsContainer.get()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với thể hiện {{domxref("Credential")}} khớp với các tham số đã cung cấp.
- {{domxref("CredentialsContainer.preventSilentAccess()")}}
  - : Đặt một cờ xác định xem có cho phép đăng nhập tự động trong các lần truy cập sau vào origin hiện tại hay không, rồi trả về một {{jsxref("Promise")}} rỗng. Ví dụ, bạn có thể gọi phương thức này sau khi người dùng đăng xuất khỏi một trang web để bảo đảm rằng họ sẽ không bị tự động đăng nhập trong lần truy cập tiếp theo. Các phiên bản trước của đặc tả gọi phương thức này là `requireUserMediation()`. Xem [Tính tương thích của trình duyệt](#browser_compatibility) để biết chi tiết hỗ trợ.
- {{domxref("CredentialsContainer.store()")}}
  - : Lưu một bộ thông tin xác thực cho người dùng bên trong một thể hiện {{domxref("Credential")}} được cung cấp và trả về chính thể hiện đó trong một {{jsxref("Promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích của trình duyệt

{{Compat}}
