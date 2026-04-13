---
title: "NavigationActivation: from property"
short-title: from
slug: Web/API/NavigationActivation/from
page-type: web-api-instance-property
browser-compat: api.NavigationActivation.from
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`from`** của giao diện {{domxref("NavigationActivation")}} chứa một đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho mục lịch sử cho tài liệu đi ("from") trong điều hướng.

## Giá trị

Một đối tượng {{domxref("NavigationHistoryEntry")}}, hoặc `null` nếu tài liệu đi là:

- Không cùng nguồn gốc với tài liệu đến.
- Tài liệu `about:blank` ban đầu.

## Ví dụ

Xem trang chính {{domxref("NavigationActivation")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Navigation API](/en-US/docs/Web/API/Navigation_API)
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
