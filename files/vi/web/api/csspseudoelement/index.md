---
title: CSSPseudoElement
slug: Web/API/CSSPseudoElement
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CSSPseudoElement
---

{{APIRef}}{{SeeCompatTable}}

Giao diện **`CSSPseudoElement`** biểu thị một pseudo-element có thể là mục tiêu của một sự kiện hoặc được tạo hoạt ảnh bằng {{DOMxRef('Web Animations API', '', '', 'true')}}. Các phiên bản của giao diện này có thể thu được bằng cách gọi {{DOMxRef('Element.pseudo()')}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{DOMxRef('CSSPseudoElement.element')}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef('Element')}} gốc/cha của pseudo-element.
- {{DOMxRef('CSSPseudoElement.type')}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về bộ chọn pseudo-element dưới dạng chuỗi.

## Phương thức phiên bản

_`CSSPseudoElement` mở rộng {{DOMxRef('EventTarget')}}, vì vậy nó kế thừa các phương thức sau:_

## Ví dụ

### Ví dụ cơ bản sử dụng Element.pseudo

Sử dụng pseudo-elements, hầu hết các trình duyệt hiện đại sẽ tự động thêm dấu ngoặc kép xung quanh văn bản trong phần tử {{HTMLElement('q')}}. (Có thể cần một quy tắc style để thêm dấu ngoặc kép trong các trình duyệt cũ hơn.) Ví dụ dưới đây minh họa các thuộc tính cơ bản của đối tượng `CSSPseudoElement` biểu thị dấu ngoặc kép mở.

```js
const element = document.querySelector("q");
const cssPseudoElement = element.pseudo("::before");
console.log(cssPseudoElement.element); // Outputs [object HTMLQuoteElement]
console.log(cssPseudoElement.type); // Outputs '::before'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef('Element.pseudo()')}}
- {{DOMxRef('Web Animations API', '', '', 'true')}}
- {{DOMxRef('Element.animate()')}}
