---
title: image()
slug: Web/CSS/Reference/Values/image/image
page-type: css-function
spec-urls: https://drafts.csswg.org/css-images-4/#funcdef-image
sidebar: cssref
---

Hàm **`image()`** của [CSS](/vi/docs/Web/CSS) định nghĩa một {{cssxref("image")}} theo cách tương tự như hàm {{CSSxRef("url_function", "url()")}}, nhưng với chức năng bổ sung bao gồm chỉ định hướng của hình ảnh, chỉ hiển thị một phần của hình ảnh đó được xác định bởi một đoạn media, và chỉ định màu đồng nhất làm fallback trong trường hợp không thể hiển thị hình ảnh được chỉ định nào.

> [!NOTE]
> Hàm CSS `image()` không nên nhầm lẫn với {{DOMxRef("HTMLImageElement/Image", '<code>Image()</code>, the <code>HTMLImageElement</code> constructor', '', 1)}}.

## Cú pháp

```css-nolint
/* Cách dùng cơ bản */
image("image1.jpg");
image(url("image2.jpg"));

/* Hình ảnh nhạy cảm với hướng (Bidi) */
image(ltr "image1.jpg");
image(rtl "image1.jpg");

/* Fallback hình ảnh */
image("image1.jpg", black);

/* Đoạn hình ảnh */
image("image1.jpg#xywh=40,0,20,20");

/* Hình ảnh màu đồng nhất */
image(rgb(0 0 255 / 0.5)), url("bg-image.png");
```

### Giá trị

- `image-tags` {{optional_inline}}
  - : Hướng của hình ảnh, là `ltr` cho trái-sang-phải hoặc `rtl` cho phải-sang-trái.
- `image-src` {{Optional_Inline}}
  - : Không hoặc nhiều {{cssxref("url_value", "&lt;url&gt;")}} hoặc {{CSSxRef("&lt;string&gt;")}} chỉ định các nguồn hình ảnh, với các định danh đoạn hình ảnh tùy chọn.
- `color` {{optional_inline}}
  - : Một màu, chỉ định màu nền đồng nhất để sử dụng làm fallback nếu không tìm thấy, hỗ trợ hoặc khai báo `image-src` nào.

### Nhận biết hai chiều

Tham số đầu tiên, tùy chọn của ký hiệu `image()` là hướng của hình ảnh. Nếu được bao gồm, và hình ảnh được sử dụng trên một phần tử có hướng ngược lại, hình ảnh sẽ bị lật ngang trong các chế độ viết ngang. Nếu hướng bị bỏ qua, hình ảnh sẽ không bị lật nếu hướng ngôn ngữ thay đổi.

### Đoạn hình ảnh

Một sự khác biệt quan trọng giữa `url()` và `image()` là khả năng thêm định danh đoạn media — điểm bắt đầu dọc theo trục x và y, cùng với chiều rộng và chiều cao — vào nguồn hình ảnh để chỉ hiển thị một phần của hình ảnh nguồn. Phần hình ảnh được xác định trong tham số trở thành một hình ảnh độc lập. Cú pháp trông như sau:

```css
background-image: image("my-image.webp#xywh=0,20,40,60");
```

Hình ảnh nền của phần tử sẽ là phần của hình ảnh _myImage.webp_ bắt đầu tại tọa độ 0px, 20px (góc trên bên trái) và rộng 40px, cao 60px.

Cú pháp đoạn media `#xywh=#,#,#,#` nhận bốn giá trị số được phân tách bằng dấu phẩy. Hai giá trị đầu tiên đại diện cho tọa độ X và Y của điểm bắt đầu của hộp sẽ được tạo. Giá trị thứ ba là chiều rộng của hộp, và giá trị cuối cùng là chiều cao. Theo mặc định, đây là các giá trị pixel. [Định nghĩa chiều không gian trong đặc tả media](https://www.w3.org/TR/media-frags/#naming-space) cho thấy rằng tỷ lệ phần trăm cũng sẽ được hỗ trợ:

```plain
xywh=160,120,320,240        /* kết quả là hình ảnh 320x240 tại x=160 và y=120 */
xywh=pixel:160,120,320,240  /* kết quả là hình ảnh 320x240 tại x=160 và y=120 */
xywh=percent:25,25,50,50    /* kết quả là hình ảnh 50%x50% tại x=25% và y=25% */
```

Các đoạn hình ảnh có thể được sử dụng trong ký hiệu `url()` cũng vậy. Cú pháp đoạn media `#xywh=#,#,#,#` 'tương thích ngược' trong đó đoạn media sẽ bị bỏ qua nếu không được hiểu, và sẽ không phá vỡ lời gọi nguồn khi được sử dụng với `url()`. Nếu trình duyệt không hiểu ký hiệu đoạn media, nó bỏ qua đoạn đó, hiển thị toàn bộ hình ảnh.

Các trình duyệt hiểu `image()` cũng hiểu ký hiệu đoạn. Do đó, nếu đoạn không được hiểu trong `image()`, hình ảnh sẽ được coi là không hợp lệ.

### Fallback màu

Nếu màu được chỉ định trong `image()` cùng với các nguồn hình ảnh, nó hoạt động như fallback nếu các hình ảnh không hợp lệ và không xuất hiện. Trong những trường hợp như vậy, hàm `image()` hiển thị như thể không có hình ảnh nào được bao gồm, tạo ra một hình ảnh màu đồng nhất. Một trường hợp sử dụng, hãy xem xét một hình ảnh tối được sử dụng làm nền cho một số văn bản trắng. Màu nền tối có thể cần thiết để văn bản tiền cảnh có thể đọc được, nếu hình ảnh không hiển thị.

Bỏ qua các nguồn hình ảnh trong khi bao gồm màu là hợp lệ và tạo ra một mảng màu. Không giống như việc khai báo {{CSSxRef("background-color")}}, được đặt dưới hoặc phía sau tất cả các hình ảnh nền, điều này có thể được sử dụng để đặt (thường là bán trong suốt) màu lên trên các hình ảnh khác.

Kích thước của mảng màu có thể được đặt bằng thuộc tính {{CSSxRef("background-size")}}. Điều này khác với `background-color`, đặt màu để bao phủ toàn bộ phần tử. Cả vị trí `image(color)` và `background-color` đều bị ảnh hưởng bởi các thuộc tính {{CSSxRef("background-clip")}} và {{CSSxRef("background-origin")}}.

## Cú pháp chính thức

{{CSSSyntax}}

## Khả năng tiếp cận

Các trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về hình ảnh nền cho công nghệ hỗ trợ. Điều này quan trọng chủ yếu đối với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của nó và do đó không truyền đạt bất cứ điều gì cho người dùng. Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả nó theo cách ngữ nghĩa trong tài liệu.

- [MDN Understanding WCAG, Guideline 1.1 explanations](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Understanding Success Criterion 1.1.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

Tính năng này có thể giúp cải thiện khả năng tiếp cận bằng cách cung cấp màu fallback khi hình ảnh không tải được. Mặc dù điều này có thể và nên được thực hiện bằng cách bao gồm background-color trên mọi hình ảnh nền, hàm CSS `image()` cho phép chỉ bao gồm màu nền khi hình ảnh không tải được, có nghĩa là bạn có thể thêm màu fallback khi một PNG/GIF/WebP trong suốt không tải được.

## Ví dụ

### Hình ảnh nhạy cảm với hướng

```html
<ul>
  <li dir="ltr">Dấu chấm là mũi tên hướng phải bên trái</li>
  <li dir="rtl">Dấu chấm là cùng mũi tên đó, lật để chỉ sang trái.</li>
</ul>
```

```css
ul {
  list-style-image: image(ltr "rightarrow.png");
}
```

Trong các mục danh sách từ trái sang phải — những mục có `dir="ltr"` được đặt trên chính phần tử hoặc kế thừa hướng từ tổ tiên hoặc giá trị mặc định cho trang — hình ảnh sẽ được sử dụng nguyên trạng. Các mục danh sách có `dir="rtl"` được đặt trên `<li>` hoặc kế thừa hướng phải-sang-trái từ tổ tiên, chẳng hạn như tài liệu được đặt thành tiếng Ả Rập hoặc tiếng Do Thái, sẽ có dấu chấm hiển thị ở bên phải, bị lật ngang, như thể `transform: scaleX(-1)` đã được đặt. Văn bản cũng sẽ được hiển thị từ trái sang phải.

{{EmbedLiveSample("Directionally-sensitive_images", "100%", 200)}}

### Hiển thị một phần của hình ảnh nền

```html
<div class="box">Hover vào đây. Bạn thấy con trỏ nào?</div>
```

```css
.box:hover {
  cursor: image("sprite.png#xywh=32,64,16,16");
}
```

Khi người dùng hover vào hộp, con trỏ sẽ thay đổi để hiển thị phần 16x16 px của hình ảnh sprite, bắt đầu tại x=32 và y=64.

{{EmbedLiveSample("Displaying_a_section_of_the_background_image", "100%", 100)}}

### Đặt màu lên trên hình ảnh nền

```css hidden
.quarter-logo {
  height: 200px;
  width: 200px;
  border: 1px solid;
}
```

```css
.quarter-logo {
  background-image: image(rgb(0 0 0 / 25%)), url("firefox.png");
  background-size: 25%;
  background-repeat: no-repeat;
}
```

```html
<div class="quarter-logo">
  Nếu được hỗ trợ, một phần tư của div này có logo được làm tối
</div>
```

Đoạn trên sẽ đặt một mặt nạ đen bán trong suốt lên trên hình ảnh nền logo Firefox. Nếu chúng ta đã sử dụng thuộc tính {{cssxref("background-color")}} thay thế, màu sẽ xuất hiện phía sau hình ảnh logo thay vì ở trên đó. Ngoài ra, toàn bộ container sẽ có cùng màu nền. Vì chúng ta đã sử dụng `image()` cùng với thuộc tính {{CSSxRef("background-size")}} (và ngăn hình ảnh lặp lại với thuộc tính {{CSSxRef("background-repeat")}}), mảng màu sẽ chỉ bao phủ một phần tư container.

{{EmbedLiveSample("Putting_color_on_top_of_a_background_image", "100%", 220)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- {{cssxref("image")}}
- {{cssxref("element()")}}
- {{cssxref("url_value", "&lt;url&gt;")}}
- {{CSSxRef("clip-path")}}
- {{cssxref("gradient")}}
- {{CSSxRef("image/image-set", "image-set()")}}
- {{cssxref("cross-fade()")}}
- Module [hình ảnh CSS](/vi/docs/Web/CSS/Guides/Images)
