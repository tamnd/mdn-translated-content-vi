---
title: "@keyframes"
slug: Web/CSS/Reference/At-rules/@keyframes
page-type: css-at-rule
browser-compat: css.at-rules.keyframes
sidebar: cssref
---

At-rule **`@keyframes`** [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) kiểm soát các bước trung gian trong một chuỗi hoạt ảnh CSS bằng cách xác định các kiểu dáng cho keyframe (hay điểm mốc) dọc theo chuỗi hoạt ảnh. Điều này cung cấp khả năng kiểm soát nhiều hơn đối với các bước trung gian của chuỗi hoạt ảnh so với [transitions](/en-US/docs/Web/CSS/Guides/Transitions).

## Cú pháp

```css
@keyframes slide-in {
  from {
    transform: translateX(0%);
  }

  to {
    transform: translateX(100%);
  }
}
```

### Các giá trị

- {{cssxref("custom-ident")}}
  - : Tên xác định danh sách keyframe. Tên này phải khớp với kết quả định danh trong cú pháp CSS.
- `from`
  - : Điểm bắt đầu là `0%`.
- `to`
  - : Điểm kết thúc là `100%`.
- {{cssxref("&lt;percentage&gt;")}}
  - : Phần trăm thời gian trong chuỗi hoạt ảnh mà keyframe được chỉ định sẽ xảy ra.
- `<timeline-range-name>` {{cssxref("&lt;percentage&gt;")}}
  - : Phần trăm thời gian trong {{cssxref("animation-range")}} được chỉ định mà keyframe được chỉ định sẽ xảy ra. Xem [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) để biết thêm thông tin về các loại hoạt ảnh sử dụng phạm vi timeline được đặt tên.

## Mô tả

Để sử dụng keyframe, hãy tạo một quy tắc `@keyframes` với tên sau đó được sử dụng bởi thuộc tính {{ cssxref("animation-name") }} để khớp một hoạt ảnh với khai báo keyframe của nó. Mỗi quy tắc `@keyframes` chứa một danh sách kiểu dáng gồm các [bộ chọn keyframe](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors), chỉ định tỷ lệ phần trăm dọc theo hoạt ảnh khi keyframe xảy ra, và một khối chứa các kiểu dáng cho keyframe đó.

Bạn có thể liệt kê các tỷ lệ phần trăm keyframe theo bất kỳ thứ tự nào; chúng sẽ được xử lý theo thứ tự chúng sẽ xảy ra.

JavaScript có thể truy cập at-rule `@keyframes` thông qua giao diện mô hình đối tượng CSS {{domxref("CSSKeyframesRule")}}.

### Danh sách keyframe hợp lệ

Nếu một quy tắc keyframe không chỉ định trạng thái bắt đầu hoặc kết thúc của hoạt ảnh (nghĩa là `0%`/`from` và `100%`/`to`), trình duyệt sẽ sử dụng các kiểu dáng hiện có của phần tử cho trạng thái bắt đầu/kết thúc. Điều này có thể được dùng để tạo hoạt ảnh cho một phần tử từ trạng thái ban đầu của nó và trở lại.

Các thuộc tính không thể tạo hoạt ảnh trong quy tắc keyframe bị bỏ qua, nhưng các thuộc tính được hỗ trợ vẫn sẽ được tạo hoạt ảnh.

### Giải quyết trùng lặp

Nếu có nhiều bộ keyframe tồn tại cho một tên đã cho, bộ cuối cùng được phân tích cú pháp gặp sẽ được sử dụng. Các quy tắc `@keyframes` không cascade, vì vậy các hoạt ảnh không bao giờ lấy keyframe từ nhiều hơn một bộ quy tắc.

Nếu một offset thời gian hoạt ảnh nhất định bị trùng lặp, tất cả keyframe trong quy tắc `@keyframes` cho tỷ lệ phần trăm đó sẽ được sử dụng cho khung đó. Có cascade trong quy tắc `@keyframes` nếu nhiều keyframe chỉ định cùng giá trị tỷ lệ phần trăm.

### Khi thuộc tính bị bỏ qua trong một số keyframe

Các thuộc tính không được chỉ định trong mọi keyframe sẽ được nội suy nếu có thể — các thuộc tính không thể nội suy sẽ bị loại khỏi hoạt ảnh. Ví dụ:

```css
@keyframes identifier {
  0% {
    top: 0;
    left: 0;
  }
  30% {
    top: 50px;
  }
  68%,
  72% {
    left: 50px;
  }
  100% {
    top: 100px;
    left: 100%;
  }
}
```

Ở đây, thuộc tính {{ cssxref("top") }} tạo hoạt ảnh sử dụng các keyframe `0%`, `30%`, và `100%`, và {{ cssxref("left") }} tạo hoạt ảnh sử dụng các keyframe `0%`, `68%`, `72%` và `100%`.

### Khi một keyframe được định nghĩa nhiều lần

Nếu một keyframe được định nghĩa nhiều lần nhưng không phải tất cả các thuộc tính bị ảnh hưởng đều có trong mỗi keyframe, tất cả các giá trị được chỉ định trong các keyframe này đều được xem xét. Ví dụ:

```css
@keyframes identifier {
  0% {
    top: 0;
  }
  50% {
    top: 30px;
    left: 20px;
  }
  50% {
    top: 10px;
  }
  100% {
    top: 0;
  }
}
```

Trong ví dụ này, tại keyframe `50%`, các giá trị được sử dụng là `top: 10px` và `left: 20px`.

Keyframe cascade được hỗ trợ bắt đầu từ Firefox 14.

### `!important` trong keyframe

Các khai báo trong keyframe được đánh dấu bằng `!important` bị bỏ qua.

```css
@keyframes important1 {
  0% {
    margin-top: 50px;
  }
  50% {
    margin-top: 150px !important; /* bị bỏ qua */
  }
  100% {
    margin-top: 100px;
  }
}

@keyframes important2 {
  from {
    margin-top: 50px;
    margin-bottom: 100px;
  }
  to {
    margin-top: 150px !important; /* bị bỏ qua */
    margin-bottom: 50px;
  }
}
```

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ về hoạt ảnh CSS

Xem [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) và [scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines) để xem các ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-name")}}
- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
- [CSS scroll-driven animation timelines](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- [Understanding timeline range names](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
- Module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- [Animate elements on scroll with Scroll-driven animations](https://developer.chrome.com/docs/css-ui/scroll-driven-animations)
- {{domxref("AnimationEvent")}}
