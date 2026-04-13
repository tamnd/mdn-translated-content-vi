---
title: "HTMLOptionElement: thuộc tính index"
short-title: index
slug: Web/API/HTMLOptionElement/index
page-type: web-api-instance-property
browser-compat: api.HTMLOptionElement.index
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`index`** của giao diện {{DOMxRef("HTMLOptionElement")}} xác định chỉ số tính từ 0 của phần tử; tức là vị trí của {{HTMLElement("option")}} trong danh sách tùy chọn mà nó thuộc về, theo thứ tự cây, dưới dạng số nguyên. Nếu `<option>` không nằm trong danh sách tùy chọn nào, giá trị là `0`.

## Giá trị

Một số.

## Ví dụ

```js
const optionElement = document.getElementById("myOption");
console.log(optionElement.index);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("option")}}
- {{HTMLElement("select")}}
- {{HTMLElement("datalist")}}
- {{DOMxRef("HTMLOptionElement.defaultSelected")}}
- {{DOMxRef("HTMLOptionElement.selected")}}
- {{DOMxRef("HTMLSelectElement.selectedIndex")}}
- {{DOMxRef("HTMLOptionsCollection")}}
