---
title: "CloseWatcher: sự kiện close"
short-title: close
slug: Web/API/CloseWatcher/close_event
page-type: web-api-event
browser-compat: api.CloseWatcher.close_event
---

{{APIRef("HTML DOM")}}

Một sự kiện `close` được kích hoạt trên đối tượng {{domxref("CloseWatcher")}} khi nhận được yêu cầu đóng và chỉ được kích hoạt nếu sự kiện {{domxref("CloseWatcher.cancel_event", "cancel")}} xảy ra trước sự kiện `close` đó không bị hủy.

Trình xử lý sự kiện `close` là nơi nên gọi mã để đóng thành phần UI: điều này bảo đảm thành phần sẽ được đóng đúng cách dù đến từ tín hiệu đóng đặc thù của nền tảng hay từ lời gọi {{domxref("CloseWatcher.requestClose()")}}.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("close", (event) => { })

onclose = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}}.

## Ví dụ

### Dùng sự kiện `close`

Dùng `close` để lắng nghe các yêu cầu đóng.

```js
watcher.addEventListener("close", () => {
  // Close your UI component
  sidebar.hide();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
