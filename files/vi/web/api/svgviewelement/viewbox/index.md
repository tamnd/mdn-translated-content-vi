---
title: "SVGViewElement: viewBox property"
short-title: viewBox
slug: Web/API/SVGViewElement/viewBox
page-type: web-api-instance-property
browser-compat: api.SVGViewElement.viewBox
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`viewBox`** của giao diện {{domxref("SVGViewElement")}} phản ánh thuộc tính {{SVGAttr("viewBox")}} của phần tử {{SVGElement("view")}} tương ứng. Nó đại diện cho các giá trị `x`, `y`, `width` và `height` xác định vùng được sử dụng cho `viewBox` của `view`.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedRect")}}.

## Ví dụ

Với SVG sau, chúng ta có thể sử dụng thuộc tính `viewBox` để truy xuất kích thước `viewBox` cho phần tử `view`:

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">
  <view id="view1" viewBox="0 0 50 50"></view>
  <circle cx="100" cy="100" r="80" fill="blue" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `viewBox`:

```js
const view = document.querySelector("view");

console.log(view.viewBox.baseVal); // kết quả: DOMRect {x: 0, y: 0, width: 50, height: 50}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("viewBox")}}
