---
title: "Custom properties (--*): CSS variables"
slug: Web/CSS/Reference/Properties/--*
page-type: css-property
browser-compat: css.properties.custom-property
sidebar: cssref
---

Tên thuộc tính có tiền tố `--`, như `--example-name`, đại diện cho _các thuộc tính tùy chỉnh_ chứa một giá trị có thể được dùng trong các khai báo khác bằng hàm {{cssxref("var()")}}.

Các thuộc tính tùy chỉnh được giới hạn phạm vi cho các phần tử mà chúng được khai báo, và tham gia vào tầng: giá trị của một thuộc tính tùy chỉnh như vậy là giá trị từ khai báo được quyết định bởi thuật toán tầng.

{{CSSInfo}}

## Cú pháp

```css
--some-keyword: left;
--some-color: #123456;
--some-complex-value: 3px 6px rgb(20 32 54);
```

- `<declaration-value>`
  - : Giá trị này khớp với bất kỳ chuỗi nào gồm một hoặc nhiều token, miễn là chuỗi không chứa bất kỳ token nào bị cấm. Nó đại diện cho toàn bộ những gì một khai báo hợp lệ có thể có làm giá trị của nó.

> [!NOTE]
> Tên thuộc tính tùy chỉnh phân biệt chữ hoa chữ thường — `--my-color` sẽ được coi là thuộc tính tùy chỉnh riêng biệt so với `--My-color`.

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<p id="firstParagraph">
  This paragraph should have a blue background and yellow text.
</p>
<p id="secondParagraph">
  This paragraph should have a yellow background and blue text.
</p>
<div id="container">
  <p id="thirdParagraph">
    This paragraph should have a green background and yellow text.
  </p>
</div>
```

#### CSS

```css
:root {
  --first-color: #1166ff;
  --second-color: #ffff77;
}

#firstParagraph {
  background-color: var(--first-color);
  color: var(--second-color);
}

#secondParagraph {
  background-color: var(--second-color);
  color: var(--first-color);
}

#container {
  --first-color: #229900;
}

#thirdParagraph {
  background-color: var(--first-color);
  color: var(--second-color);
}
```

#### Kết quả

{{EmbedLiveSample('basic example', 500, 130)}}

### Đăng ký thuộc tính tùy chỉnh bằng @property

Trong ví dụ này, chúng ta dùng quy tắc at {{cssxref("@property")}} để đăng ký thuộc tính tùy chỉnh.

#### HTML

HTML của chúng ta bao gồm một danh sách có thứ tự ({{htmlelement("ol")}}) chứa ba mục danh sách ({{htmlelement("li")}}).

```html
<ol>
  <li class="one">Item one</li>
  <li class="two">Item two</li>
  <li class="three">Item three</li>
</ol>
```

#### CSS

Chúng ta dùng quy tắc at {{cssxref("@property")}} để đăng ký hai thuộc tính tùy chỉnh.

```css
@property --itemSize {
  syntax: "<length> | <percentage>";
  inherits: true;
  initial-value: 200px;
}

@property --borderWidth {
  syntax: "<length>";
  inherits: false;
  initial-value: 10px;
}
```

Chúng ta thử ghi đè các giá trị thuộc tính tùy chỉnh. Các giá trị đặt trên `.two` là hợp lệ trong khi các giá trị đặt trên `.three` là không hợp lệ.

```css
ol {
  --itemSize: 100px;
  --borderWidth: 1px;
}
.two {
  --itemSize: initial;
  --borderWidth: inherit;
}
.three {
  --itemSize: large;
  --borderWidth: 3%;
}
```

Chúng ta dùng hai thuộc tính tùy chỉnh để tạo kiểu cho các mục, đặt đường viền và chiều rộng cho tất cả các mục cùng một lúc:

```css
li {
  width: var(--itemSize);
  border: var(--borderWidth) solid red;
  background-color: yellow;
  margin-bottom: 10px;
}
```

#### Kết quả

{{EmbedLiveSample('Registering custom properties with @property', 500, 130)}}

Thuộc tính `--itemSize` có thể kế thừa; `--borderWidth` thì không. Các thuộc tính được đặt trên phần tử cha `ol`, ghi đè các giá trị mặc định được xác định trong đăng ký của chúng. Mục thứ nhất kế thừa kích thước nhưng không kế thừa chiều rộng đường viền từ OL. Các từ khóa toàn cục, được khai báo cho `.two`, hợp lệ cho `<length>`, vì vậy được dùng. Các giá trị trong `.three` là không hợp lệ ("large" không phải là `<length-percentage>` và `3%` không phải là `<length>`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm {{cssxref("var()")}}
- Quy tắc at {{cssxref("@property")}}
- Hướng dẫn [Sử dụng thuộc tính tùy chỉnh CSS (biến)](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties)
- Hướng dẫn [Đăng ký thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
- Module [Các biến tầng tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Cascading_variables)
