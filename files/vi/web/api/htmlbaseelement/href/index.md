---
title: "HTMLBaseElement: href property"
short-title: href
slug: Web/API/HTMLBaseElement/href
page-type: web-api-instance-property
browser-compat: api.HTMLBaseElement.href
---

{{APIRef("HTML DOM")}}

Thuộc tính **`href`** của giao diện {{domxref("HTMLBaseElement")}} chứa một chuỗi là URL để sử dụng làm cơ sở cho [các URL tương đối](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL#absolute_urls_vs._relative_urls).

Nó phản ánh thuộc tính `href` của phần tử {{HTMLElement("base")}}.

## Giá trị

Một chuỗi chứa URL, hoặc chuỗi rỗng (`""`) nếu phần tử `<base>` tương ứng không bao gồm thuộc tính `href`.

## Ví dụ

### HTML với URL cơ sở

Ví dụ này minh họa rằng thuộc tính `href` trong `<base>` được phản ánh trong thuộc tính `href` của `HTMLBaseElement`.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}
```

```css hidden
#log {
  height: 20px;
}
```

#### HTML

```html
<base href="https://developer.mozilla.org/example" />
```

#### JavaScript

```js
const base = document.getElementsByTagName("base")[0];
log(`base.href="${base.href}"`);
```

#### Kết quả

{{EmbedLiveSample('HTML with base URL', '100','50px')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
