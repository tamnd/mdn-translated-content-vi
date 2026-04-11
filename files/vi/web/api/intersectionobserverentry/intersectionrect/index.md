---
title: "IntersectionObserverEntry: thuộc tính intersectionRect"
short-title: intersectionRect
slug: Web/API/IntersectionObserverEntry/intersectionRect
page-type: web-api-instance-property
browser-compat: api.IntersectionObserverEntry.intersectionRect
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`intersectionRect`** của giao diện {{domxref("IntersectionObserverEntry")}} là một đối tượng {{domxref("DOMRectReadOnly")}} mô tả hình chữ nhật nhỏ nhất chứa toàn bộ phần của phần tử đích hiện đang hiển thị trong root giao nhau.

## Giá trị

Một {{domxref("DOMRectReadOnly")}} mô tả phần của phần tử đích hiện đang hiển thị trong hình chữ nhật giao nhau của root.

Hình chữ nhật này được tính bằng cách lấy giao của {{domxref("IntersectionObserverEntry", "boundingClientRect")}} với hình chữ nhật clip của từng tổ tiên của {{domxref("IntersectionObserverEntry.target", "target")}}, ngoại trừ chính root của intersection {{domxref("IntersectionObserver.root", "root")}}.

## Ví dụ

Trong ví dụ đơn giản này, callback giao nhau lưu hình chữ nhật giao nhau lại để dùng sau trong code vẽ nội dung của các phần tử đích, որպեսզի chỉ vùng hiển thị được vẽ lại.

```js
function intersectionCallback(entries) {
  entries.forEach((entry) => {
    refreshZones.push({
      element: entry.target,
      rect: entry.intersectionRect,
    });
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
