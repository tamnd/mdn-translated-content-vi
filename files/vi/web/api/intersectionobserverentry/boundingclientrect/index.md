---
title: "IntersectionObserverEntry: thuộc tính boundingClientRect"
short-title: boundingClientRect
slug: Web/API/IntersectionObserverEntry/boundingClientRect
page-type: web-api-instance-property
browser-compat: api.IntersectionObserverEntry.boundingClientRect
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`boundingClientRect`** của giao diện {{domxref("IntersectionObserverEntry")}} trả về một {{domxref("DOMRectReadOnly")}}, về bản chất là hình chữ nhật nhỏ nhất chứa toàn bộ phần tử đích.

## Giá trị

Một {{domxref("DOMRectReadOnly")}} mô tả hình chữ nhật nhỏ nhất chứa mọi phần của phần tử đích có thay đổi giao nhau đang được mô tả.
Giá trị này được lấy bằng cùng thuật toán với {{domxref("Element.getBoundingClientRect()")}}, nên hãy xem bài viết đó để biết chi tiết.

Nói chung, có thể hiểu đây là hình chữ nhật biên của phần tử đích.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
