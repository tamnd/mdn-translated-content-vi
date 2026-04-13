---
title: "HTMLOptionElement: thuộc tính selected"
short-title: selected
slug: Web/API/HTMLOptionElement/selected
page-type: web-api-instance-property
browser-compat: api.HTMLOptionElement.selected
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`selected`** của giao diện {{DOMxRef("HTMLOptionElement")}} xác định trạng thái được chọn hiện tại của phần tử; tức là liệu {{HTMLElement("option")}} có đang được chọn hay không.

Sự hiện diện của thuộc tính HTML [`selected`](/en-US/docs/Web/HTML/Reference/Elements/option#selected) cho biết tùy chọn được chọn mặc định. Nó không cho biết liệu tùy chọn này hiện có đang được chọn hay không: nếu trạng thái của tùy chọn thay đổi, thuộc tính nội dung `selected` không phản ánh sự thay đổi đó; chỉ thuộc tính IDL `selected` của `HTMLOptionElement` mới được cập nhật. Thuộc tính `selected` được phản ánh bởi thuộc tính {{domxref("HTMLOptionElement.defaultSelected", "defaultSelected")}}.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const optionElement = document.getElementById("water");
console.log(optionElement.selected);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("option")}}
- {{HTMLElement("select")}}
- {{DOMxRef("HTMLOptionElement.defaultSelected")}}
- {{DOMxRef("HTMLOptionElement.index")}}
- {{DOMxRef("HTMLOptionsCollection")}}
- {{DOMxRef("HTMLSelectElement.selectedIndex")}}
