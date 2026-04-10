---
title: "HTMLInputElement: thuộc tính src"
short-title: src
slug: Web/API/HTMLInputElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.src
---

{{APIRef("HTML DOM")}}

Thuộc tính **`src`** của giao diện {{DOMxRef("HTMLInputElement")}} xác định nguồn của hình ảnh để hiển thị làm nút gửi đồ họa. Nó phản ánh thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/input#src) của phần tử {{htmlelement("input")}}.

Thuộc tính `src` chỉ hợp lệ cho loại [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

## Giá trị

Một chuỗi.

## Ví dụ

```js
const inputElement = document.getElementById("imageButton");
console.log(input.src);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("HTMLButtonElement")}}
- {{HTMLElement("button")}}
- {{HTMLElement("input")}}
- {{HTMLElement("img")}}
