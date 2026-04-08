---
title: print-color-adjust
slug: Web/CSS/Reference/Properties/print-color-adjust
page-type: css-property
browser-compat: css.properties.print-color-adjust
sidebar: cssref
---

Thuộc tính **`print-color-adjust`** của [CSS](/vi/docs/Web/CSS) đặt những gì, nếu có, {{Glossary("user agent")}} có thể làm để tối ưu hóa giao diện của phần tử trên thiết bị đầu ra.
Theo mặc định, trình duyệt được phép thực hiện bất kỳ điều chỉnh nào đối với giao diện của phần tử mà nó cho là cần thiết và hợp lý dựa trên loại và khả năng của thiết bị đầu ra.

## Cú pháp

```css
print-color-adjust: economy;
print-color-adjust: exact;

/* Giá trị toàn cục */
print-color-adjust: inherit;
print-color-adjust: initial;
print-color-adjust: revert;
print-color-adjust: revert-layer;
print-color-adjust: unset;
```

Giá trị của thuộc tính `print-color-adjust` phải là một trong các từ khóa sau.

### Giá trị

- `economy`
  - : User agent được phép thực hiện các điều chỉnh đối với phần tử nếu nó cho là phù hợp và hợp lý nhằm tối ưu hóa đầu ra cho thiết bị mà nó đang được kết xuất.
    Ví dụ, khi in, trình duyệt có thể chọn bỏ qua tất cả ảnh nền và điều chỉnh màu văn bản để đảm bảo độ tương phản được tối ưu hóa để đọc trên giấy trắng.
    Đây là giá trị mặc định.
- `exact`
  - : Nội dung của phần tử đã được tạo ra một cách cụ thể và cẩn thận để sử dụng màu sắc, hình ảnh và kiểu dáng theo cách chu đáo và/hoặc quan trọng, đến mức việc trình duyệt thay đổi chúng có thể làm mọi thứ tệ hơn thay vì tốt hơn.
    Giao diện của nội dung không nên bị thay đổi trừ khi có yêu cầu của người dùng.
    Ví dụ, một trang có thể bao gồm danh sách thông tin với các hàng có màu nền xen kẽ giữa trắng và xám nhạt.
    Việc loại bỏ màu nền sẽ làm giảm khả năng đọc của nội dung.

## Ghi chú sử dụng

Có một số lý do khiến trình duyệt có thể muốn sai lệch so với giao diện được chỉ định, chẳng hạn như:

- Nội dung sử dụng màu văn bản và nền quá giống nhau trên thiết bị đầu ra vì lý do dễ đọc.
- Nếu thiết bị đầu ra là máy in, và để tiết kiệm mực, ảnh nền tối hoặc cực kỳ dày đặc có thể bị loại bỏ.
- Khi in một trang, trình duyệt có thể muốn thay thế văn bản màu sáng trên nền tối bằng văn bản tối trên nền trắng.

Bất kỳ tùy chọn nào mà user agent cung cấp cho người dùng để kiểm soát việc sử dụng màu sắc và hình ảnh sẽ được ưu tiên hơn giá trị của `print-color-adjust`.
Nói cách khác, không có gì đảm bảo rằng `print-color-adjust` sẽ làm bất cứ điều gì.
Không chỉ người dùng có thể ghi đè hành vi, mà mỗi user agent được phép tự quyết định cách xử lý `print-color-adjust` trong bất kỳ tình huống nào.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Giữ nguyên độ tương phản thấp

Trong ví dụ này, một hộp được hiển thị sử dụng {{cssxref("background-image")}} và hàm {{cssxref("gradient/linear-gradient", "linear-gradient()")}} trong suốt trên màu nền đen để có gradient xanh tối phía sau văn bản đỏ vừa phải.
Vì lý do nào đó, đây là giao diện mong muốn trong mọi môi trường kết xuất, kể cả trên giấy, vì vậy chúng ta cũng sử dụng `print-color-adjust: exact` để báo cho trình duyệt không thực hiện điều chỉnh màu sắc hoặc kiểu dáng cho hộp khi kết xuất.

#### CSS

```css
.my-box {
  background-color: black;
  background-image: linear-gradient(rgb(0 0 180 / 50%), rgb(70 140 220 / 50%));
  color: #990000;
  width: 15rem;
  height: 6rem;
  text-align: center;
  font:
    24px "Helvetica",
    sans-serif;
  display: flex;
  align-items: center;
  justify-content: center;
  print-color-adjust: exact;
}
```

#### HTML

```html
<div class="my-box">
  <p>Need more contrast!</p>
</div>
```

#### Kết quả

{{EmbedLiveSample("Preserving_low_contrast", 640, 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính liên quan đến màu sắc khác: {{cssxref("color")}}, {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}, {{cssxref("caret-color")}} và {{cssxref("column-rule-color")}}
- {{cssxref("background-image")}}
