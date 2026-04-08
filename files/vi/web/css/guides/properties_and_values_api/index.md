---
title: CSS properties and values API
short-title: Properties and values API
slug: Web/CSS/Guides/Properties_and_values_API
page-type: css-module
spec-urls: https://drafts.css-houdini.org/css-properties-values-api-1/
sidebar: cssref
---

Module **CSS properties and values API** định nghĩa một phương pháp để đăng ký các thuộc tính CSS mới, xác định kiểu dữ liệu của thuộc tính, hành vi kế thừa và tùy chọn giá trị ban đầu.
API này mở rộng module [CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables), cho phép tác giả định nghĩa các thuộc tính tùy chỉnh trong CSS bằng [cú pháp hai gạch ngang (`--`)](/en-US/docs/Web/CSS/Reference/Properties/--*).
CSS properties and values API là một phần của nhóm API [CSS Houdini](/en-US/docs/Web/API/Houdini_APIs).

Các thuộc tính tùy chỉnh cho phép bạn tái sử dụng các giá trị xuyên suốt một dự án, giúp đơn giản hóa các stylesheet phức tạp hoặc lặp lại.
Các thuộc tính tùy chỉnh cơ bản được định nghĩa trong module [CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables).
CSS properties and values API mở rộng module đó, cho phép thêm metadata vào các thuộc tính tùy chỉnh bằng CSS thông qua at-rule {{cssxref("@property")}}, hoặc thay thế bằng phương thức JavaScript {{domxref('CSS/registerProperty_static', 'CSS.registerProperty')}}.

Dù được đăng ký bằng CSS hay JavaScript, việc thiết lập metadata cho thuộc tính tùy chỉnh cung cấp kiểu dữ liệu mong đợi mà trình duyệt có thể sử dụng tùy theo ngữ cảnh, xác định giá trị ban đầu và cho phép kiểm soát tính kế thừa.

Việc đăng ký thuộc tính tùy chỉnh theo CSS properties and values API mạnh mẽ hơn cách khai báo biến CSS cascading đơn giản, đặc biệt khi chuyển tiếp và animation các giá trị, vì trình duyệt có thể nội suy giữa các giá trị tùy chỉnh của kiểu này, trong khi các thuộc tính dùng [cú pháp hai gạch ngang (`--`)](/en-US/docs/Web/CSS/Reference/Properties/--*) hoạt động giống như thay thế chuỗi.

## Properties and values API trong hoạt động

Để xem cách các thuộc tính và giá trị tùy chỉnh có thể được sử dụng qua API, hãy di chuột qua hộp bên dưới.

```js hidden
CSS.registerProperty({
  name: "--stop-color",
  syntax: "<color>",
  inherits: false,
  initialValue: "cornflowerblue",
});
```

```css hidden
.box {
  padding: 1rem;
  width: 90%;
  height: 4rem;
  font-family: sans-serif;
  font-size: large;
  color: white;
  border-radius: 0.5rem;
}

.box {
  background: linear-gradient(to right, var(--stop-color), lavenderblush);
  transition: --stop-color 2s;
}

.box:hover {
  --stop-color: aquamarine;
}
```

```html hidden
<div class="box"><p>Linear gradient with transition</p></div>
```

{{EmbedLiveSample("Properties and values API in action",600,120)}}

Hộp có [background](/en-US/docs/Web/CSS/Reference/Properties/background) bao gồm [linear gradient](/en-US/docs/Web/CSS/Reference/Values/gradient/linear-gradient) từ `--stop-color` (thuộc tính tùy chỉnh) đến [`lavenderblush`](/en-US/docs/Web/CSS/Reference/Values/named-color).
Giá trị của `--stop-color` ban đầu được đặt là `cornflowerblue`, nhưng khi di chuột qua hộp, `--stop-color` [chuyển tiếp](/en-US/docs/Web/CSS/Reference/Properties/transition) sang `aquamarine` trong hai giây (`linear-gradient(to right, aquamarine, lavenderblush)`).

## Tham khảo

### At-rules và descriptors

- {{cssxref("@property")}}
  - [syntax](/en-US/docs/Web/CSS/Reference/At-rules/@property#descriptors) descriptor
    - [`+` and `#`](/en-US/docs/Web/CSS/Reference/At-rules/@property#descriptors) multipliers
    - [`|`](/en-US/docs/Web/CSS/Reference/At-rules/@property#descriptors) combinator
  - [inherits](/en-US/docs/Web/CSS/Reference/At-rules/@property#descriptors) descriptor
  - [initial-value](/en-US/docs/Web/CSS/Reference/At-rules/@property#descriptors) descriptor

### Interfaces và APIs

- {{domxref('CSSPropertyRule')}}
- {{domxref('CSS/registerProperty_static', 'CSS.registerProperty()')}}

## Hướng dẫn

- [Đăng ký thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
  - : Trình bày cách đăng ký thuộc tính tùy chỉnh CSS bằng at-rule `@property` và giải thích lợi ích của việc làm đó.
- [Sử dụng CSS properties and values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API/guide)
  - : Giải thích cách đăng ký thuộc tính tùy chỉnh trong CSS và JavaScript, cùng các gợi ý xử lý giá trị không xác định và không hợp lệ, fallback và kế thừa.
- [CSS Houdini](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Houdini)
  - : Tài liệu tham khảo về tài nguyên Houdini bao gồm các module CSS, hướng dẫn API và tài nguyên bên ngoài.
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
  - : Giải thích CSS Houdini là gì và các lợi thế của nó, cùng danh sách các API có sẵn và trạng thái của chúng.

## Khái niệm liên quan

- {{cssxref("var")}}
- [CSSRule](/en-US/docs/Web/API/CSSRule)
- [CSSStyleValue](/en-US/docs/Web/API/CSSStyleValue)
- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping)
- [Using shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [Worklet](/en-US/docs/Web/API/Worklet)

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) module
- [Using shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API) module
- [Worklet](/en-US/docs/Web/API/Worklet) interface
- [CSS `env()`](/en-US/docs/Web/CSS/Reference/Values/env)
- [CSS Typed Object Model](/en-US/docs/Web/API/CSS_Typed_OM_API)
