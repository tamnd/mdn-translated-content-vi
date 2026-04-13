---
title: "Document: thuộc tính adoptedStyleSheets"
short-title: adoptedStyleSheets
slug: Web/API/Document/adoptedStyleSheets
page-type: web-api-instance-property
browser-compat: api.Document.adoptedStyleSheets
---

{{APIRef("CSSOM")}}

Thuộc tính **`adoptedStyleSheets`** của giao diện {{domxref("Document")}} được sử dụng để thiết lập một mảng các stylesheet được xây dựng để sử dụng bởi tài liệu.

> [!NOTE]
> Một constructed stylesheet là một stylesheet được tạo theo chương trình bằng cách sử dụng [phương thức khởi tạo `CSSStyleSheet()`](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet) (so với một stylesheet được tạo bởi user-agent khi nhập stylesheet từ một script, được nhập bằng {{HTMLElement('style')}} và {{CSSXref('@import')}}, hoặc được liên kết qua {{HTMLElement('link')}}).

Các constructed stylesheet tương tự cũng có thể được chia sẻ với một hoặc nhiều instance {{domxref("ShadowRoot")}} bằng cách sử dụng thuộc tính [`ShadowRoot.adoptedStyleSheets`](/en-US/docs/Web/API/ShadowRoot/adoptedStyleSheets).
Thay đổi một stylesheet được adopted sẽ ảnh hưởng đến tất cả các đối tượng adopt nó.

Các stylesheet trong thuộc tính được đánh giá cùng với các stylesheet khác của tài liệu bằng cách sử dụng [thuật toán cascade CSS](/en-US/docs/Web/CSS/Guides/Cascade/Introduction).
Khi phân giải các quy tắc xem xét thứ tự stylesheet, `adoptedStyleSheets` được giả định được sắp xếp sau những stylesheet trong [`Document.styleSheets`](/en-US/docs/Web/API/Document/styleSheets).

Chỉ các stylesheet được tạo bằng [phương thức khởi tạo `CSSStyleSheet()`](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet) trong ngữ cảnh của {{domxref("Document")}} hiện tại mới có thể được adopted.

## Giá trị

Giá trị là một mảng các instance {{domxref("CSSStyleSheet")}} phải được tạo bằng phương thức khởi tạo {{domxref("CSSStyleSheet.CSSStyleSheet()", "CSSStyleSheet()")}} trong ngữ cảnh của cùng một {{domxref("Document")}}.

Nếu mảng cần được sửa đổi, hãy sử dụng các phép biến đổi tại chỗ như `push()`. Các instance {{domxref("CSSStyleSheet")}} cũng có thể được sửa đổi và những thay đổi này sẽ áp dụng ở bất cứ nơi nào stylesheet được adopted.

Trong phiên bản trước của đặc tả kỹ thuật, mảng không thể sửa đổi được, vì vậy cách duy nhất để thêm stylesheet mới là gán một mảng mới cho `adoptedStyleSheets`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Một trong các instance {{domxref("CSSStyleSheet")}} trong mảng không được tạo bằng [phương thức khởi tạo `CSSStyleSheet()`](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet) hoặc được xây dựng trong một tài liệu khác với tài liệu hiện tại, chẳng hạn như trong một frame.

## Ví dụ

### Adopting một stylesheet

Đoạn mã bên dưới hiển thị một stylesheet được xây dựng, sau đó {{domxref("CSSStyleSheet.replaceSync()")}} được gọi để thêm một quy tắc vào sheet.
Stylesheet sau đó được thêm vào một mảng và gán cho thuộc tính `adoptedStyleSheets`.

```js
// Create an empty "constructed" stylesheet
const sheet = new CSSStyleSheet();
// Apply a rule to the sheet
sheet.replaceSync("a { color: red; }");

// Apply the stylesheet to a document
document.adoptedStyleSheets.push(sheet);
```

Chúng ta có thể thêm một quy tắc mới vào stylesheet bằng cách sử dụng {{domxref("CSSStyleSheet.insertRule()")}}.

```js
sheet.insertRule("* { background-color: blue; }");
// The document will now have blue background.
```

## Chia sẻ stylesheet với một shadow DOM

Chúng ta có thể chia sẻ một stylesheet với một shadow root theo cách tương tự.

```js
// Create an element in the document and then create a shadow root:
const node = document.createElement("div");
const shadow = node.attachShadow({ mode: "open" });

// Adopt the same sheet into the shadow DOM
shadow.adoptedStyleSheets = [sheet];
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Constructable Stylesheets](https://web.dev/articles/constructable-stylesheets) (web.dev)
- [Sử dụng Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- [Phương thức khởi tạo `CSSStyleSheet()`](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet)
- {{domxref("CSSStyleSheet.replaceSync()")}}
- {{domxref("CSSStyleSheet.replace()")}}
- {{domxref("CSSStyleSheet.insertRule()")}}
- {{domxref("CSSStyleSheet.deleteRule()")}}
