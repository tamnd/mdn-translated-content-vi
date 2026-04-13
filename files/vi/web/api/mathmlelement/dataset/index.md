---
title: "MathMLElement: thuộc tính dataset"
short-title: dataset
slug: Web/API/MathMLElement/dataset
page-type: web-api-instance-property
browser-compat: api.MathMLElement.dataset
---

{{APIRef("MathML")}}

Thuộc tính chỉ đọc **`dataset`** của giao diện {{DOMxRef("MathMLElement")}} cung cấp quyền truy cập đọc/ghi vào [các thuộc tính dữ liệu tùy chỉnh](/en-US/docs/Web/MathML/Reference/Global_attributes/data-*) (`data-*`) trên các phần tử. Nó hiển thị một bản đồ các chuỗi ({{domxref("DOMStringMap")}}) với một mục cho mỗi thuộc tính `data-*`.

Bản thân thuộc tính `dataset` có thể đọc nhưng không thể ghi trực tiếp. Thay vào đó, tất cả các lần ghi phải đến các thuộc tính riêng lẻ trong `dataset`, đại diện cho các thuộc tính dữ liệu.

## Giá trị

Một {{domxref("DOMStringMap")}}.

## Ví dụ

```html
<div>
  <math>
    <msup id="equation" data-value="-1" data-equation="euler">
      <mi>e</mi>
      <mrow><mi>i</mi> <mi>π</mi></mrow>
    </msup>
    <mo>+</mo>
    <mn>1</mn>
    <mo>=</mo>
    <mn>0</mn>
  </math>
</div>
```

```js
const el = document.querySelector("#equation");

console.log(el.dataset.value); // "-1"
console.log(el.dataset.equation); // "euler"
```

### Kết quả

{{EmbedLiveSample("dataset",100,100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.dataset")}}
- [`data-*`](/en-US/docs/Web/MathML/Reference/Global_attributes/data-*)
- [Sử dụng thuộc tính dữ liệu](/en-US/docs/Web/HTML/How_to/Use_data_attributes)
