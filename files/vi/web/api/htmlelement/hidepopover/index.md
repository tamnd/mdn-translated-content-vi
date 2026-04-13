---
title: "HTMLElement: phương thức hidePopover()"
short-title: hidePopover()
slug: Web/API/HTMLElement/hidePopover
page-type: web-api-instance-method
browser-compat: api.HTMLElement.hidePopover
---

{{APIRef("Popover API")}}

Phương thức **`hidePopover()`** của giao diện {{domxref("HTMLElement")}} ẩn phần tử [popover](/en-US/docs/Web/API/Popover_API) (nghĩa là phần tử có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) hợp lệ) bằng cách xóa nó khỏi {{glossary("top layer")}} và đặt kiểu `display: none`.

Khi `hidePopover()` được gọi trên một phần tử đang hiển thị có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), một sự kiện {{domxref("HTMLElement/beforetoggle_event", "beforetoggle")}} sẽ được kích hoạt, tiếp theo là popover bị ẩn, rồi sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}} kích hoạt. Nếu phần tử đã bị ẩn, một lỗi sẽ được ném ra.

## Cú pháp

```js-nolint
hidePopover()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu popover đã bị ẩn.

## Ví dụ

### Ẩn popover

Ví dụ sau cung cấp chức năng ẩn popover bằng cách nhấn một phím cụ thể trên bàn phím.

#### HTML

```html
<button popovertarget="mypopover">Toggle popover's display</button>
<div id="mypopover" popover="manual">
  You can press <kbd>h</kbd> on your keyboard to close the popover.
</div>
```

#### JavaScript

```js
const popover = document.getElementById("mypopover");

document.addEventListener("keydown", (event) => {
  if (event.key === "h") {
    popover.hidePopover();
  }
});
```

#### Kết quả

{{EmbedLiveSample("Hiding a popover","100%",100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Popover](/en-US/docs/Web/API/Popover_API)
