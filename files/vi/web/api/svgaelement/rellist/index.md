---
title: "SVGAElement: thuộc tính relList"
short-title: relList
slug: Web/API/SVGAElement/relList
page-type: web-api-instance-property
browser-compat: api.SVGAElement.relList
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`relList`** của {{domxref("SVGAElement")}} trả về một {{domxref("DOMTokenList")}} trực tiếp phản ánh các giá trị chuỗi [`<list-of-Link-Types>`](/en-US/docs/Web/HTML/Reference/Attributes/rel) phân cách bằng dấu cách của thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Elements/a#rel) của phần tử SVG {{svgelement("a")}}.

## Giá trị

Một {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `relList` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `relList`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}} và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

Với SVG sau:

```html
<svg viewBox="0 0 200 20" xmlns="http://www.w3.org/2000/svg">
  <!-- Liên kết quanh văn bản -->
  <a href="/docs/Web/SVG/Reference/Element/text" rel="alternate bookmark">
    <text x="30" y="10">Link text</text>
  </a>
</svg>
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
svg {
  height: 50px;
}
text {
  font-size: 1rem;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Chúng ta có thể lấy mọi kiểu liên kết được xác định bởi thuộc tính `rel` của phần tử `<a>`:

```js
// Chọn phần tử SVG <a>
const svgLink = document.querySelector("a");
const relations = svgLink.relList;

relations.forEach((relValue) => {
  log(relValue);
});
```

{{EmbedLiveSample("Example","100%","200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`rel`](/en-US/docs/Web/HTML/Reference/Elements/a#rel)
- {{domxref("SVGAElement.rel")}}
- {{domxref("HTMLAnchorElement.relList")}}
- {{domxref("HTMLLinkElement.relList")}}
