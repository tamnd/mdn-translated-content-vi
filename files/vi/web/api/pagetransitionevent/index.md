---
title: PageTransitionEvent
slug: Web/API/PageTransitionEvent
page-type: web-api-interface
browser-compat: api.PageTransitionEvent
---

{{APIRef("HTML DOM")}}

Đối tượng sự kiện **`PageTransitionEvent`** có sẵn bên trong các hàm xử lý cho các sự kiện [`pageshow`](/en-US/docs/Web/API/Window/pageshow_event) và [`pagehide`](/en-US/docs/Web/API/Window/pagehide_event), được kích hoạt khi một tài liệu đang được tải hoặc dỡ tải.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PageTransitionEvent.PageTransitionEvent", "PageTransitionEvent()")}}
  - : Tạo một đối tượng `PageTransitionEvent` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha, {{domxref("Event")}}._

- {{domxref("PageTransitionEvent.persisted")}} {{ReadOnlyInline}}
  - : Chỉ ra nếu tài liệu đang được tải từ bộ nhớ cache.

## Ví dụ

```js
window.addEventListener("pageshow", (event) => {
  if (event.persisted) {
    alert("The page was cached by the browser");
  } else {
    alert("The page was NOT cached by the browser");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện [`pageshow`](/en-US/docs/Web/API/Window/pageshow_event)
- Sự kiện [`pagehide`](/en-US/docs/Web/API/Window/pagehide_event)
