---
title: "ShadowRoot: thuộc tính adoptedStyleSheets"
short-title: adoptedStyleSheets
slug: Web/API/ShadowRoot/adoptedStyleSheets
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.adoptedStyleSheets
---

{{APIRef("CSSOM")}}

Thuộc tính **`adoptedStyleSheets`** của giao diện {{domxref("ShadowRoot")}} đặt một mảng các stylesheet được tạo sẵn để cây con shadow DOM sử dụng.

> [!NOTE]
> Một stylesheet được tạo sẵn là stylesheet được tạo theo lập trình bằng [`CSSStyleSheet()` constructor](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet) (khác với stylesheet do user-agent tạo ra khi nhập stylesheet từ một script, được nhập bằng {{HTMLElement('style')}} và {{CSSXref('@import')}}, hoặc được liên kết qua {{HTMLElement('link')}}.

Cùng một stylesheet được tạo sẵn có thể được tiếp nhận bởi nhiều thể hiện {{domxref("ShadowRoot")}}, và bởi chính tài liệu cha (bằng thuộc tính {{domxref("Document.adoptedStyleSheets")}}). Việc thay đổi một stylesheet đã được tiếp nhận sẽ ảnh hưởng đến tất cả các đối tượng đã tiếp nhận nó.

Các stylesheet trong thuộc tính `adoptedStyleSheets` được tính cùng với các stylesheet khác của shadow DOM. Để xác định CSS tính toán cuối cùng của bất kỳ phần tử nào, chúng được xem như đã được thêm _sau_ các stylesheet khác trong shadow DOM ([`ShadowRoot.styleSheets`](/en-US/docs/Web/API/ShadowRoot/styleSheets)).

Chỉ các stylesheet được tạo bằng [`CSSStyleSheet()` constructor](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet), và được tạo trong cùng `Document` cha với shadow root, mới có thể được tiếp nhận.

## Giá trị

Giá trị là một mảng các thể hiện {{domxref("CSSStyleSheet")}} phải được tạo bằng constructor {{domxref("CSSStyleSheet.CSSStyleSheet()", "CSSStyleSheet()")}} trong ngữ cảnh của `Document` cha của shadow root.

Nếu mảng cần được sửa đổi, hãy dùng các thao tác biến đổi tại chỗ như `push()`. Bản thân các thể hiện {{domxref("CSSStyleSheet")}} cũng có thể được sửa đổi, và các thay đổi này sẽ áp dụng ở mọi nơi stylesheet đó được tiếp nhận.

Trong một phiên bản trước của đặc tả, mảng này không thể sửa đổi, nên cách duy nhất để thêm stylesheet mới là gán một mảng mới cho `adoptedStyleSheets`.

## Ví dụ

### Tiếp nhận một stylesheet

Đoạn mã dưới đây trước tiên tạo một stylesheet, sau đó gọi {{domxref("CSSStyleSheet.replaceSync()")}} để thêm một quy tắc vào sheet.

```js
// Tạo một stylesheet "constructed" rỗng
const sheet = new CSSStyleSheet();
// Áp dụng một quy tắc cho sheet
sheet.replaceSync("a { color: red; }");
```

Sau đó chúng ta tạo một {{domxref("ShadowRoot")}} và truyền đối tượng sheet vào `adoptedStyleSheets` trong một mảng.

```js
// Tạo một phần tử trong tài liệu rồi tạo shadow root:
const node = document.createElement("div");
const shadow = node.attachShadow({ mode: "open" });

// Tiếp nhận sheet vào shadow DOM
shadow.adoptedStyleSheets = [sheet];
```

Chúng ta vẫn có thể sửa stylesheet sau khi nó đã được thêm vào mảng. Bên dưới, chúng ta thêm một quy tắc mới vào cùng sheet bằng {{domxref("CSSStyleSheet.insertRule()")}}.

```js
sheet.insertRule("* { background-color: blue; }");
// Tài liệu bây giờ sẽ có nền màu xanh.
```

### Thêm một stylesheet mới

Các stylesheet mới có thể được _thêm vào cuối_ document hoặc shadow root bằng cách dùng `adoptedStyleSheets.push()`:

```js
const extraSheet = new CSSStyleSheet();
extraSheet.replaceSync("p { color: green; }");

// Nối sheet mới vào.
shadow.adoptedStyleSheets.push(extraSheet);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Constructable Stylesheets](https://web.dev/articles/constructable-stylesheets) (web.dev)
- [Sử dụng Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- [`CSSStyleSheet()` constructor](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet)
- {{domxref("CSSStyleSheet.replaceSync()")}}
- {{domxref("CSSStyleSheet.replace()")}}
- {{domxref("CSSStyleSheet.insertRule()")}}
- {{domxref("CSSStyleSheet.deleteRule()")}}
