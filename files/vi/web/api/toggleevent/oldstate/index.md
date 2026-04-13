---
title: "ToggleEvent: oldState property"
short-title: oldState
slug: Web/API/ToggleEvent/oldState
page-type: web-api-instance-property
browser-compat: api.ToggleEvent.oldState
---

{{APIRef("Popover API")}}

Thuộc tính chỉ đọc **`oldState`** của giao diện {{domxref("ToggleEvent")}} là chuỗi biểu diễn trạng thái mà phần tử đang chuyển từ.

## Giá trị

Một chuỗi. Các giá trị có thể là `"open"` (popover đang chuyển từ hiển thị sang ẩn) hoặc `"closed"` (popover đang chuyển từ ẩn sang hiển thị).

## Ví dụ

```js
const popover = document.getElementById("mypopover");

// …

popover.addEventListener("beforetoggle", (event) => {
  if (event.oldState === "open") {
    console.log("Popover is being hidden");
  } else {
    console.log("Popover is being shown");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Popover API](/en-US/docs/Web/API/Popover_API)
