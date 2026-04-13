---
title: "NavigatorLogin: phương thức setStatus()"
short-title: setStatus()
slug: Web/API/NavigatorLogin/setStatus
page-type: web-api-instance-method
browser-compat: api.NavigatorLogin.setStatus
---

{{securecontext_header}}{{APIRef("FedCM API")}}

Phương thức **`setStatus()`** của giao diện {{domxref("NavigatorLogin")}} đặt trạng thái đăng nhập của nhà cung cấp danh tính liên kết (IdP), khi được gọi từ origin của IdP. Theo "trạng thái đăng nhập", chúng ta có nghĩa là "liệu có người dùng nào đăng nhập vào IdP trên trình duyệt hiện tại hay không". Phương thức này nên được gọi bởi trang IdP sau khi người dùng đăng nhập hoặc đăng xuất.

Trình duyệt lưu trữ trạng thái này cho từng IdP; [FedCM API](/en-US/docs/Web/API/FedCM_API) sau đó sử dụng nó để giảm số lượng yêu cầu gửi đến IdP (vì không cần lãng phí thời gian yêu cầu tài khoản khi không có người dùng nào đăng nhập vào IdP). Nó cũng giảm thiểu [các cuộc tấn công timing tiềm ẩn](https://github.com/w3c-fedid/FedCM/issues/447).

Xem [Cập nhật trạng thái đăng nhập bằng Login Status API](/en-US/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api) để biết thêm thông tin về trạng thái đăng nhập FedCM.

## Cú pháp

```js-nolint
setStatus(status)
```

### Tham số

- `status`
  - : Một chuỗi đại diện cho trạng thái đăng nhập cần đặt cho IdP. Các giá trị có thể là:
    - `"logged-in"`: IdP có ít nhất một tài khoản người dùng đã đăng nhập.
    - `"logged-out"`: Tất cả tài khoản người dùng IdP hiện đang đăng xuất.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với `undefined`.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu miền gọi không nằm trong khung mà toàn bộ phân cấp lồng nhau là same-origin. Dù được gọi từ khung chính, một `<iframe>` lồng trong khung chính, hay một `<iframe>` khác lồng một hoặc nhiều cấp sâu hơn trong `<iframe>` đầu tiên, _tất cả_ các cấp của phân cấp lồng nhau phải cùng origin để cuộc gọi thành công.

## Ví dụ

```js
/* Set logged-in status */
navigator.login.setStatus("logged-in");

/* Set logged-out status */
navigator.login.setStatus("logged-out");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API)
