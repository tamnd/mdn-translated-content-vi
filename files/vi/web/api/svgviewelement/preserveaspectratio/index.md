---
title: "SVGViewElement: preserveAspectRatio property"
short-title: preserveAspectRatio
slug: Web/API/SVGViewElement/preserveAspectRatio
page-type: web-api-instance-property
browser-compat: api.SVGViewElement.preserveAspectRatio
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`preserveAspectRatio`** của giao diện {{domxref("SVGViewElement")}} phản ánh thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử {{SVGElement("view")}} tương ứng. Nó xác định cách nội dung trong `view` nên được co giãn để phù hợp với khung nhìn trong khi duy trì tỷ lệ khung hình.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedPreserveAspectRatio")}}.

## Ví dụ

Với SVG sau, chúng ta có thể sử dụng thuộc tính `preserveAspectRatio` để truy xuất hành vi co giãn cho phần tử `view`:

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">
  <view id="view1" preserveAspectRatio="xMidYMid meet"></view>
  <circle cx="100" cy="100" r="80" fill="blue" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `preserveAspectRatio`:

```js
const view = document.querySelector("view");

console.log(view.preserveAspectRatio.baseVal); // kết quả: SVGPreserveAspectRatio {align: 1, meetOrSlice: 1}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("preserveAspectRatio")}}
