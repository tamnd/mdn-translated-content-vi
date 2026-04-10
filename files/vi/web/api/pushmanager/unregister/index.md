---
title: "PushManager: phương thức unregister()"
short-title: unregister()
slug: Web/API/PushManager/unregister
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.PushManager.unregister
---

{{ApiRef("Push API")}}{{deprecated_header}}{{non-standard_header}}{{AvailableInWorkers}}

Phương thức **`unregister()`** được dùng để yêu cầu hệ thống hủy đăng ký và xóa endpoint đã chỉ định.

> [!NOTE]
> Trong API được cập nhật, một subscription có thể được hủy đăng ký thông qua phương thức {{domxref("PushSubscription.unsubscribe()")}}.

## Cú pháp

```js-nolint
unregister(pushEndpoint)
```

### Tham số

- `pushEndpoint`
  - : Một `pushEndpoint` cần được hủy đăng ký.

### Giá trị trả về

Một đối tượng `DOMRequest` để xử lý thành công hoặc thất bại của lời gọi phương thức.

Nếu lời gọi phương thức thành công, `result` của request sẽ là một đối tượng [PushRegistration](#pushregistration) đại diện cho endpoint đã bị hủy đăng ký.

### PushRegistration

Các object này là các object JavaScript vô danh với những thuộc tính sau:

- `pushEndpoint`
  - : Một chuỗi biểu thị URL của endpoint đã bị hủy đăng ký.
- `version`
  - : `Undefined` khi `unregister.onsuccess` được gọi.

## Ví dụ

```js
const req = navigator.push.unregister(pushEndpoint);

req.onsuccess = (e) => {
  const endpoint = req.result;
  console.log(`Unregistered endpoint: ${endpoint}`);
};

req.onerror = (e) => {
  console.error(`Error unregistering the endpoint: ${e.error}`);
};
```

## Thông số kỹ thuật

Tính năng này không còn thuộc bất kỳ đặc tả nào nữa. Nó không còn nằm trong lộ trình để trở thành một tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PushManager")}}
