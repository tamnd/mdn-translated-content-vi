---
title: Giới thiệu về việc sử dụng XPath trong JavaScript
slug: Web/XML/XPath/Guides/Introduction_to_using_XPath_in_JavaScript
page-type: guide
sidebar: xmlsidebar
---

Tài liệu này mô tả giao diện để dùng [XPath](/en-US/docs/Web/XML/XPath) trong JavaScript.
Giao diện chính để dùng XPath là hàm [evaluate](/en-US/docs/Web/API/Document/evaluate) của đối tượng [document](/en-US/docs/Web/API/Document).

## document.evaluate()

Phương thức này đánh giá các biểu thức [XPath](/en-US/docs/Web/XML/XPath) trên một tài liệu dựa trên [XML](/en-US/docs/Glossary/XML) (bao gồm cả tài liệu HTML), và trả về một đối tượng [`XPathResult`](/en-US/docs/Web/API/XPathResult), có thể là một node đơn lẻ hoặc một tập node. Tài liệu hiện có cho phương thức này nằm ở [document.evaluate](/en-US/docs/Web/API/Document/evaluate), nhưng hiện tại còn khá sơ sài đối với nhu cầu của chúng ta; phần dưới đây sẽ trình bày đầy đủ hơn.

```js
const xpathResult = document.evaluate(
  xpathExpression,
  contextNode,
  namespaceResolver,
  resultType,
  result,
);
```

### Tham số

Phương thức [`evaluate()`](/en-US/docs/Web/API/Document/evaluate) nhận tổng cộng năm tham số:

- `xpathExpression`: Một chuỗi chứa biểu thức XPath sẽ được đánh giá.
- `contextNode`: Một node trong tài liệu trên đó `xpathExpression` sẽ được đánh giá, bao gồm tất cả các node con của nó. Node [document](/en-US/docs/Web/API/Document) là node thường được dùng nhất.
- `namespaceResolver`: Một hàm sẽ được truyền mọi tiền tố namespace có trong `xpathExpression` và trả về một chuỗi đại diện cho URI namespace gắn với tiền tố đó. Điều này cho phép chuyển đổi giữa các tiền tố dùng trong biểu thức XPath và các tiền tố có thể khác trong tài liệu. Hàm này có thể là:
  - Một {{domxref("Node")}}, cung cấp phương thức {{domxref("Node.lookupNamespaceURI")}} để phân giải tiền tố namespace.
  - `null`, có thể dùng cho tài liệu HTML hoặc khi không dùng tiền tố namespace nào. Lưu ý rằng nếu `xpathExpression` có chứa một tiền tố namespace, điều này sẽ khiến một `DOMException` được ném ra với mã `NAMESPACE_ERR`.
  - Một hàm tùy chỉnh do người dùng định nghĩa. Xem phần [Triển khai một bộ phân giải namespace do người dùng định nghĩa](#implementing_a_user_defined_namespace_resolver) trong phụ lục để biết chi tiết.

- `resultType`: Một [hằng số](#xpathresult_defined_constants) chỉ định kiểu kết quả mong muốn sẽ được trả về sau khi đánh giá. Hằng số thường được truyền nhất là `XPathResult.ANY_TYPE`, hằng số này sẽ trả về kết quả của biểu thức XPath theo kiểu tự nhiên nhất. Có một phần trong phụ lục chứa danh sách đầy đủ các [hằng số khả dụng](#xpathresult_defined_constants). Chúng được giải thích bên dưới trong phần "[Chỉ định kiểu trả về](#specifying_the_return_type)."
- `result`: Nếu một đối tượng `XPathResult` hiện có được chỉ định, nó sẽ được tái sử dụng để trả về kết quả. Chỉ định `null` sẽ tạo một đối tượng `XPathResult` mới.

### Giá trị trả về

Trả về một đối tượng {{domxref("XPathResult")}} với kiểu [được chỉ định](#specifying_the_return_type) trong tham số `resultType`.

### Triển khai một bộ phân giải Namespace mặc định

Chúng ta dùng đối tượng [`document`](/en-US/docs/Web/API/Document) làm bộ phân giải namespace.

```js
const nsResolver =
  contextNode.ownerDocument === null
    ? contextNode.documentElement
    : contextNode.ownerDocument.documentElement;
```

Sau đó truyền biến `nsResolver` cho `document.evaluate` ở tham số `namespaceResolver`.

Lưu ý: XPath định nghĩa các QName không có tiền tố chỉ khớp với các phần tử trong namespace rỗng. Trong XPath không có cách nào để lấy namespace mặc định như áp dụng cho một tham chiếu phần tử thông thường (ví dụ, `p[@id='_my-id']` cho `xmlns='http://www.w3.org/1999/xhtml'`). Để khớp các phần tử mặc định trong một namespace khác rỗng, bạn либо phải tham chiếu tới một phần tử cụ thể bằng dạng như `['namespace-uri()='http://www.w3.org/1999/xhtml' and name()='p' and @id='_my-id']` ([cách này](#using_xpath_functions_to_reference_elements_with_a_default_namespace) hoạt động tốt cho XPath động khi các namespace có thể chưa biết trước) hoặc dùng các phép kiểm tra tên có tiền tố, và tạo một bộ phân giải namespace ánh xạ tiền tố tới namespace. Đọc thêm về [cách tạo bộ phân giải namespace do người dùng định nghĩa](#implementing_a_user_defined_namespace_resolver) nếu bạn muốn chọn cách thứ hai.

## Mô tả

Thích ứng bất kỳ node DOM nào để phân giải namespace sao cho một biểu thức [XPath](/en-US/docs/Web/XML/XPath) có thể được đánh giá dễ dàng tương đối với ngữ cảnh của node nơi nó xuất hiện trong tài liệu. Bộ thích ứng này hoạt động giống phương thức DOM Level 3 `lookupNamespaceURI` trên các node trong việc phân giải `namespaceURI` từ một tiền tố cho trước, dựa trên thông tin hiện có trong hệ phân cấp của node tại thời điểm `lookupNamespaceURI` được gọi. Nó cũng phân giải đúng tiền tố ngầm định `xml`.

### Chỉ định kiểu trả về

Biến `xpathResult` trả về từ `document.evaluate` có thể được tạo thành từ các node riêng lẻ ([kiểu đơn giản](#simple_types)), hoặc một tập hợp các node ([kiểu node-set](#node-set_types)).

#### Kiểu đơn giản

Khi kiểu kết quả mong muốn trong `resultType` được chỉ định là một trong:

- `NUMBER_TYPE` - số double
- `STRING_TYPE` - chuỗi
- `BOOLEAN_TYPE` - giá trị boolean

Chúng ta lấy giá trị trả về của biểu thức bằng cách truy cập lần lượt các thuộc tính sau của đối tượng `XPathResult`.

- `numberValue`
- `stringValue`
- `booleanValue`

##### Ví dụ

Ví dụ sau dùng biểu thức XPath [`count(//p)`](/en-US/docs/Web/XML/XPath/Reference/Functions/count) để lấy số phần tử `<p>` trong một tài liệu HTML:

```js
const paragraphCount = document.evaluate(
  "count(//p)",
  document,
  null,
  XPathResult.ANY_TYPE,
  null,
);

console.log(
  `Tài liệu này chứa ${paragraphCount.numberValue} phần tử đoạn văn.`,
);
```

Mặc dù JavaScript cho phép chúng ta chuyển số thành chuỗi để hiển thị, giao diện XPath sẽ không tự động chuyển đổi kết quả số nếu thuộc tính `stringValue` được yêu cầu, nên đoạn mã sau sẽ **không** hoạt động:

```js
const paragraphCount = document.evaluate(
  "count(//p)",
  document,
  null,
  XPathResult.ANY_TYPE,
  null,
);

console.log(
  `Tài liệu này chứa ${paragraphCount.stringValue} phần tử đoạn văn.`,
);
```

Thay vào đó, nó sẽ trả về một ngoại lệ với mã `NS_DOM_TYPE_ERROR`.

#### Kiểu Node-Set

Đối tượng `XPathResult` cho phép node-set được trả về theo 3 kiểu chính:

- [Bộ lặp](#iterators)
- [Ảnh chụp nhanh](#snapshots)
- [Node đầu tiên](#first_node)

##### Bộ lặp

Khi kiểu kết quả được chỉ định trong tham số `resultType` là một trong:

- `UNORDERED_NODE_ITERATOR_TYPE`
- `ORDERED_NODE_ITERATOR_TYPE`

Đối tượng `XPathResult` được trả về là một node-set các node khớp, hoạt động như một iterator, cho phép chúng ta truy cập các node riêng lẻ bằng phương thức `iterateNext()` của `XPathResult`.

Sau khi chúng ta đã duyệt qua toàn bộ các node khớp riêng lẻ, `iterateNext()` sẽ trả về `null`.

Lưu ý rằng nếu tài liệu bị thay đổi (cây tài liệu bị sửa đổi) giữa các lần lặp, việc này sẽ làm mất hiệu lực của iterator và thuộc tính `invalidIteratorState` của `XPathResult` được đặt thành `true`, đồng thời một ngoại lệ `NS_ERROR_DOM_INVALID_STATE_ERR` sẽ được ném ra.

```js
const iterator = document.evaluate(
  "//phoneNumber",
  documentNode,
  null,
  XPathResult.UNORDERED_NODE_ITERATOR_TYPE,
  null,
);

try {
  let thisNode = iterator.iterateNext();

  while (thisNode) {
    console.log(thisNode.textContent);
    thisNode = iterator.iterateNext();
  }
} catch (e) {
  console.error(`Lỗi: Cây tài liệu đã bị thay đổi trong lúc lặp ${e}`);
}
```

##### Ảnh chụp nhanh

Khi kiểu kết quả được chỉ định trong tham số `resultType` là một trong:

- `UNORDERED_NODE_SNAPSHOT_TYPE`
- `ORDERED_NODE_SNAPSHOT_TYPE`

Đối tượng `XPathResult` được trả về là một node-set tĩnh của các node khớp, cho phép chúng ta truy cập từng node thông qua phương thức `snapshotItem(itemNumber)` của đối tượng `XPathResult`, trong đó `itemNumber` là chỉ mục của node cần lấy. Tổng số node chứa trong kết quả có thể truy cập qua thuộc tính `snapshotLength`.

Ảnh chụp nhanh không thay đổi khi tài liệu bị sửa đổi, nên khác với iterator, snapshot không trở nên không hợp lệ, nhưng nó có thể không còn tương ứng với tài liệu hiện tại, ví dụ các node có thể đã bị di chuyển, nó có thể chứa các node không còn tồn tại, hoặc các node mới có thể đã được thêm vào.

```js
const nodesSnapshot = document.evaluate(
  "//phoneNumber",
  documentNode,
  null,
  XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
  null,
);

for (let i = 0; i < nodesSnapshot.snapshotLength; i++) {
  console.log(nodesSnapshot.snapshotItem(i).textContent);
}
```

##### Node đầu tiên

Khi kiểu kết quả được chỉ định trong tham số `resultType` là một trong:

- `ANY_UNORDERED_NODE_TYPE`
- `FIRST_ORDERED_NODE_TYPE`

Đối tượng `XPathResult` được trả về chỉ là node đầu tiên tìm thấy khớp với biểu thức XPath. Node này có thể được truy cập qua thuộc tính `singleNodeValue` của đối tượng `XPathResult`. Giá trị này sẽ là `null` nếu node-set rỗng.

Lưu ý rằng, với kiểu con không có thứ tự, node đơn được trả về có thể không phải là node đầu tiên theo thứ tự tài liệu, nhưng với kiểu có thứ tự thì bạn được đảm bảo sẽ nhận node khớp đầu tiên theo thứ tự tài liệu.

```js
const firstPhoneNumber = document.evaluate(
  "//phoneNumber",
  documentNode,
  null,
  XPathResult.FIRST_ORDERED_NODE_TYPE,
  null,
);

console.log(
  `Số điện thoại đầu tiên tìm thấy là ${firstPhoneNumber.singleNodeValue.textContent}`,
);
```

#### Hằng số ANY_TYPE

Khi kiểu kết quả trong tham số `resultType` được chỉ định là `ANY_TYPE`, đối tượng `XPathResult` được trả về sẽ là kiểu tự nhiên sinh ra từ quá trình đánh giá biểu thức.

Nó có thể là bất kỳ kiểu đơn giản nào (`NUMBER_TYPE, STRING_TYPE, BOOLEAN_TYPE`), **nhưng**, nếu kiểu kết quả trả về là một node-set thì nó sẽ **chỉ** là `UNORDERED_NODE_ITERATOR_TYPE`.

Để xác định kiểu đó sau khi đánh giá, chúng ta dùng thuộc tính `resultType` của đối tượng `XPathResult`. Các giá trị [hằng số](#xpathresult_defined_constants) của thuộc tính này được định nghĩa trong phụ lục.

## Ví dụ

### Trong tài liệu HTML

Đoạn mã sau đây được thiết kế để đặt trong bất kỳ đoạn JavaScript nào bên trong hoặc được liên kết tới tài liệu HTML mà biểu thức XPath sẽ được đánh giá trên đó.

Để trích xuất tất cả các phần tử heading `<h2>` trong tài liệu HTML bằng XPath, `xpathExpression` là `"//h2"`. Trong đó, `//` là toán tử duyệt đệ quy, khớp các phần tử có nodeName `h2` ở bất kỳ đâu trong cây tài liệu. Mã đầy đủ cho ví dụ này là:

```js
const headings = document.evaluate(
  "//h2",
  document,
  null,
  XPathResult.ANY_TYPE,
  null,
);
```

Lưu ý rằng, vì HTML không có namespace, chúng ta đã truyền `null` cho tham số `namespaceResolver`.

Vì chúng ta muốn tìm kiếm toàn bộ tài liệu để lấy các heading, chúng ta đã dùng chính đối tượng [document](/en-US/docs/Web/API/Document) làm `contextNode`.

Kết quả của biểu thức này là một đối tượng `XPathResult`. Nếu muốn biết kiểu kết quả trả về, chúng ta có thể đánh giá thuộc tính `resultType` của đối tượng được trả về. Trong trường hợp này, giá trị đó sẽ là `4`, tức `UNORDERED_NODE_ITERATOR_TYPE`. Đây là kiểu trả về mặc định khi kết quả của biểu thức XPath là một node-set. Nó cung cấp quyền truy cập từng node một và có thể không trả về các node theo một thứ tự cụ thể. Để truy cập các node được trả về, chúng ta dùng phương thức `iterateNext()` của đối tượng được trả về:

```js
let thisHeading = headings.iterateNext();

let alertText = "Các tiêu đề cấp 2 trong tài liệu này là:\n";

while (thisHeading) {
  alertText += `${thisHeading.textContent}\n`;
  thisHeading = headings.iterateNext();
}
```

Sau khi lặp đến một node, chúng ta có thể dùng tất cả các giao diện DOM chuẩn trên node đó. Sau khi đã duyệt hết các phần tử `h2` được trả về từ biểu thức của chúng ta, mọi lần gọi tiếp theo tới `iterateNext()` sẽ trả về `null`.

## Phụ lục

### Triển khai một bộ phân giải Namespace do người dùng định nghĩa

Đây chỉ là ví dụ minh họa. Hàm này sẽ cần lấy các tiền tố namespace từ `xpathExpression` và trả về URI tương ứng với tiền tố đó. Ví dụ, biểu thức:

```plain
'//xhtml:td/mathml:math'
```

sẽ chọn tất cả các biểu thức [MathML](/en-US/docs/Web/MathML) là con của các phần tử ô dữ liệu bảng (table data cell) trong (X)HTML.

Để liên kết tiền tố `mathml:` với URI namespace `http://www.w3.org/1998/Math/MathML` và `xhtml:` với URI `http://www.w3.org/1999/xhtml`, chúng ta cung cấp một hàm:

```js
function nsResolver(prefix) {
  const ns = {
    xhtml: "http://www.w3.org/1999/xhtml",
    mathml: "http://www.w3.org/1998/Math/MathML",
  };
  return ns[prefix] || null;
}
```

Khi đó lời gọi `document.evaluate` của chúng ta sẽ là:

```js
document.evaluate(
  "//xhtml:td/mathml:math",
  document,
  nsResolver,
  XPathResult.ANY_TYPE,
  null,
);
```

### Triển khai namespace mặc định cho tài liệu XML

Như đã lưu ý trước đó trong phần [Triển khai một bộ phân giải Namespace mặc định](#implementing_a_default_namespace_resolver), bộ phân giải mặc định không xử lý namespace mặc định cho tài liệu XML. Ví dụ với tài liệu này:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
    <entry />
    <entry />
    <entry />
</feed>
```

`doc.evaluate('//entry', doc, nsResolver, XPathResult.ANY_TYPE, null)` sẽ trả về một tập rỗng, trong đó `nsResolver` là bất kỳ `Node` nào. Truyền bộ phân giải `null` cũng không khá hơn.

Một cách khắc phục có thể là tạo một bộ phân giải tùy chỉnh trả về đúng namespace mặc định (trong trường hợp này là namespace Atom). Lưu ý rằng bạn vẫn phải dùng một tiền tố namespace nào đó trong biểu thức XPath để hàm phân giải có thể đổi nó thành namespace bạn cần. Ví dụ:

```js
function resolver() {
  return "http://www.w3.org/2005/Atom";
}
doc.evaluate("//myns:entry", doc, resolver, XPathResult.ANY_TYPE, null);
```

Lưu ý rằng sẽ cần một bộ phân giải phức tạp hơn nếu tài liệu dùng nhiều namespace.

Một cách tiếp cận khác có thể hiệu quả hơn (và cho phép namespace chưa biết trước) được mô tả trong phần tiếp theo.

### Dùng các hàm XPath để tham chiếu phần tử với namespace mặc định

Một cách khác để khớp các phần tử mặc định trong một namespace không rỗng (và là cách hoạt động tốt với các biểu thức XPath động khi các namespace có thể chưa được biết trước) là tham chiếu tới một phần tử cụ thể bằng dạng như `[namespace-uri()='http://www.w3.org/1999/xhtml' and name()='p' and @id='_my-id']`. Cách này khắc phục vấn đề một truy vấn XPath không thể phát hiện namespace mặc định trên một phần tử được gắn nhãn thông thường.

### Lấy các phần tử và thuộc tính có namespace cụ thể bất kể tiền tố

Nếu muốn có sự linh hoạt trong namespace (như đúng với ý định của chúng) bằng cách không bắt buộc phải dùng một tiền tố cụ thể khi tìm phần tử hoặc thuộc tính có namespace, ta phải dùng các kỹ thuật đặc biệt.

Mặc dù có thể điều chỉnh cách tiếp cận ở phần trên để kiểm tra các phần tử có namespace bất kể tiền tố nào được chọn (bằng cách dùng [`local-name()`](/en-US/docs/Web/XML/XPath/Reference/Functions/local-name) kết hợp với [`namespace-uri()`](/en-US/docs/Web/XML/XPath/Reference/Functions/namespace-uri) thay vì [`name()`](/en-US/docs/Web/XML/XPath/Reference/Functions/name)), nhưng sẽ có một tình huống khó hơn nếu muốn lấy một phần tử có một thuộc tính namespace cụ thể trong predicate (do XPath 1.0 không có biến độc lập với cách triển khai).

Ví dụ, có thể sẽ thử (một cách không đúng) lấy một phần tử có thuộc tính namespace như sau: `const xpathLink = someElements[local-name(@*)="href" and namespace-uri(@*)='http://www.w3.org/1999/xlink'];`

Cách này có thể vô tình lấy sai phần tử nếu một trong các thuộc tính của nó có local name là `href`, nhưng lại là một thuộc tính khác mang namespace mục tiêu (XLink) thay vì [`@href`](/en-US/docs/Web/XML/XPath/Reference/Axes#attribute).

Để lấy chính xác các phần tử có thuộc tính XLink `@href` (mà cũng không bị ràng buộc bởi các tiền tố đã định nghĩa sẵn trong bộ phân giải namespace), ta có thể làm như sau:

```js
const xpathEls =
  'someElements[@*[local-name() = "href" and namespace-uri() = "http://www.w3.org/1999/xlink"]]'; // Lấy các phần tử có bất kỳ thuộc tính đơn lẻ nào vừa có local name là 'href' vừa có namespace XLink
const thisLevel = xml.evaluate(xpathEls, xml, null, XPathResult.ANY_TYPE, null);
let thisItemEl = thisLevel.iterateNext();
```

#### Các hằng số được định nghĩa của XPathResult

| Hằng số kiểu kết quả         | Giá trị | Mô tả                                                                                                                                                                           |
| ---------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ANY_TYPE                     | 0       | Một tập kết quả chứa bất kỳ kiểu nào tự nhiên sinh ra từ việc đánh giá biểu thức. Lưu ý rằng nếu kết quả là một node-set thì UNORDERED_NODE_ITERATOR_TYPE luôn là kiểu kết quả. |
| NUMBER_TYPE                  | 1       | Một kết quả chứa một số đơn lẻ. Điều này hữu ích, ví dụ, trong một biểu thức XPath dùng hàm `count()`.                                                                          |
| STRING_TYPE                  | 2       | Một kết quả chứa một chuỗi đơn lẻ.                                                                                                                                              |
| BOOLEAN_TYPE                 | 3       | Một kết quả chứa một giá trị boolean đơn lẻ. Điều này hữu ích, ví dụ, trong một biểu thức XPath dùng hàm `not()`.                                                               |
| UNORDERED_NODE_ITERATOR_TYPE | 4       | Một node-set kết quả chứa tất cả các node khớp với biểu thức. Các node không nhất thiết theo cùng thứ tự như chúng xuất hiện trong tài liệu.                                    |
| ORDERED_NODE_ITERATOR_TYPE   | 5       | Một node-set kết quả chứa tất cả các node khớp với biểu thức. Các node trong tập kết quả có cùng thứ tự như chúng xuất hiện trong tài liệu.                                     |
| UNORDERED_NODE_SNAPSHOT_TYPE | 6       | Một node-set kết quả chứa ảnh chụp nhanh của tất cả các node khớp với biểu thức. Các node không nhất thiết theo cùng thứ tự như chúng xuất hiện trong tài liệu.                 |
| ORDERED_NODE_SNAPSHOT_TYPE   | 7       | Một node-set kết quả chứa ảnh chụp nhanh của tất cả các node khớp với biểu thức. Các node trong tập kết quả có cùng thứ tự như chúng xuất hiện trong tài liệu.                  |
| ANY_UNORDERED_NODE_TYPE      | 8       | Một node-set kết quả chứa bất kỳ một node đơn lẻ nào khớp với biểu thức. Node này không nhất thiết là node đầu tiên trong tài liệu khớp với biểu thức.                          |
| FIRST_ORDERED_NODE_TYPE      | 9       | Một node-set kết quả chứa node đầu tiên trong tài liệu khớp với biểu thức.                                                                                                      |

## Xem thêm

- [XPath](/en-US/docs/Web/XML/XPath)
- [Ngôn ngữ Đường dẫn XML](https://www.xml.com/pub/a/2000/08/holman/index.html?page=2#xpath-info) từ _[What is XSLT?](https://www.xml.com/pub/a/2000/08/holman/)_ của G. Ken Holman

## Thông tin tài liệu gốc

- Dựa trên một tài liệu gốc của James Graham.
- Các cộng tác viên khác: James Thompson.
