---
title: "HTMLScriptElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLScriptElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.type
---

{{APIRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLScriptElement")}} là một chuỗi phản ánh loại tập lệnh.

Nó phản ánh thuộc tính `type` của phần tử {{HTMLElement("script")}}.

## Giá trị

Một chuỗi. Giá trị của thuộc tính này có thể là một trong những giá trị sau:

- **Thuộc tính không được đặt (mặc định), chuỗi rỗng, hoặc kiểu MIME JavaScript**
  - : Chỉ ra rằng tập lệnh là "classic script", chứa mã JavaScript.
- `module`
  - : Giá trị này khiến mã được xử lý như một JavaScript module.
- `importmap`
  - : Giá trị này chỉ ra rằng phần thân của phần tử chứa một import map.
- `speculationrules` {{experimental_inline}}
  - : Giá trị này chỉ ra rằng phần thân của phần tử chứa speculation rules.
- **Bất kỳ giá trị nào khác**
  - : Nội dung được nhúng được coi là một khối dữ liệu, và sẽ không được trình duyệt xử lý.

Để biết thêm thông tin, hãy tham khảo thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/script/type) của phần tử {{HTMLElement("script")}}.

## Ví dụ

```html
<script id="el" type="module"></script>
```

```js
const el = document.getElementById("el");
console.log(el.type); // Kết quả: "module"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
