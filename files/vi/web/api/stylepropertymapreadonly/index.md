---
title: StylePropertyMapReadOnly
slug: Web/API/StylePropertyMapReadOnly
page-type: web-api-interface
browser-compat: api.StylePropertyMapReadOnly
---

{{APIRef("CSS Typed Object Model API")}}

Giao diện **`StylePropertyMapReadOnly`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) cung cấp một biểu diễn chỉ đọc của khối khai báo CSS, là một lựa chọn thay thế cho {{domxref("CSSStyleDeclaration")}}. Sử dụng {{domxref('Element.computedStyleMap','Element.computedStyleMap()')}} để lấy một thực thể của giao diện này.

## Thuộc tính phiên bản

- {{domxref('StylePropertyMapReadOnly.size')}}
  - : Trả về một số nguyên dương chứa kích thước của đối tượng `StylePropertyMapReadOnly`.

## Phương thức phiên bản

- {{domxref('StylePropertyMapReadOnly.entries()')}}
  - : Trả về một mảng các cặp `[key, value]` thuộc tính liệt kê riêng của đối tượng, theo cùng thứ tự như vòng lặp {{jsxref("Statements/for...in", "for...in")}} (điểm khác biệt là vòng lặp for-in cũng duyệt qua các thuộc tính trong chuỗi prototype).
- {{domxref('StylePropertyMapReadOnly.forEach()')}}
  - : Thực thi một hàm được cung cấp một lần cho mỗi phần tử của `StylePropertyMapReadOnly`.
- {{domxref('StylePropertyMapReadOnly.get()')}}
  - : Trả về giá trị của thuộc tính được chỉ định.
- {{domxref('StylePropertyMapReadOnly.getAll()')}}
  - : Trả về một mảng các đối tượng {{domxref("CSSStyleValue")}} chứa các giá trị của thuộc tính được cung cấp.
- {{domxref('StylePropertyMapReadOnly.has()')}}
  - : Cho biết liệu thuộc tính được chỉ định có tồn tại trong đối tượng `StylePropertyMapReadOnly` hay không.
- {{domxref('StylePropertyMapReadOnly.keys()')}}
  - : Trả về một _iterator mảng_ mới chứa các khóa của mỗi phần tử trong `StylePropertyMapReadOnly`.
- {{domxref('StylePropertyMapReadOnly.values()')}}
  - : Trả về một _iterator mảng_ mới chứa các giá trị của mỗi chỉ mục trong đối tượng `StylePropertyMapReadOnly`.

## Ví dụ

Chúng ta cần có một phần tử để quan sát:

```html
<p>
  This is a paragraph with some text. We can add some CSS, or not. The style map
  will include all the default and inherited CSS property values.
</p>
<dl id="output"></dl>
```

Thêm một chút CSS với thuộc tính tùy chỉnh để minh họa kết quả rõ hơn:

```css
p {
  --some-variable: 1.6em;
  --some-other-variable: translateX(33vw);
  --another-variable: 42;
  line-height: var(--some-variable);
}
```

Thêm JavaScript để lấy đoạn văn và trả về danh sách định nghĩa của tất cả các giá trị thuộc tính CSS mặc định bằng {{domxref('Element.computedStyleMap()')}}.

```js
// get the element
const myElement = document.querySelector("p");

// get the <dl> we'll be populating
const stylesList = document.querySelector("#output");

// Retrieve all computed styles with computedStyleMap()
const stylePropertyMap = myElement.computedStyleMap();

// iterate through the map of all the properties and values, adding a <dt> and <dd> for each
for (const [prop, val] of stylePropertyMap) {
  // properties
  const cssProperty = document.createElement("dt");
  cssProperty.innerText = prop;
  stylesList.appendChild(cssProperty);

  // values
  const cssValue = document.createElement("dd");
  cssValue.innerText = val;
  stylesList.appendChild(cssValue);
}
```

{{EmbedLiveSample("Examples", 120, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
