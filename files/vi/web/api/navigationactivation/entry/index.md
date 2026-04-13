---
title: "NavigationActivation: entry property"
short-title: entry
slug: Web/API/NavigationActivation/entry
page-type: web-api-instance-property
browser-compat: api.NavigationActivation.entry
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`entry`** của giao diện {{domxref("NavigationActivation")}} chứa một đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho mục lịch sử cho tài liệu đến ("to") trong điều hướng. Tương đương với thuộc tính {{domxref("Navigation.currentEntry")}} tại thời điểm tài liệu đến được kích hoạt.

Có một số trường hợp mà đối tượng {{domxref("NavigationHistoryEntry")}} của `from` hoặc `entry` sẽ không phải là mục tiêu khả thi cho phương thức `traverseTo()`, vì chúng có thể không được giữ lại trong lịch sử. Ví dụ, tài liệu có thể được kích hoạt bằng cách dùng `location.replace()` hoặc mục ban đầu của nó có thể được thay thế bằng `history.replaceState()`. Tuy nhiên, các thuộc tính `url` của các mục đó và phương thức `getState()` vẫn có thể truy cập được.

## Giá trị

Một đối tượng {{domxref("NavigationHistoryEntry")}}.

## Ví dụ

Xem trang chính {{domxref("NavigationActivation")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Navigation API](/en-US/docs/Web/API/Navigation_API)
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
