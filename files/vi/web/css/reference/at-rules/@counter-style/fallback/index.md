---
title: fallback
slug: Web/CSS/Reference/At-rules/@counter-style/fallback
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.fallback
sidebar: cssref
---

Mô tả **`fallback`** của quy tắc at {{cssxref("@counter-style")}} có thể được dùng để chỉ định kiểu đếm để dự phòng nếu kiểu đếm đang được định nghĩa không thể tạo biểu diễn marker cho một giá trị counter cụ thể.

## Cú pháp

```css
/* Giá trị từ khóa */
fallback: lower-alpha;
fallback: custom-gangnam-style;
```

## Giá trị

Mô tả nhận một `<counter-style-name>` duy nhất làm giá trị:

- [`<counter-style-name>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style#counter-style-name)
  - : Cung cấp tên của kiểu đếm được dùng làm dự phòng, là `<custom-ident>` phân biệt hoa thường của kiểu counter CSS tùy chỉnh (không có dấu nháy) hoặc giá trị thuộc tính {{cssxref("list-style-type")}} không phân biệt hoa thường như `decimal`, `disc`, v.v.

Nếu bỏ qua, dự phòng counter mặc định là `decimal`.

## Mô tả

Kiểu đếm được cung cấp làm giá trị của mô tả `fallback` được dùng khi mô tả {{cssxref('@counter-style/range', 'range')}} được chỉ định cho một kiểu đếm; kiểu `fallback` được dùng để biểu diễn tất cả các giá trị nằm ngoài phạm vi. Kiểu `fallback` cũng được dùng khi hệ thống `fixed` {{cssxref('@counter-style/system', 'system')}} được dùng và không đủ ký hiệu để bao phủ tất cả các mục danh sách; kiểu `fallback` được dùng để biểu diễn tất cả các giá trị vượt ra ngoài phạm vi của hệ thống fixed. Trong cả hai trường hợp này, và bất kỳ khi nào counter được định nghĩa không thể tạo giá trị counter cụ thể, kiểu `fallback` sẽ được dùng.

Nếu kiểu dự phòng được chỉ định cũng không thể xây dựng biểu diễn, thì giá trị `fallback` của counter dự phòng đó sẽ được dùng. Nếu fallback của kiểu dự phòng đó cũng không thể xây dựng biểu diễn, thì fallback của fallback đó sẽ được dùng. Quá trình dự phòng này tiếp tục cho đến khi tìm thấy dự phòng có thể xây dựng biểu diễn counter. Nếu không có giá trị `fallback` nào có thể xây dựng biểu diễn — nếu kiểu dự phòng không có giá trị `fallback`, hoặc nếu giá trị `fallback` không được chỉ định hoặc không hợp lệ — dự phòng mặc định là `decimal`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định kiểu counter dự phòng

#### HTML

```html
<ul class="list">
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
</ul>
```

#### CSS

```css
@counter-style fallback-example {
  system: fixed;
  symbols: "\24B6" "\24B7" "\24B8";
  fallback: upper-alpha;
}

.list {
  list-style: fallback-example;
}
```

#### Kết quả

{{ EmbedLiveSample('Specifying_a_fallback_counter_style') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các mô tả {{cssxref("@counter-style")}} khác: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, và {{cssxref("@counter-style/speak-as", "speak-as")}}
- {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- {{cssxref("symbols()")}}: ký pháp hàm để tạo kiểu counter ẩn danh
