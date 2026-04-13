---
title: "CloseWatcher: sự kiện cancel"
short-title: cancel
slug: Web/API/CloseWatcher/cancel_event
page-type: web-api-event
browser-compat: api.CloseWatcher.cancel_event
---

{{APIRef("HTML DOM")}}

Một sự kiện `cancel` được kích hoạt trên đối tượng {{domxref("CloseWatcher")}} trước sự kiện `close`, để có thể ngăn `close` được kích hoạt nếu cần. Nó được kích hoạt bởi mọi tín hiệu đóng (ví dụ: phím <kbd>Esc</kbd>) cũng như bởi {{domxref("CloseWatcher.requestClose()")}}.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("cancel", (event) => { })

oncancel = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}}.

## Ví dụ

### Dùng sự kiện `cancel`

Trong ví dụ này, chúng ta yêu cầu người dùng xác nhận rằng họ thực sự muốn đóng thành phần, và nếu không, chúng ta hủy sự kiện bằng {{domxref("Event.preventDefault()")}}, việc này ngăn không cho sự kiện `close` được kích hoạt.

```js
watcher.addEventListener("cancel", (e) => {
  if (e.cancelable && hasUnsavedData) {
    const userReallyWantsToClose = confirm("Are you sure you want to close?");
    if (!userReallyWantsToClose) {
      e.preventDefault();
    }
  }
});

// Trigger a close request manually
watcher.requestClose();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
