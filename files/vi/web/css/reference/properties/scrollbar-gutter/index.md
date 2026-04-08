---
title: scrollbar-gutter
slug: Web/CSS/Reference/Properties/scrollbar-gutter
page-type: css-property
browser-compat: css.properties.scrollbar-gutter
sidebar: cssref
---

Thuộc tính **`scrollbar-gutter`** [CSS](/en-US/docs/Web/CSS) cho phép tác giả dành không gian cho thanh cuộn, ngăn các thay đổi bố cục không mong muốn khi nội dung phát triển, đồng thời tránh các hiển thị không cần thiết khi không cần cuộn.

_Scrollbar gutter_ của một phần tử là không gian giữa cạnh viền trong và cạnh padding ngoài, nơi trình duyệt có thể hiển thị thanh cuộn. Nếu không có thanh cuộn nào hiện diện, gutter sẽ được vẽ như một phần mở rộng của padding.

Trình duyệt xác định xem thanh cuộn _classic_ hay _overlay_ được sử dụng:

- Thanh cuộn Classic luôn được đặt trong gutter, chiếm không gian khi hiện diện.
- Thanh cuộn Overlay được đặt trên nội dung, không nằm trong gutter, và thường có độ trong suốt một phần.

## Cú pháp

```css
/* Giá trị khởi tạo */
scrollbar-gutter: auto;

/* Từ khóa "stable", với bộ điều chỉnh tùy chọn */
scrollbar-gutter: stable;
scrollbar-gutter: stable both-edges;

/* Giá trị toàn cục */
scrollbar-gutter: inherit;
scrollbar-gutter: initial;
scrollbar-gutter: revert;
scrollbar-gutter: revert-layer;
scrollbar-gutter: unset;
```

### Giá trị

- `auto`
  - : Giá trị khởi tạo. Thanh cuộn Classic tạo gutter khi `overflow` là `scroll`, hoặc khi `overflow` là `auto` và hộp đang tràn. Thanh cuộn Overlay không chiếm không gian.
- `stable`
  - : Khi sử dụng thanh cuộn classic, gutter sẽ hiện diện nếu `overflow` là `auto`, `scroll`, hoặc `hidden` ngay cả khi hộp không tràn. Khi sử dụng thanh cuộn overlay, gutter sẽ không hiện diện.
- `both-edges`
  - : Nếu một gutter sẽ hiện diện trên một trong các cạnh inline start/end của hộp, thì một gutter khác cũng sẽ hiện diện ở cạnh đối diện.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Các ví dụ bên dưới cho thấy cách các giá trị khác nhau của thuộc tính `scrollbar-gutter` ảnh hưởng đến phần tử `div` có thể cuộn (`.container`) với một hoặc nhiều đoạn văn bên trong.

> [!NOTE]
> Trong hình ảnh cho các ví dụ, cài đặt hệ thống của người dùng được đặt thành thanh cuộn classic (luôn hiển thị).

### Ví dụ 1

Ngăn các thay đổi bố cục không cần thiết khi nội dung tăng hoặc giảm khiến thanh cuộn xuất hiện/biến mất, một khoảng trống được dành cho nó.

```css
.container {
  scrollbar-gutter: stable;
}
```

![Phần tử div chứa với đoạn văn bản bên trong và khoảng trống bên phải nơi thanh cuộn sẽ xuất hiện](stable-no-scroll.png)

### Ví dụ 2

Thêm khoảng cách đối xứng cho cả hai bên của hộp để nội dung được căn giữa:

```css
.container {
  scrollbar-gutter: stable both-edges;
}
```

![Phần tử div chứa với đoạn văn bản bên trong, khoảng trống bên phải nơi thanh cuộn sẽ xuất hiện và khoảng trống trống tương ứng ở bên trái](stable-both-edges.png)

### Ví dụ 3

Căn chỉnh nội dung của phần tử không cuộn và phần tử cuộn bên cạnh nó:
Ví dụ này hiển thị hai div cạnh nhau. Phần tử bên trái không có cuộn, nhưng phần tử bên phải có. Cả hai đều có `scrollbar-gutter` được áp dụng, cũng dành không gian cho div bên trái không có nội dung có thể cuộn. Đây là một kỹ thuật tốt để giữ chiều rộng nội dung nhất quán.

```css
.container1 {
  overflow: hidden;
  scrollbar-gutter: stable;
}

.container2 {
  scrollbar-gutter: stable;
}
```

![Hai div liền kề chứa văn bản, cả hai đều có không gian cho thanh cuộn](side-by-side.png)

### Thanh cuộn Overlay

Để tham khảo, hình ảnh này hiển thị cùng div ở trên, nhưng với cài đặt hệ thống của người dùng được đặt thành thanh cuộn overlay. Lưu ý ở đây thanh cuộn chỉ hiển thị khi người dùng đang cuộn và trên nội dung, vì vậy không có không gian nào được dành cho nó và thuộc tính `scrollbar-gutter` không có hiệu lực.

![Một div với văn bản, không có thanh cuộn hiển thị](for-ref-no-scroll.png)

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS scrollbars styling](/en-US/docs/Web/CSS/Guides/Scrollbars_styling)
- {{CSSxRef("overflow")}}
- {{CSSxRef("scrollbar-width")}}
- {{CSSxRef("scrollbar-color")}}
