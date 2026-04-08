---
title: negative
slug: Web/CSS/Reference/At-rules/@counter-style/negative
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.negative
sidebar: cssref
---

Descriptor **`negative`** của at-rule {{cssxref("@counter-style")}} cho phép bạn xác định cách biểu diễn các giá trị bộ đếm âm khi định nghĩa kiểu bộ đếm tùy chỉnh. Giá trị của descriptor `negative` xác định các ký hiệu sẽ được thêm vào trước và sau biểu diễn bộ đếm khi giá trị bộ đếm là âm.

## Cú pháp

```css
/* Một giá trị <symbol> */
negative: "--"; /* Thêm '--' trước nếu giá trị bộ đếm là âm */

/* Hai giá trị <symbol> */
negative: "(" ")"; /* Thêm '(-' trước và ')' sau nếu giá trị bộ đếm là âm */
```

### Giá trị

Descriptor `negative` chấp nhận tối đa hai giá trị [`<symbol>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/symbols#values).

- `<symbol>`
  - : Nếu chỉ có một giá trị được chỉ định, nó sẽ được thêm vào trước biểu diễn bộ đếm khi giá trị bộ đếm là âm. Nếu có hai giá trị được chỉ định, giá trị đầu tiên được thêm vào trước và giá trị thứ hai được thêm vào sau biểu diễn bộ đếm khi giá trị bộ đếm là âm.

## Mô tả

Nếu giá trị bộ đếm là âm, `<symbol>` được chỉ định cho descriptor `negative` sẽ được thêm vào trước biểu diễn bộ đếm, thay thế dấu `-` mặc định cho các giá trị âm. `<symbol>` thứ hai, nếu được chỉ định, sẽ được thêm vào sau biểu diễn bộ đếm.

Descriptor `negative` có liên quan trong hai trường hợp: nếu kiểu bộ đếm có giá trị `system` là `symbolic`, `alphabetic`, `numeric` và `additive` và số đếm là âm; và nếu giá trị `system` là `extends` và kiểu bộ đếm được mở rộng tự thân sử dụng dấu âm. Đối với các hệ thống không hỗ trợ giá trị bộ đếm âm, việc chỉ định descriptor `negative` không có hiệu lực và bị bỏ qua.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Hiển thị bộ đếm âm

Ví dụ này [mở rộng](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/system#extends) kiểu danh sách [`decimal`](/en-US/docs/Web/CSS/Reference/Properties/list-style-type#decimal). Descriptor `negative` được dùng để thêm `(-` và `)` trước và sau các giá trị bộ đếm âm.

#### HTML

```html
<ol start="-3">
  <li>Negative three</li>
  <li>Negative two</li>
  <li>Negative one</li>
  <li>Zero</li>
  <li>One</li>
</ol>
```

#### CSS

```css
@counter-style neg {
  system: extends decimal;
  negative: "(-" ")";
  suffix: ": ";
}

ol {
  list-style: neg;
}
```

#### Kết quả

{{ EmbedLiveSample('Rendering negative counters') }}

Tiền tố và hậu tố được liệt kê làm giá trị của descriptor `negative` chỉ được thêm vào marker khi giá trị bộ đếm nhỏ hơn không.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor của {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, {{cssxref("@counter-style/fallback", "fallback")}}
- Các thuộc tính kiểu danh sách: {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- Hàm {{cssxref("symbols()")}} để tạo kiểu bộ đếm ẩn danh
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
