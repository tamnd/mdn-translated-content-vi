---
title: BackgroundFetchEvent
slug: Web/API/BackgroundFetchEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BackgroundFetchEvent
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Giao diện **`BackgroundFetchEvent`** của {{domxref('Background Fetch API', "", "", "nocode")}} là kiểu sự kiện cho các sự kiện tìm nạp nền được gửi tới {{domxref("ServiceWorkerGlobalScope", "phạm vi toàn cục của service worker", "", "nocode")}}.

Đây là kiểu sự kiện được truyền tới sự kiện {{domxref("ServiceWorkerGlobalScope/backgroundfetchclick_event", "backgroundfetchclick")}} và sự kiện {{domxref("ServiceWorkerGlobalScope/backgroundfetchabort_event", "backgroundfetchabort")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("BackgroundFetchEvent.BackgroundFetchEvent()", "BackgroundFetchEvent()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `BackgroundFetchEvent` mới. Hàm tạo này thường không được dùng trực tiếp, vì trình duyệt tự tạo các đối tượng này và cung cấp chúng cho các callback của sự kiện tìm nạp nền.

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ cha của nó, {{domxref("ExtendableEvent")}}._

- {{domxref("BackgroundFetchEvent.registration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{domxref("BackgroundFetchRegistration")}} mà sự kiện đã được khởi tạo với nó.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ cha của nó, {{domxref("ExtendableEvent")}}._

Không có.

## Ví dụ

Trong ví dụ này, nếu người dùng nhấp vào giao diện người dùng đang hiển thị tiến trình tải xuống, một cửa sổ mới sẽ được mở. {{domxref("BackgroundFetchRegistration")}} hiện tại được trả về bằng cách gọi `event.registration`.

```js
addEventListener("backgroundfetchclick", (event) => {
  const bgFetch = event.registration;

  if (bgFetch.result === "success") {
    clients.openWindow("/latest-podcasts");
  } else {
    clients.openWindow("/download-progress");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
