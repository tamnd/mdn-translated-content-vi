---
title: CSSKeywordValue
slug: Web/API/CSSKeywordValue
page-type: web-api-interface
browser-compat: api.CSSKeywordValue
---

{{APIRef("CSS Typed Object Model API")}}

Giao diện **`CSSKeywordValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) tạo ra một đối tượng để biểu thị các từ khóa CSS và các định danh khác.

Tên phiên bản của giao diện là {{Glossary("stringifier")}}, có nghĩa là khi được sử dụng ở bất cứ đâu mà chuỗi được mong đợi, nó sẽ trả về giá trị của `CSSKeyword.value`.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("CSSKeywordValue.CSSKeywordValue", "CSSKeywordValue()")}}
  - : Tạo một đối tượng `CSSKeywordValue` mới.

## Thuộc tính phiên bản

- {{domxref('CSSKeywordValue.value')}}
  - : Trả về hoặc thiết lập giá trị của `CSSKeywordValue`.

## Phương thức phiên bản

_Kế thừa phương thức từ {{domxref('CSSStyleValue')}}._

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
let myElement = document.getElementById("myElement").attributeStyleMap;
myElement.set("display", new CSSKeywordValue("initial"));

console.log(myElement.get("display").value); // 'initial'
```

{{EmbedLiveSample("Examples", 120, 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSImageValue')}}
- {{domxref('CSSNumericValue')}}
- {{domxref('CSSPositionValue')}}
- {{domxref('CSSTransformValue')}}
- {{domxref('CSSUnparsedValue')}}
