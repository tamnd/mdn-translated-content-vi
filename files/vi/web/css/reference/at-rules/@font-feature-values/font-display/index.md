---
title: font-display
slug: Web/CSS/Reference/At-rules/@font-feature-values/font-display
page-type: css-at-rule-descriptor
spec-urls: https://drafts.csswg.org/css-fonts/#descdef-font-feature-values-font-display
sidebar: cssref
---

Descriptor **`font-display`** cho at-rule {{cssxref("@font-feature-values")}} đặt giá trị mặc định về cách hiển thị một font face dựa trên việc font đó có được tải về hay không và khi nào. Việc đặt giá trị cho descriptor `font-display` trong khối `@font-feature-values` sẽ đặt giá trị mặc định của descriptor `font-display` cho at-rule {{cssxref("@font-face")}} đối với tất cả font có cùng giá trị {{cssxref("@font-face/font-family", "font-family")}}.

## Cú pháp

```css
/* Các giá trị từ khóa */
font-display: auto;
font-display: block;
font-display: swap;
font-display: fallback;
font-display: optional;
```

### Giá trị

- `auto`
  - : Chiến lược hiển thị font được xác định bởi user agent.
- `block`
  - : Cho font face một khoảng thời gian block ngắn, thường khoảng 3 giây, và một khoảng thời gian swap vô hạn.
- `swap`
  - : Cho font face một khoảng thời gian block cực nhỏ và một khoảng thời gian swap vô hạn.
- `fallback`
  - : Cho font face một khoảng thời gian block cực nhỏ và một khoảng thời gian swap ngắn.
- `optional`
  - : Cho font face một khoảng thời gian block cực nhỏ và không có khoảng thời gian swap.

## Mô tả

Descriptor `font-display` cho `@font-feature-values` xác định timeline hiển thị font; nó thực hiện điều này bằng cách đặt giá trị `font-display` mặc định cho `@font-face` với cùng tên `font-family`. Khi `font-display` bị bỏ qua trong `@font-face`, user agent đầu tiên sẽ tìm giá trị `font-display` đã được đặt thông qua `@font-feature-values` cho font-family liên quan. Nếu không tìm thấy giá trị nào, user agent sẽ sử dụng giá trị `auto` cho `font-display`, trong trường hợp đó user agent sẽ xác định chiến lược hiển thị font.

Timeline hiển thị font dựa trên một bộ hẹn giờ bắt đầu khi user agent cố gắng sử dụng một font face đã tải về cụ thể. Timeline được chia thành ba giai đoạn, như liệt kê bên dưới. Các giai đoạn này quyết định hành vi hiển thị của bất kỳ phần tử nào sử dụng font face đó.

- Giai đoạn **block** của font: Nếu font face chưa được tải, các phần tử cố gắng sử dụng font sẽ được hiển thị với font face dự phòng _vô hình_. Trình duyệt chặn hiển thị văn bản thấy được, dành chỗ cho văn bản sắp hiển thị dựa trên số liệu của font dự phòng. Trong giai đoạn block, văn bản không hiển thị. Khi kết thúc giai đoạn block, nếu font chưa tải xong, văn bản sẽ được hiển thị bằng font dự phòng.

- Giai đoạn **swap** của font: Giai đoạn swap xảy ra sau giai đoạn block (nếu có) và nếu font face vẫn chưa được tải thành công. Các phần tử cố gắng sử dụng font chưa tải sẽ được hiển thị bằng font face dự phòng khả dụng tiếp theo. Font face dự phòng vô hình trước đó được vẽ lên màn hình. Nếu font tải thành công trong giai đoạn swap, văn bản được hiển thị bằng font dự phòng sẽ được cập nhật — hoặc hoán đổi — với font vừa tải. Bước này kích hoạt việc vẽ lại.

- Giai đoạn **failure** của font: Nếu font face chưa tải xong vào lúc giai đoạn swap hết hạn hoặc giai đoạn block hết hạn (nếu không có giai đoạn swap, như trong trường hợp `optional`), user agent sẽ coi font đó là tải thất bại. Kết quả là nội dung hiển thị bằng font dự phòng.

Descriptor `font-display` cho phép bạn đặt chính sách hiển thị mặc định cho tất cả các quy tắc `@font-face`, kể cả những quy tắc không do tác giả kiểm soát, chẳng hạn như các quy tắc `@font-face` của bên thứ ba. Khi giá trị `font-display` được đặt thông qua `@font-feature-values`, nó trở thành giá trị `font-display` mặc định và được áp dụng cho toàn bộ font-family. Tuy nhiên, bất kỳ giá trị `font-display` nào được định nghĩa trong các khối `@font-face` riêng lẻ sẽ ghi đè giá trị mặc định này, nhưng chỉ cho những khối có descriptor đó.

## Ví dụ

```css
@font-feature-values "Leitura" {
  font-display: swap;
  @swash {
    fancy: 1;
  }
}
```

Descriptor `font-display` trong ví dụ này đặt giá trị `font-display` mặc định cho font "Leitura" thành `swap` cho tất cả các khối `@font-face`. Có thể có nhiều khối `@font-face` nhập nhiều tệp font cho một font-family. Nếu một trong những khối `@font-face` đó bao gồm descriptor `font-display`, giá trị được chỉ định sẽ được sử dụng chỉ cho tệp font cụ thể đó. Tất cả các khối khác không bao gồm descriptor `font-display` sẽ mặc định thành `swap` thay vì giá trị mặc định chuẩn `auto` của user agent.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- Descriptor {{cssxref("@font-face/font-display", "font-display")}} cho at-rule {{cssxref("@font-face")}}
- Module [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts)
