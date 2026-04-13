---
title: "HTMLInputElement: thuộc tính autocomplete"
short-title: autocomplete
slug: Web/API/HTMLInputElement/autocomplete
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.autocomplete
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`autocomplete`** của giao diện {{DOMxRef("HTMLInputElement")}} cho biết liệu giá trị của điều khiển có thể được trình duyệt tự động hoàn thành hay không. Nó phản ánh thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) của phần tử {{htmlelement("input")}}.

## Giá trị

Một chuỗi; giá trị của thuộc tính `autocomplete` (`"on"`, `"off"`, một [`<token-list>`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete#token_list_tokens)), hoặc chuỗi rỗng `""` nếu không được chỉ định.

## Ví dụ

```js
const inputElement = document.getElementById("name");
console.log(inputElement.autocomplete);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMxRef("HTMLInputElement.value")}}
- Thuộc tính HTML [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
- Thuộc tính ARIA [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete)
- [Tắt tự động hoàn thành](/en-US/docs/Web/Security/Practical_implementation_guides/Turning_off_form_autocompletion)
