---
title: "PageSwapEvent: PageSwapEvent() constructor"
short-title: PageSwapEvent()
slug: Web/API/PageSwapEvent/PageSwapEvent
page-type: web-api-constructor
browser-compat: api.PageSwapEvent.PageSwapEvent
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`PageSwapEvent()`** tạo một thực thể đối tượng {{domxref("PageSwapEvent")}} mới.

## Cú pháp

```js-nolint
new PageSwapEvent(type, init)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện. Trong trường hợp `PageSwapEvent`, luôn là `pageswap`.
- `init`
  - : Một đối tượng chứa các thuộc tính sau:
    - `activation`
      - : Một đối tượng {{domxref("NavigationActivation")}} đại diện cho loại điều hướng và các mục lịch sử tài liệu hiện tại và đích. Mặc định là `null` nếu điều hướng liên quan là điều hướng nguồn gốc chéo.
    - `viewTransition`
      - : Một đối tượng {{domxref("ViewTransition")}} đại diện cho chuyển đổi view đang hoạt động cho điều hướng liên quan. Mặc định là `null` nếu không có chuyển đổi view đang hoạt động.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `PageSwapEvent` mới được tạo khi một hàm xử lý được gọi do sự kiện {{domxref("Window.pageswap_event", "pageswap")}} kích hoạt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
