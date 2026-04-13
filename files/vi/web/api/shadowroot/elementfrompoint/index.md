---
title: "ShadowRoot: phương thức elementFromPoint()"
short-title: elementFromPoint()
slug: Web/API/ShadowRoot/elementFromPoint
page-type: web-api-instance-method
status:
  - non-standard
browser-compat: api.ShadowRoot.elementFromPoint
---

{{APIRef("DOM")}}{{Non-standard_Header}}

Phương thức **`elementFromPoint()`**, khả dụng trên đối tượng {{domxref("ShadowRoot")}}, trả về phần tử ở lớp shadow root trên cùng tại tọa độ được chỉ định tương đối với viewport (shadow root cao nhất trong thứ tự z của hiển thị có thể nhận sự kiện con trỏ). Các phần tử shadow root có {{cssxref("pointer-events")}} đặt thành `none` sẽ bị bỏ qua.

Nếu điểm được chỉ định nằm ngoài ranh giới của shadow root, kết quả là `undefined`.

## Cú pháp

```js-nolint
elementFromPoint(x, y)
```

### Tham số

- `x`
  - : Tọa độ ngang của một điểm, tương đối với mép trái của {{Glossary("viewport")}} hiện tại.
- `y`
  - : Tọa độ dọc của một điểm, tương đối với mép trên của viewport hiện tại.

### Giá trị trả về

Một {{domxref("Element")}}; phần tử shadow root nằm ở vị trí cao nhất tại tọa độ được chỉ định, nếu có.

## Ví dụ

Trong ví dụ này, giả sử HTML có sẵn một {{htmlelement("template")}}, chúng ta định nghĩa một `<my-custom-element>`. Nếu phần tử custom được thêm vào chạm vào góc trên bên trái của viewport, hoặc bất kỳ phần nào của nó chồng lên góc đó, phần tử ở lớp trên cùng tại điểm đó trong custom element sẽ có một viền đỏ mảnh, nét đứt.

```js
customElements.define(
  "my-custom-element",
  class extends HTMLElement {
    constructor() {
      super();
      const template = document.getElementById("my-custom-element-template");
      const sRoot = this.attachShadow({ mode: "open" });
      sRoot.appendChild(document.importNode(template.content, true));
      // lấy phần tử trên cùng ở góc trên bên trái của viewport
      const srElement = this.shadowRoot.elementFromPoint(0, 0);
      // áp dụng viền cho phần tử đó
      srElement.style.border = "1px dashed red";
    }
  },
);
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ShadowRoot.elementsFromPoint()")}}
- {{domxref("Document.elementFromPoint()")}}
