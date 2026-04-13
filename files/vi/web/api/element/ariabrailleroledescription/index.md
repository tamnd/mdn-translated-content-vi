---
title: "Element: thuộc tính ariaBrailleRoleDescription"
short-title: ariaBrailleRoleDescription
slug: Web/API/Element/ariaBrailleRoleDescription
page-type: web-api-instance-property
browser-compat: api.Element.ariaBrailleRoleDescription
---

{{APIRef("DOM")}}

Thuộc tính **`ariaBrailleRoleDescription`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription), định nghĩa mô tả vai trò braille ARIA của phần tử.

Property này có thể được sử dụng để cung cấp phiên bản viết tắt của giá trị [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription). Nó chỉ nên được sử dụng nếu `aria-roledescription` hiện diện và trong trường hợp hiếm khi nó quá dài dòng cho chữ braille. Thuộc tính [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription) chứa thêm thông tin về thời điểm nên thiết lập property này.

## Giá trị

- `<string>`
  - : Giá trị là một chuỗi, một kiểu giá trị không ràng buộc, được dự định chuyển đổi thành chữ braille.

## Ví dụ

### Lấy và thiết lập ariaBrailleRoleDescription

Ví dụ này cho thấy cách bạn có thể lấy và thiết lập property `ariaBrailleRoleDescription`.

#### HTML

Đầu tiên chúng ta định nghĩa một phần tử `<article>` sẽ được sử dụng làm slide trong bài trình chiếu. Chúng ta thiết lập thuộc tính `aria-roledescription` thành "slide", và phần viết tắt braille của nó trong `aria-brailleroledescription` thành "sld".

```html
<article
  id="article"
  aria-roledescription="slide"
  aria-brailleroledescription="sld"
  aria-labelledby="slide1heading">
  <h1 id="slide1heading">Welcome to my talk</h1>
</article>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 70px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Để lấy mô tả vai trò của phần tử, chúng ta sử dụng property `ariaBrailleRoleDescription`. Đoạn mã dưới đây trước tiên lấy và sau đó ghi lại giá trị. Sau đó thiết lập mô tả vai trò braille thành "sd" và ghi lại giá trị một lần nữa (chỉ để minh họa — trong mã sản phẩm bạn sẽ không thiết lập giá trị này).

```js
const article = document.getElementById("article");
log(article.ariaBrailleRoleDescription);
article.ariaBrailleRoleDescription = "sd";
log(article.ariaBrailleRoleDescription);
```

#### Kết quả

{{EmbedLiveSample("Getting and setting ariaBrailleRoleDescription")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
