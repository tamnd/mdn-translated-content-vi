---
title: <system-color>
slug: Web/CSS/Reference/Values/system-color
page-type: css-type
browser-compat: css.types.color.system-color
sidebar: cssref
---

Kiểu dữ liệu **`<system-color>`** trong [CSS](/vi/docs/Web/CSS) thường phản ánh các lựa chọn màu sắc mặc định được sử dụng cho các phần khác nhau của trang web.

Tuy nhiên, các tác nhân người dùng có thể cung cấp tính năng trợ năng gọi là _chế độ màu buộc_, trong đó màu sắc bị giới hạn trong bảng màu do người dùng và tác nhân người dùng định nghĩa, ghi đè lựa chọn màu sắc của tác giả trong một số thuộc tính nhất định. Trong chế độ màu buộc, `<system-color>` hiển thị các màu đã chọn để phần còn lại của trang có thể tích hợp với chúng. Một ví dụ về chế độ màu buộc là [chế độ tương phản cao trên Windows](https://blogs.windows.com/msedgedev/2020/09/17/styling-for-windows-high-contrast-with-new-standards-for-forced-colors/).

Trong chế độ màu buộc, các tác giả nên sử dụng màu từ kiểu `<system-color>` cho tất cả các thuộc tính _không_ thuộc tập hợp các thuộc tính có màu bị ghi đè. Điều này đảm bảo trang nhất quán sử dụng cùng bảng màu trên tất cả các thuộc tính.

Tác giả có thể phát hiện chế độ màu buộc bằng tính năng media [`forced-colors`](/vi/docs/Web/CSS/Reference/At-rules/@media/forced-colors).

Giá trị `<system-color>` có thể được sử dụng ở bất kỳ nơi nào có thể dùng {{cssxref("&lt;color&gt;")}}.

## Cú pháp

Lưu ý rằng các từ khóa này _không phân biệt chữ hoa chữ thường_, nhưng được liệt kê ở đây với chữ hoa/thường hỗn hợp để dễ đọc.

Tùy thuộc vào cài đặt của bạn, màu mẫu hiển thị trong bảng có thể thay đổi. Bạn cũng có thể xem trang này với các trình duyệt, hệ điều hành và cài đặt hệ thống khác nhau để kiểm tra sự khác biệt.

<table>
  <thead>
    <tr>
      <th>Từ khóa</th>
      <th>Mô tả</th>
      <th>Mẫu</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>AccentColor</code></td>
      <td>Nền của các điều khiển giao diện người dùng được nhấn mạnh.</td>
      <td style="background-color: AccentColor;"></td>
    </tr>
    <tr>
      <td><code>AccentColorText</code></td>
      <td>Văn bản của các điều khiển giao diện người dùng được nhấn mạnh.</td>
      <td style="background-color: AccentColorText;"></td>
    </tr>
    <tr>
      <td><code>ActiveText</code></td>
      <td>Văn bản của các liên kết đang hoạt động.</td>
      <td style="background-color: ActiveText;"></td>
    </tr>
    <tr>
      <td><code>ButtonBorder</code></td>
      <td>Màu viền cơ sở của các điều khiển.</td>
      <td style="background-color: ButtonBorder;"></td>
    </tr>
    <tr>
      <td><code>ButtonFace</code></td>
      <td>Màu nền của các điều khiển.</td>
      <td style="background-color: ButtonFace;"></td>
    </tr>
    <tr>
      <td><code>ButtonText</code></td>
      <td>Màu văn bản của các điều khiển.</td>
      <td style="background-color: ButtonText;"></td>
    </tr>
    <tr>
      <td><code>Canvas</code></td>
      <td>Nền của nội dung ứng dụng hoặc tài liệu.</td>
      <td style="background-color: Canvas;"></td>
    </tr>
    <tr>
      <td><code>CanvasText</code></td>
      <td>Màu văn bản trong nội dung ứng dụng hoặc tài liệu.</td>
      <td style="background-color: CanvasText;"></td>
    </tr>
    <tr>
      <td><code>Field</code></td>
      <td>Nền của các trường nhập liệu.</td>
      <td style="background-color: Field;"></td>
    </tr>
    <tr>
      <td><code>FieldText</code></td>
      <td>Văn bản trong các trường nhập liệu.</td>
      <td style="background-color: FieldText;"></td>
    </tr>
    <tr>
      <td><code>GrayText</code></td>
      <td>Màu văn bản cho các mục bị vô hiệu hóa (ví dụ: điều khiển bị vô hiệu hóa).</td>
      <td style="background-color: GrayText;"></td>
    </tr>
    <tr>
      <td><code>Highlight</code></td>
      <td>Nền của các mục được chọn.</td>
      <td style="background-color: Highlight;"></td>
    </tr>
    <tr>
      <td><code>HighlightText</code></td>
      <td>Màu văn bản của các mục được chọn.</td>
      <td style="background-color: HighlightText;"></td>
    </tr>
    <tr>
      <td><code>LinkText</code></td>
      <td>Văn bản của các liên kết không hoạt động, chưa được truy cập.</td>
      <td style="background-color: LinkText;"></td>
    </tr>
    <tr>
      <td><code>Mark</code></td>
      <td>Nền của văn bản được đánh dấu đặc biệt (chẳng hạn bằng phần tử HTML <code>mark</code>).</td>
      <td style="background-color: Mark;"></td>
    </tr>
    <tr>
      <td><code>MarkText</code></td>
      <td>Văn bản được đánh dấu đặc biệt (chẳng hạn bằng phần tử HTML <code>mark</code>).</td>
      <td style="background-color: MarkText;"></td>
    </tr>
    <tr>
      <td><code>SelectedItem</code></td>
      <td>Nền của các mục được chọn, ví dụ: hộp kiểm được chọn.</td>
      <td style="background-color: SelectedItem;"></td>
    </tr>
    <tr>
      <td><code>SelectedItemText</code></td>
      <td>Văn bản của các mục được chọn.</td>
      <td style="background-color: SelectedItemText;"></td>
    </tr>
    <tr>
      <td><code>VisitedText</code></td>
      <td>Văn bản của các liên kết đã được truy cập.</td>
      <td style="background-color: VisitedText;"></td>
    </tr>
  </tbody>
</table>

### Các từ khóa màu hệ thống đã lỗi thời

Các từ khóa sau đây đã được định nghĩa trong các phiên bản trước của CSS Color Module. Hiện nay chúng đã lỗi thời và không được dùng trên các trang web công cộng.

<table>
  <thead>
    <tr>
      <th>Từ khóa</th>
      <th>Mô tả</th>
      <th>Thay thế</th>
      <th>Mẫu</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>ActiveBorder</code></td>
      <td>Viền cửa sổ đang hoạt động</td>
      <td><code>ButtonBorder</code></td>
      <td style="background-color: ActiveBorder;"></td>
    </tr>
    <tr>
      <td><code>ActiveCaption</code></td>
      <td>Thanh tiêu đề cửa sổ đang hoạt động. Nên dùng với <code>CaptionText</code> làm màu nền trước.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: ActiveCaption;"></td>
    </tr>
    <tr>
      <td><code>AppWorkspace</code></td>
      <td>Màu nền của giao diện đa tài liệu.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: AppWorkspace;"></td>
    </tr>
    <tr>
      <td><code>Background</code></td>
      <td>Nền màn hình.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: Background;"></td>
    </tr>
    <tr>
      <td><code>ButtonHighlight</code></td>
      <td>Màu của viền hướng về nguồn sáng cho các phần tử 3-D trông có vẻ 3-D nhờ lớp viền bao quanh đó.</td>
      <td><code>ButtonFace</code></td>
      <td style="background-color: ButtonHighlight;"></td>
    </tr>
    <tr>
      <td><code>ButtonShadow</code></td>
      <td>Màu của viền tránh xa nguồn sáng cho các phần tử 3-D trông có vẻ 3-D nhờ lớp viền bao quanh đó.</td>
      <td><code>ButtonFace</code></td>
      <td style="background-color: ButtonShadow;"></td>
    </tr>
    <tr>
      <td><code>CaptionText</code></td>
      <td>Văn bản trong thanh tiêu đề, hộp kích thước và hộp mũi tên thanh cuộn. Nên dùng với màu nền <code>ActiveCaption</code>.</td>
      <td><code>CanvasText</code></td>
      <td style="background-color: CaptionText;"></td>
    </tr>
    <tr>
      <td><code>InactiveBorder</code></td>
      <td>Viền cửa sổ không hoạt động.</td>
      <td><code>ButtonBorder</code></td>
      <td style="background-color: InactiveBorder;"></td>
    </tr>
    <tr>
      <td><code>InactiveCaption</code></td>
      <td>Thanh tiêu đề cửa sổ không hoạt động. Nên dùng với màu nền trước <code>InactiveCaptionText</code>.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: InactiveCaption;"></td>
    </tr>
    <tr>
      <td><code>InactiveCaptionText</code></td>
      <td>Màu văn bản trong thanh tiêu đề không hoạt động. Nên dùng với màu nền <code>InactiveCaption</code>.</td>
      <td><code>GrayText</code></td>
      <td style="background-color: InactiveCaptionText;"></td>
    </tr>
    <tr>
      <td><code>InfoBackground</code></td>
      <td>Màu nền cho điều khiển tooltip. Nên dùng với màu nền trước <code>InfoText</code>.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: InfoBackground;"></td>
    </tr>
    <tr>
      <td><code>InfoText</code></td>
      <td>Màu văn bản cho điều khiển tooltip. Nên dùng với màu nền <code>InfoBackground</code>.</td>
      <td><code>CanvasText</code></td>
      <td style="background-color: InfoText;"></td>
    </tr>
    <tr>
      <td><code>Menu</code></td>
      <td>Nền menu. Nên dùng với màu nền trước <code>MenuText</code> hoặc <code>-moz-MenuBarText</code>.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: Menu;"></td>
    </tr>
    <tr>
      <td><code>MenuText</code></td>
      <td>Văn bản trong menu. Nên dùng với màu nền <code>Menu</code>.</td>
      <td><code>CanvasText</code></td>
      <td style="background-color: MenuText;"></td>
    </tr>
    <tr>
      <td><code>Scrollbar</code></td>
      <td>Màu nền của thanh cuộn.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: Scrollbar;"></td>
    </tr>
    <tr>
      <td><code>ThreeDDarkShadow</code></td>
      <td>Màu tối hơn (thường là ngoài cùng) trong hai viền tránh xa nguồn sáng cho các phần tử 3-D có vẻ 3-D nhờ hai lớp viền bao quanh đồng tâm.</td>
      <td><code>ButtonBorder</code></td>
      <td style="background-color: ThreeDDarkShadow;"></td>
    </tr>
    <tr>
      <td><code>ThreeDFace</code></td>
      <td>Màu nền mặt cho các phần tử 3-D có vẻ 3-D nhờ hai lớp viền bao quanh đồng tâm. Nên dùng với màu nền trước <code>ButtonText</code>.</td>
      <td><code>ButtonFace</code></td>
      <td style="background-color: ThreeDFace;"></td>
    </tr>
    <tr>
      <td><code>ThreeDHighlight</code></td>
      <td>Màu sáng hơn (thường là ngoài cùng) trong hai viền hướng về nguồn sáng cho các phần tử 3-D có vẻ 3-D nhờ hai lớp viền bao quanh đồng tâm.</td>
      <td><code>ButtonBorder</code></td>
      <td style="background-color: ThreeDHighlight;"></td>
    </tr>
    <tr>
      <td><code>ThreeDLightShadow</code></td>
      <td>Màu tối hơn (thường là trong cùng) trong hai viền hướng về nguồn sáng cho các phần tử 3-D có vẻ 3-D nhờ hai lớp viền bao quanh đồng tâm.</td>
      <td><code>ButtonBorder</code></td>
      <td style="background-color: ThreeDLightShadow;"></td>
    </tr>
    <tr>
      <td><code>ThreeDShadow</code></td>
      <td>Màu sáng hơn (thường là trong cùng) trong hai viền tránh xa nguồn sáng cho các phần tử 3-D có vẻ 3-D nhờ hai lớp viền bao quanh đồng tâm.</td>
      <td><code>ButtonBorder</code></td>
      <td style="background-color: ThreeDShadow;"></td>
    </tr>
    <tr>
      <td><code>Window</code></td>
      <td>Nền cửa sổ. Nên dùng với màu nền trước <code>WindowText</code>.</td>
      <td><code>Canvas</code></td>
      <td style="background-color: Window;"></td>
    </tr>
    <tr>
      <td><code>WindowFrame</code></td>
      <td>Khung cửa sổ.</td>
      <td><code>ButtonBorder</code></td>
      <td style="background-color: WindowFrame;"></td>
    </tr>
    <tr>
      <td><code>WindowText</code></td>
      <td>Văn bản trong cửa sổ. Nên dùng với màu nền <code>Window</code>.</td>
      <td><code>CanvasText</code></td>
      <td style="background-color: WindowText;"></td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Sử dụng màu hệ thống

Trong ví dụ này, chúng ta có một nút thông thường lấy độ tương phản bằng cách sử dụng thuộc tính {{cssxref("box-shadow")}}. Trong chế độ màu buộc, `box-shadow` bị buộc thành `none`, vì vậy ví dụ sử dụng tính năng media `forced-colors` để đảm bảo có viền với màu phù hợp (trong trường hợp này là `ButtonBorder`).

#### HTML

```html
<button class="button">Press me!</button>
```

#### CSS

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
    /* Use a border instead, since box-shadow
    is forced to 'none' in forced-colors mode */
    border: 2px ButtonBorder solid;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Using system colors")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;color&gt;")}}: kiểu dữ liệu mà các từ khóa này thuộc về
