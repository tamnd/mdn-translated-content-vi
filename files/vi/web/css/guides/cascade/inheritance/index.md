---
title: Inheritance
slug: Web/CSS/Guides/Cascade/Inheritance
page-type: guide
spec-urls: https://drafts.csswg.org/css-cascade-5/#css-inheritance
sidebar: cssref
---

Trong CSS, **inheritance** kiểm soát điều gì xảy ra khi không có giá trị nào được chỉ định cho một thuộc tính trên một phần tử.

Các thuộc tính CSS có thể được phân thành hai loại:

- **Inherited properties** (thuộc tính được kế thừa), theo mặc định được đặt thành [computed value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của phần tử cha
- **Non-inherited properties** (thuộc tính không được kế thừa), theo mặc định được đặt thành [initial value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) của thuộc tính

Tham khảo [bất kỳ định nghĩa thuộc tính CSS nào](/en-US/docs/Web/CSS/Reference#index) để xem liệu một thuộc tính cụ thể có inherit theo mặc định ("Inherited: yes") hay không ("Inherited: no").

## Inherited properties

Khi không có giá trị nào cho **inherited property** được chỉ định trên một phần tử, phần tử đó nhận [computed value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của thuộc tính đó trên phần tử cha của nó. Chỉ có phần tử gốc của tài liệu mới nhận [initial value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) được nêu trong phần tóm tắt của thuộc tính.

Một ví dụ điển hình về inherited property là thuộc tính {{cssxref("color")}}. Hãy xem xét các quy tắc style và markup sau:

```css
p {
  color: green;
}
```

```html
<p>This paragraph has <em>emphasized text</em> in it.</p>
```

{{EmbedLiveSample("Inherited properties","",40)}}

Các từ "emphasized text" sẽ hiển thị màu xanh lá cây, vì phần tử `em` đã kế thừa giá trị của thuộc tính {{cssxref("color")}} từ phần tử `p`. Nó _không_ nhận giá trị ban đầu của thuộc tính (là màu được dùng cho phần tử gốc khi trang không chỉ định màu nào).

## Non-inherited properties

Khi không có giá trị nào cho **non-inherited property** được chỉ định trên một phần tử, phần tử đó nhận [initial value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) của thuộc tính đó (như được chỉ định trong phần tóm tắt của thuộc tính).

Một ví dụ điển hình về non-inherited property là thuộc tính {{ Cssxref("border") }}. Hãy xem xét các quy tắc style và markup sau:

```css
p {
  border: medium solid;
}
```

```html
<p>This paragraph has <em>emphasized text</em> in it.</p>
```

{{EmbedLiveSample("Non-inherited properties","",40)}}

Các từ "emphasized text" sẽ không có border khác (vì giá trị ban đầu của {{cssxref("border-style")}} là `none`).

## Ghi chú

Từ khóa {{cssxref("inherit")}} cho phép tác giả chỉ định tường minh việc kế thừa. Nó hoạt động trên cả inherited properties lẫn non-inherited properties.

Bạn có thể kiểm soát inheritance cho tất cả các thuộc tính cùng một lúc bằng cách sử dụng thuộc tính shorthand {{cssxref("all")}}, áp dụng giá trị của nó cho tất cả các thuộc tính. Ví dụ:

```css
p {
  all: revert;
  font-size: 200%;
  font-weight: bold;
}
```

Điều này revert style của thuộc tính {{cssxref("font")}} của các đoạn văn về mặc định của user agent, trừ khi tồn tại user stylesheet, trong trường hợp đó sẽ dùng stylesheet đó. Sau đó nó nhân đôi cỡ chữ và áp dụng {{cssxref("font-weight")}} là `"bold"`.

### Ghi đè inheritance, một ví dụ

Sử dụng ví dụ trước với {{cssxref("border")}}, nếu chúng ta đặt tường minh inheritance bằng `inherit`, chúng ta nhận được kết quả sau:

```css
p {
  border: medium solid;
}

em {
  border: inherit;
}
```

```html
<p>This paragraph has <em>emphasized text</em> in it.</p>
```

{{EmbedLiveSample("Overriding inheritance, an example","",40)}}

Chúng ta có thể thấy ở đây có thêm border xung quanh từ "emphasized text".

## Đặc tả

{{Specifications}}

## Xem thêm

- Các giá trị CSS để kiểm soát inheritance: {{cssxref("inherit")}}, {{cssxref("initial")}}, {{cssxref("revert")}}, {{cssxref("revert-layer")}}, và {{cssxref("unset")}}
- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- [CSS error handling](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling)
- [Giới thiệu về CSS cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Học: Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)
- [Học: Cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
- [Giới thiệu cú pháp CSS: declarations, rulesets và statements](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [At-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- Giá trị: [initial](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value), [computed](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value), [used](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value), và [actual](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
- [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
- Module [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting)
