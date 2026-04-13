---
title: "PageRevealEvent: hàm khởi tạo PageRevealEvent()"
short-title: PageRevealEvent()
slug: Web/API/PageRevealEvent/PageRevealEvent
page-type: web-api-constructor
browser-compat: api.PageRevealEvent.PageRevealEvent
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`PageRevealEvent()`** tạo một phiên bản đối tượng {{domxref("PageRevealEvent")}} mới.

## Cú pháp

```js-nolint
new PageRevealEvent(type, init)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện. Trong trường hợp của `PageRevealEvent` luôn là `pagereveal`.
- `init`
  - : Một đối tượng chứa các thuộc tính sau:
    - `viewTransition` {{optional_inline}}
      - : Một đối tượng {{domxref("ViewTransition")}} đại diện cho view transition đang hoạt động cho điều hướng liên quan. Mặc định là `null` nếu không có view transition đang hoạt động.

## Ví dụ

Một nhà phát triển sẽ không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `PageRevealEvent` mới được xây dựng khi một trình xử lý được gọi do sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}} kích hoạt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
