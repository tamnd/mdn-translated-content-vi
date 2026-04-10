---
title: "CSSStyleSheet: CSSStyleSheet() constructor"
short-title: CSSStyleSheet()
slug: Web/API/CSSStyleSheet/CSSStyleSheet
page-type: web-api-constructor
browser-compat: api.CSSStyleSheet.CSSStyleSheet
---

{{APIRef("CSSOM")}}

Hàm khởi tạo **`CSSStyleSheet()`** tạo một đối tượng {{domxref("CSSStyleSheet")}} mới đại diện cho một [bảng kiểu](/en-US/docs/Glossary/Stylesheet) duy nhất.

Sau khi khởi tạo bảng kiểu, các phương thức {{domxref("CSSStyleSheet.replace()")}}, {{domxref("CSSStyleSheet.replaceSync()")}}, {{domxref("CSSStyleSheet.insertRule()")}}, và {{domxref("CSSStyleSheet.deleteRule()")}} có thể được sử dụng để sửa đổi các quy tắc của bảng kiểu mới.

Một bảng kiểu được tạo bằng phương thức này được gọi là "constructed stylesheet" (bảng kiểu có thể khởi tạo). Một bảng kiểu khởi tạo có thể được chia sẻ giữa một tài liệu và các shadow DOM subtrees của nó bằng cách sử dụng {{domxref("ShadowRoot.adoptedStyleSheets")}} và {{domxref("Document.adoptedStyleSheets")}}.

## Cú pháp

```js-nolint
new CSSStyleSheet()
new CSSStyleSheet(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `baseURL` {{optional_inline}}
      - : Một chuỗi chứa `baseURL` được sử dụng để phân giải các URL tương đối trong bảng kiểu.
    - `media` {{optional_inline}}
      - : Một {{domxref("MediaList")}} chứa danh sách các media rule, hoặc một chuỗi chứa một rule duy nhất.
    - `disabled` {{optional_inline}}
      - : Một {{jsxref("Boolean")}} cho biết bảng kiểu có bị vô hiệu hóa hay không. Mặc định là False.

## Ví dụ

Trong ví dụ sau, một {{domxref("CSSStyleSheet")}} mới được khởi tạo với một media rule là `"print"`.
Khi in {{domxref("StyleSheet.media")}} ra console sẽ trả về một {{domxref("MediaList")}} với một mục nhập duy nhất cho rule print này.

```js
let stylesheet = new CSSStyleSheet({ media: "print" });
console.log(stylesheet.media);
```

### Chia sẻ bảng kiểu với một shadow DOM

Đoạn mã dưới đây cho thấy bảng kiểu được khởi tạo và sau đó {{domxref("CSSStyleSheet.replaceSync()")}} được gọi để thêm một quy tắc vào bảng kiểu.

```js
// Tạo một bảng kiểu "constructed" rỗng
const sheet = new CSSStyleSheet();
// Áp dụng một quy tắc cho bảng kiểu
sheet.replaceSync("a { color: red; }");
```

Sau đó chúng ta tạo một {{domxref("ShadowRoot")}} và truyền đối tượng sheet vào thuộc tính {{domxref("ShadowRoot.adoptedStyleSheets")}} bên trong một mảng.

```js
// Tạo một phần tử trong tài liệu và sau đó tạo một shadow root:
const node = document.createElement("div");
const shadow = node.attachShadow({ mode: "open" });

// Chấp nhận bảng kiểu vào shadow DOM
shadow.adoptedStyleSheets = [sheet];
```

Chúng ta có thể sửa đổi các bảng kiểu sau khi chúng đã được thêm vào mảng.
Dưới đây chúng ta nối một quy tắc mới vào cùng bảng kiểu bằng cách sử dụng {{domxref("CSSStyleSheet.insertRule()")}}.

```js
sheet.insertRule("* { background-color: blue; }");
// Tài liệu bây giờ sẽ có nền màu xanh.
```

Cùng một bảng kiểu có thể được chia sẻ với nhiều shadow subtrees trong cùng một tài liệu.
Để biết thêm ví dụ, xem {{domxref("ShadowRoot.adoptedStyleSheets")}}.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{domxref("Document.adoptedStyleSheets")}}
- [Constructable Stylesheets](https://web.dev/articles/constructable-stylesheets) (web.dev)
- [Using the Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- [construct-style-sheets-polyfill](https://www.npmjs.com/package/construct-style-sheets-polyfill)
