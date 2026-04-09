---
title: Các đoạn mã XPath
slug: Web/XML/XPath/Guides/Snippets
page-type: guide
sidebar: xmlsidebar
---

Bài viết này cung cấp một số đoạn mã XPath - ví dụ về cách triển khai một vài **hàm tiện ích**. Các hàm này dựa trên các giao diện chuẩn cung cấp chức năng XPath cho mã JavaScript. Các đoạn mã là những hàm bạn có thể dùng trong thực tế của mình.

## Hàm đánh giá riêng cho từng node

Hàm tiện ích tùy chỉnh sau đây có thể được dùng để đánh giá các biểu thức XPath trên các node XML cho trước. Tham số đầu tiên là một node DOM hoặc đối tượng Document, còn tham số thứ hai là một chuỗi định nghĩa biểu thức XPath.

### Ví dụ: Định nghĩa một hàm tiện ích `evaluateXPath()` tùy chỉnh cho từng node

```js
// Đánh giá biểu thức XPath `expr` trên một node DOM hoặc đối tượng
// Document cho trước `node`, và trả về kết quả dưới dạng một mảng
// cảm ơn wanderingstan tại morethanwarm dot mail dot com vì phần
// triển khai ban đầu.
function evaluateXPath(node, expr) {
  const xpe = new XPathEvaluator();
  const nsResolver =
    node.ownerDocument === null
      ? node.documentElement
      : node.ownerDocument.documentElement;
  const result = xpe.evaluate(expr, node, nsResolver, 0, null);
  const found = [];
  let res;
  while ((res = result.iterateNext())) found.push(res);
  return found;
}
```

Lưu ý rằng `documentElement` chỉ nên được dùng nếu bạn chắc chắn rằng các tiền tố namespace trong biểu thức XPath khớp với những tiền tố trong tài liệu bạn muốn truy vấn (và không có namespace mặc định nào đang được dùng). Nếu không, bạn phải tự cung cấp triển khai riêng của XPathNSResolver.

### Cách dùng mẫu

Giả sử chúng ta có tài liệu XML sau (xem thêm [Phân tích và tuần tự hóa XML](/en-US/docs/Web/XML/Guides/Parsing_and_serializing_XML)):

#### Ví dụ: Một tài liệu XML để dùng với hàm tiện ích `evaluateXPath()` tùy chỉnh

```xml
<?xml version="1.0"?>
<people>
  <person first-name="eric" middle-initial="H" last-name="jung">
    <address street="321 south st" city="denver" state="co" country="usa"/>
    <address street="123 main st" city="arlington" state="ma" country="usa"/>
  </person>

  <person first-name="jed" last-name="brown">
    <address street="321 north st" city="atlanta" state="ga" country="usa"/>
    <address street="123 west st" city="seattle" state="wa" country="usa"/>
    <address street="321 south avenue" city="denver" state="co" country="usa"/>
  </person>
</people>
```

Bây giờ bạn có thể "truy vấn" tài liệu bằng các biểu thức XPath. Mặc dù việc duyệt cây DOM cũng có thể cho kết quả tương tự, dùng biểu thức XPath sẽ nhanh hơn nhiều và mạnh hơn. Nếu bạn có thể dựa vào các thuộc tính `id`, `document.getElementById()` vẫn rất hữu ích, nhưng không mạnh bằng XPath. Sau đây là một số ví dụ.

#### Ví dụ: Mã JavaScript với hàm tiện ích `evaluateXPath()` tùy chỉnh

```js
// hiển thị họ của tất cả mọi người trong tài liệu
let results = evaluateXPath(people, "//person/@last-name");
for (const i in results) console.log(`Người #${i} có họ ${results[i].value}`);

// lấy node người thứ 2
results = evaluateXPath(people, "/people/person[2]");

// lấy tất cả các node người có địa chỉ ở denver
results = evaluateXPath(people, "//person[address/@city='denver']");

// lấy tất cả các địa chỉ có "south" trong tên đường
results = evaluateXPath(people, "//address[contains(@street, 'south')]");
console.log(results.length);
```

## docEvaluateArray

Sau đây là một hàm tiện ích để đưa kết quả XPath (theo thứ tự) vào một mảng, bất kể có nhu cầu đặc biệt nào về bộ phân giải namespace, v.v. Nó tránh cú pháp phức tạp hơn của [`document.evaluate()`](/en-US/docs/Web/API/Document/evaluate) trong những trường hợp không cần đến, cũng như tránh phải dùng các iterator đặc biệt trên [`XPathResult`](/en-US/docs/Web/API/XPathResult) (bằng cách trả về một mảng thay vì vậy).

### Ví dụ: Định nghĩa một hàm tiện ích `docEvaluateArray()`

```js
// Cách dùng ví dụ:
// const els = docEvaluateArray('//a');
// console.log(els[0].nodeName); // trả về 'A' trong tài liệu HTML có ít nhất một liên kết

function docEvaluateArray(
  expr,
  context,
  doc = context ? context.ownerDocument : document,
  resolver = null,
) {
  let i;
  const a = [];
  context ||= doc;

  const result = doc.evaluate(
    expr,
    context,
    resolver,
    XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
    null,
  );
  for (let i = 0; i < result.snapshotLength; i++) {
    a.push(result.snapshotItem(i));
  }
  return a;
}
```

## getXPathForElement

Hàm sau cho phép truyền vào một element và một tài liệu XML để tìm một chuỗi biểu thức XPath duy nhất dẫn ngược về chính element đó.

### Ví dụ: Định nghĩa một hàm tiện ích `getXPathForElement()`

```js
function getXPathForElement(el, xml) {
  let xpath = "";
  let pos, tempItem2;

  while (el !== xml.documentElement) {
    pos = 0;
    tempItem2 = el;
    while (tempItem2) {
      if (tempItem2.nodeType === 1 && tempItem2.nodeName === el.nodeName) {
        // Nếu đây là ELEMENT_NODE có cùng tên
        pos += 1;
      }
      tempItem2 = tempItem2.previousSibling;
    }

    xpath = `*[name()='${el.nodeName}' and namespace-uri()='${
      el.namespaceURI ?? ""
    }'][${pos}]/${xpath}`;

    el = el.parentNode;
  }
  xpath = `/*[name()='${xml.documentElement.nodeName}' and namespace-uri()='${
    el.namespaceURI ?? ""
  }']/${xpath}`;
  xpath = xpath.replace(/\/$/, "");
  return xpath;
}
```

## Xem thêm

- [XPath](/en-US/docs/Web/XML/XPath)
- [Thảo luận trên diễn đàn về chủ đề này](https://forums.mozillazine.org/viewtopic.php?t=229106)
- [Giới thiệu về việc sử dụng XPath trong JavaScript](/en-US/docs/Web/XML/XPath/Guides/Introduction_to_using_XPath_in_JavaScript)
