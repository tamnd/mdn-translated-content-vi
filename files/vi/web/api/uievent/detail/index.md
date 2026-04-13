---
title: "UIEvent: detail property"
short-title: detail
slug: Web/API/UIEvent/detail
page-type: web-api-instance-property
browser-compat: api.UIEvent.detail
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`UIEvent.detail`**, khi khác không, cung cấp số lần click hiện tại (hoặc tiếp theo, tùy thuộc vào sự kiện).

Đối với các sự kiện {{domxref("Element/click_event", "click")}} hoặc {{domxref("Element/dblclick_event", "dblclick")}}, `UIEvent.detail` là số lần click hiện tại.

Đối với các sự kiện {{domxref("Element/mousedown_event", "mousedown")}} hoặc {{domxref("Element/mouseup_event", "mouseup")}}, `UIEvent.detail` là _1 cộng_ số lần click hiện tại.

Đối với tất cả các đối tượng {{domxref("UIEvent")}} khác, `UIEvent.detail` luôn là không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
