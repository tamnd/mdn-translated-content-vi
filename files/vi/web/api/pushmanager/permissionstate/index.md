---
title: "PushManager: phương thức permissionState()"
short-title: permissionState()
slug: Web/API/PushManager/permissionState
page-type: web-api-instance-method
browser-compat: api.PushManager.permissionState
---

{{ApiRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`permissionState()`** của giao diện {{domxref("PushManager")}} trả về một {{jsxref("Promise")}} giải quyết thành một chuỗi biểu thị trạng thái quyền của push manager. Các giá trị có thể là `'prompt'`, `'denied'` hoặc `'granted'`.

> [!NOTE]
> Tính đến Firefox 44, quyền cho [Notifications](/en-US/docs/Web/API/Notifications_API) và [Push](/en-US/docs/Web/API/Push_API) đã được gộp lại. Nếu quyền được cấp cho notifications, push cũng sẽ được bật.

## Cú pháp

```js-nolint
permissionState()
permissionState(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object chứa các tham số cấu hình tùy chọn. Nó có thể có các thuộc tính sau:
    - `userVisibleOnly`
      - : Một giá trị boolean cho biết subscription đẩy trả về sẽ chỉ được dùng cho các thông điệp có hiệu ứng được hiển thị cho người dùng.
    - `applicationServerKey`
      - : Một public key mà máy chủ đẩy của bạn sẽ dùng để gửi thông điệp tới các ứng dụng client thông qua push server. Giá trị này là một phần của cặp signing key được máy chủ ứng dụng tạo ra và có thể dùng với elliptic curve digital signature (ECDSA) trên đường cong P-256.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành một chuỗi có giá trị `'prompt'`, `'denied'` hoặc `'granted'`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
