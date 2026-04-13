---
title: "HTMLSelectElement: thuộc tính autocomplete"
short-title: autocomplete
slug: Web/API/HTMLSelectElement/autocomplete
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.autocomplete
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`autocomplete`** của giao diện {{DOMxRef("HTMLSelectElement")}} cho biết giá trị của điều khiển có thể được trình duyệt tự động hoàn thành hay không. Nó phản ánh thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/select#autocomplete) của phần tử `<select>`.

## Giá trị

Một chuỗi đại diện cho giá trị của thuộc tính `autocomplete` (`"on"`, `"off"`, hoặc một [`<token-list>`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete#token_list_tokens)) hoặc chuỗi rỗng (`""`) nếu không được chỉ định.

## Ví dụ

```js
const selectElement = document.getElementById("favorite-fruit");
console.log(textArea.autocomplete);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("select")}}
- {{HTMLElement("option")}}
- Thuộc tính HTML [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
- Thuộc tính ARIA [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete)
- [Tắt tự động hoàn thành](/en-US/docs/Web/Security/Practical_implementation_guides/Turning_off_form_autocompletion)
