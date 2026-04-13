---
title: "SVGPointList: removeItem() method"
short-title: removeItem()
slug: Web/API/SVGPointList/removeItem
page-type: web-api-instance-method
browser-compat: api.SVGPointList.removeItem
---

{{APIRef("SVG")}}

Phương thức **`removeItem()`** của giao diện {{domxref("SVGPointList")}} xóa một {{domxref("DOMPoint")}} khỏi danh sách.

## Cú pháp

```js-nolint
removeItem(index)
```

### Tham số

- `index`
  - : Chỉ mục của phần tử cần xóa.

### Giá trị trả về

Đối tượng {{domxref("DOMPoint")}} đã bị xóa.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu danh sách là chỉ đọc.
- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu chỉ mục được truyền vào lớn hơn số lượng phần tử trong danh sách.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Phần tử tại chỉ mục `2` được xóa.

```html
<svg id="svg" viewBox="-10 -10 120 120" xmlns="http://www.w3.org/2000/svg">
  <polyline
    id="example"
    stroke="black"
    fill="none"
    points="50,0 21,90 98,35 2,35 79,90" />
</svg>
```

```js
const example = document.getElementById("example");
console.log(example.points.removeItem(2));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
