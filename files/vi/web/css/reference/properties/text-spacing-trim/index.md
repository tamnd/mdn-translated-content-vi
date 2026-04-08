---
title: text-spacing-trim
slug: Web/CSS/Reference/Properties/text-spacing-trim
page-type: css-property
status:
  - experimental
browser-compat: css.properties.text-spacing-trim
sidebar: cssref
---

{{seecompattable}}

Thuộc tính **`text-spacing-trim`** [CSS](/en-US/docs/Web/CSS) kiểm soát khoảng cách nội bộ được thiết lập trên các ký tự dấu câu Trung Quốc/Nhật Bản/Hàn Quốc (CJK) giữa các ký tự kề nhau (kerning) và ở đầu hoặc cuối dòng văn bản.

## Cú pháp

```css
/* Giá trị từ khóa */
text-spacing-trim: normal;
text-spacing-trim: space-all;
text-spacing-trim: space-first;
text-spacing-trim: trim-start;

/* Giá trị toàn cục */
text-spacing-trim: inherit;
text-spacing-trim: initial;
text-spacing-trim: revert;
text-spacing-trim: revert-layer;
text-spacing-trim: unset;
```

### Giá trị

- `<spacing-trim>`
  - : Định nghĩa các tùy chọn cắt khoảng cách khác nhau. Các giá trị có sẵn là:
    - `normal`
      - : Đặt các ký tự dấu câu mở toàn-chiều-rộng CJK thành toàn-chiều-rộng ở đầu mỗi dòng. Đặt các ký tự dấu câu đóng toàn-chiều-rộng CJK thành toàn-chiều-rộng ở cuối mỗi dòng, hoặc nửa-chiều-rộng nếu chúng không vừa trên dòng trước khi căn đều. [Thu gọn khoảng cách](#thu_gọn_dấu_câu_toàn_chiều_rộng) giữa các ký tự dấu câu.
    - `space-all`
      - : Tất cả các ký tự dấu câu toàn-chiều-rộng CJK đều được đặt thành toàn-chiều-rộng.
    - `space-first`
      - : Hoạt động như `normal`, ngoại trừ các ký tự dấu câu mở toàn-chiều-rộng CJK được đặt thành toàn-chiều-rộng ở đầu dòng đầu tiên của khối container văn bản, và ở đầu mỗi dòng tiếp theo sau ngắt dòng rõ ràng như ký tự xuống dòng.
    - `trim-start`
      - : Hoạt động như `normal`, ngoại trừ các ký tự dấu câu mở toàn-chiều-rộng CJK được đặt thành nửa-chiều-rộng ở đầu mỗi dòng.

    > [!NOTE]
    > Module [CSS Text](/en-US/docs/Web/CSS/Guides/Text) cũng định nghĩa các giá trị `trim-both`, `trim-all`, và `auto`. Tuy nhiên, những giá trị này hiện chưa được triển khai trong bất kỳ trình duyệt nào.

## Mô tả

Thuộc tính `text-spacing-trim` áp dụng khoảng cách/kerning cho các ký tự dấu câu CJK để tạo ra kiểu chữ đẹp mắt về mặt thị giác như được định nghĩa bởi [Yêu cầu bố cục văn bản Nhật Bản](https://w3c.github.io/jlreq/) (JLREQ) và [Yêu cầu bố cục văn bản Trung Quốc](https://www.w3.org/International/clreq/) (CLREQ).

Nhiều ký tự dấu câu CJK bao gồm khoảng cách nội bộ trong hình vẽ. Ví dụ, dấu chấm đầy-chiều-rộng CJK và dấu đóng ngoặc tròn đầy-chiều-rộng CJK thường có khoảng cách nội bộ ở bên phải của chúng, để cho chúng có một [độ dịch chuyển không đổi](/en-US/docs/Glossary/Advance_measure) nhất quán với các ký tự biểu tượng khác. Tuy nhiên, khi chúng xuất hiện liên tiếp, khoảng cách nội bộ có thể trở nên quá thừa.

`text-spacing-trim` có thể được dùng để điều chỉnh khoảng cách quá thừa như vậy giữa các ký tự kề nhau (kerning) và ở đầu hoặc cuối dòng văn bản. Nói chung:

- Nếu một ký tự dấu câu toàn-chiều-rộng được đặt thành toàn-chiều-rộng, nó có khoảng cách nội bộ ở cả hai bên và có chiều rộng đầy đủ của một biểu tượng chữ.
- Nếu một ký tự dấu câu toàn-chiều-rộng được đặt thành nửa-chiều-rộng, nó chỉ có khoảng cách nội bộ ở một bên, và bên còn lại khớp với đầu (với dấu câu mở) hoặc cuối (với dấu câu đóng). Các ký tự nửa-chiều-rộng thường có chiều rộng bằng một nửa biểu tượng chữ.

> [!NOTE]
> Để tránh nguy cơ kerning quá mức, phông chữ phải có tính năng OpenType Alternate Half Widths (`halt`), tính năng Contextual Half-width Spacing (`chws`), hoặc cả hai. Nếu phông chữ không có tính năng nào, `text-spacing-trim` sẽ bị vô hiệu hóa.

### Thu gọn dấu câu toàn chiều rộng

Khi các cặp ký tự dấu câu kề nhau, khoảng cách giữa chúng được thu gọn theo các quy tắc sau:

- Đặt một ký tự dấu câu mở toàn-chiều-rộng thành nửa-chiều-rộng nếu ký tự trước đó là ký tự dấu câu mở toàn-chiều-rộng, dấu chấm giữa toàn-chiều-rộng, khoảng cách biểu tượng chữ (U+3000), ký tự dấu câu đóng toàn-chiều-rộng có kích thước phông chữ tương đương hoặc lớn hơn, hoặc một ký tự thuộc [danh mục tổng quát Unicode "Dấu câu mở" Ps](https://www.compart.com/en/unicode/category/Ps). Nếu không, đặt thành toàn-chiều-rộng.
- Đặt một ký tự dấu câu đóng toàn-chiều-rộng thành nửa-chiều-rộng nếu ký tự tiếp theo là ký tự dấu câu đóng toàn-chiều-rộng, dấu chấm giữa toàn-chiều-rộng, khoảng cách biểu tượng chữ (U+3000), ký tự dấu câu mở toàn-chiều-rộng có kích thước phông chữ lớn hơn, hoặc một ký tự thuộc [danh mục tổng quát Unicode "Dấu câu đóng" (Pe)](https://www.compart.com/en/unicode/category/Pe). Nếu không, đặt thành toàn-chiều-rộng.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### So sánh giá trị `text-spacing-trim`

Ví dụ này so sánh hiệu ứng của bốn giá trị `text-spacing-trim` khác nhau, áp dụng chúng cho bốn đoạn văn giống hệt nhau để bạn có thể thấy sự khác biệt trực quan giữa từng giá trị.

#### HTML

```html
<main>
  <div id="normal">
    <h2>normal</h2>
    <p>
      （東）、【「（東）」】。<br />
      「東」「東」「東」東東東「東」。
    </p>
  </div>
  <div id="space-all">
    <h2>space-all</h2>
    <p>
      （東）、【「（東）」】。<br />
      「東」「東」「東」東東東「東」。
    </p>
  </div>
  <div id="space-first">
    <h2>space-first</h2>
    <p>
      （東）、【「（東）」】。<br />
      「東」「東」「東」東東東「東」。
    </p>
  </div>
  <div id="trim-start">
    <h2>trim-start</h2>
    <p>
      （東）、【「（東）」】。<br />
      「東」「東」「東」東東東「東」。
    </p>
  </div>
</main>
```

#### CSS

```css
main {
  font-family:
    "Yu Gothic", "YuGothic", "Noto Sans JP", "Hiragino Sans",
    "Hiragino Kaku Gothic ProN", sans-serif;
  display: grid;
  gap: 0.5em;
  grid-template-columns: 1fr 1fr;
  width: 70%;
  margin: 0 auto;
}
h2 {
  font-size: 80%;
  margin: 0;
}
p {
  font-size: 20px;
  border: 1px solid blue;
  margin: 0;
}
#normal {
  text-spacing-trim: normal;
  grid-column: 1;
  grid-row: 1;
}
#space-all {
  text-spacing-trim: space-all;
  grid-column: 2;
  grid-row: 1;
}
#space-first {
  text-spacing-trim: space-first;
  grid-column: 1;
  grid-row: 2;
}
#trim-start {
  text-spacing-trim: trim-start;
  grid-column: 2;
  grid-row: 2;
}
```

#### Kết quả

{{EmbedLiveSample("`text-spacing-trim` value comparison", "100%",320)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXref("text-autospace")}}
- Đơn vị [`ic`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#local_font-relative_lengths) và [`ric`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#root_font-relative_lengths)
- Module [CSS text](/en-US/docs/Web/CSS/Guides/Text)
