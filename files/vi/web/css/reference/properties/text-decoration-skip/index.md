---
title: text-decoration-skip
slug: Web/CSS/Reference/Properties/text-decoration-skip
page-type: css-property
status:
  - deprecated
browser-compat: css.properties.text-decoration-skip
sidebar: cssref
---

{{deprecated_header}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-decoration-skip`** xác định những phần nào trong nội dung của phần tử mà các đường trang trí văn bản tác động lên phần tử đó phải bỏ qua. Thuộc tính kiểm soát tất cả các đường trang trí văn bản được vẽ bởi phần tử và cả các đường trang trí văn bản được vẽ bởi các phần tử cha của nó.

> [!NOTE]
> Hầu hết các trình duyệt khác đang hướng tới hỗ trợ thuộc tính {{cssxref("text-decoration-skip-ink")}} đơn giản hơn.

## Cú pháp

```css
/* Giá trị từ khóa */
text-decoration-skip: none;
text-decoration-skip: objects;
text-decoration-skip: spaces;
text-decoration-skip: edges;
text-decoration-skip: box-decoration;

/* Nhiều từ khóa */
text-decoration-skip: objects spaces;
text-decoration-skip: leading-spaces trailing-spaces;
text-decoration-skip: objects edges box-decoration;

/* Giá trị toàn cục */
text-decoration-skip: inherit;
text-decoration-skip: initial;
text-decoration-skip: revert;
text-decoration-skip: revert-layer;
text-decoration-skip: unset;
```

### Giá trị

- `none`
  - : Không bỏ qua phần nào. Do đó, trang trí văn bản được vẽ cho toàn bộ nội dung văn bản và qua các hộp inline-level atomic.
- `objects`
  - : Toàn bộ hộp margin của phần tử bị bỏ qua nếu nó là một inline atomic như hình ảnh hoặc inline-block.
- `spaces`
  - : Tất cả khoảng cách bị bỏ qua: tất cả [ký tự khoảng trắng Unicode](https://www.unicode.org/reports/tr44/#White_Space) và tất cả dấu phân cách từ, cộng với bất kỳ {{cssxref("letter-spacing")}} hay {{cssxref("word-spacing")}} liền kề nào.
- `leading-spaces`
  - : Giống như `spaces`, ngoại trừ chỉ bỏ qua các khoảng cách đầu.
- `trailing-spaces`
  - : Giống như `spaces`, ngoại trừ chỉ bỏ qua các khoảng cách cuối.
- `edges`
  - : Phần bắt đầu và kết thúc của trang trí văn bản được lùi vào một chút (ví dụ: bằng một nửa độ dày của đường) so với cạnh nội dung của hộp trang trí. Do đó, các phần tử liền kề nhận được các đường gạch chân riêng biệt. (Điều này quan trọng trong tiếng Trung, nơi gạch chân là một dạng dấu câu.)

    ![Một ví dụ về "text-decoration-skip: edges;".](decoration-skip-edges.png)

- `box-decoration`
  - : Trang trí văn bản bị bỏ qua qua các vùng margin, border và padding của hộp. Điều này chỉ có tác dụng đối với các trang trí được áp đặt bởi một phần tử cha; một _hộp trang trí_ không bao giờ vẽ qua trang trí hộp của chính nó.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Bỏ qua cạnh

#### HTML

```html
<p>Hey, grab a cup of <em>coffee!</em></p>
```

#### CSS

```css
p {
  margin: 0;
  font-size: 3em;
  text-decoration: underline;
  text-decoration-skip: edges;
}
```

#### Kết quả

{{EmbedLiveSample("Skipping_edges", "100%", 150)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-decoration-skip-ink")}}
