---
title: ::placeholder
slug: Web/CSS/Reference/Selectors/::placeholder
page-type: css-pseudo-element
browser-compat: css.selectors.placeholder
sidebar: cssref
---

Phần tử giả **`::placeholder`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho [văn bản giữ chỗ](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder) trong phần tử {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}}.

{{InteractiveExample("CSS Demo: ::placeholder", "tabbed-shorter")}}

```css interactive-example
input {
  margin-top: 0.5rem;
}

input::placeholder {
  font-weight: bold;
  opacity: 0.5;
  color: red;
}
```

```html interactive-example
<label for="first-name">Your phone number:</label><br />

<input
  id="first-name"
  type="tel"
  name="phone"
  minlength="9"
  maxlength="9"
  placeholder="It must be 9 digits" />
```

Chỉ tập hợp con các thuộc tính CSS áp dụng cho phần tử giả {{cssxref("::first-line")}} mới có thể được dùng trong quy tắc dùng `::placeholder` trong bộ chọn.

> [!NOTE]
> Trong hầu hết các trình duyệt, giao diện của văn bản giữ chỗ mặc định là màu xám mờ hoặc xám nhạt.

## Cú pháp

```css
::placeholder {
  /* ... */
}
```

## Khả năng tiếp cận

### Độ tương phản màu sắc

#### Tỷ lệ tương phản

Văn bản giữ chỗ thường có màu nhạt hơn để cho biết đó là gợi ý về loại đầu vào hợp lệ, và không phải là đầu vào thực sự.

Điều quan trọng là đảm bảo tỷ lệ tương phản giữa màu văn bản giữ chỗ và nền của ô nhập liệu đủ cao để những người có vấn đề về thị lực thấp có thể đọc được, đồng thời đảm bảo có đủ sự khác biệt giữa màu văn bản giữ chỗ và màu văn bản đầu vào để người dùng không nhầm lẫn giữa chúng.

Tỷ lệ tương phản màu sắc được xác định bằng cách so sánh độ sáng của văn bản giữ chỗ và giá trị màu nền ô nhập liệu. Để đáp ứng [Hướng dẫn về khả năng tiếp cận nội dung web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) hiện tại, cần tỷ lệ 4.5:1 cho nội dung văn bản và 3:1 cho văn bản lớn hơn như tiêu đề. Văn bản lớn được định nghĩa là 18.66px và đậm hoặc lớn hơn, hoặc 24px hoặc lớn hơn.

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.3 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

#### Khả năng sử dụng

Văn bản giữ chỗ có đủ độ tương phản màu sắc có thể bị hiểu nhầm là đầu vào đã nhập. Văn bản giữ chỗ cũng sẽ biến mất khi người dùng nhập nội dung vào phần tử {{htmlelement("input")}}. Cả hai trường hợp này đều có thể cản trở việc hoàn thành biểu mẫu thành công, đặc biệt đối với những người có lo ngại về nhận thức.

Một cách tiếp cận thay thế để cung cấp thông tin giữ chỗ là bao gồm nó bên ngoài ô nhập liệu ở gần về mặt hình ảnh, sau đó sử dụng [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) để liên kết lập trình {{HTMLElement("input")}} với gợi ý của nó.

Với cách triển khai này, nội dung gợi ý có sẵn ngay cả khi thông tin được nhập vào trường nhập liệu, và ô nhập liệu trông trống khi trang được tải. Hầu hết các công nghệ đọc màn hình sẽ sử dụng `aria-describedby` để đọc gợi ý sau khi văn bản nhãn của ô nhập liệu được thông báo, và người dùng đang dùng trình đọc màn hình có thể tắt tiếng nếu họ thấy thông tin thêm là không cần thiết.

```html
<label for="user-email">Your email address</label>
<span id="user-email-hint" class="input-hint">Example: jane@sample.com</span>
<input
  id="user-email"
  aria-describedby="user-email-hint"
  name="email"
  type="email" />
```

- [Placeholders in Form Fields Are Harmful — Nielsen Norman Group](https://www.nngroup.com/articles/form-design-placeholders/)

### Chế độ tương phản cao của Windows

Văn bản giữ chỗ sẽ xuất hiện với cùng kiểu dáng như nội dung văn bản do người dùng nhập khi được hiển thị trong [Chế độ tương phản cao của Windows](https://www.smashingmagazine.com/2022/06/guide-windows-high-contrast-mode/). Điều này sẽ khiến một số người khó xác định nội dung nào đã được nhập và nội dung nào là văn bản giữ chỗ.

### Nhãn

Các placeholder không phải là sự thay thế cho phần tử {{htmlelement("label")}}. Nếu không có nhãn được liên kết lập trình với ô nhập liệu bằng sự kết hợp của các thuộc tính [`for`](/en-US/docs/Web/HTML/Reference/Elements/label#for) và [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id), các công nghệ hỗ trợ như trình đọc màn hình không thể phân tích cú pháp các phần tử {{htmlelement("input")}}.

- [Placeholders in Form Fields Are Harmful — Nielsen Norman Group](https://www.nngroup.com/articles/form-design-placeholders/)

## Ví dụ

### Thay đổi giao diện của placeholder

Ví dụ này cho thấy một số điều chỉnh bạn có thể thực hiện đối với các kiểu của văn bản giữ chỗ.

#### HTML

```html
<input placeholder="Type here" />
```

#### CSS

```css
input::placeholder {
  color: red;
  font-size: 1.2em;
  font-style: italic;
  opacity: 0.5;
}
```

#### Kết quả

{{EmbedLiveSample("Change_placeholder_appearance", 200, 60)}}

### Văn bản không trong suốt

Một số trình duyệt làm cho văn bản giữ chỗ kém trong suốt hơn. Nếu bạn muốn văn bản hoàn toàn không trong suốt, hãy đặt giá trị thuộc tính {{CSSXref("color")}} một cách rõ ràng. Giá trị [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword) có thể được dùng để có cùng màu với phần tử ô nhập liệu tương ứng.

#### HTML

```html
<input placeholder="Color set by browser" />
<input placeholder="Same color as input" class="explicit-color" />
<input placeholder="Semi-opaque text color" class="opacity-change" />
```

#### CSS

```css
input {
  font-weight: bold;
  color: green;
}

.explicit-color::placeholder {
  /* use the same color as input element to avoid the browser set default color */
  color: currentColor;
}

.opacity-change::placeholder {
  /* less opaque text */
  color: color-mix(in srgb, currentColor 70%, transparent);
}
```

#### Kết quả

{{EmbedLiveSample("default_color", 200, 60)}}

> [!NOTE]
> Lưu ý rằng các trình duyệt sử dụng màu mặc định khác nhau cho văn bản giữ chỗ. Ví dụ, Firefox sử dụng màu của phần tử ô nhập liệu với độ mờ 54%, và Chrome sử dụng màu `darkgray`. Nếu bạn muốn màu văn bản giữ chỗ nhất quán trên các trình duyệt, hãy đặt `color` một cách rõ ràng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lớp giả {{cssxref(":placeholder-shown")}} tạo kiểu cho phần tử _có_ placeholder đang hoạt động.
- Các phần tử HTML liên quan: {{HTMLElement("input")}}, {{HTMLElement("textarea")}}
- [HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms)
