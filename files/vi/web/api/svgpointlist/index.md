---
title: SVGPointList
slug: Web/API/SVGPointList
page-type: web-api-interface
browser-compat: api.SVGPointList
---

{{APIRef("SVG")}}

Giao diện **`SVGPointList`** đại diện cho một danh sách các đối tượng {{domxref("DOMPoint")}}.

Một `SVGPointList` có thể được chỉ định là chỉ đọc, nghĩa là các nỗ lực sửa đổi đối tượng sẽ dẫn đến việc ném ra một ngoại lệ.

## Thuộc tính phiên bản

- {{domxref("SVGPointList.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng điểm trong danh sách.
- {{domxref("SVGPointList.numberOfItems")}} {{ReadOnlyInline}}
  - : Trả về số lượng điểm trong danh sách.

## Phương thức phiên bản

- {{domxref("SVGPointList.clear()")}}
  - : Xóa tất cả các phần tử trong danh sách.
- {{domxref("SVGPointList.initialize()")}}
  - : Đầu tiên xóa tất cả các phần tử trong danh sách, sau đó thêm một giá trị duy nhất vào danh sách.
- {{domxref("SVGPointList.getItem()")}}
  - : Lấy một phần tử từ danh sách tại vị trí được chỉ định.
- {{domxref("SVGPointList.insertItemBefore()")}}
  - : Chèn một phần tử vào danh sách tại vị trí được chỉ định.
- {{domxref("SVGPointList.replaceItem()")}}
  - : Thay thế một phần tử trong danh sách bằng một phần tử mới.
- {{domxref("SVGPointList.removeItem()")}}
  - : Xóa một phần tử khỏi danh sách.
- {{domxref("SVGPointList.appendItem()")}}
  - : Thêm một phần tử vào cuối danh sách.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Thuộc tính `points` trả về một `SVGPointList`.

```html
<svg viewBox="-10 -10 120 120" xmlns="http://www.w3.org/2000/svg">
  <polyline
    id="example"
    stroke="black"
    fill="none"
    points="50,0 21,90 98,35 2,35 79,90" />
</svg>
```

```js
const example = document.getElementById("example");
console.log(example.points); // Một SVGPointList
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
