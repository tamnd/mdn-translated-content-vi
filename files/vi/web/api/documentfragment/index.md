---
title: DocumentFragment
slug: Web/API/DocumentFragment
page-type: web-api-interface
browser-compat: api.DocumentFragment
---

{{ APIRef("DOM") }}

Giao diện **`DocumentFragment`** đại diện cho một đối tượng tài liệu tối thiểu không có phần tử cha.

Nó được sử dụng như một phiên bản nhẹ của {{domxref("Document")}} để lưu trữ một phân đoạn cấu trúc tài liệu bao gồm các nút giống như một tài liệu chuẩn. Sự khác biệt chính là do phân đoạn tài liệu không phải là một phần của cấu trúc cây tài liệu hoạt động. Các thay đổi được thực hiện đối với phân đoạn không ảnh hưởng đến tài liệu.

{{InheritanceDiagram}}

## Constructor

- {{ domxref("DocumentFragment.DocumentFragment()", "DocumentFragment()") }}
  - : Tạo và trả về một đối tượng `DocumentFragment` mới.

## Thuộc tính thực thể

_Giao diện này không có thuộc tính cụ thể nào, nhưng kế thừa những thuộc tính của phần tử cha, {{domxref("Node")}}._

- {{ domxref("DocumentFragment.childElementCount") }} {{ReadOnlyInline}}
  - : Trả về số lượng {{domxref("Element","phần tử")}} con mà `DocumentFragment` có.
- {{ domxref("DocumentFragment.children") }} {{ReadOnlyInline}}
  - : Trả về một {{domxref("HTMLCollection")}} trực tiếp chứa tất cả các đối tượng kiểu {{domxref("Element")}} là con của đối tượng `DocumentFragment`.
- {{ domxref("DocumentFragment.firstElementChild") }} {{ReadOnlyInline}}
  - : Trả về {{domxref("Element")}} là phần tử con đầu tiên của đối tượng `DocumentFragment`, hoặc `null` nếu không có phần tử nào.
- {{ domxref("DocumentFragment.lastElementChild") }} {{ReadOnlyInline}}
  - : Trả về {{domxref("Element")}} là phần tử con cuối cùng của đối tượng `DocumentFragment`, hoặc `null` nếu không có phần tử nào.

## Phương thức thực thể

_Giao diện này kế thừa các phương thức của phần tử cha, {{domxref("Node")}}._

- {{DOMxRef("DocumentFragment.append()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi sau phần tử con cuối cùng của phân đoạn tài liệu.
- {{DOMxRef("DocumentFragment.prepend()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi trước phần tử con đầu tiên của phân đoạn tài liệu.
- {{domxref("DocumentFragment.querySelector()")}}
  - : Trả về nút {{domxref("Element")}} đầu tiên trong `DocumentFragment`, theo thứ tự tài liệu, khớp với các bộ chọn đã chỉ định.
- {{domxref("DocumentFragment.querySelectorAll()")}}
  - : Trả về một {{domxref("NodeList")}} của tất cả các nút {{domxref("Element")}} trong `DocumentFragment` khớp với các bộ chọn đã chỉ định.
- {{DOMxRef("DocumentFragment.moveBefore()")}}
  - : Di chuyển một {{domxref("Node")}} đã cho vào trong `DocumentFragment` gọi phương thức như một phần tử con trực tiếp, trước một nút tham chiếu đã cho, mà không cần xóa rồi chèn lại nút.
- {{DOMxRef("DocumentFragment.replaceChildren()")}}
  - : Thay thế các phần tử con hiện có của `DocumentFragment` bằng một tập hợp phần tử con mới đã chỉ định.
- {{domxref("DocumentFragment.getElementById()")}}
  - : Trả về nút {{domxref("Element")}} đầu tiên trong `DocumentFragment`, theo thứ tự tài liệu, khớp với ID đã chỉ định. Hoạt động tương tự như {{domxref("Document.getElementById()")}}.

## Ghi chú sử dụng

Cách sử dụng phổ biến cho `DocumentFragment` là tạo một phân đoạn, lắp ráp một cây con DOM bên trong nó, sau đó nối hoặc chèn phân đoạn vào DOM bằng các phương thức giao diện {{domxref("Node")}} như {{domxref("Node.appendChild", "appendChild()")}}, {{domxref("Element.append", "append()")}}, hoặc {{domxref("Node.insertBefore", "insertBefore()")}}. Việc này sẽ di chuyển các nút của phân đoạn vào DOM, để lại một `DocumentFragment` rỗng.

Giao diện này cũng rất hữu ích với các Web component: các phần tử {{HTMLElement("template")}} chứa một `DocumentFragment` trong thuộc tính {{domxref("HTMLTemplateElement.content")}} của chúng.

Một `DocumentFragment` rỗng có thể được tạo bằng phương thức {{domxref("document.createDocumentFragment()")}} hoặc constructor.

## Hiệu suất

Lợi ích về hiệu suất của `DocumentFragment` thường bị phóng đại quá mức. Trên thực tế, trong một số công cụ, việc sử dụng `DocumentFragment` chậm hơn so với việc nối vào tài liệu trong một vòng lặp như đã minh họa trong [phép đo hiệu suất này](https://jsbench.me/02l63eic9j/1). Tuy nhiên, sự khác biệt giữa các ví dụ này nhỏ đến mức tốt hơn nên tối ưu hóa cho khả năng đọc hơn là hiệu suất.

## Ví dụ

### HTML

```html
<ul></ul>
```

### JavaScript

```js
const ul = document.querySelector("ul");
const fruits = ["Apple", "Orange", "Banana", "Melon"];

const fragment = new DocumentFragment();

for (const fruit of fruits) {
  const li = document.createElement("li");
  li.textContent = fruit;
  fragment.append(li);
}

ul.append(fragment);
```

### Kết quả

{{EmbedLiveSample('Example')}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
