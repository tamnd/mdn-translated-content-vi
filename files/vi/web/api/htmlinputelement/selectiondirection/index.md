---
title: "HTMLInputElement: thuộc tính selectionDirection"
short-title: selectionDirection
slug: Web/API/HTMLInputElement/selectionDirection
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.selectionDirection
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`selectionDirection`** của giao diện {{domxref("HTMLInputElement")}} là một chuỗi cho biết hướng mà người dùng đang chọn văn bản.

## Giá trị

Một chuỗi. Nó có thể có một trong các giá trị sau:

- `forward`
  - : Người dùng đang mở rộng lựa chọn về phía cuối văn bản đầu vào.
- `backward`
  - : Người dùng đang mở rộng lựa chọn về phía đầu của văn bản đầu vào.
- `none`
  - : Người dùng không mở rộng lựa chọn.

> [!NOTE]
> Trên Windows, hướng cho biết vị trí của con trỏ tương đối với lựa chọn: lựa chọn "forward" có con trỏ ở cuối lựa chọn và lựa chọn "backward" có con trỏ ở đầu lựa chọn. Windows không có hướng "none".

> [!NOTE]
> Trên Mac, hướng cho biết đầu nào của lựa chọn bị ảnh hưởng khi người dùng điều chỉnh kích thước lựa chọn bằng các phím mũi tên với phím Shift: hướng "forward" nghĩa là cuối của lựa chọn được sửa đổi, và hướng "backward" nghĩa là đầu của lựa chọn được sửa đổi. Hướng "none" là mặc định trên Mac, cho biết rằng chưa có hướng cụ thể nào được chọn. Người dùng đặt hướng ngầm định khi lần đầu điều chỉnh lựa chọn, dựa trên phím mũi tên theo hướng nào được sử dụng.

## Ví dụ

### HTML

```html
<label for="selectionDirection">Thuộc tính selectionDirection</label>
<input type="text" id="selectionDirection" value="MDN" />
<p id="direction"></p>
```

### JavaScript

```js
const textSelectionDirection = document.querySelector("#selectionDirection");
const pConsole = document.querySelector("#direction");
pConsole.textContent = `Hướng lựa chọn : ${textSelectionDirection.selectionDirection}`;
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLTextAreaElement.selectionDirection")}}
- Thuộc tính {{domxref("HTMLInputElement.selectionStart")}}
- Thuộc tính {{domxref("HTMLInputElement.selectionEnd")}}
- Phương thức {{domxref("HTMLInputElement.setSelectionRange")}}
