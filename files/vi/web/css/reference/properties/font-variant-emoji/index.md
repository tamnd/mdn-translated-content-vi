---
title: font-variant-emoji
slug: Web/CSS/Reference/Properties/font-variant-emoji
page-type: css-property
browser-compat: css.properties.font-variant-emoji
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`font-variant-emoji`** chỉ định kiểu hiển thị mặc định cho các emoji.

Theo truyền thống, điều này được thực hiện bằng cách thêm _Bộ chọn biến thể_, `U+FE0E` cho văn bản và `U+FE0F` cho emoji, vào điểm mã emoji. Chỉ các emoji được liệt kê là góp phần vào [chuỗi trình bày emoji Unicode](https://www.unicode.org/emoji/charts/emoji-variants.html) mới bị ảnh hưởng bởi thuộc tính này.

## Cú pháp

```css
/* Giá trị từ khóa */
font-variant-emoji: normal;
font-variant-emoji: text;
font-variant-emoji: emoji;
font-variant-emoji: unicode;

/* Giá trị toàn cục */
font-variant-emoji: inherit;
font-variant-emoji: initial;
font-variant-emoji: revert;
font-variant-emoji: revert-layer;
font-variant-emoji: unset;
```

Thuộc tính `font-variant-emoji` được chỉ định bằng một giá trị từ khóa từ danh sách bên dưới.

### Giá trị

- `normal`
  - : Cho phép trình duyệt chọn cách hiển thị emoji. Điều này thường tuân theo cài đặt của hệ điều hành.
- `text`
  - : Hiển thị emoji như thể nó đang sử dụng bộ chọn biến thể văn bản unicode (`U+FE0E`).
- `emoji`
  - : Hiển thị emoji như thể nó đang sử dụng bộ chọn biến thể emoji unicode (`U+FE0F`).
- `unicode`
  - : Hiển thị emoji theo [thuộc tính trình bày Emoji](https://www.unicode.org/reports/tr51/tr51-23.html#Emoji_Presentation). Nếu bộ chọn biến thể `U+FE0E` hoặc `U+FE0F` có mặt, thì nó sẽ ghi đè cài đặt giá trị này.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Khả năng tiếp cận

Mặc dù việc sử dụng emoji có thể thú vị, bạn nên xem xét tác động của chúng đối với khả năng tiếp cận, đặc biệt đối với người dùng có khiếm khuyết thị giác và nhận thức. Hãy xem xét các yếu tố sau khi sử dụng emoji:

- Hiển thị trên trình đọc màn hình: Các trình đọc màn hình sẽ đọc to văn bản thay thế của emoji. Hãy ghi nhớ điều này để xem xét vị trí của emoji trong nội dung. Việc lặp lại và lạm dụng emoji sẽ có tác động tiêu cực đến người dùng trình đọc màn hình. Tốt hơn là dùng emoji hơn emoticon; emoticon sẽ được đọc như các ký tự dấu câu.

- Tương phản với nền: Khi sử dụng emoji, hãy xem xét màu sắc của chúng và cách đó sẽ hoạt động với màu nền, đặc biệt nếu bạn có màu nền có thể thay đổi, chẳng hạn như chế độ sáng/tối.

- Mục đích sử dụng: Không sử dụng emoji để thay thế từ ngữ vì sự hiểu biết của bạn về ý nghĩa emoji có thể khác với người dùng. Cũng cần lưu ý rằng emoji có thể có ý nghĩa khác nhau trong các nền văn hóa và địa lý khác nhau. Khuyến nghị của chúng tôi là ưu tiên giới hạn việc sử dụng đối với các emoji phổ biến.

## Ví dụ

### Thay đổi cách hiển thị emoji

Ví dụ này cho thấy cách bạn có thể hiển thị emoji theo kiểu `text` hoặc `emoji`.

#### HTML

```html hidden
<p class="no-support">
  Your Browser does not support <code>font-variant-emoji</code>. This image
  shows how it is rendered with support.
</p>
<img
  class="no-support"
  src="./font-variant-emoji-example.jpg"
  alt="a telephone emoji show as text, black and white next to a telephone emoji shown as emoji full color and graphical representation" />
```

```html
<section class="emojis">
  <div class="emoji">
    <h2>text presentation</h2>
    <div class="text-presentation">☎</div>
  </div>
  <div class="emoji">
    <h2>emoji presentation</h2>
    <div class="emoji-presentation">☎</div>
  </div>
</section>
```

#### CSS

```css hidden
@supports (font-variant-emoji: emoji) {
  .no-support {
    display: none;
  }
  .emojis {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
  }
  .emoji > div {
    font-size: 2rem;
  }
}

@supports not (font-variant-emoji: emoji) {
  .emojis {
    display: none;
  }
}
```

```css
.text-presentation {
  font-variant-emoji: text;
}

.emoji-presentation {
  font-variant-emoji: emoji;
}
```

#### Kết quả

{{ EmbedLiveSample('Changing the way an emoji is displayed') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [font-variant](/en-US/docs/Web/CSS/Reference/Properties/font-variant)
- [font-variant-alternates](/en-US/docs/Web/CSS/Reference/Properties/font-variant-alternates)
- [font-variant-caps](/en-US/docs/Web/CSS/Reference/Properties/font-variant-caps)
- [font-variant-east-asian](/en-US/docs/Web/CSS/Reference/Properties/font-variant-east-asian)
- [font-variant-ligatures](/en-US/docs/Web/CSS/Reference/Properties/font-variant-ligatures)
- [font-variant-numeric](/en-US/docs/Web/CSS/Reference/Properties/font-variant-numeric)
- [Emojis and accessibility: How to use them properly](https://uxdesign.cc/emojis-in-accessibility-how-to-use-them-properly-66b73986b803)
