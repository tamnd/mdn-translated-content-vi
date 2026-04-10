---
title: "XRSession: sự kiện visibilitychange"
short-title: visibilitychange
slug: Web/API/XRSession/visibilitychange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.visibilitychange_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`visibilitychange`** được gửi đến một {{domxref("XRSession")}} để thông báo khi nó trở nên hiển thị hoặc ẩn, hoặc khi nó trở nên hiển thị nhưng hiện không được tập trung. Khi nhận được sự kiện, bạn có thể kiểm tra giá trị của thuộc tính {{domxref("XRSession.visibilityState", "visibilityState")}} của phiên để xác định trạng thái hiển thị mới.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("visibilitychange", (event) => { })

onvisibilitychange = (event) => { }
```

## Loại sự kiện

Một {{domxref("XRSessionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("XRSessionEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("XRSessionEvent.session", "session")}} {{ReadOnlyInline}}
  - : {{domxref("XRSession")}} mà sự kiện đề cập đến.

## Mô tả

### Kích hoạt

Được kích hoạt khi một {{domxref("XRSession")}} trở nên hiển thị hoặc ẩn, hoặc khi nó trở nên hiển thị nhưng hiện không được tập trung.

Khi `XRSession` nhận được sự kiện này, trạng thái hiển thị đã được thay đổi.

### Trường hợp sử dụng

Khi nhận được sự kiện, bạn có thể kiểm tra giá trị của thuộc tính {{domxref("XRSession.visibilityState", "visibilityState")}} của phiên để xác định trạng thái hiển thị mới.

## Ví dụ

Ví dụ này minh họa cách lắng nghe một sự kiện `visibilitychange` trên một phiên WebXR, sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để bắt đầu lắng nghe sự kiện:

```js
navigator.xr.requestSession("inline").then((xrSession) => {
  xrSession.addEventListener("visibilitychange", (e) => {
    switch (e.session.visibilityState) {
      case "visible":
      case "visible-blurred":
        mySessionVisible(true);
        break;
      case "hidden":
        mySessionVisible(false);
        break;
    }
  });
});
```

Khi trạng thái hiển thị thay đổi, sự kiện được nhận và chuyển đến một hàm `mySessionVisible()`, với một tham số Boolean cho biết liệu phiên có đang được hiển thị cho người dùng hay không.

Bạn cũng có thể tạo trình xử lý sự kiện bằng cách gán nó cho thuộc tính trình xử lý sự kiện `onvisibilitychange` của {{domxref("XRSession")}}, như sau:

```js
xrSession.onvisibilitychange = (e) => {
  /* event handled here */
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
