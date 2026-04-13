---
title: "XRSession: sự kiện end"
short-title: end
slug: Web/API/XRSession/end_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.end_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện `end` được gửi đến một đối tượng {{DOMxRef("XRSession")}} khi phiên WebXR đã kết thúc, hoặc vì ứng dụng web đã chọn dừng phiên, hoặc vì {{Glossary("user agent")}} đã chấm dứt phiên.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("end", (event) => { })

onend = (event) => { }
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

Được kích hoạt khi phiên WebXR đã kết thúc, hoặc vì ứng dụng web đã chọn dừng phiên, hoặc vì {{Glossary("user agent")}} đã chấm dứt phiên.

Sự kiện này không thể hủy và không nổi bọt.

### Trường hợp sử dụng

Bạn có thể sử dụng sự kiện này để phản ứng với việc kết thúc phiên WebXR. Bạn có thể muốn hiển thị một phần tử UI thông báo về việc chấm dứt phiên, ví dụ.

## Ví dụ

Để được thông báo khi một phiên WebXR kết thúc, bạn có thể thêm một trình xử lý vào thể hiện {{domxref("XRSession")}} của mình bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}}, như sau:

```js
XRSession.addEventListener("end", (event) => {
  /* the session has shut down */
});
```

Ngoài ra, bạn có thể sử dụng thuộc tính trình xử lý sự kiện `XRSession.onend` để thiết lập một trình xử lý cho sự kiện `end`:

```js
XRSession.onend = (event) => {
  /* the session has shut down */
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
