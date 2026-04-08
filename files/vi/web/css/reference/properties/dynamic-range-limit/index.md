---
title: dynamic-range-limit
slug: Web/CSS/Reference/Properties/dynamic-range-limit
page-type: css-property
browser-compat: css.properties.dynamic-range-limit
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`dynamic-range-limit`** chỉ định độ sáng tối đa được phép cho nội dung High Dynamic Range (HDR).

## Cú pháp

```css
/* Giá trị từ khóa */
dynamic-range-limit: standard;
dynamic-range-limit: no-limit;
dynamic-range-limit: constrained;

/* hàm dynamic-range-limit-mix() */
dynamic-range-limit: dynamic-range-limit-mix(standard 70%, no-limit 30%);

/* Giá trị toàn cục */
dynamic-range-limit: inherit;
dynamic-range-limit: initial;
dynamic-range-limit: revert;
dynamic-range-limit: revert-layer;
dynamic-range-limit: unset;
```

### Giá trị

Thuộc tính `dynamic-range-limit` được chỉ định là một trong các giá trị từ khóa sau hoặc lời gọi hàm {{cssxref("dynamic-range-limit-mix()")}}.

Các giá trị từ khóa sau có thể được chỉ định:

- `standard`
  - : Chỉ định độ sáng tối đa là **trắng tham chiếu HDR**, là màu CSS `white`.
- `no-limit`
  - : Chỉ định độ sáng tối đa lớn hơn nhiều so với trắng tham chiếu HDR. Mức chính xác không được chỉ định.
- `constrained`
  - : Chỉ định độ sáng tối đa hơi lớn hơn trắng tham chiếu HDR, sao cho có thể xem thoải mái khi kết hợp nội dung Standard Dynamic Range (SDR) và HDR. Mức chính xác không được chỉ định.

Hàm {{cssxref("dynamic-range-limit-mix()")}} chỉ định độ sáng tối đa là giá trị tùy chỉnh là sự kết hợp của các giá trị từ khóa khác nhau theo tỷ lệ phần trăm được cung cấp. Nó nhận hai hoặc nhiều cặp, mỗi cặp bao gồm một từ khóa `dynamic-range-limit` (hoặc hàm `dynamic-range-limit-mix()` lồng nhau) và một phần trăm.

## Mô tả

Dải động là sự chênh lệch về độ sáng giữa phần sáng nhất và tối nhất của nội dung. Dải động được đo bằng stops nhiếp ảnh, trong đó tăng một stop tương đương với gấp đôi độ sáng.

### SDR, HDR, và headroom

Nội dung web truyền thống sử dụng **Standard Dynamic Range (SDR)**, trong đó màu sáng nhất tương đương với màu CSS `white` (`#ffffff` theo hệ thập lục phân). Độ sáng trong nội dung **High Dynamic Range (HDR)** ngược lại có thể vượt quá mức trắng tiêu chuẩn. Trong thuật ngữ HDR, CSS `white` tiêu chuẩn còn được gọi là trắng tham chiếu HDR.

Độ sáng đỉnh mà nội dung có thể được hiển thị phụ thuộc vào nội dung, phần cứng màn hình khả dụng, và tùy chọn người dùng. Mức mà độ sáng đỉnh của trắng có thể vượt quá trắng tham chiếu HDR được gọi là **HDR headroom** và thường được biểu thị bằng stops nhiếp ảnh.

Nội dung SDR luôn có HDR headroom là `0` vì trắng sáng nhất của nó _là_ trắng tham chiếu HDR. Các màn hình cũ hơn cũng có thể có HDR headroom là `0` vì chúng không thể hiển thị màu sáng hơn. Các màn hình mới hơn có thể có HDR headroom lớn hơn `0`, cho phép hiển thị các màu sáng hơn có trong nội dung HDR.

### Trường hợp sử dụng cho `dynamic-range-limit`

Độ sáng của nội dung HDR có thể gây khó chịu cho người xem. Điều này đặc biệt rõ ràng trong các ứng dụng khi hiển thị hỗn hợp nội dung HDR và SDR, dẫn đến sự không nhất quán về độ sáng.

Thuộc tính `dynamic-range-limit` cho phép bạn kiểm soát độ sáng của nội dung HDR. Ví dụ: bạn có thể muốn hạn chế độ sáng tối đa của tất cả hình thu nhỏ trong thư viện ảnh hoặc video về trắng tham chiếu HDR (đây là những gì giá trị từ khóa `standard` thực hiện) hoặc về độ sáng chỉ hơi lớn hơn trắng tham chiếu HDR (sử dụng giá trị từ khóa `constrained` hoặc giới hạn tùy chỉnh được tạo bằng {{cssxref("dynamic-range-limit-mix()")}}). Khi người dùng xem một ảnh HDR đơn lẻ, hoặc nếu người dùng chọn tùy chọn để bật, bạn có thể đặt `dynamic-range-limit` của ảnh đó thành `no-limit`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng `dynamic-range-limit` cơ bản

Trong [bản demo thuộc tính dynamic-range-limit](https://github.com/mdn/dom-examples/tree/main/dynamic-range-limit) của chúng tôi, chúng tôi bao gồm một ảnh HDR có thể di chuột và lấy tiêu điểm để chuyển đổi giá trị `dynamic-range-limit`. [Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/dynamic-range-limit/) trên màn hình có khả năng hiển thị màu HDR, và thử nghiệm. Mã được giải thích bên dưới.

#### HTML

Trong markup, chúng ta nhúng một ảnh HDR bằng phần tử {{htmlelement("img")}}. Chúng ta bao gồm giá trị [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) là `0` để ảnh có thể được lấy tiêu điểm qua bàn phím.

```html
<img
  src="gioia-pixel-ultrahdr.jpg"
  alt="A subway station, with white strip lights lighting the platform and ad posters in the background"
  tabindex="0" />
```

#### CSS

Chúng ta đặt cho phần tử `<img>` một số kiểu cơ bản, sau đó đặt thuộc tính `dynamic-range-limit` về `standard`, có nghĩa là nó sẽ không được hiển thị sáng hơn trắng tham chiếu HDR. Chúng ta cũng đặt thuộc tính {{cssxref("transition")}} để giá trị `dynamic-range-limit` của phần tử `<img>` sẽ chuyển đổi trong `0.6` giây khi trạng thái của nó thay đổi.

```css
img {
  width: 50%;
  border: 1px solid black;
  dynamic-range-limit: standard;
  transition: dynamic-range-limit 0.6s;
}
```

Khi di chuột hoặc lấy tiêu điểm, chúng ta thay đổi giá trị `dynamic-range-limit` của phần tử `<img>` thành `no-limit` để nó sẽ hiển thị sáng nhất có thể mà trình duyệt và cài đặt màn hình cho phép.

```css
img:hover,
img:focus {
  dynamic-range-limit: no-limit;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

Tính năng media [`dynamic-range`](/en-US/docs/Web/CSS/Reference/At-rules/@media/dynamic-range) và [`video-dynamic-range`](/en-US/docs/Web/CSS/Reference/At-rules/@media/video-dynamic-range)
