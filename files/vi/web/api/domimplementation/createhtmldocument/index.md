---
title: "DOMImplementation: createHTMLDocument() method"
short-title: createHTMLDocument()
slug: Web/API/DOMImplementation/createHTMLDocument
page-type: web-api-instance-method
browser-compat: api.DOMImplementation.createHTMLDocument
---

{{ApiRef("DOM")}}

Phương thức **`DOMImplementation.createHTMLDocument()`** tạo một HTML {{ domxref("Document") }} mới.

## Cú pháp

```js-nolint
createHTMLDocument()
createHTMLDocument(title)
```

### Tham số

- `title` {{optional_inline}}
  - : Một chuỗi chứa tiêu đề để đặt cho tài liệu HTML mới.

### Giá trị trả về

Một đối tượng HTML {{domxref("Document")}} mới.

## Ví dụ

Ví dụ này tạo một tài liệu HTML mới và chèn nó vào một {{HTMLElement("iframe")}} trong tài liệu hiện tại.

Đây là HTML cho ví dụ này:

```html live-sample___new-doc
<button id="create-doc">Create new document</button>
<iframe id="theFrame" src="about:blank"></iframe>
```

Triển khai JavaScript của `makeDocument()`:

```js live-sample___new-doc
function makeDocument() {
  const frame = document.getElementById("theFrame");

  const doc = document.implementation.createHTMLDocument("New Document");
  const p = doc.createElement("p");
  p.textContent = "This is a new paragraph.";

  try {
    doc.body.appendChild(p);
  } catch (e) {
    console.log(e);
  }

  // Copy the new HTML document into the frame

  const destDocument = frame.contentDocument;
  const srcNode = doc.documentElement;
  const newNode = destDocument.importNode(srcNode, true);

  destDocument.replaceChild(newNode, destDocument.documentElement);
}

document.getElementById("create-doc").addEventListener("click", makeDocument);
```

Mã xử lý việc tạo tài liệu HTML mới và chèn nội dung vào đó. `createHTMLDocument()` xây dựng một tài liệu HTML mới có {{ HTMLElement("title") }} là `"New Document"`. Sau đó, chúng ta tạo một phần tử đoạn văn mới với nội dung đơn giản, và đoạn văn mới được chèn vào tài liệu mới.

`destDocument` lưu trữ `contentDocument` của khung; đây là tài liệu mà chúng ta sẽ chèn nội dung mới vào. Hai dòng tiếp theo xử lý việc nhập nội dung của tài liệu mới vào ngữ cảnh của tài liệu mới. Cuối cùng, `destDocument.replaceChild` thực sự thay thế nội dung của khung bằng nội dung của tài liệu mới.

{{EmbedLiveSample("new-doc", "", 200)}}

Tài liệu được trả về được xây dựng sẵn với HTML sau:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>title</title>
  </head>
  <body>
    …
  </body>
</html>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("DOMImplementation")}} mà nó thuộc về.
