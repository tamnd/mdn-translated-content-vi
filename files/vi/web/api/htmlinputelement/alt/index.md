---
title: "HTMLInputElement: thuộc tính alt"
short-title: alt
slug: Web/API/HTMLInputElement/alt
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.alt
---

{{APIRef("HTML DOM")}}

Thuộc tính **`alt`** của giao diện {{DOMxRef("HTMLInputElement")}} định nghĩa nhãn văn bản cho nút cho người dùng và tác nhân người dùng không thể sử dụng hình ảnh. Nó phản ánh thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/input#alt) của phần tử {{htmlelement("input")}}.

Thuộc tính `alt` chỉ hợp lệ cho loại [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image). Nó phải là một chuỗi không rỗng đưa ra nhãn phù hợp cho một nút tương đương nếu hình ảnh không khả dụng.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const inputElement = document.getElementById("imageButton");
console.log(inputElement.alt);
inputElement.alt = "Mô tả tốt hơn nhiều";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("HTMLImageElement.alt")}}
- {{DOMXref("HTMLButtonElement")}}
- {{HTMLElement("button")}}
- {{HTMLElement("input")}}
- {{HTMLElement("img")}}
- [Văn bản alt tốt, văn bản alt xấu — Làm cho nội dung của bạn có thể nhận biết](https://www.wcag.com/blog/good-alt-text-bad-alt-text-making-your-content-perceivable/) trên WCAG.com (2021)
- [Cây quyết định alt](https://www.w3.org/WAI/tutorials/images/decision-tree/) trên W3C Web Accessibility Initiative (WAI)
