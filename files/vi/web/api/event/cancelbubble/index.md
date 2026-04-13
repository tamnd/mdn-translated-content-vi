---
title: "Event: thuộc tính cancelBubble"
short-title: cancelBubble
slug: Web/API/Event/cancelBubble
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Event.cancelBubble
---

{{APIRef("DOM")}}{{Deprecated_Header}}{{AvailableInWorkers}}

Thuộc tính **`cancelBubble`** của giao diện {{domxref("Event")}} đã không còn được dùng nữa. Hãy dùng {{domxref("Event.stopPropagation()")}} thay thế.
Việc đặt giá trị của nó thành `true` trước khi trả về từ một trình xử lý sự kiện sẽ ngăn sự kiện lan truyền. Trong các triển khai về sau, việc đặt giá trị này thành `false` không làm gì cả.
Xem [Tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

## Giá trị

Một giá trị boolean. Giá trị `true` có nghĩa là sự kiện không được phép lan truyền xa hơn.

## Ví dụ

```js
elem.onclick = (event) => {
  // Làm vài việc thú vị ở đây
  event.cancelBubble = true;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
