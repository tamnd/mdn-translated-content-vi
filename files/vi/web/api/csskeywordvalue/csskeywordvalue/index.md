---
title: "CSSKeywordValue: hàm khởi tạo CSSKeywordValue()"
short-title: CSSKeywordValue()
slug: Web/API/CSSKeywordValue/CSSKeywordValue
page-type: web-api-constructor
browser-compat: api.CSSKeywordValue.CSSKeywordValue
---

{{APIRef("CSS Typed Object Model API")}}

Hàm khởi tạo **`CSSKeywordValue()`** tạo một đối tượng {{domxref("CSSKeywordValue")}} mới biểu thị các từ khóa CSS và các định danh khác.

## Cú pháp

```js-nolint
new CSSKeywordValue(val)
```

### Tham số

- `value`
  - : Thiết lập hoặc trả về giá trị của `CSSKeywordValue` mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu tham số `value` không được chỉ định hoặc không thuộc loại {{jsxref('String')}}.

## Ví dụ

Ví dụ sau đặt lại thuộc tính CSS {{cssxref('display')}} về giá trị mặc định của nó, thiết lập thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) nội tuyến thành `style="display: initial"` nếu xem trong [inspector của developer tools](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/select_an_element/index.html).

```css hidden
#myElement {
  display: flex;
}
```

```html hidden
<div id="myElement">
  Check the developer tools to see the log in the console and to inspect the
  style attribute on this div.
</div>
```

```js
const keyword = new CSSKeywordValue("initial");
const myElement = document.getElementById("myElement").attributeStyleMap;
myElement.set("display", keyword);

console.log(myElement.get("display").value); // 'initial'
console.dir(keyword);
```

{{EmbedLiveSample("Examples", 120, 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
