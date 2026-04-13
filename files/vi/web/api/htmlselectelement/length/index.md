---
title: "HTMLSelectElement: thuộc tính length"
short-title: length
slug: Web/API/HTMLSelectElement/length
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.length
---

{{APIRef("HTML DOM")}}

Thuộc tính **`length`** của giao diện {{DOMxRef("HTMLSelectElement")}} chỉ định số lượng phần tử {{htmlelement("option")}} trong phần tử {{htmlelement("select")}}. Nó đại diện cho số nút trong tập hợp {{DOMxRef("HTMLSelectElement.options", "options")}}. Khi được đặt, nó hoạt động như {{DOMxRef("HTMLOptionsCollection.length")}}.

## Giá trị

Một số.

## Ví dụ

```js
const selectElement = document.getElementById("fruits");
console.log(selectElement.length);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("select")}}
- {{HTMLElement("option")}}
- {{DOMXref("HTMLSelectElement.options")}}
- {{DOMXref("HTMLSelectElement.selectedOptions")}}
- {{DOMXref("HTMLSelectElement.multiple")}}
- {{DOMXref("HTMLSelectElement.selectedIndex")}}
