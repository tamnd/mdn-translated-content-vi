---
title: "PushEvent: thuộc tính data"
short-title: data
slug: Web/API/PushEvent/data
page-type: web-api-instance-property
browser-compat: api.PushEvent.data
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc `data` của giao diện **`PushEvent`** trả về một tham chiếu đến một đối tượng {{domxref("PushMessageData")}} chứa dữ liệu được gửi đến {{domxref("PushSubscription")}}.

## Giá trị

Một đối tượng {{domxref("PushMessageData")}} hoặc `null` nếu không có thành viên `data` nào được truyền khi khởi tạo phiên bản sự kiện.

## Ví dụ

Ví dụ sau lấy dữ liệu từ một PushEvent và hiển thị nó trên tất cả các client của service worker.

```js
self.addEventListener("push", (event) => {
  if (!(self.Notification && self.Notification.permission === "granted")) {
    return;
  }

  const data = event.data?.json() ?? {};
  const title = data.title || "Something Has Happened";
  const message =
    data.message || "Here's something you might want to check out.";
  const icon = "images/new-notification.png";

  const notification = new Notification(title, {
    body: message,
    tag: "simple-push-demo-notification",
    icon,
  });

  notification.addEventListener("click", () => {
    clients.openWindow(
      "https://example.blog.com/2015/03/04/something-new.html",
    );
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
