---
title: "SVGRectElement: rx property"
short-title: rx
slug: Web/API/SVGRectElement/rx
page-type: web-api-instance-property
browser-compat: api.SVGRectElement.rx
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`rx`** của giao diện {{domxref("SVGRectElement")}} mô tả độ cong theo chiều ngang của các góc hình chữ nhật SVG dưới dạng {{domxref("SVGAnimatedLength")}}. Độ dài tính theo đơn vị hệ tọa độ người dùng dọc theo trục x. Cú pháp của nó giống với cú pháp của [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length).

Thuộc tính này phản ánh thuộc tính trình bày {{SVGAttr("rx")}} của phần tử {{SVGElement("rect")}}. Thuộc tính CSS {{cssxref("rx")}} được ưu tiên hơn thuộc tính trình bày `rx` của SVG, vì vậy giá trị có thể không phản ánh kích thước thực tế của các góc bo tròn. Giá trị mặc định là `0`, tức là hình chữ nhật có góc vuông.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Với SVG sau:

```html
<svg viewBox="0 0 300 200" xmlns="http://www.w3.org/2000/svg">
  <rect x="0" y="0" width="60" height="60" rx="15" ry="15" />
  <rect x="60" y="0" width="60" height="60" rx="15%" ry="15" />
</svg>
```

Chúng ta có thể truy cập các giá trị tính toán của các thuộc tính `rx`:

```js
const rectangles = document.querySelectorAll("rect");
const rxSize0 = rectangle[0].rx;
const rxSize1 = rectangle[1].rx;
console.log(rxSize0.baseVal.value); // output: 15 (giá trị của `rx`)
console.log(rxSize1.baseVal.value); // output: 45 (15% của 300)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGRectElement.ry")}}
