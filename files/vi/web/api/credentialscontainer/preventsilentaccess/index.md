---
title: "Phương thức CredentialsContainer: preventSilentAccess()"
short-title: preventSilentAccess()
slug: Web/API/CredentialsContainer/preventSilentAccess
page-type: web-api-instance-method
browser-compat: api.CredentialsContainer.preventSilentAccess
---

{{APIRef("Credential Management API")}}{{SecureContext_Header}}

Phương thức **`preventSilentAccess()`** của giao diện {{domxref("CredentialsContainer")}} đặt một cờ xác định xem có cho phép đăng nhập tự động trong các lần truy cập sau vào origin hiện tại hay không, rồi trả về một {{jsxref("Promise")}} được giải quyết thành `undefined`.
Ví dụ, bạn có thể gọi phương thức này sau khi người dùng đăng xuất khỏi một trang web để bảo đảm rằng họ sẽ không bị tự động đăng nhập trong lần truy cập tiếp theo.
Việc dàn xếp thay đổi theo từng origin, đồng thời đóng vai trò như một điểm kiểm tra bổ sung đối với các thông tin xác thực được trình duyệt lưu trữ, để thông báo cho người dùng về trạng thái đăng nhập của một tài khoản. Phương thức này thường được gọi sau khi người dùng đăng xuất khỏi một trang web, nhằm bảo đảm thông tin đăng nhập của người dùng đó sẽ không tự động được chuyển tiếp trong lần truy cập trang tiếp theo.

Khi dùng {{domxref("PublicKeyCredential")}}, phương thức này thường không có tác dụng; các authenticator như vậy thường yêu cầu người dùng tương tác. Tuy nhiên, _vẫn có thể_ một số authenticator nhất định bị loại trừ, trong khi nếu không thì chúng có thể đã hoạt động một cách im lặng.

Các phiên bản trước của đặc tả gọi phương thức này là `requireUserMediation()`.
Phần [Tính tương thích của trình duyệt](/en-US/docs/Web/API/CredentialsContainer#browser_compatibility) có chi tiết về mức độ hỗ trợ.

## Cú pháp

```js-nolint
preventSilentAccess()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành `undefined`.

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích của trình duyệt

{{Compat}}
