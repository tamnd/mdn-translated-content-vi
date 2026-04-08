---
title: pad
slug: Web/CSS/Reference/At-rules/@counter-style/pad
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.pad
sidebar: cssref
---

Descriptor **`pad`** của at-rule {{cssxref("@counter-style")}} được dùng để đặt độ dài tối thiểu cho biểu diễn marker.

## Cú pháp

```css
pad: 3 "0";
pad: "+" 5;
```

### Giá trị

Descriptor chấp nhận hai giá trị sau đây, được phân tách bằng khoảng trắng và có thể được chỉ định theo bất kỳ thứ tự nào:

- {{cssxref("integer")}}
  - : Chỉ định độ dài tối thiểu mà tất cả các biểu diễn marker phải đạt. Giá trị phải không âm. Trong trường hợp descriptor `pad`, giá trị này còn được gọi là _độ dài đệm_ (pad length).

- [`<symbol>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/symbols#symbol)
  - : Chỉ định ký hiệu được dùng để đệm nếu độ dài tối thiểu được xác định bởi `<integer>` chưa đạt được. Trong trường hợp descriptor `pad`, giá trị này còn được gọi là _ký hiệu đệm_ (padding symbol).

## Mô tả

Dùng descriptor `pad` khi bạn cần biểu diễn marker có độ dài tối thiểu. Nếu biểu diễn marker ngắn hơn độ dài đệm được chỉ định, thì biểu diễn marker sẽ được đệm bằng ký hiệu đệm được chỉ định. Biểu diễn marker dài hơn độ dài đệm sẽ được hiển thị mà không cần đệm thêm.

Descriptor `pad` nhận một `<integer>` cho độ dài marker tối thiểu và một `<symbol>` cho ký hiệu đệm. Trường hợp sử dụng phổ biến của descriptor `pad` là khi bạn cần một danh sách bắt đầu đánh số từ `01` và tiếp tục qua `02`, `03`, `04`, v.v., thay vì chỉ `1`, `2`, `3` và `4`. Bằng cách chỉ định descriptor `pad` là `pad: 2 "0"` trong trường hợp này, trình duyệt đảm bảo bộ đếm có ít nhất hai ký tự và thêm đệm bằng `0` để đạt độ dài tối thiểu hai ký tự khi cần. Các bộ đếm đã có hai ký tự trở lên trong ví dụ này sẽ được hiển thị bình thường, không cần đệm.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đệm một bộ đếm

Ví dụ này mở rộng {{cssxref("@counter-style/system","system")}} `decimal` để tạo một bộ đếm có ít nhất ba ký tự, đệm các bộ đếm ngắn hơn bằng `0` để đạt độ dài tối thiểu đó. Descriptor {{cssxref("@counter-style/suffix", "suffix")}} đã được thêm vào để làm cho kết quả dễ đọc hơn.

#### HTML

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li value="40">Forty</li>
  <li>Forty-one</li>
  <li value="200">Two hundred</li>
  <li value="3000">Three thousand</li>
  <li>and so on</li>
</ul>
```

#### CSS

```css
@counter-style pad-example {
  system: extends decimal;
  suffix: ": ";
  pad: 3 "0";
}

ul {
  list-style: pad-example;
}
```

#### Kết quả

{{ EmbedLiveSample('Padding a counter', '100', '200') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor của {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, {{cssxref("@counter-style/fallback", "fallback")}}
- Các thuộc tính kiểu danh sách: {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- Hàm {{cssxref("symbols()")}} để tạo kiểu bộ đếm ẩn danh
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
