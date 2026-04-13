---
title: Node
slug: Web/API/Node
page-type: web-api-interface
browser-compat: api.Node
---

{{APIRef("DOM")}}

{{Glossary("DOM")}} **`Node`** là một giao diện lớp cơ sở trừu tượng mà nhiều đối tượng API DOM khác được xây dựng dựa trên đó, nhờ vậy các kiểu đối tượng này có thể được dùng theo cách tương tự và thường có thể thay thế cho nhau. Là một lớp trừu tượng, không có khái niệm một đối tượng `Node` thuần túy. Tất cả các đối tượng triển khai chức năng `Node` đều dựa trên một trong các lớp con của nó. Nổi bật nhất là {{domxref("Document")}}, {{domxref("Element")}} và {{domxref("DocumentFragment")}}.

Ngoài ra, mọi kiểu nút DOM đều được biểu diễn bằng một giao diện dựa trên `Node`. Các kiểu này bao gồm {{DOMxRef("Attr")}}, {{DOMxRef("CharacterData")}} (mà {{DOMxRef("Text")}}, {{DOMxRef("Comment")}}, {{DOMxRef("CDATASection")}} và {{DOMxRef("ProcessingInstruction")}} đều dựa trên), và {{DOMxRef("DocumentType")}}.

Trong một số trường hợp, một tính năng cụ thể của giao diện cơ sở `Node` có thể không áp dụng cho một trong các giao diện con của nó; khi đó, nút kế thừa có thể trả về `null` hoặc ném ra một ngoại lệ, tùy hoàn cảnh. Ví dụ, việc cố thêm phần tử con vào một kiểu nút không thể chứa phần tử con sẽ ném ra một ngoại lệ.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Ngoài các thuộc tính bên dưới, `Node` còn kế thừa các thuộc tính từ lớp cha của nó, {{DOMxRef("EventTarget")}}._

- {{DOMxRef("Node.baseURI")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi biểu thị URL cơ sở tuyệt đối của tài liệu chứa `Node`.
- {{DOMxRef("Node.childNodes")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("NodeList")}} động chứa tất cả phần tử con của nút này (bao gồm phần tử, văn bản và chú thích). `NodeList` là động nghĩa là nếu các phần tử con của `Node` thay đổi, đối tượng `NodeList` sẽ được cập nhật tự động.
- {{DOMxRef("Node.firstChild")}} {{ReadOnlyInline}}
  - : Trả về một `Node` đại diện cho nút con trực tiếp đầu tiên của nút, hoặc `null` nếu nút không có phần tử con.
- {{DOMxRef("Node.isConnected")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết Node có được kết nối hay không (trực tiếp hoặc gián tiếp) với đối tượng ngữ cảnh, ví dụ như đối tượng {{DOMxRef("Document")}} trong DOM thông thường, hoặc {{DOMxRef("ShadowRoot")}} trong shadow DOM.
- {{DOMxRef("Node.lastChild")}} {{ReadOnlyInline}}
  - : Trả về một `Node` đại diện cho nút con trực tiếp cuối cùng của nút, hoặc `null` nếu nút không có phần tử con.
- {{DOMxRef("Node.nextSibling")}} {{ReadOnlyInline}}
  - : Trả về một `Node` đại diện cho nút kế tiếp trong cây, hoặc `null` nếu không có nút như vậy.
- {{DOMxRef("Node.nodeName")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa tên của `Node`. Cấu trúc của tên sẽ khác nhau tùy theo kiểu nút. Ví dụ, một {{DOMxRef("HTMLElement")}} sẽ chứa tên của thẻ tương ứng, như `'AUDIO'` cho {{DOMxRef("HTMLAudioElement")}}, còn nút {{DOMxRef("Text")}} sẽ có chuỗi `'#text'`, hoặc nút {{DOMxRef("Document")}} sẽ có chuỗi `'#document'`.
- {{DOMxRef("Node.nodeType")}} {{ReadOnlyInline}}
  - : Trả về một `unsigned short` biểu thị kiểu của nút. Các giá trị có thể là:

    | Tên                          | Giá trị |
    | ---------------------------- | ------- |
    | `ELEMENT_NODE`               | `1`     |
    | `ATTRIBUTE_NODE`             | `2`     |
    | `TEXT_NODE`                  | `3`     |
    | `CDATA_SECTION_NODE`         | `4`     |
    | `PROCESSING_INSTRUCTION_NODE` | `7`     |
    | `COMMENT_NODE`               | `8`     |
    | `DOCUMENT_NODE`              | `9`     |
    | `DOCUMENT_TYPE_NODE`          | `10`    |
    | `DOCUMENT_FRAGMENT_NODE`     | `11`    |

- {{DOMxRef("Node.nodeValue")}}
  - : Trả về / đặt giá trị của nút hiện tại.
- {{DOMxRef("Node.ownerDocument")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef("Document")}} mà nút này thuộc về. Nếu bản thân nút là một tài liệu, trả về `null`.
- {{DOMxRef("Node.parentNode")}} {{ReadOnlyInline}}
  - : Trả về một `Node` là nút cha của nút này. Nếu không có nút như vậy, chẳng hạn nếu nút này ở đầu cây hoặc không tham gia vào cây, thuộc tính này trả về `null`.
- {{DOMxRef("Node.parentElement")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("Element")}} là phần tử cha của nút này. Nếu nút không có cha, hoặc nếu cha đó không phải là {{DOMxRef("Element")}}, thuộc tính này trả về `null`.
- {{DOMxRef("Node.previousSibling")}} {{ReadOnlyInline}}
  - : Trả về một `Node` đại diện cho nút trước đó trong cây, hoặc `null` nếu không có nút như vậy.
- {{DOMxRef("Node.textContent")}}
  - : Trả về / đặt nội dung văn bản của một phần tử và tất cả phần tử con của nó.

## Phương thức thể hiện

_Ngoài các phương thức bên dưới, `Node` còn kế thừa các phương thức từ lớp cha của nó, {{DOMxRef("EventTarget")}}._

- {{DOMxRef("Node.appendChild()")}}
  - : Thêm đối số `childNode` đã chỉ định vào cuối danh sách phần tử con của nút hiện tại. Nếu đối số tham chiếu đến một nút đã tồn tại trong cây DOM, nút đó sẽ được tách khỏi vị trí hiện tại và gắn vào vị trí mới.
- {{DOMxRef("Node.cloneNode()")}}
  - : Sao chép một `Node`, và tùy chọn sao chép toàn bộ nội dung của nó. Mặc định, nó sao chép nội dung của nút.
- {{DOMxRef("Node.compareDocumentPosition()")}}
  - : So sánh vị trí của nút hiện tại với một nút khác trong bất kỳ tài liệu nào.
- {{DOMxRef("Node.contains()")}}
  - : Trả về giá trị `true` hoặc `false` cho biết một nút có phải là nút hậu duệ của nút gọi hay không.
- {{DOMxRef("Node.getRootNode()")}}
  - : Trả về gốc của đối tượng ngữ cảnh, có thể bao gồm shadow root nếu có.
- {{DOMxRef("Node.hasChildNodes()")}}
  - : Trả về giá trị boolean cho biết phần tử có phần tử con hay không.
- {{DOMxRef("Node.insertBefore()")}}
  - : Chèn một `Node` đứng trước nút tham chiếu như một phần tử con của một nút cha được chỉ định.
- {{DOMxRef("Node.isDefaultNamespace()")}}
  - : Nhận một URI namespace làm đối số và trả về giá trị boolean `true` nếu namespace đó là namespace mặc định trên nút đã cho, hoặc `false` nếu không phải.
- {{DOMxRef("Node.isEqualNode()")}}
  - : Trả về một giá trị boolean cho biết hai nút có cùng kiểu và mọi dữ liệu xác định của chúng có khớp nhau hay không.
- {{DOMxRef("Node.isSameNode()")}}
  - : Trả về một giá trị boolean cho biết hai nút có phải là cùng một nút hay không (tức là chúng tham chiếu đến cùng một đối tượng).
- {{DOMxRef("Node.lookupPrefix()")}}
  - : Trả về một chuỗi chứa tiền tố của một URI namespace đã cho, nếu có, và `null` nếu không có. Khi có nhiều tiền tố khả dĩ, kết quả phụ thuộc vào cách triển khai.
- {{DOMxRef("Node.lookupNamespaceURI()")}}
  - : Nhận một tiền tố và trả về URI namespace được liên kết với nó trên nút đã cho nếu tìm thấy, và `null` nếu không. Nếu truyền `null` làm tiền tố, phương thức sẽ trả về namespace mặc định.
- {{DOMxRef("Node.normalize()")}}
  - : Dọn dẹp tất cả các nút văn bản bên dưới phần tử này (gộp các nút liền kề, xóa các nút rỗng).
- {{DOMxRef("Node.removeChild()")}}
  - : Xóa một nút con khỏi phần tử hiện tại, và nút đó phải là nút con của nút hiện tại.
- {{DOMxRef("Node.replaceChild()")}}
  - : Thay thế một `Node` con của nút hiện tại bằng nút thứ hai được truyền vào.

## Sự kiện

- {{domxref("Node/selectstart_event", "selectstart")}}
  - : Được kích hoạt khi người dùng bắt đầu một vùng chọn mới trong nút này.

## Ví dụ

### Xóa tất cả phần tử con lồng bên trong một nút

Hàm này xóa từng phần tử con đầu tiên của một phần tử cho đến khi không còn phần tử nào.

```js
function removeAllChildren(element) {
  while (element.firstChild) {
    element.removeChild(element.firstChild);
  }
}
```

Dùng hàm này chỉ cần một lần gọi. Ở đây chúng ta xóa toàn bộ nội dung của phần `body` trong tài liệu:

```js
removeAllChildren(document.body);
```

Một cách khác là đặt `textContent` thành chuỗi rỗng: `document.body.textContent = ""`.

### Đệ quy qua các nút con

Hàm sau gọi đệ quy một hàm callback cho mỗi nút được chứa bởi một nút gốc (bao gồm cả nút gốc):

```js
function eachNode(rootNode, callback) {
  if (!callback) {
    const nodes = [];
    eachNode(rootNode, (node) => {
      nodes.push(node);
    });
    return nodes;
  }

  if (callback(rootNode) === false) {
    return false;
  }

  if (rootNode.hasChildNodes()) {
    for (const node of rootNode.childNodes) {
      if (eachNode(node, callback) === false) {
        return;
      }
    }
  }
}
```

Hàm này gọi đệ quy một hàm cho mỗi nút hậu duệ của `rootNode` (bao gồm cả nút gốc).

Nếu bỏ qua `callback`, hàm sẽ trả về một {{jsxref("Array")}} thay thế, chứa `rootNode` và tất cả các nút bên trong nó.

Nếu cung cấp `callback`, và nó trả về `false` khi được gọi, mức đệ quy hiện tại sẽ bị dừng và hàm sẽ tiếp tục thực thi ở mức của nút cha cuối cùng. Điều này có thể dùng để dừng vòng lặp khi đã tìm thấy một nút nào đó, chẳng hạn khi tìm một nút văn bản chứa một chuỗi nhất định.

Hàm có hai tham số:

- `rootNode`
  - : Đối tượng `Node` có các nút hậu duệ sẽ được duyệt đệ quy.
- `callback` {{optional_inline}}
  - : Một hàm callback [tùy chọn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) chỉ nhận một đối số `Node`. Nếu bỏ qua, `eachNode` trả về một {{jsxref("Array")}} gồm mọi nút được chứa trong `rootNode` (bao gồm cả nút gốc).

Ví dụ sau minh họa một cách sử dụng thực tế của hàm `eachNode()`: tìm kiếm văn bản trên một trang web.

Chúng ta dùng một hàm bao bọc tên là `grep` để thực hiện việc tìm kiếm:

```js
function grep(parentNode, pattern) {
  let matches = [];
  let endScan = false;

  eachNode(parentNode, (node) => {
    if (endScan) {
      return false;
    }

    // Bỏ qua mọi thứ không phải nút văn bản
    if (node.nodeType !== Node.TEXT_NODE) {
      return;
    }

    if (typeof pattern === "string" && node.textContent.includes(pattern)) {
      matches.push(node);
    } else if (pattern.test(node.textContent)) {
      if (!pattern.global) {
        endScan = true;
        matches = node;
      } else {
        matches.push(node);
      }
    }
  });

  return matches;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
