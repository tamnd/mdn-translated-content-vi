---
title: "@layer"
slug: Web/CSS/Reference/At-rules/@layer
page-type: css-at-rule
browser-compat: css.at-rules.layer
sidebar: cssref
---

At-rule **`@layer`** [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) được dùng để khai báo một cascade layer và cũng có thể được dùng để xác định thứ tự ưu tiên trong trường hợp có nhiều cascade layer.

{{InteractiveExample("CSS Demo: @layer", "tabbed-standard")}}

```css interactive-example
@layer module, state;

@layer state {
  .alert {
    background-color: brown;
  }
  p {
    border: medium solid limegreen;
  }
}

@layer module {
  .alert {
    border: medium solid violet;
    background-color: yellow;
    color: white;
  }
}
```

```html interactive-example
<p class="alert">Beware of the zombies</p>
```

## Cú pháp

```css
/* statement at-rules */
@layer layer-name;
@layer layer-name, layer-name, layer-name;

/* block at-rules */
@layer {rules}
@layer layer-name {rules}
```

trong đó:

- _layer-name_
  - : Là tên của cascade layer.
- _rules_
  - : Là tập hợp các quy tắc CSS trong cascade layer.

## Mô tả

Các quy tắc trong một cascade layer cascade với nhau, cung cấp cho các nhà phát triển web khả năng kiểm soát tốt hơn đối với cascade. Các kiểu dáng không được định nghĩa trong một layer luôn ghi đè các kiểu dáng được khai báo trong các layer có tên và ẩn danh.

Sơ đồ sau cho thấy các ưu tiên layer trong đó các layer được khai báo theo thứ tự 1, 2, ..., N.

![Diagram showing cascade layer priorities](https://mdn.github.io/shared-assets/images/diagrams/css/at-rules/layer-cascade.svg)

Như được ghi chú trong sơ đồ trên, _khai báo quan trọng_ (declarations with `!important` flag) có ưu tiên cao hơn _khai báo thông thường_ (regular declarations without `!important`). Thứ tự ưu tiên giữa các quy tắc quan trọng là nghịch đảo của các quy tắc thông thường. Transitions có mức độ ưu tiên cao nhất. Tiếp theo theo thứ tự từ cao đến thấp là các khai báo quan trọng của {{glossary("user agent")}}, khai báo quan trọng của người dùng, và khai báo quan trọng của tác giả; theo thứ tự đó. Người dùng có thể chỉ định kiểu dáng bằng cách sử dụng tùy chọn trình duyệt, tùy chọn hệ điều hành hoặc tiện ích mở rộng trình duyệt. Các khai báo quan trọng của họ có ưu tiên cao hơn các khai báo quan trọng của _tác giả_ hay _nhà phát triển web_.

Trong các kiểu dáng của tác giả, tất cả các khai báo quan trọng trong các CSS layer đều có ưu tiên cao hơn bất kỳ khai báo quan trọng nào được khai báo ngoài layer, trong khi tất cả các khai báo thông thường trong các CSS layer có ưu tiên thấp hơn các khai báo được khai báo ngoài layer.
Thứ tự khai báo quan trọng. Layer được khai báo đầu tiên có ưu tiên thấp nhất và layer được khai báo cuối cùng có ưu tiên cao nhất. Tuy nhiên, ưu tiên bị đảo ngược khi cờ [`!important`](/en-US/docs/Web/CSS/Reference/Values/important) được sử dụng.

At-rule `@layer` được dùng để tạo cascade layer theo một trong ba cách.

Cách thứ nhất là sử dụng block at-rule `@layer` để tạo cascade layer có tên với các quy tắc CSS cho layer đó bên trong, như sau:

```css
@layer utilities {
  .padding-sm {
    padding: 0.5rem;
  }

  .padding-lg {
    padding: 0.8rem;
  }
}
```

Cách thứ hai là sử dụng statement at-rule `@layer` để tạo một hoặc nhiều cascade layer có tên phân cách bằng dấu phẩy mà không gán bất kỳ kiểu dáng nào. Đây có thể là một layer duy nhất, như được hiển thị bên dưới:

```css
@layer utilities;
```

Nhiều layer có thể được định nghĩa cùng một lúc, như được hiển thị bên dưới:

```css
@layer theme, layout, utilities;
```

Điều này hữu ích vì thứ tự ban đầu trong đó các layer được khai báo chỉ ra layer nào có ưu tiên. Như với các khai báo, layer được liệt kê cuối cùng sẽ thắng nếu các khai báo được tìm thấy trong nhiều layer. Do đó, với ví dụ trước, nếu một quy tắc cạnh tranh được tìm thấy trong `theme` và `utilities`, quy tắc trong `utilities` sẽ thắng và được áp dụng.

Một quy tắc trong `utilities` sẽ được áp dụng _ngay cả khi nó có độ đặc hiệu thấp hơn_ so với quy tắc trong `theme`. Điều này là vì một khi thứ tự layer đã được thiết lập, độ đặc hiệu và thứ tự xuất hiện bị bỏ qua. Điều này cho phép sử dụng các bộ chọn CSS đơn giản hơn vì bạn không phải đảm bảo rằng bộ chọn sẽ có độ đặc hiệu đủ cao để ghi đè các quy tắc cạnh tranh; tất cả những gì bạn cần đảm bảo là nó xuất hiện trong một layer sau.

> [!NOTE]
> Sau khi đã khai báo tên layer, thiết lập thứ tự của chúng, bạn có thể thêm quy tắc CSS vào layer bằng cách khai báo lại tên. Các kiểu dáng sau đó được thêm vào layer và thứ tự layer sẽ không thay đổi.

Cách thứ ba là tạo một layer vô danh bằng cách sử dụng block at-rule `@layer` mà không bao gồm tên layer. Ví dụ:

```css
@layer {
  p {
    margin-block: 1rem;
  }
}
```

Điều này tạo ra một _anonymous cascade layer_. Layer này hoạt động giống như các layer có tên; tuy nhiên, các quy tắc không thể được gán cho nó sau này. Thứ tự ưu tiên cho các layer ẩn danh là thứ tự mà các layer được khai báo, có tên hoặc không, và thấp hơn các kiểu dáng được khai báo ngoài layer.

Một cách khác để tạo cascade layer là sử dụng {{cssxref("@import")}}. Trong trường hợp này, các quy tắc sẽ nằm trong stylesheet được nhập. Hãy nhớ rằng at-rule `@import` phải đứng trước tất cả các loại quy tắc khác, ngoại trừ câu lệnh `@charset` và `@layer` (không phải block `@layer`).

```css
@import "theme.css" layer(utilities);
```

### Lồng các layer

Các layer có thể được lồng nhau. Ví dụ:

```css
@layer framework {
  @layer layout {
  }
}
```

Để thêm quy tắc vào layer `layout` bên trong `framework`, hãy nối hai tên lại với nhau bằng dấu `.`.

```css
@layer framework.layout {
  p {
    margin-block: 1rem;
  }
}
```

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ sau, hai quy tắc CSS được tạo ra. Một cho phần tử {{htmlelement("p")}} nằm ngoài bất kỳ layer nào và một bên trong layer có tên `type` cho `.box p`.

Không có layer, bộ chọn `.box p` sẽ có độ đặc hiệu cao nhất, và do đó, văn bản `Hello, world!` sẽ hiển thị màu xanh lá. Vì layer `type` xuất hiện trước layer ẩn danh được tạo để giữ nội dung không có layer, văn bản sẽ có màu tím.

Cũng lưu ý thứ tự. Mặc dù chúng ta khai báo kiểu dáng không có layer đầu tiên, nó vẫn được áp dụng _sau_ các kiểu dáng trong layer.

#### HTML

```html
<div class="box">
  <p>Hello, world!</p>
</div>
```

#### CSS

```css
p {
  color: rebeccapurple;
}

@layer type {
  .box p {
    font-weight: bold;
    font-size: 1.3em;
    color: green;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example")}}

### Gán quy tắc cho các layer hiện có

Trong ví dụ sau, hai layer được tạo ra mà không có quy tắc nào được áp dụng, sau đó các quy tắc CSS được áp dụng cho hai layer. Layer `base` xác định `color`, `border`, `font-size`, và `padding`. Layer `special` xác định một màu khác. Vì `special` xuất hiện cuối cùng khi các layer được định nghĩa, màu mà nó cung cấp được sử dụng và văn bản được hiển thị bằng `rebeccapurple`. Tất cả các quy tắc khác từ `base` vẫn được áp dụng.

#### HTML

```html
<div class="item">
  I am displayed in <code>color: rebeccapurple</code> because the
  <code>special</code> layer comes after the <code>base</code> layer. My green
  border, font-size, and padding come from the <code>base</code> layer.
</div>
```

#### CSS

```css
@layer base, special;

@layer special {
  .item {
    color: rebeccapurple;
  }
}

@layer base {
  .item {
    color: green;
    border: 5px solid green;
    font-size: 1.3em;
    padding: 0.5em;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Assigning_rules_to_existing_layers")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@import")}}
- {{domxref("CSSLayerBlockRule")}}
- {{domxref("CSSLayerStatementRule")}}
- [`!important`](/en-US/docs/Web/CSS/Reference/Values/important)
- {{cssxref("revert-layer")}}
- [Introducing the CSS cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Learn: Handling conflicts](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)
- [Learn: Cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
- [The future of CSS: Cascade layers](https://www.bram.us/2021/09/15/the-future-of-css-cascade-layers-css-at-layer/) on bram.us (2021)
