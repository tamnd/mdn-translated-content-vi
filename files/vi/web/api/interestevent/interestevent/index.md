---
title: "InterestEvent: InterestEvent() constructor"
short-title: InterestEvent()
slug: Web/API/InterestEvent/InterestEvent
page-type: web-api-constructor
status:
  - experimental
  - non-standard
browser-compat: api.InterestEvent.InterestEvent
---

{{APIRef("Popover API")}}{{SeeCompatTable}}{{non-standard_header}}

Hàm khởi tạo **`InterestEvent()`** tạo một đối tượng {{domxref("InterestEvent")}} mới.

## Cú pháp

```js-nolint
new InterestEvent(type, init)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện. Đối với `InterestEvent`, giá trị này luôn là `interest` hoặc `loseinterest`.
- `init` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `source` {{optional_inline}}
      - : Một {{domxref("Element")}} đại diện cho phần tử interest invoker mà sự quan tâm hoặc mất quan tâm xảy ra.

## Ví dụ

Thông thường bạn sẽ không dùng hàm khởi tạo này theo cách thủ công. Một đối tượng `InterestEvent` mới được tạo khi một trình xử lý được gọi do sự kiện liên quan kích hoạt.

Xem hướng dẫn [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) và trang tham chiếu sự kiện {{domxref("HTMLElement.interest_event", "interest")}} để xem ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Popover API](/en-US/docs/Web/API/Popover_API)
- [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
