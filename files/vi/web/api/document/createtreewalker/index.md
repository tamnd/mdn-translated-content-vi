---
title: "Document: phương thức createTreeWalker()"
short-title: createTreeWalker()
slug: Web/API/Document/createTreeWalker
page-type: web-api-instance-method
browser-compat: api.Document.createTreeWalker
---

{{ApiRef("Document")}}

Phương thức tạo **`Document.createTreeWalker()`** trả về một đối tượng {{domxref("TreeWalker")}} mới được tạo.

## Cú pháp

```js-nolint
createTreeWalker(root)
createTreeWalker(root, whatToShow)
createTreeWalker(root, whatToShow, filter)
```

### Tham số

- `root`
  - : Một {{domxref("Node")}} đại diện cho gốc của đối tượng `TreeWalker`, đây là giá trị ban đầu của {{domxref("TreeWalker.currentNode")}}.

- `whatToShow` {{optional_inline}}
  - : Một `unsigned long` đại diện cho một bitmask được tạo bằng cách kết hợp các hằng số của [`NodeFilter`](https://dom.spec.whatwg.org/#interface-nodefilter). Đây là một cách thuận tiện để lọc các loại nút cụ thể. Mặc định là `0xFFFFFFFF`, đại diện cho hằng số `NodeFilter.SHOW_ALL`.

    | Hằng số                                                  | Giá trị số      | Mô tả                                             |
    | -------------------------------------------------------- | --------------- | ------------------------------------------------- |
    | `NodeFilter.SHOW_ALL`                                    | `0xFFFFFFFF`    | Hiển thị tất cả các nút.                          |
    | `NodeFilter.SHOW_ATTRIBUTE`                              | `0x2`           | Hiển thị các nút {{domxref("Attr")}}.             |
    | `NodeFilter.SHOW_CDATA_SECTION`                          | `0x8`           | Hiển thị các nút {{domxref("CDATASection")}}.     |
    | `NodeFilter.SHOW_COMMENT`                                | `0x80`          | Hiển thị các nút {{domxref("Comment")}}.          |
    | `NodeFilter.SHOW_DOCUMENT`                               | `0x100`         | Hiển thị các nút {{domxref("Document")}}.         |
    | `NodeFilter.SHOW_DOCUMENT_FRAGMENT`                      | `0x400`         | Hiển thị các nút {{domxref("DocumentFragment")}}. |
    | `NodeFilter.SHOW_DOCUMENT_TYPE`                          | `0x200`         | Hiển thị các nút {{domxref("DocumentType")}}.     |
    | `NodeFilter.SHOW_ELEMENT`                                | `0x1`           | Hiển thị các nút {{domxref("Element")}}.          |
    | `NodeFilter.SHOW_ENTITY` {{deprecated_inline}}           | `0x20`          | Legacy, không còn hiệu lực.                       |
    | `NodeFilter.SHOW_ENTITY_REFERENCE` {{deprecated_inline}} | `0x10`          | Legacy, không còn hiệu lực.                       |
    | `NodeFilter.SHOW_NOTATION` {{deprecated_inline}}         | `0x800`         | Legacy, không còn hiệu lực.                       |
    | `NodeFilter.SHOW_PROCESSING_INSTRUCTION`                 | `0x40`          | Hiển thị các nút {{domxref("ProcessingInstruction")}}. |
    | `NodeFilter.SHOW_TEXT`                                   | `0x4`           | Hiển thị các nút {{domxref("Text")}}.             |

    > [!NOTE]
    > Hằng số `NodeFilter.SHOW_ATTRIBUTE` chỉ có hiệu lực khi root là một nút thuộc tính. Vì cha của bất kỳ nút `Attr` nào luôn là `null`, {{DOMXref("TreeWalker.nextNode()")}} và {{DOMXref("TreeWalker.previousNode()")}} sẽ không bao giờ trả về một nút `Attr`. Để duyệt các nút `Attr`, hãy sử dụng {{DOMXref("Element.attributes")}} thay thế.

- `filter` {{optional_inline}}
  - : Một hàm callback hoặc một đối tượng có phương thức `acceptNode()`, trả về `NodeFilter.FILTER_ACCEPT`, `NodeFilter.FILTER_REJECT` hoặc `NodeFilter.FILTER_SKIP`. Hàm hoặc phương thức sẽ được gọi cho mỗi nút trong cây con dựa trên `root` được chấp nhận là được bao gồm bởi cờ `whatToShow` để xác định xem có bao gồm nó trong danh sách các nút có thể duyệt hay không:
    - Nếu giá trị trả về là `NodeFilter.FILTER_ACCEPT`, nút này được bao gồm.
    - Nếu giá trị trả về là `NodeFilter.FILTER_REJECT`, bất kỳ nút nào trong cây con dựa trên nút này sẽ không được bao gồm.
    - Nếu giá trị trả về là `NodeFilter.FILTER_SKIP`, nút này không được bao gồm.

### Giá trị trả về

Một đối tượng {{domxref("TreeWalker")}} mới.

## Ví dụ

### Sử dụng whatToShow

Ví dụ này sử dụng `whatToShow` để chuyển đổi nội dung văn bản thành chữ hoa. Lưu ý rằng các nút văn bản của các phần tử con của phần tử `#root` cũng được duyệt mặc dù chúng không phải là các nút con của phần tử `#root`.

#### HTML

```html
<div id="root">
  This is a text node.
  <span>And this is a <code>span</code> element.</span>
</div>
```

#### CSS

```css
span {
  background-color: aqua;
}
```

#### JavaScript

```js
const treeWalker = document.createTreeWalker(
  document.querySelector("#root"),
  NodeFilter.SHOW_TEXT,
);

while (treeWalker.nextNode()) {
  const node = treeWalker.currentNode;
  node.data = node.data.toUpperCase();
}
```

#### Kết quả

{{EmbedLiveSample("using_whattoshow", "100%", 100)}}

### Sử dụng filter

Ví dụ này sử dụng `filter` để escape nội dung văn bản. Đối với bất kỳ nút văn bản nào, nội dung của nó sẽ được escape bằng {{JSXref("encodeURI()")}} nếu nó là phần tử con của một phần tử `.escape` nhưng không phải của bất kỳ phần tử `.no-escape` nào.

#### HTML

```html
<div>
  <div>
    This is not escaped. <span class="escape">But this is escaped.</span>
  </div>
  <div class="escape">This is escaped.</div>
  <div class="no-escape">This is not escaped.</div>
</div>
<hr />
<div class="escape">
  <div>
    This is escaped. <span class="no-escape">But this is not escaped.</span>
  </div>
  <div class="no-escape">This is not escaped.</div>
</div>
<hr />
<div class="no-escape">
  <div>This is not escaped.</div>
  <div class="escape">This is not escaped.</div>
</div>
```

#### CSS

```css hidden
div {
  margin: 0.25em 0;
  padding: 0.25em;
}
span {
  display: inline-block;
}
```

```css
.escape {
  border: dashed;
}
.no-escape {
  border: solid;
}
```

#### JavaScript

```js
const treeWalker = document.createTreeWalker(
  document.body,
  NodeFilter.SHOW_ELEMENT,
  (node) =>
    node.classList.contains("no-escape")
      ? NodeFilter.FILTER_REJECT
      : node.closest(".escape")
        ? NodeFilter.FILTER_ACCEPT
        : NodeFilter.FILTER_SKIP,
);

while (treeWalker.nextNode()) {
  for (const node of treeWalker.currentNode.childNodes) {
    if (node.nodeType === Node.TEXT_NODE && /\S/.test(node.data)) {
      // Exclude whitespace-only text nodes
      node.data = encodeURI(node.data.replace(/\s+/g, " "));
    }
  }
}
```

#### Kết quả

{{EmbedLiveSample("using_filter", "100%", 400)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TreeWalker")}}: Giao diện liên quan
