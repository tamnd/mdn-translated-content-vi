---
title: will-change
slug: Web/CSS/Reference/Properties/will-change
page-type: css-property
browser-compat: css.properties.will-change
sidebar: cssref
---

Thuộc tính **`will-change`** của [CSS](/vi/docs/Web/CSS) gợi ý cho trình duyệt về cách một phần tử dự kiến sẽ thay đổi. Trình duyệt có thể thiết lập các tối ưu hóa trước khi phần tử thực sự thay đổi. Các loại tối ưu hóa này có thể tăng khả năng phản hồi của trang bằng cách thực hiện công việc tiềm năng tốn kém trước khi thực sự cần.

> [!WARNING]
> `will-change` được thiết kế để dùng như phương án cuối cùng, nhằm giải quyết các vấn đề hiệu suất hiện có. Không nên dùng nó để dự đoán trước các vấn đề hiệu suất.

Cách dùng thuộc tính này đúng cách có thể khá phức tạp:

- _Đừng áp dụng will-change cho quá nhiều phần tử._ Trình duyệt đã cố gắng hết sức để tối ưu hóa mọi thứ. Một số tối ưu hóa mạnh hơn có khả năng được gắn với `will-change` tiêu tốn nhiều tài nguyên của máy, và khi dùng quá mức có thể khiến trang chạy chậm hoặc tiêu thụ nhiều tài nguyên.
- _Dùng tiết kiệm._ Hành vi thông thường của tối ưu hóa mà trình duyệt thực hiện là xóa các tối ưu hóa ngay khi có thể và trở lại trạng thái bình thường. Nhưng việc thêm `will-change` trực tiếp trong stylesheet ngụ ý rằng các phần tử mục tiêu luôn sắp thay đổi và trình duyệt sẽ giữ các tối ưu hóa lâu hơn nhiều so với bình thường. Vì vậy, thực hành tốt là bật và tắt `will-change` bằng code script trước và sau khi thay đổi xảy ra.
- _Đừng áp dụng will-change cho các phần tử để tối ưu hóa sớm_. Nếu trang của bạn đang hoạt động tốt, đừng thêm thuộc tính `will-change` vào các phần tử chỉ để khai thác thêm một chút tốc độ. `will-change` được thiết kế để dùng như một phương án cuối cùng, nhằm giải quyết các vấn đề hiệu suất hiện có. Không nên dùng nó để dự đoán trước các vấn đề hiệu suất. Việc dùng quá nhiều `will-change` sẽ dẫn đến sử dụng bộ nhớ quá mức và gây ra quá trình kết xuất phức tạp hơn khi trình duyệt cố gắng chuẩn bị cho sự thay đổi có thể xảy ra. Điều này sẽ dẫn đến hiệu suất tệ hơn.
- _Dành đủ thời gian để hoạt động_. Thuộc tính này được thiết kế như một phương pháp để tác giả cho tác nhân người dùng biết trước về các thuộc tính có khả năng thay đổi. Sau đó trình duyệt có thể chọn áp dụng các tối ưu hóa cần thiết trước khi thay đổi thuộc tính thực sự xảy ra. Vì vậy, điều quan trọng là dành cho trình duyệt một khoảng thời gian để thực sự thực hiện các tối ưu hóa. Tìm cách dự đoán trước ít nhất một chút rằng điều gì đó sẽ thay đổi, và đặt `will-change` khi đó.
- _Lưu ý rằng will-change thực sự có thể ảnh hưởng đến giao diện hình ảnh của các phần tử_, khi được dùng với các giá trị thuộc tính tạo ra [ngữ cảnh xếp chồng](/vi/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) (ví dụ: will-change: opacity), vì ngữ cảnh xếp chồng được tạo ra trước.

## Cú pháp

```css
/* Giá trị từ khóa */
will-change: auto;
will-change: scroll-position;
will-change: contents;
will-change: transform; /* Ví dụ về <custom-ident> */
will-change: opacity; /* Ví dụ về <custom-ident> */
will-change: left, top; /* Ví dụ về hai <animatable-feature> */

/* Giá trị toàn cục */
will-change: inherit;
will-change: initial;
will-change: revert;
will-change: revert-layer;
will-change: unset;
```

### Giá trị

- `auto`
  - : Từ khóa này không thể hiện ý định cụ thể nào; tác nhân người dùng nên áp dụng bất kỳ heuristic và tối ưu hóa nào mà nó thường làm.

`<animatable-feature>` có thể là một trong các giá trị sau:

- `scroll-position`
  - : Cho biết tác giả dự kiến hoạt ảnh hoặc thay đổi vị trí cuộn của phần tử trong tương lai gần.
- `contents`
  - : Cho biết tác giả dự kiến hoạt ảnh hoặc thay đổi nội dung của phần tử trong tương lai gần.
- {{cssxref("custom-ident", "&lt;custom-ident&gt;")}}
  - : Cho biết tác giả dự kiến hoạt ảnh hoặc thay đổi thuộc tính có tên đã cho trên phần tử trong tương lai gần. Nếu thuộc tính được cho là viết tắt, nó cho biết kỳ vọng cho tất cả các thuộc tính viết dài mà viết tắt mở rộng ra. Nó không thể là một trong các giá trị sau: `unset`, `initial`, `inherit`, `will-change`, `auto`, `scroll-position`, hoặc `contents`. Đặc tả không định nghĩa hành vi của giá trị cụ thể, nhưng thông thường `transform` là gợi ý lớp ghép. [Chrome hiện tại thực hiện hai hành động](https://github.com/operasoftware/devopera/pull/330), với các định danh thuộc tính CSS cụ thể: thiết lập lớp ghép mới hoặc {{Glossary("stacking context")}} mới.

### Qua stylesheet

Có thể phù hợp khi bao gồm `will-change` trong stylesheet của bạn cho ứng dụng thực hiện lật trang khi nhấn phím như album hoặc bài thuyết trình slide mà các trang rất lớn và phức tạp. Điều này sẽ cho phép trình duyệt chuẩn bị chuyển đổi trước thời hạn và cho phép chuyển đổi nhanh nhạy giữa các trang ngay khi nhấn phím. Nhưng hãy thận trọng khi dùng thuộc tính `will-change` trực tiếp trong stylesheet. Nó có thể khiến trình duyệt giữ tối ưu hóa trong bộ nhớ lâu hơn nhiều so với cần thiết.

```css
.slide {
  will-change: transform;
}
```

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Qua script

Đây là ví dụ về cách áp dụng thuộc tính `will-change` qua scripting, đây có thể là điều bạn nên làm trong hầu hết các trường hợp.

```js
const el = document.getElementById("element");

// Đặt will-change khi di chuột qua phần tử
el.addEventListener("mouseenter", hintBrowser);
el.addEventListener("animationEnd", removeHint);

function hintBrowser() {
  // Các thuộc tính có thể tối ưu hóa sẽ thay đổi
  // trong khối keyframes của hoạt ảnh
  this.style.willChange = "transform, opacity";
}

function removeHint() {
  this.style.willChange = "auto";
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform")}}
- Các thuộc tính transform riêng lẻ:
  - {{cssxref("translate")}}
  - {{cssxref("scale")}}
  - {{cssxref("rotate")}}
  - Lưu ý: không có thuộc tính `skew` riêng lẻ
