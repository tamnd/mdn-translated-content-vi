---
title: "PageSwapEvent: viewTransition property"
short-title: viewTransition
slug: Web/API/PageSwapEvent/viewTransition
page-type: web-api-instance-property
browser-compat: api.PageSwapEvent.viewTransition
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`viewTransition`** của giao diện {{domxref("PageRevealEvent")}} chứa một đối tượng {{domxref("ViewTransition")}} đại diện cho chuyển đổi view đang hoạt động cho điều hướng giữa các tài liệu.

> [!NOTE]
> Chuyển đổi view đang hoạt động cũng có thể được truy cập thông qua thuộc tính {{domxref("Document.activeViewTransition")}}.

## Giá trị

Một đối tượng {{domxref("ViewTransition")}}, hoặc `null` nếu không có chuyển đổi view nào đang hoạt động khi sự kiện kích hoạt.

## Ví dụ

Xem trang chính {{domxref("PageSwapEvent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
