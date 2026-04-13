---
title: "ToggleEvent: newState property"
short-title: newState
slug: Web/API/ToggleEvent/newState
page-type: web-api-instance-property
browser-compat: api.ToggleEvent.newState
---

{{APIRef("Popover API")}}

Thuộc tính chỉ đọc **`newState`** của giao diện {{domxref("ToggleEvent")}} là chuỗi biểu diễn trạng thái mà phần tử đang chuyển sang.

## Giá trị

Một chuỗi. Các giá trị có thể là `"open"` (popover đang được hiển thị) hoặc `"closed"` (popover đang được ẩn).

## Ví dụ

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
