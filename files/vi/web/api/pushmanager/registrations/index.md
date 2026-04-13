---
title: "PushManager: phương thức registrations()"
short-title: registrations()
slug: Web/API/PushManager/registrations
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.PushManager.registrations
---

{{ApiRef("Push API")}}{{deprecated_header}}{{non-standard_header}}{{AvailableInWorkers}}

Phương thức **`registrations`** được dùng để hỏi hệ thống về các đăng ký endpoint đẩy hiện có.

> [!NOTE]
> Phương thức này đã được thay thế bởi {{domxref("PushManager.getSubscription()")}}.

## Cú pháp

```js-nolint
registrations()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `DOMRequest` để xử lý thành công hoặc thất bại của lời gọi phương thức.

Nếu lời gọi phương thức thành công, `result` của request sẽ là một mảng các đối tượng [PushRegistration](#pushregistration).

### PushRegistration

Các object này là các object JavaScript vô danh với những thuộc tính sau:

- `pushEndpoint`
  - : Một chuỗi biểu thị URL của endpoint.
- `version`
  - : Phiên bản hiện tại của endpoint đẩy.

## Ví dụ

```js
const req = navigator.push.registrations();

req.onsuccess = (e) => {
  if (req.result.length > 0) {
    req.result.forEach((result) => {
      console.log(
        `Existing registration ${result.pushEndpoint} ${result.version}`,
      );
    });
    // Tái sử dụng các endpoint hiện có.
  } else {
    // Đăng ký một endpoint mới.
    const register = navigator.push.register();
    register.onsuccess = (e) => {
      console.log(`Registered new endpoint: ${register.result}`);
    };
  }
};
```

## Thông số kỹ thuật

Tính năng này không còn thuộc bất kỳ đặc tả nào nữa. Nó không còn nằm trong lộ trình để trở thành một tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PushManager")}}
