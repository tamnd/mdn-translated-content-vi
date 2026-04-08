---
title: revert-layer
slug: Web/CSS/Reference/Values/revert-layer
page-type: css-keyword
browser-compat: css.types.global_keywords.revert-layer
sidebar: cssref
---

Từ khóa toàn cục CSS **`revert-layer`** [CSS-wide keyword](/vi/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords) khôi phục giá trị của một thuộc tính trong [lớp cascade](/vi/docs/Web/CSS/Reference/At-rules/@layer) về giá trị của thuộc tính đó trong một quy tắc CSS khớp với phần tử ở lớp cascade trước đó. Giá trị của thuộc tính với từ khóa này được tính toán lại như thể không có quy tắc nào được chỉ định cho phần tử đích trong lớp cascade hiện tại.

Nếu không có lớp cascade nào khác để hoàn nguyên cho quy tắc CSS khớp, giá trị thuộc tính sẽ khôi phục về [giá trị được tính toán](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) dẫn xuất từ lớp hiện tại. Hơn nữa, nếu không có quy tắc CSS khớp trong lớp hiện tại, giá trị thuộc tính cho phần tử sẽ khôi phục về kiểu được xác định trong [nguồn gốc kiểu](/vi/docs/Glossary/Style_origin) trước đó.

Từ khóa này có thể được áp dụng cho bất kỳ thuộc tính CSS nào, bao gồm thuộc tính rút gọn CSS {{cssxref("all")}}.

## Revert-layer so với revert

Từ khóa `revert-layer` cho phép bạn khôi phục kiểu về những kiểu được chỉ định trong các lớp cascade trước đó trong [nguồn gốc tác giả](/vi/docs/Glossary/Style_origin). Ngược lại, từ khóa {{cssxref("revert")}} cho phép bạn khôi phục các kiểu được áp dụng trong nguồn gốc tác giả về những kiểu được chỉ định trong nguồn gốc người dùng hoặc nguồn gốc tác nhân người dùng.

Từ khóa `revert-layer` lý tưởng là được áp dụng cho các thuộc tính trong lớp cascade. Tuy nhiên, nếu được áp dụng cho các thuộc tính bên ngoài lớp cascade, nó sẽ khôi phục giá trị thuộc tính về bất kỳ giá trị nào được đặt bởi các gợi ý trình bày (chẳng hạn như thuộc tính `width` và `height` hoặc phần tử `<s>` trong HTML), mặc định về các giá trị được thiết lập bởi stylesheet của tác nhân người dùng hoặc kiểu người dùng. Không giống như từ khóa `revert`, coi các gợi ý trình bày là một phần của nguồn gốc tác giả và cũng hoàn nguyên chúng, từ khóa `revert-layer` bỏ qua các gợi ý trình bày bên ngoài lớp cascade, vì vậy nó không hoàn nguyên chúng.

## Ví dụ

### Hành vi lớp cascade mặc định

Trong ví dụ bên dưới, hai lớp cascade được xác định trong CSS, `base` và `special`. Theo mặc định, các quy tắc trong lớp `special` sẽ ghi đè các quy tắc cạnh tranh trong lớp `base` vì `special` được liệt kê sau `base` trong câu lệnh khai báo `@layer`.

#### HTML

```html
<p>Ví dụ này chứa một danh sách.</p>

<ul>
  <li class="item feature">Mục một</li>
  <li class="item">Mục hai</li>
  <li class="item">Mục ba</li>
</ul>
```

#### CSS

```css
@layer base, special;

@layer special {
  .item {
    color: red;
  }
}

@layer base {
  .item {
    color: blue;
  }
  .feature {
    color: green;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Default_cascade_layer_behavior')}}

Tất cả các phần tử `<li>` khớp với quy tắc `item` trong lớp `special` và có màu đỏ. Đây là hành vi lớp cascade mặc định, trong đó các quy tắc trong lớp `special` ưu tiên hơn các quy tắc trong lớp `base`.

### Hoàn nguyên về kiểu trong lớp cascade trước đó

Hãy xem cách từ khóa `revert-layer` thay đổi hành vi lớp cascade mặc định. Đối với ví dụ này, lớp `special` chứa thêm một quy tắc `feature` nhắm vào phần tử `<li>` đầu tiên. Thuộc tính `color` trong quy tắc này được đặt thành `revert-layer`.

#### HTML

```html
<p>Ví dụ này chứa một danh sách.</p>

<ul>
  <li class="item feature">Mục một</li>
  <li class="item">Mục hai</li>
  <li class="item">Mục ba</li>
</ul>
```

#### CSS

```css
@layer base, special;

@layer special {
  .item {
    color: red;
  }
  .feature {
    color: revert-layer;
  }
}

@layer base {
  .item {
    color: blue;
  }
  .feature {
    color: green;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Revert_to_style_in_previous_cascade_layer')}}

Với `color` được đặt thành `revert-layer`, giá trị thuộc tính `color` khôi phục về giá trị trong quy tắc `feature` khớp trong lớp `base` trước đó, và vì vậy 'Mục một' bây giờ có màu xanh lá cây.

### Hoàn nguyên về kiểu ở nguồn gốc trước đó

Ví dụ này cho thấy hành vi của từ khóa `revert-layer` khi không có lớp cascade nào để hoàn nguyên _và_ không có quy tắc CSS khớp trong lớp hiện tại để kế thừa giá trị thuộc tính.

#### HTML

```html
<p>Ví dụ này chứa một danh sách.</p>

<ul>
  <li class="item feature">Mục một</li>
  <li class="item">Mục hai</li>
  <li class="item">Mục ba</li>
</ul>
```

#### CSS

```css
@layer base {
  .item {
    color: revert-layer;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Revert_to_style_in_previous_origin')}}

Kiểu cho tất cả các phần tử `<li>` khôi phục về các giá trị mặc định trong nguồn gốc tác nhân người dùng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("initial")}}
- {{cssxref("inherit")}}
- {{cssxref("revert")}}
- {{cssxref("unset")}}
- {{cssxref("all")}}
- Module [CSS cascading and inheritance](/vi/docs/Web/CSS/Guides/Cascade)
