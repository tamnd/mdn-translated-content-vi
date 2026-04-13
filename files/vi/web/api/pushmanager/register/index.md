---
title: "PushManager: phương thức register()"
short-title: register()
slug: Web/API/PushManager/register
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.PushManager.register
---

{{ApiRef("Push API")}}{{deprecated_header}}{{non-standard_header}}{{AvailableInWorkers}}

Phương thức **`register`** được dùng để yêu cầu hệ thống tạo một endpoint mới cho notifications.

> [!NOTE]
> Phương thức này đã được thay thế bởi {{domxref("PushManager.subscribe()")}}.

## Cú pháp

```js-nolint
register()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `DOMRequest` để xử lý thành công hoặc thất bại của lời gọi phương thức.

Nếu lời gọi phương thức thành công, `result` của request sẽ là một chuỗi, chính là URL của endpoint.

> [!NOTE]
> Nếu bạn không cần URL nữa, hãy dùng {{domxref("PushManager.unregister()")}} để dọn dẹp sau đó.

## Ví dụ

```js
const req = navigator.push.register();

req.onsuccess = (e) => {
  const endpoint = req.result;
  console.log(`New endpoint: ${endpoint}`);
};

req.onerror = (e) => {
  console.error(`Error getting a new endpoint: ${e.error}`);
};
```

## Thông số kỹ thuật

Tính năng này không thuộc bất kỳ đặc tả nào. Nó không còn nằm trong lộ trình để trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PushManager")}}
