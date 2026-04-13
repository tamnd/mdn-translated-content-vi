---
title: "Node: phương thức getRootNode()"
short-title: getRootNode()
slug: Web/API/Node/getRootNode
page-type: web-api-instance-method
browser-compat: api.Node.getRootNode
---

{{APIRef("DOM")}}

Phương thức **`getRootNode()`** của giao diện {{domxref("Node")}} trả về gốc của đối tượng ngữ cảnh, có thể bao gồm shadow root nếu có.

## Cú pháp

```js-nolint
getRootNode()
getRootNode(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng đặt các tùy chọn để lấy nút gốc. Các tùy chọn có sẵn là:
    - `composed`: Một giá trị boolean cho biết shadow root có nên được trả về (`false`, mặc định) hay là một nút gốc vượt qua shadow root (`true`).

### Giá trị trả về

Một đối tượng kế thừa từ {{domxref('Node')}}. Hình dạng chính xác của nó sẽ khác nhau tùy theo vị trí bạn gọi `getRootNode()`; ví dụ:

- Gọi trên một phần tử trong một trang web thông thường sẽ trả về một đối tượng {{domxref("HTMLDocument")}} biểu thị toàn bộ trang (hoặc {{HTMLElement("iframe")}}).
- Gọi trên một phần tử bên trong shadow DOM sẽ trả về {{domxref("ShadowRoot")}} tương ứng.
- Gọi trên một phần tử không được gắn vào tài liệu hoặc cây shadow sẽ trả về gốc của cây DOM mà nó thuộc về.

## Ví dụ

### Ví dụ 1

Ví dụ đơn giản đầu tiên trả về một tham chiếu đến nút HTML/tài liệu:

```js
const rootNode = node.getRootNode();
```

### Ví dụ 2

Ví dụ phức tạp hơn này cho thấy sự khác biệt giữa việc trả về một root bình thường và một root bao gồm shadow root:

```html
<div class="parent">
  <div class="child"></div>
</div>
<div class="shadowHost">shadowHost</div>
<pre id="output">Output: </pre>
```

```js
const parent = document.querySelector(".parent");
const child = document.querySelector(".child");
const shadowHost = document.querySelector(".shadowHost");
const output = document.getElementById("output");

output.innerText += `\nroot của parent: ${parent.getRootNode().nodeName}\n`; // #document
output.innerText += `root của child: ${child.getRootNode().nodeName}\n\n`; // #document

// tạo một ShadowRoot
const shadowRoot = shadowHost.attachShadow({ mode: "open" });
shadowRoot.innerHTML =
  '<style>div{background:#2bb8aa;}</style><div class="shadowChild">shadowChild</div>';
const shadowChild = shadowRoot.querySelector(".shadowChild");

// Giá trị mặc định của composed là false
output.innerText += `shadowChild.getRootNode() === shadowRoot : ${
  shadowChild.getRootNode() === shadowRoot
}\n`; // true
output.innerText += `shadowChild.getRootNode({ composed:false }) === shadowRoot : ${
  shadowChild.getRootNode({ composed: false }) === shadowRoot
}\n`; // true
output.innerText += `shadowChild.getRootNode({ composed:true }).nodeName : ${
  shadowChild.getRootNode({ composed: true }).nodeName
}\n`; // #document
```

{{ EmbedLiveSample('Example 2', '100%', '200px') }}

### Ví dụ 3

Ví dụ này trả về gốc của cây chưa được gắn.
Lưu ý `element` ở đây là gốc của cây (vì nó không có cha), nên theo định nghĩa gốc của nó chính là nó:

```js
const element = document.createElement("p");
const child = document.createElement("span");

element.append(child);

const rootNode = child.getRootNode(); // <p><span></span></p>

element === rootNode; // true
element === element.getRootNode(); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
