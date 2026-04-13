---
title: "ToggleEvent: ToggleEvent() constructor"
short-title: ToggleEvent()
slug: Web/API/ToggleEvent/ToggleEvent
page-type: web-api-constructor
browser-compat: api.ToggleEvent.ToggleEvent
---

{{APIRef("Popover API")}}

Hàm khởi tạo **`ToggleEvent()`** tạo một đối tượng {{domxref("ToggleEvent")}} mới.

## Cú pháp

```js-nolint
new ToggleEvent(type, init)
```

### Tham số

- `type`
  - : Chuỗi biểu diễn loại sự kiện. Trong trường hợp của `ToggleEvent`, luôn là `beforetoggle` hoặc `toggle`.
- `init` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `newState` {{optional_inline}}
      - : Chuỗi biểu diễn trạng thái mà phần tử đang chuyển sang. Có thể là bất kỳ giá trị nào, nhưng các sự kiện do trình duyệt kích hoạt đặt giá trị này thành `"open"` hoặc `"closed"`. Mặc định là `""`.
    - `oldState` {{optional_inline}}
      - : Chuỗi biểu diễn trạng thái mà phần tử đang chuyển từ. Có thể là bất kỳ giá trị nào, nhưng các sự kiện do trình duyệt kích hoạt đặt giá trị này thành `"open"` hoặc `"closed"`. Mặc định là `""`.
    - `source` {{optional_inline}}
      - : Một {{domxref("Element")}} biểu diễn phần tử điều khiển popover HTML đã khởi tạo việc chuyển đổi. Mặc định là `null`.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `ToggleEvent` mới được xây dựng khi một trình xử lý được gọi do một sự kiện liên quan kích hoạt.

Ví dụ:

```js
const popover = document.getElementById("mypopover");

// …

popover.addEventListener("beforetoggle", (event) => {
  if (event.newState === "open") {
    console.log("Popover is being shown");
    if (event.source) {
      console.log("Initiated by:", event.source);
    }
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
