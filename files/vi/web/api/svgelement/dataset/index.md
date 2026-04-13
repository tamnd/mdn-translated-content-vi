---
title: "SVGElement: thuộc tính dataset"
short-title: dataset
slug: Web/API/SVGElement/dataset
page-type: web-api-instance-property
browser-compat: api.SVGElement.dataset
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`dataset`** của giao diện {{DOMxRef("SVGElement")}} cung cấp quyền đọc/ghi các [thuộc tính dữ liệu tùy chỉnh](/en-US/docs/Web/SVG/Reference/Attribute/data-*) (`data-*`) trên các phần tử. Nó cung cấp một bản đồ các chuỗi ({{domxref("DOMStringMap")}}) với một mục cho mỗi thuộc tính `data-*`.

Để biết thêm thông tin về cách hoạt động của `dataset`, xem {{domxref("HTMLElement.dataset")}}.

## Giá trị

Một {{domxref("DOMStringMap")}}.

## Ví dụ

```html
<div>
  <svg viewBox="0 0 120 30" xmlns="http://www.w3.org/2000/svg">
    <text x="20" y="20" id="user" data-id="1234567890" data-user="carinaanand">
      Carina Anand
    </text>
  </svg>
</div>
```

```js
const el = document.querySelector("#user");

console.log(el.dataset.id); // "1234567890"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính SVG [`data-*`](/en-US/docs/Web/SVG/Reference/Attribute/data-*)
- [Sử dụng thuộc tính dữ liệu](/en-US/docs/Web/HTML/How_to/Use_data_attributes)
