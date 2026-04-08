---
title: forced-colors
slug: Web/CSS/Reference/At-rules/@media/forced-colors
page-type: css-media-feature
browser-compat: css.at-rules.media.forced-colors
sidebar: cssref
---

Tính năng media **`forced-colors`** trong [CSS](/en-US/docs/Web/CSS) được dùng để phát hiện xem {{Glossary("user agent")}} có bật chế độ màu cưỡng bức (forced colors mode), trong đó bảng màu hạn chế do người dùng chọn được áp dụng bắt buộc lên trang hay không. Ví dụ về chế độ màu cưỡng bức là chế độ High Contrast trên Windows.

## Cú pháp

Tính năng media `forced-colors` cho biết trình duyệt hiện có đang ở chế độ màu cưỡng bức hay không.

### Giá trị

- `none`
  - : Chế độ màu cưỡng bức không hoạt động; màu sắc của trang không bị ép vào bảng màu hạn chế.
- `active`
  - : Cho biết chế độ màu cưỡng bức đang hoạt động. Trình duyệt cung cấp bảng màu cho tác giả thông qua các từ khóa [màu hệ thống CSS](/en-US/docs/Web/CSS/Reference/Values/system-color) và, nếu thích hợp, kích hoạt giá trị tương ứng của [`prefers-color-scheme`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme) để tác giả có thể điều chỉnh trang. Trình duyệt chọn giá trị cho `prefers-color-scheme` dựa trên độ sáng của màu hệ thống `Canvas` (xem [đặc tả color adjust](https://drafts.csswg.org/css-color-adjust-1/#forced) để biết thêm chi tiết).

## Ghi chú sử dụng

### Các thuộc tính bị ảnh hưởng bởi chế độ màu cưỡng bức

Trong chế độ màu cưỡng bức, giá trị của các thuộc tính sau được xử lý như thể không có giá trị cấp tác giả nào được chỉ định. Tức là, giá trị do trình duyệt chỉ định được sử dụng thay thế. Các giá trị do trình duyệt chỉ định không ảnh hưởng đến cascade kiểu; thay vào đó, giá trị được trình duyệt cưỡng bức áp dụng lúc vẽ.

Các giá trị do trình duyệt chỉ định này được chọn từ tập hợp màu hệ thống — điều này đảm bảo độ tương phản nhất quán cho các phần tử giao diện phổ biến đối với người dùng đã bật màu cưỡng bức.

- {{cssxref("color")}}
- {{cssxref("background-color")}}
- {{cssxref("text-decoration-color")}}
- {{cssxref("text-emphasis-color")}}
- {{cssxref("border-color")}}
- {{cssxref("outline-color")}}
- {{cssxref("column-rule-color")}}
- {{cssxref("-webkit-tap-highlight-color")}}
- [SVG fill attribute](/en-US/docs/Web/SVG/Reference/Attribute/fill)
- [SVG stroke attribute](/en-US/docs/Web/SVG/Reference/Attribute/stroke)

Ngoài ra, các thuộc tính sau có hành vi đặc biệt trong chế độ màu cưỡng bức:

- {{cssxref("box-shadow")}} bị cưỡng bức thành 'none'
- {{cssxref("text-shadow")}} bị cưỡng bức thành 'none'
- {{cssxref("background-image")}} bị cưỡng bức thành 'none' đối với các giá trị không dựa trên url
- {{cssxref("color-scheme")}} bị cưỡng bức thành 'light dark'
- {{cssxref("scrollbar-color")}} bị cưỡng bức thành 'auto'

Các màu hệ thống được cưỡng bức cho các thuộc tính trên phụ thuộc vào ngữ cảnh của phần tử. Ví dụ, thuộc tính {{cssxref("color")}} trên phần tử button sẽ bị cưỡng bức thành `ButtonText`. Trên văn bản thông thường, nó sẽ bị cưỡng bức thành `CanvasText`. Xem [danh sách màu hệ thống](/en-US/docs/Web/CSS/Reference/Values/system-color) để biết thêm chi tiết về khi nào mỗi màu phù hợp trong các ngữ cảnh giao diện khác nhau.

> [!NOTE]
> Các tác nhân người dùng chọn màu hệ thống dựa trên ngữ nghĩa phần tử gốc, _không_ dựa trên các vai trò ARIA được thêm vào.
> Ví dụ, thêm `role="button"` vào một `div` sẽ **không** làm cho màu của phần tử bị cưỡng bức thành `ButtonText`

Ngoài các điều chỉnh này, trình duyệt sẽ giúp đảm bảo khả năng đọc văn bản bằng cách vẽ "backplate" phía sau văn bản. Điều này đặc biệt quan trọng để duy trì độ tương phản khi văn bản được đặt lên trên hình ảnh.

Có một số trường hợp mà tác nhân người dùng không cưỡng bức giá trị cho các thuộc tính trên:

Khi {{cssxref("forced-color-adjust")}} được đặt thành `none` trên một phần tử, không có giá trị màu cưỡng bức nào sẽ được áp dụng, và kiểu tác giả sẽ được áp dụng bình thường. Ngoài ra, backplate cho văn bản sẽ bị tắt.

Khi {{cssxref("forced-color-adjust")}} được đặt thành `preserve-parent-color` trên một phần tử, và giá trị {{cssxref("color")}} trên phần tử không kế thừa từ phần tử cha, phần tử sẽ hoạt động giống như khi đặt `preserve-parent-color` thành `none`.

Khi một [màu hệ thống](/en-US/docs/Web/CSS/Reference/Values/system-color) được chỉ định, nó sẽ được sử dụng thay vì giá trị lẽ ra đã bị cưỡng bức.

Bạn cũng có thể sử dụng màu hệ thống với bất kỳ thuộc tính _nào khác_ ngoài những thuộc tính được liệt kê ở trên, để đảm bảo phần còn lại của trang tích hợp với bảng màu hạn chế có sẵn trong chế độ màu cưỡng bức.

### Vấn đề khả năng tiếp cận

Nói chung, các tác giả web **không** nên sử dụng tính năng media `forced-colors` để tạo thiết kế riêng cho người dùng có tính năng này được bật. Thay vào đó, mục đích sử dụng của nó là để thực hiện các điều chỉnh nhỏ nhằm cải thiện khả năng sử dụng hoặc khả năng đọc khi việc áp dụng màu cưỡng bức mặc định không hoạt động tốt cho một phần nhất định của trang.

Độ tương phản cao do bảng màu thu gọn và backplate văn bản của chế độ màu cưỡng bức cung cấp thường là điều cần thiết để một số người dùng có thể đọc hoặc sử dụng một trang web nhất định, vì vậy các điều chỉnh ảnh hưởng đến nội dung cần được chọn cẩn thận và nhắm mục tiêu đến nội dung không thể đọc được theo cách khác.

### Tùy chọn người dùng

Tính năng media này chỉ hoạt động nếu người dùng đã bật tùy chọn bảng màu trong hệ điều hành của họ. Một ví dụ về tính năng như vậy là chế độ High Contrast trên Windows.

## Ví dụ

> [!NOTE]
> Ví dụ dưới đây chỉ hoạt động khi sử dụng trình duyệt hỗ trợ tính năng media này, và với một tùy chọn như chế độ High Contrast được bật trong hệ điều hành của bạn.

Ví dụ này là một nút thường lấy độ tương phản thông qua {{cssxref("box-shadow")}}. Trong chế độ màu cưỡng bức, box-shadow bị cưỡng bức thành none, vì vậy ví dụ sử dụng tính năng media forced-colors để đảm bảo có đường viền màu phù hợp (ButtonText trong trường hợp này).

### HTML

```html
<button class="button">Press me!</button>
```

### CSS

```css
.button {
  border: 0;
  padding: 10px;
  box-shadow:
    -2px -2px 5px gray,
    2px 2px 5px gray;
}

@media (forced-colors: active) {
  .button {
    /* Use a border instead, since box-shadow is forced to 'none' in forced-colors mode */
    border: 2px ButtonText solid;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
- [Styling for Windows high contrast with standards for forced colors.](https://blogs.windows.com/msedgedev/2020/09/17/styling-for-windows-high-contrast-with-new-standards-for-forced-colors/)
- {{cssxref("forced-color-adjust")}}
