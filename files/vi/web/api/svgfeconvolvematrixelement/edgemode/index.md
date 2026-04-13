---
title: "SVGFEConvolveMatrixElement: edgeMode property"
short-title: edgeMode
slug: Web/API/SVGFEConvolveMatrixElement/edgeMode
page-type: web-api-instance-property
browser-compat: api.SVGFEConvolveMatrixElement.edgeMode
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`edgeMode`** của giao diện {{domxref("SVGFEConvolveMatrixElement")}} phản ánh thuộc tính {{SVGAttr("edgeMode")}} của phần tử {{SVGElement("feConvolveMatrix")}} đã cho. Các hằng số `SVG_EDGEMODE_*` được định nghĩa trên giao diện này được biểu thị bằng các số từ 1 đến 3, trong đó giá trị mặc định `duplicate` là `1`, `wrap` là `2`, và `none` là `3`.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

Trong ví dụ này, chúng ta lấy giá trị thuộc tính `edgeMode` của phần tử bộ lọc `<feConvolveMatrix>` thông qua thuộc tính `edgeMode` của giao diện `SVGFEConvolveMatrixElement`.

Nếu SVG của chúng ta chứa bộ lọc sau:

```html
<feConvolveMatrix kernelMatrix="3 0 0 0 0 0 0 0 -4" id="el" edgeMode="wrap" />
```

Chúng ta có thể truy cập số tương ứng với giá trị từ khóa liệt kê của thuộc tính `edgeMode` của phần tử `feConvolveMatrix`.

```js
const el = document.getElementById("el");
console.log(el.edgeMode.baseVal); // output: 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
- {{domxref("SVGFEGaussianBlurElement.edgeMode")}}
