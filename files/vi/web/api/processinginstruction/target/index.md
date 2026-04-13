---
title: "ProcessingInstruction: thuộc tính target"
short-title: target
slug: Web/API/ProcessingInstruction/target
page-type: web-api-instance-property
browser-compat: api.ProcessingInstruction.target
---

{{ApiRef("DOM")}}

Thuộc tính **`target`** chỉ đọc của giao diện {{domxref("ProcessingInstruction")}}
biểu diễn ứng dụng mà `ProcessingInstruction` nhắm đến.

Ví dụ:

```html
<?xml version="1.0"?>
```

là một chỉ thị xử lý có `target` là `xml`.

## Giá trị

Một chuỗi chứa tên của ứng dụng.

## Ví dụ

### Trong tài liệu XML

```html hidden
<output></output>
```

```js
let parser = new DOMParser();
const doc = parser.parseFromString(
  '<?xml version="1.0"?><test/>',
  "application/xml",
);
const pi = doc.createProcessingInstruction(
  "xml-stylesheet",
  'href="mycss.css" type="text/css"',
);
doc.insertBefore(pi, doc.firstChild);

const output = document.querySelector("output");
output.textContent = `Đích của chỉ thị xử lý này là: ${doc.firstChild.target}`;
```

{{EmbedLiveSample("In an XML document", "100%", 50)}}

### Trong tài liệu HTML

Dòng chỉ thị xử lý sẽ được xem như và biểu diễn dưới dạng đối tượng {{domxref("Comment")}}.

```html
<?xml version="1.0"?>
<pre></pre>
```

```js
const node = document.querySelector("pre").previousSibling.previousSibling;
const result = `Nút chứa chỉ thị xử lý: ${node.nodeName}: ${node.nodeValue}\n`;
document.querySelector("pre").textContent = result;
```

{{EmbedLiveSample("In an HTML document", "100%", 50)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [DOM API](/en-US/docs/Web/API/Document_Object_Model)
