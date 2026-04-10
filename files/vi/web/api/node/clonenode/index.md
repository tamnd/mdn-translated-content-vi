---
title: "Node: phương thức cloneNode()"
short-title: cloneNode()
slug: Web/API/Node/cloneNode
page-type: web-api-instance-method
browser-compat: api.Node.cloneNode
---

{{APIRef("DOM")}}

Phương thức **`cloneNode()`** của giao diện {{domxref("Node")}} trả về một bản sao của nút mà phương thức này được gọi trên đó. Đối số của nó điều khiển việc cây con chứa trong nút có được sao chép hay không.

Theo mặc định, việc sao chép một nút sẽ sao chép tất cả các thuộc tính và giá trị của chúng, bao gồm cả các trình xử lý sự kiện được chỉ định qua thuộc tính. Nếu đặt tham số `deep`, bạn cũng có thể sao chép cây con chứa trong nút. Nó _không_ sao chép bất kỳ dữ liệu nội bộ nào khác, chẳng hạn các trình xử lý sự kiện được thêm bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc các thuộc tính `onevent` (ví dụ `node.onclick = someFunction`), hay hình ảnh đã được vẽ sẵn của phần tử {{HTMLElement("canvas")}}.

Phương thức {{domxref("Document.importNode()")}} cũng tạo một bản sao của nút. Khác biệt là `importNode()` sao chép nút trong ngữ cảnh của tài liệu gọi, còn `cloneNode()` dùng tài liệu của chính nút đang được sao chép. Ngữ cảnh tài liệu sẽ quyết định {{domxref("CustomElementRegistry")}} dùng để dựng mọi phần tử tùy chỉnh. Vì lý do này, để sao chép nút để dùng trong tài liệu khác, hãy dùng `importNode()` trên tài liệu đích. {{domxref("HTMLTemplateElement.content")}} thuộc về một tài liệu riêng, vì vậy nó cũng nên được sao chép bằng `document.importNode()` để các phần tử tùy chỉnh con được dựng bằng định nghĩa trong tài liệu hiện tại.

> [!WARNING]
> `cloneNode()` có thể dẫn đến các ID phần tử trùng lặp trong tài liệu! Nếu nút gốc có thuộc tính `id`, và bản sao sẽ được đặt trong cùng một tài liệu, thì bạn nên sửa `id` của bản sao để nó là duy nhất.
>
> Ngoài ra, các thuộc tính `name` cũng có thể cần được sửa đổi, tùy thuộc vào việc tên trùng lặp có được mong đợi hay không.

## Cú pháp

```js-nolint
cloneNode()
cloneNode(deep)
```

### Tham số

- `deep` {{optional_inline}}
  - : Nếu là `true`, thì nút và toàn bộ cây con của nó, bao gồm cả văn bản có thể nằm trong các nút {{domxref("Text")}} con, cũng sẽ được sao chép.

    Nếu là `false` hoặc bị bỏ qua, chỉ nút sẽ được sao chép.
    Cây con, bao gồm cả văn bản mà nút chứa, sẽ không được sao chép.

    Lưu ý rằng `deep` không có tác dụng với {{glossary("void element", "phần tử void")}}, chẳng hạn như các phần tử {{HTMLElement("img")}} và {{HTMLElement("input")}}.

### Giá trị trả về

Nút {{domxref("Node")}} mới được sao chép.
Nút được sao chép không có cha và không thuộc về tài liệu,
_cho đến khi_ nó được thêm vào một nút khác thuộc tài liệu, bằng
{{domxref("Node.appendChild()")}} hoặc phương thức tương tự.

## Ví dụ

### Dùng cloneNode()

```js
const p = document.getElementById("para1");
const p2 = p.cloneNode(true);
```

### Dùng cloneNode() với template

Tránh dùng `cloneNode()` trên nội dung của phần tử {{htmlelement("template")}}, vì nếu template chứa các phần tử tùy chỉnh, chúng sẽ không được nâng cấp cho đến khi được chèn vào tài liệu.

```js
class MyElement extends HTMLElement {
  constructor() {
    super();
    console.log("MyElement created");
  }
}
customElements.define("my-element", MyElement);

const template = document.createElement("template");
template.innerHTML = `<my-element></my-element>`;

const clone = template.content.cloneNode(true);
// Chưa log gì; my-element chưa được định nghĩa trong tài liệu của template
customElements.upgrade(clone);
// Vẫn chưa log gì; my-element vẫn chưa được định nghĩa trong tài liệu của template
document.body.appendChild(clone);
// Log "MyElement created"; my-element giờ đã được nâng cấp
```

Thay vào đó, hãy dùng `document.importNode()` để sao chép nội dung template, để mọi phần tử tùy chỉnh được nâng cấp bằng các định nghĩa trong tài liệu hiện tại:

```js
const clone = document.importNode(template.content, true);
// Log "MyElement created"; my-element được nâng cấp bằng các định nghĩa của document
document.body.appendChild(clone);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
