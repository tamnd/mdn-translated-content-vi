---
title: "IntersectionObserver: root property"
short-title: root
slug: Web/API/IntersectionObserver/root
page-type: web-api-instance-property
browser-compat: api.IntersectionObserver.root
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`root`** của giao diện {{domxref("IntersectionObserver")}} xác định {{domxref("Element")}} hoặc {{domxref("Document")}} có ranh giới được dùng làm {{Glossary("bounding box")}} của {{Glossary("viewport")}} cho phần tử là đích của trình quan sát.

Nếu `root` là `null`, thì ranh giới của viewport tài liệu thực tế sẽ được sử dụng.

## Giá trị

Một đối tượng {{domxref("Element")}} hoặc {{domxref("Document")}} có hộp giới hạn được dùng làm ranh giới của viewport để xác định bao nhiêu phần của phần tử đích hiển thị.
Giao điểm của hình chữ nhật giới hạn này, được bù bởi bất kỳ lề nào được chỉ định trong các tùy chọn truyền vào hàm khởi tạo {{domxref("IntersectionObserver.IntersectionObserver", "IntersectionObserver()")}}, ranh giới của phần tử đích, trừ đi ranh giới của mọi phần tử hoặc đối tượng khác chồng lên phần tử đích, được coi là vùng hiển thị của phần tử đích.

Nếu `root` là `null`, thì tài liệu sở hữu được dùng làm gốc, và ranh giới viewport của nó (tức là vùng hiển thị của tài liệu) được dùng làm ranh giới gốc.

## Ví dụ

Ví dụ này đặt {{cssxref("border")}} của phần tử gốc của trình quan sát giao nhau thành một đường màu xanh lá cây dày 2 pixel.

```js
observer.root.style.border = "2px solid #44aa44";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Timing element visibility with the Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility)
