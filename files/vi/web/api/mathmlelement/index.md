---
title: MathMLElement
slug: Web/API/MathMLElement
page-type: web-api-interface
browser-compat: api.MathMLElement
---

{{APIRef("MathML")}}

Giao diện **`MathMLElement`** đại diện cho bất kỳ phần tử [MathML](/en-US/docs/Web/MathML) nào.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ lớp cha {{DOMxRef("Element")}}_

- {{DOMxRef("MathMLElement.attributeStyleMap")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("StylePropertyMap")}} đại diện cho các khai báo của thuộc tính `style` của phần tử.
- {{DOMxRef("MathMLElement.autofocus")}}
  - : Liệu điều khiển có nên được lấy tiêu điểm khi trang tải, hoặc khi {{htmlelement("dialog")}} hoặc [popover](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) được hiển thị hay không.
- {{DOMxRef("MathMLElement.dataset")}} {{ReadOnlyInline}}
  - : Một đối tượng {{DOMxRef("DOMStringMap")}} cung cấp danh sách các cặp khóa/giá trị của các thuộc tính dữ liệu có tên tương ứng với [thuộc tính dữ liệu tùy chỉnh](/en-US/docs/Web/HTML/How_to/Use_data_attributes) gắn kèm với phần tử. Chúng tương ứng với các thuộc tính toàn cục [`data-*`](/en-US/docs/Web/MathML/Reference/Global_attributes/data-*) của MathML.
- {{DOMxRef("MathMLElement.style")}}
  - : Một {{DOMxRef("CSSStyleDeclaration")}} đại diện cho các khai báo của thuộc tính `style` của phần tử.
- {{DOMxRef("MathMLElement.tabIndex")}}
  - : Vị trí của phần tử trong thứ tự tab.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ lớp cha {{DOMxRef("Element")}}_

- {{DOMxRef("MathMLElement.blur()")}}
  - : Xóa tiêu điểm bàn phím khỏi phần tử hiện đang được lấy tiêu điểm.
- {{DOMxRef("MathMLElement.focus()")}}
  - : Đặt phần tử là tiêu điểm bàn phím hiện tại.

## Ví dụ

### MathML

```html
<math>
  <msqrt>
    <mi>x</mi>
  </msqrt>
</math>
```

### JavaScript

```js
document.querySelector("msqrt").constructor.name; // MathMLElement
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Element")}}
- {{DOMxRef("HTMLElement")}}
- {{DOMxRef("SVGElement")}}
