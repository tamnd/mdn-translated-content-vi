---
title: "Notification: phương thức close()"
short-title: close()
slug: Web/API/Notification/close
page-type: web-api-instance-method
browser-compat: api.Notification.close
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("Notification")}} được dùng để đóng/xóa một thông báo đã hiển thị trước đó.

> [!NOTE]
> Không nên dùng API này chỉ để tự động xóa thông báo khỏi màn hình sau một độ trễ cố định, vì phương thức này cũng sẽ xóa thông báo khỏi mọi khay thông báo, khiến người dùng không thể tương tác với nó sau khi thông báo được hiển thị. Một cách dùng hợp lý là xóa một thông báo không còn liên quan nữa (ví dụ: người dùng đã đọc thông báo trên trang web trong trường hợp ứng dụng nhắn tin hoặc bài hát tiếp theo đã bắt đầu phát trong ứng dụng âm nhạc).

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong đoạn mã sau, chúng ta có một hàm khi được gọi sẽ tạo một object `options` rồi tạo một thông báo mới. Cuối hàm, nó cũng gọi `close()` bên trong một hàm {{domxref("EventTarget.addEventListener","addEventListener()")}} để xóa thông báo khi nội dung liên quan đã được đọc trên trang web.

```js
function spawnNotification(theBody, theIcon, theTitle) {
  const options = {
    body: theBody,
    icon: theIcon,
  };

  const n = new Notification(theTitle, options);
  document.addEventListener("visibilitychange", () => {
    if (document.visibilityState === "visible") {
      // Tab đã hiện lên nên xóa Notification đã cũ.
      n.close();
    }
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
