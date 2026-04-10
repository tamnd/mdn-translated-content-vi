---
title: "HTMLFormElement: thuộc tính autocomplete"
short-title: autocomplete
slug: Web/API/HTMLFormElement/autocomplete
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.autocomplete
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`autocomplete`** của giao diện {{DOMxRef("HTMLFormElement")}} cho biết liệu giá trị của các điều khiển biểu mẫu có thể được trình duyệt tự động hoàn thành hay không. Nó phản ánh thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) của phần tử {{htmlelement("form")}}.

## Giá trị

Một chuỗi; giá trị `"off"` nếu được đặt rõ ràng là `"off"`, và ngược lại luôn là `"on"`.

## Ví dụ

```js
const formElement = document.getElementById("name");
console.log(formElement.autocomplete);
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("form")}}
- Thuộc tính HTML [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
- Thuộc tính ARIA [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete)
- [Tắt tự động hoàn thành](/en-US/docs/Web/Security/Practical_implementation_guides/Turning_off_form_autocompletion)
