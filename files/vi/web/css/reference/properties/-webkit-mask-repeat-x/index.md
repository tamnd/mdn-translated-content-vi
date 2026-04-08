---
title: -webkit-mask-repeat-x
slug: Web/CSS/Reference/Properties/-webkit-mask-repeat-x
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-webkit-mask-repeat-x
sidebar: cssref
---

{{Non-standard_header}}

Thuộc tính `-webkit-mask-repeat-x` chỉ định liệu hình ảnh mặt nạ có được lặp lại (lát gạch) theo chiều ngang hay không và lặp lại như thế nào.

## Cú pháp

```css
/* Giá trị từ khóa */
-webkit-mask-repeat-x: repeat;
-webkit-mask-repeat-x: no-repeat;
-webkit-mask-repeat-x: space;
-webkit-mask-repeat-x: round;

/* Nhiều giá trị */
-webkit-mask-repeat-x: repeat, no-repeat, space;

/* Giá trị toàn cục */
-webkit-mask-repeat-x: inherit;
-webkit-mask-repeat-x: initial;
-webkit-mask-repeat-x: revert;
-webkit-mask-repeat-x: revert-layer;
-webkit-mask-repeat-x: unset;
```

### Giá trị

- repeat
  - : Hình ảnh mặt nạ được lặp lại theo cả chiều ngang và chiều dọc.
- no-repeat
  - : Hình ảnh mặt nạ không được lặp lại; chỉ có một bản sao của hình ảnh mặt nạ được vẽ. Phần còn lại nội dung của phần tử được che khuất sẽ không hiển thị.
- space
  - : Hình ảnh được lặp lại nhiều nhất có thể mà không bị cắt xén. Hình ảnh đầu tiên và cuối cùng được ghim vào hai cạnh của phần tử, và khoảng trắng được phân phối đều giữa các hình ảnh. Thuộc tính {{cssxref("mask-position")}} bị bỏ qua trừ khi chỉ có một hình ảnh có thể hiển thị mà không bị cắt. Trường hợp duy nhất xảy ra cắt xén khi dùng `space` là khi không có đủ chỗ để hiển thị một hình ảnh.
- round
  - : Khi không gian cho phép tăng lên, các hình ảnh lặp lại sẽ kéo giãn (không để khoảng trống) cho đến khi có chỗ để thêm một hình ảnh khác. Khi hình ảnh tiếp theo được thêm vào, tất cả hình ảnh hiện tại nén lại để nhường chỗ. Ví dụ: Một hình ảnh có chiều rộng gốc 260px, lặp lại ba lần, có thể kéo giãn cho đến khi mỗi lần lặp rộng 300px, rồi một hình ảnh khác sẽ được thêm vào. Sau đó chúng nén xuống còn 225px.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-mask-repeat-x = [ repeat | no-repeat | space | round ]#`)}}

## Ví dụ

### Dùng hình ảnh mặt nạ lặp lại hoặc không lặp lại

```css
.example-one {
  -webkit-mask-image: url("mask.png");
  -webkit-mask-repeat-x: repeat;
}

.example-two {
  -webkit-mask-image: url("mask.png");
  -webkit-mask-repeat-x: no-repeat;
}
```

### Dùng nhiều hình ảnh mặt nạ

Bạn có thể chỉ định một `<repeat-style>` khác nhau cho mỗi hình ảnh mặt nạ, phân cách bằng dấu phẩy:

```css
.example-three {
  -webkit-mask-image: url("mask1.png"), url("mask2.png");
  -webkit-mask-repeat-x: repeat, space;
}
```

Mỗi hình ảnh được ghép với kiểu lặp tương ứng, từ hình ảnh đầu tiên đến hình ảnh cuối cùng.

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

{{cssxref("mask-repeat", "-webkit-mask-repeat")}}, {{cssxref("-webkit-mask-repeat-y")}}
