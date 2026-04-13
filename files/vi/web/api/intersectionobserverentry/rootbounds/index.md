---
title: "IntersectionObserverEntry: thuộc tính rootBounds"
short-title: rootBounds
slug: Web/API/IntersectionObserverEntry/rootBounds
page-type: web-api-instance-property
browser-compat: api.IntersectionObserverEntry.rootBounds
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`rootBounds`** của giao diện {{domxref("IntersectionObserverEntry")}} là một {{domxref("DOMRectReadOnly")}} tương ứng với hình chữ nhật giao nhau của root của {{domxref("IntersectionObserverEntry.target", "target")}}, đã được bù bởi {{domxref("IntersectionObserver.rootMargin")}} nếu có chỉ định.

## Giá trị

Một {{domxref("DOMRectReadOnly")}} mô tả hình chữ nhật giao nhau của root.
Với root là viewport của {{domxref("Document")}}, hình chữ nhật này là biên của toàn bộ tài liệu.
Nếu không, đó là biên của phần tử root.

Hình chữ nhật này được dịch theo các giá trị trong {{domxref("IntersectionObserver.rootMargin")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
