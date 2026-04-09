---
title: "Clients: phương thức openWindow()"
short-title: openWindow()
slug: Web/API/Clients/openWindow
page-type: web-api-instance-method
browser-compat: api.Clients.openWindow
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`openWindow()`** của giao diện {{domxref("Clients")}}
tạo một ngữ cảnh duyệt cấp cao nhất mới và tải URL đã cho. Nếu script gọi
không có quyền hiển thị cửa sổ bật lên, `openWindow()` sẽ ném ra
`InvalidAccessError`.

Trong Firefox, phương thức này chỉ được phép hiển thị cửa sổ bật lên khi được gọi từ kết quả của một
sự kiện nhấp thông báo.

Trong Chrome cho Android, phương thức này có thể mở URL trong một ngữ cảnh duyệt đang tồn tại
do một [ứng dụng web độc lập](/en-US/docs/Web/Progressive_web_apps) đã được người dùng thêm vào màn hình chính cung cấp. Trong thời gian gần đây, điều này cũng hoạt động trên
Chrome cho Windows.

## Cú pháp

```js-nolint
openWindow(url)
```

### Tham số

- `url`
  - : Một chuỗi biểu diễn URL của client mà bạn muốn mở trong
    cửa sổ. Nhìn chung, giá trị này phải là một URL cùng origin với script gọi.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành một đối tượng {{domxref("WindowClient")}} nếu
URL thuộc cùng origin với service worker, hoặc thành {{Glossary("null", "giá trị null")}} trong trường hợp khác.

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Promise bị từ chối với ngoại lệ này nếu không có cửa sổ nào trong origin của ứng dụng có [kích hoạt tạm thời](/en-US/docs/Web/Security/Defenses/User_activation).

## Yêu cầu bảo mật

- Ít nhất một cửa sổ trong origin của ứng dụng phải có [kích hoạt tạm thời](/en-US/docs/Web/Security/Defenses/User_activation).

## Ví dụ

```js
// Send notification to OS if applicable
if (self.Notification.permission === "granted") {
  const notificationObject = {
    body: "Click here to view your messages.",
    data: { url: `${self.location.origin}/some/path` },
    // data: { url: 'http://example.com' },
  };
  self.registration.showNotification(
    "You've got messages!",
    notificationObject,
  );
}

// Notification click event listener
self.addEventListener("notificationclick", (e) => {
  // Close the notification popout
  e.notification.close();
  // Get all the Window clients
  e.waitUntil(
    clients.matchAll({ type: "window" }).then((clientsArr) => {
      const windowToFocus = clientsArr.find(
        (windowClient) => windowClient.url === e.notification.data.url,
      );
      if (windowToFocus) {
        // If a Window tab matching the targeted URL already exists, focus that;
        windowToFocus.focus();
      } else {
        // Otherwise, open a new tab to the applicable URL and focus it.
        clients
          .openWindow(e.notification.data.url)
          .then((windowClient) => (windowClient ? windowClient.focus() : null));
      }
    }),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
