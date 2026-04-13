---
title: "SVGPointList: clear() method"
short-title: clear()
slug: Web/API/SVGPointList/clear
page-type: web-api-instance-method
browser-compat: api.SVGPointList.clear
---

{{APIRef("SVG")}}

Phương thức **`clear()`** của giao diện {{domxref("SVGPointList")}} xóa tất cả các phần tử khỏi danh sách.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu danh sách là chỉ đọc.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Gọi `clear()` làm rỗng danh sách. Do đó, polyline không còn hiển thị trong SVG.

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
let example = document.getElementById("example");
example.points.clear();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
