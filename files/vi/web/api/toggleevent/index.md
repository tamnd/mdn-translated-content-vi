---
title: ToggleEvent
slug: Web/API/ToggleEvent
page-type: web-api-interface
browser-compat: api.ToggleEvent
---

{{APIRef("Popover API")}}

Giao diện **`ToggleEvent`** biểu diễn một sự kiện kích hoạt khi một phần tử popover được chuyển đổi giữa trạng thái hiển thị và ẩn.

Đây là đối tượng sự kiện cho các sự kiện {{domxref("HTMLElement.beforetoggle_event", "beforetoggle")}} và {{domxref("HTMLElement.toggle_event", "toggle")}}, kích hoạt trên các phần tử như sau:

- Sự kiện `beforetoggle` kích hoạt trước khi các phần tử [popover](/en-US/docs/Web/API/Popover_API) hoặc {{htmlelement("dialog")}} được hiển thị hoặc ẩn.
- Sự kiện `toggle` kích hoạt sau khi các phần tử popover, `<dialog>`, hoặc {{htmlelement("details")}} được hiển thị hoặc ẩn.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{DOMxRef("ToggleEvent.ToggleEvent", "ToggleEvent()")}}
  - : Tạo một đối tượng `ToggleEvent`.

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ cha nó, {{DOMxRef("Event")}}._

- {{DOMxRef("ToggleEvent.newState")}} {{ReadOnlyInline}}
  - : Chuỗi (`"open"` hoặc `"closed"`), biểu diễn trạng thái mà phần tử đang chuyển sang.
- {{DOMxRef("ToggleEvent.oldState")}} {{ReadOnlyInline}}
  - : Chuỗi (`"open"` hoặc `"closed"`), biểu diễn trạng thái mà phần tử đang chuyển từ.
- {{DOMxRef("ToggleEvent.source")}} {{ReadOnlyInline}}
  - : Một phiên bản đối tượng {{domxref("Element")}} biểu diễn điều khiển HTML đã khởi tạo việc chuyển đổi.

## Ví dụ

### Ví dụ cơ bản

```js
const popover = document.getElementById("mypopover");

// …

popover.addEventListener("beforetoggle", (event) => {
  if (event.newState === "open") {
    console.log("Popover is being shown");
  } else {
    console.log("Popover is being hidden");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Popover API](/en-US/docs/Web/API/Popover_API)
- [sự kiện `beforetoggle`](/en-US/docs/Web/API/HTMLElement/beforetoggle_event)
- [sự kiện `toggle`](/en-US/docs/Web/API/HTMLElement/toggle_event)
