---
title: "PageRevealEvent: thuộc tính viewTransition"
short-title: viewTransition
slug: Web/API/PageRevealEvent/viewTransition
page-type: web-api-instance-property
browser-compat: api.PageRevealEvent.viewTransition
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`viewTransition`** của giao diện {{domxref("PageRevealEvent")}} chứa một đối tượng {{domxref("ViewTransition")}} đại diện cho view transition đang hoạt động cho điều hướng giữa các tài liệu.

> [!NOTE]
> View transition đang hoạt động cũng có thể được truy cập thông qua thuộc tính {{domxref("Document.activeViewTransition")}}.

## Giá trị

Một đối tượng {{domxref("ViewTransition")}}, hoặc `null` nếu không có view transition đang hoạt động khi sự kiện được kích hoạt.

## Ví dụ

Xem trang {{domxref("PageRevealEvent")}} chính.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Navigation API](/en-US/docs/Web/API/Navigation_API)
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
