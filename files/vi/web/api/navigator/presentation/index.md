---
title: "Navigator: thuộc tính presentation"
short-title: presentation
slug: Web/API/Navigator/presentation
page-type: web-api-instance-property
browser-compat: api.Navigator.presentation
---

{{securecontext_header}}{{APIRef("Presentation API")}}

Thuộc tính chỉ đọc `presentation` của {{DOMxRef("Navigator")}} đóng vai trò là mục nhập
điểm cho [Presentation API](/en-US/docs/Web/API/Presentation_API) và
trả về một tham chiếu đến đối tượng {{DOMxRef("Presentation")}}.

## Giá trị

Tham chiếu đến đối tượng {{DOMxRef("Presentation")}}.

## Ví dụ

Hiện tại, thuộc tính `navigator.presentation` hữu ích nhất cho việc kiểm tra tính năng và đối với tác nhân người dùng nhận để truy cập {{domxref("PresentationReceiver")}}.

```js
// Check if the Presentation API is available in the current browser
if ("presentation" in navigator) {
  footer.textContent = navigator.presentation.receiver
    ? "Receiving presentation"
    : "(idle)";
} else {
  console.error("Presentation API is not available in this browser.");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Presentation API](/en-US/docs/Web/API/Presentation_API)
- {{DOMxRef("Presentation")}}
