---
title: DocumentFragment
slug: Web/API/DocumentFragment
page-type: web-api-interface
browser-compat: api.DocumentFragment
---

{{APIRef("DOM")}}

Giao diện **`DocumentFragment`** đại diện cho một tài liệu tối giản không có nút cha.

Nó được dùng như một phiên bản nhẹ của {{domxref("Document")}} để lưu trữ một đoạn cấu trúc tài liệu gồm các nút giống như một tài liệu chuẩn. Điểm khác biệt chính là document fragment không nằm trong cây tài liệu đang hoạt động. Các thay đổi được thực hiện trên fragment sẽ không ảnh hưởng đến tài liệu.

{{InheritanceDiagram}}

## Constructor

- {{ domxref("DocumentFragment.DocumentFragment()", "DocumentFragment()") }}
  - : Tạo và trả về một đối tượng `DocumentFragment` mới.

## Thuộc tính thể hiện

_Giao diện này không có thuộc tính riêng, nhưng kế thừa các thuộc tính của lớp cha, {{domxref("Node")}}._

- {{ domxref("DocumentFragment.childElementCount") }} {{ReadOnlyInline}}
  - : Trả về số lượng {{domxref("Element","phần tử")}} con mà `DocumentFragment` có.
- {{ domxref("DocumentFragment.children") }} {{ReadOnlyInline}}
  - : Trả về một {{domxref("HTMLCollection")}} động chứa tất cả các đối tượng kiểu {{domxref("Element")}} là con của `DocumentFragment`.
- {{ domxref("DocumentFragment.firstElementChild") }} {{ReadOnlyInline}}
  - : Trả về {{domxref("Element")}} là phần tử con đầu tiên của `DocumentFragment`, hoặc `null` nếu không có phần tử con nào.
- {{ domxref("DocumentFragment.lastElementChild") }} {{ReadOnlyInline}}
  - : Trả về {{domxref("Element")}} là phần tử con cuối cùng của `DocumentFragment`, hoặc `null` nếu không có phần tử con nào.

## Phương thức thể hiện

_Giao diện này kế thừa các phương thức của lớp cha, {{domxref("Node")}}._

- {{DOMxRef("DocumentFragment.append()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi sau phần tử con cuối cùng của document fragment.
- {{DOMxRef("DocumentFragment.prepend()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi trước phần tử con đầu tiên của document fragment.
- {{domxref("DocumentFragment.querySelector()")}}
  - : Trả về nút {{domxref("Element")}} đầu tiên trong `DocumentFragment`, theo thứ tự tài liệu, khớp với bộ chọn đã chỉ định.
- {{domxref("DocumentFragment.querySelectorAll()")}}
  - : Trả về một {{domxref("NodeList")}} chứa tất cả các nút {{domxref("Element")}} trong `DocumentFragment` khớp với bộ chọn đã chỉ định.
- {{DOMxRef("DocumentFragment.moveBefore()")}}
  - : Di chuyển một {{domxref("Node")}} đã cho bên trong `DocumentFragment` đang gọi thành phần tử con trực tiếp, đứng trước một nút tham chiếu đã cho, mà không xóa rồi chèn lại nút đó.
- {{DOMxRef("DocumentFragment.replaceChildren()")}}
  - : Thay thế các phần tử con hiện có của `DocumentFragment` bằng một tập hợp phần tử con mới được chỉ định.
- {{domxref("DocumentFragment.getElementById()")}}
  - : Trả về nút {{domxref("Element")}} đầu tiên trong `DocumentFragment`, theo thứ tự tài liệu, khớp với ID được chỉ định. Về mặt chức năng, nó tương đương với {{domxref("Document.getElementById()")}}.

## Ghi chú sử dụng

Một cách dùng phổ biến của `DocumentFragment` là tạo một fragment, ghép một cây con DOM bên trong nó, rồi thêm hoặc chèn fragment vào DOM bằng các phương thức của giao diện {{domxref("Node")}} như {{domxref("Node.appendChild", "appendChild()")}}, {{domxref("Element.append", "append()")}}, hoặc {{domxref("Node.insertBefore", "insertBefore()")}}. Làm như vậy sẽ di chuyển các nút của fragment vào DOM và để lại một `DocumentFragment` rỗng.

Giao diện này cũng rất hữu ích với Web Components: các phần tử {{HTMLElement("template")}} chứa một `DocumentFragment` trong thuộc tính {{domxref("HTMLTemplateElement.content")}}.

Bạn có thể tạo một `DocumentFragment` rỗng bằng phương thức {{domxref("document.createDocumentFragment()")}} hoặc bằng constructor.

## Hiệu năng

Lợi ích hiệu năng của `DocumentFragment` thường bị phóng đại. Thực tế, ở một số engine, dùng `DocumentFragment` còn chậm hơn việc thêm vào tài liệu trong một vòng lặp như minh họa trong [benchmark này](https://jsbench.me/02l63eic9j/1). Tuy nhiên, sự khác biệt giữa các ví dụ này rất nhỏ nên tốt hơn là tối ưu cho khả năng đọc thay vì hiệu năng.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
