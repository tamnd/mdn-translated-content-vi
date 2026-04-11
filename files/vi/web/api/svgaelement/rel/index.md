---
title: "SVGAElement: thuộc tính rel"
short-title: rel
slug: Web/API/SVGAElement/rel
page-type: web-api-instance-property
browser-compat: api.SVGAElement.rel
---

{{APIRef("SVG")}}

Thuộc tính **`rel`** của {{domxref("SVGAElement")}} trả về một chuỗi phản ánh giá trị của thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Elements/a#rel) của phần tử SVG {{svgelement("a")}}.

Thuộc tính `rel` chỉ định danh sách các kiểu liên kết phân cách bằng dấu cách, [`<list-of-Link-Types>`](/en-US/docs/Web/HTML/Reference/Attributes/rel), cho biết mối quan hệ giữa đích hoặc tài nguyên được biểu thị bởi phần tử {{SVGElement("a")}} và tài liệu hiện tại. Thuộc tính này có thể lấy hoặc đặt giá trị thuộc tính `rel`.

## Giá trị

Một chuỗi; giá trị của thuộc tính `rel`.

## Ví dụ

Với SVG sau:

```html
<svg viewBox="0 0 200 20" xmlns="http://www.w3.org/2000/svg">
  <!-- Liên kết quanh văn bản -->
  <a href="/docs/Web/SVG/Reference/Element/text" rel="terms-of-service">
    <text x="30" y="10">Link text.</text>
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

Chúng ta có thể lấy và đặt thuộc tính `rel`:

```js
// Chọn phần tử SVG <a>
const svgLink = document.querySelector("svg a");

// Truy cập thuộc tính rel
log(`Rel: ${svgLink.rel}`);

// Đặt thuộc tính rel
svgLink.rel = "alternate bookmark";

// Truy cập lại thuộc tính rel
log(`New rel: "${svgLink.rel}"`); // New rel: "alternate bookmark"
```

{{EmbedLiveSample("Example","100%","200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`rel`](/en-US/docs/Web/HTML/Reference/Elements/a#rel)
- {{domxref("SVGAElement.relList")}}
- {{domxref("HTMLAnchorElement.rel")}}
- {{domxref("HTMLLinkElement.rel")}}
