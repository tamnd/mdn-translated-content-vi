---
title: "@counter-style"
slug: Web/CSS/Reference/At-rules/@counter-style
page-type: css-at-rule
browser-compat: css.at-rules.counter-style
sidebar: cssref
---

[Quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) **`@counter-style`** [CSS](/en-US/docs/Web/CSS) cho phép bạn mở rộng các kiểu danh sách được định sẵn và định nghĩa kiểu đếm tùy chỉnh không nằm trong tập hợp các kiểu được định sẵn. Quy tắc `@counter-style` chứa các [mô tả](#mô_tả) định nghĩa cách giá trị đếm được chuyển thành biểu diễn chuỗi.

Mặc dù CSS cung cấp nhiều kiểu đếm được định sẵn hữu ích, quy tắc at `@counter-style` cung cấp phương pháp linh hoạt để tạo counter. Quy tắc at này đáp ứng nhu cầu typography toàn cầu bằng cách cho phép các tác giả định nghĩa kiểu đếm tùy chỉnh khi các kiểu định sẵn không đáp ứng yêu cầu của họ.

## Cú pháp

```css
@counter-style thumbs {
  system: cyclic;
  symbols: "\1F44D";
  suffix: " ";
}
```

Quy tắc at `@counter-style` được nhận dạng bằng [tên kiểu đếm](#tên_kiểu_đếm), và kiểu của counter được đặt tên có thể được tinh chỉnh bằng `<declaration-list>` gồm một hoặc nhiều [mô tả](#mô_tả) và giá trị của chúng.

### Tên kiểu đếm

- `<counter-style-name>`
  - : Cung cấp tên cho kiểu đếm của bạn. Nó được chỉ định là {{cssxref("custom-ident")}} phân biệt hoa thường không có dấu nháy. Giá trị không được bằng `none`. Giống như tất cả các định danh tùy chỉnh, giá trị của kiểu đếm không thể là [từ khóa toàn cục CSS](/en-US/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords). Tránh dùng các giá trị thuộc tính CSS đã liệt kê khác, bao gồm các giá trị thuộc tính [list](/en-US/docs/Web/CSS/Guides/Lists#properties) và [counter style](/en-US/docs/Web/CSS/Guides/Counter_styles#properties). Tên counter của bạn không thể là các giá trị thuộc tính {{cssxref("list-style-type")}} không phân biệt hoa thường là `decimal`, `disc`, `square`, `circle`, `disclosure-open` và `disclosure-closed`.

    > [!NOTE]
    > Các tên kiểu đếm không thể ghi đè `decimal`, `disc`, `square`, `circle`, `disclosure-open` và `disclosure-closed` không thể được dùng làm tên counter tùy chỉnh. Tuy nhiên, chúng hợp lệ trong các ngữ cảnh khác nơi kiểu dữ liệu `<counter-style-name>` được mong đợi, chẳng hạn trong `system: extends <counter-style-name>`.

### Mô tả

- {{cssxref("@counter-style/system", "system")}}
  - : Chỉ định thuật toán dùng để chuyển đổi giá trị số nguyên của counter thành biểu diễn chuỗi. Nếu giá trị là `cyclic`, `numeric`, `alphabetic`, `symbolic` hoặc `fixed`, mô tả `symbols` cũng phải được chỉ định. Nếu giá trị là `additive`, mô tả `additive-symbols` cũng phải được chỉ định.

- {{cssxref("@counter-style/symbols", "symbols")}}
  - : Chỉ định các ký hiệu dùng cho biểu diễn marker. Ký hiệu có thể chứa chuỗi, hình ảnh hoặc định danh tùy chỉnh. Mô tả này bắt buộc nếu mô tả `system` được đặt thành `cyclic`, `numeric`, `alphabetic`, `symbolic` hoặc `fixed`.

- {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}
  - : Định nghĩa các _bộ đôi cộng_ cho các hệ thống cộng. Trong khi các ký hiệu chỉ định trong mô tả `symbols` được dùng để xây dựng biểu diễn marker bởi hầu hết các thuật toán, các hệ thống counter cộng như số La Mã bao gồm một chuỗi các ký hiệu có trọng số. Mô tả là danh sách ký hiệu counter cùng với trọng số số nguyên không âm của chúng, liệt kê theo trọng số giảm dần. Mô tả này bắt buộc nếu mô tả `system` được đặt thành `additive`.

- {{cssxref("@counter-style/negative", "negative")}}
  - : Chỉ định các ký hiệu sẽ được thêm vào đầu hoặc cuối biểu diễn counter nếu giá trị là âm.

- {{cssxref("@counter-style/prefix", "prefix")}}
  - : Chỉ định ký hiệu sẽ được thêm vào trước biểu diễn marker. Các tiền tố được thêm vào biểu diễn ở giai đoạn cuối, trước bất kỳ ký tự nào được thêm vào giá trị counter âm bởi mô tả `negative`.

- {{cssxref("@counter-style/suffix", "suffix")}}
  - : Tương tự mô tả prefix, chỉ định ký hiệu được thêm vào sau biểu diễn marker. Các hậu tố đứng sau biểu diễn marker, kể cả sau bất kỳ ký tự nào được thêm vào giá trị counter âm bởi mô tả `negative`.

- {{cssxref("@counter-style/range", "range")}}
  - : Định nghĩa phạm vi giá trị mà kiểu đếm được áp dụng. Nếu kiểu đếm được dùng để biểu diễn giá trị counter ngoài phạm vi được định nghĩa bởi mô tả này, kiểu đếm sẽ quay lại dùng kiểu `fallback` của nó.

- {{cssxref("@counter-style/pad", "pad")}}
  - : Được dùng khi bạn cần biểu diễn marker có độ dài tối thiểu. Ví dụ nếu bạn muốn counter bắt đầu từ 01 và đi qua 02, 03, 04, v.v., thì mô tả `pad` cần được dùng. Đối với các biểu diễn lớn hơn giá trị `pad` được chỉ định, marker được xây dựng bình thường.

- {{cssxref("@counter-style/speak-as", "speak-as")}}
  - : Mô tả cách các bộ tổng hợp giọng nói, chẳng hạn như trình đọc màn hình, nên thông báo kiểu đếm. Ví dụ, giá trị của marker danh sách có thể được đọc ra như số hoặc chữ cái cho danh sách có thứ tự hoặc như tín hiệu âm thanh cho danh sách không có thứ tự, dựa trên giá trị của mô tả này.

- {{cssxref("@counter-style/fallback", "fallback")}}
  - : Chỉ định tên counter của hệ thống để quay lại nếu hệ thống được chỉ định không thể xây dựng biểu diễn của giá trị counter hoặc nếu giá trị counter nằm ngoài `range` được chỉ định. Nếu counter dự phòng cũng không thể biểu diễn giá trị, thì dự phòng của counter đó sẽ được dùng, nếu có. Nếu không có counter dự phòng nào được mô tả hoặc nếu chuỗi hệ thống dự phòng không thể biểu diễn giá trị counter, nó sẽ cuối cùng quay lại kiểu `decimal`.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định ký hiệu với counter-style

```css
@counter-style circled-alpha {
  system: fixed;
  symbols: Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ;
  suffix: " ";
}
```

Quy tắc kiểu counter ở trên có thể được áp dụng cho danh sách như sau:

```css
.items {
  list-style: circled-alpha;
}
```

Đoạn code trên tạo ra kết quả sau:

```html hidden
<ol class="items">
  <li>one</li>
  <li>two</li>
  <li>three</li>
  <li>four</li>
  <li>five</li>
</ol>
<p>...</p>
<ol class="items" start="25">
  <li>twenty-five</li>
  <li>twenty-six</li>
  <li>twenty-seven</li>
  <li>twenty-eight</li>
</ol>
```

{{EmbedLiveSample('Specifying symbols with counter-style', '', '300')}}

Xem thêm ví dụ trên [trang demo](https://mdn.github.io/css-examples/counter-style-demo/) ([mã nguồn](https://github.com/mdn/css-examples/tree/main/counter-style-demo)).

### Kiểu counter sẵn sàng sử dụng

Tìm bộ sưu tập hơn 100 đoạn code `counter-style` trong tài liệu [Ready-made Counter Styles](https://w3c.github.io/predefined-counter-styles/). Tài liệu này cung cấp các counter đáp ứng nhu cầu của các ngôn ngữ và nền văn hóa trên toàn thế giới.

[Bộ chuyển đổi kiểu counter](https://r12a.github.io/app-counters/) lấy từ danh sách này để kiểm tra và tạo code sao chép và dán cho kiểu counter.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("counter()")}}
- {{cssxref("counters()")}}
- {{cssxref("symbols()")}}
- {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}, {{Cssxref("list-style-type")}}
- [Mô-đun kiểu counter CSS](/en-US/docs/Web/CSS/Guides/Counter_styles)
