---
title: "NavigationActivation: navigationType property"
short-title: navigationType
slug: Web/API/NavigationActivation/navigationType
page-type: web-api-instance-property
browser-compat: api.NavigationActivation.navigationType
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`navigationType`** của giao diện {{domxref("NavigationActivation")}} chứa một chuỗi cho biết loại điều hướng.

## Giá trị

Một chuỗi đại diện cho loại điều hướng mà {{domxref("NavigationActivation")}} liên quan đến. Các giá trị có thể là:

- `push`: Một vị trí mới đã được điều hướng đến, khiến một mục mới được đẩy vào danh sách lịch sử.
- `reload`: {{domxref("NavigationActivation.entry")}} được tải lại.
- `replace`: {{domxref("NavigationActivation.entry")}} được thay thế bằng mục lịch sử mới. Mục mới này sẽ sử dụng lại cùng {{domxref("NavigationHistoryEntry.key", "key")}}, nhưng được gán một {{domxref("NavigationHistoryEntry.id", "id")}} khác.
- `traverse`: Trình duyệt điều hướng từ một mục lịch sử hiện có sang một mục lịch sử hiện có khác.

## Ví dụ

```js
window.addEventListener("pageswap", (event) => {
  // For example, the page was hidden, or the navigation is cross-document.
  if (!event.viewTransition) return;

  // Skip the view transition for back/forward navigations.
  if (event.activation.navigationType === "traverse") {
    event.viewTransition.skipTransition();
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Navigation API](/en-US/docs/Web/API/Navigation_API)
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
