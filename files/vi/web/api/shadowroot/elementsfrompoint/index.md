---
title: "ShadowRoot: phương thức elementsFromPoint()"
short-title: elementsFromPoint()
slug: Web/API/ShadowRoot/elementsFromPoint
page-type: web-api-instance-method
status:
  - non-standard
browser-compat: api.ShadowRoot.elementsFromPoint
---

{{APIRef("DOM")}}{{Non-standard_Header}}

Phương thức **`elementsFromPoint()`** của giao diện {{domxref("ShadowRoot")}} trả về một mảng gồm tất cả các phần tử shadow root tại tọa độ được chỉ định (tương đối với viewport). Các phần tử được sắp xếp từ phần tử trên cùng (cao nhất trong thứ tự z của hiển thị) đến phần tử dưới cùng.

Nó hoạt động tương tự như phương thức {{domxref("ShadowRoot.elementFromPoint")}}. Một số trình duyệt chỉ trả về các phần tử shadow root có mặt tại vị trí đó. Những trình duyệt khác bao gồm cả các phần tử nằm ngoài [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM), từ phần tử shadow DOM ở lớp trên cùng đến nút gốc của tài liệu, như phần tử gốc {{htmlelement("html")}} hoặc {{SVGElement("svg")}}. Trong các trình duyệt này, nó hoạt động tương tự phương thức {{domxref("Document.elementsFromPoint")}}, nhưng có khả năng đi qua [ranh giới shadow](/en-US/docs/Glossary/Shadow_tree).

## Cú pháp

```js-nolint
elementsFromPoint(x, y)
```

### Tham số

- `x`
  - : Tọa độ ngang của một điểm, tương đối với mép trái của {{Glossary("viewport")}} hiện tại.
- `y`
  - : Tọa độ dọc của một điểm, tương đối với mép trên của viewport hiện tại.

### Giá trị trả về

Một mảng các đối tượng {{domxref('Element')}}.

## Ví dụ

```js
const customElem = document.querySelector("my-custom-element");
const shadow = customElem.shadowRoot;
const elements = shadow.elementsFromPoint(20, 20);
const msg = elements.map((el) => el.localName).join(" < ");
if (msg) {
  console.log(msg);
} else {
  console.log("Phần tử custom không có nút con nào tại x: 20, y: 20.");
}
```

Nếu `<my-custom-element>` ở gần góc trên bên trái của viewport, và chứa một `<div>` duy nhất, kết quả trên có thể là một trong hai giá trị sau, tùy theo cách triển khai của trình duyệt:

```plain
div
div < my-custom-element < body < html
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("ShadowRoot.elementFromPoint()")}}
- {{DOMxRef("Document.elementsFromPoint()")}}
