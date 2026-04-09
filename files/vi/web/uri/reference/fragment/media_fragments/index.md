---
title: Media fragments
slug: Web/URI/Reference/Fragment/Media_fragments
page-type: uri-component
spec-urls: https://www.w3.org/TR/media-frags/
sidebar: urlsidebar
---

**Media fragments** có thể được gắn vào các URL tệp phương tiện, chẳng hạn [video](/en-US/docs/Web/HTML/Reference/Elements/video) và [SVG](/en-US/docs/Web/SVG), để cho biết rằng bạn muốn hiển thị một phần con của phương tiện: một khoảng thời gian nhất định hoặc một kích thước nhất định.

## Khái niệm và cách dùng

Khi hiển thị nhiều đoạn phương tiện, sẽ tiện và hiệu quả hơn nếu đưa toàn bộ phương tiện vào một tệp duy nhất, rồi chỉ hiển thị phần nội dung cần thiết trong từng trường hợp.

Media fragments cho phép bạn làm điều này thông qua các fragment của URL. Đặc tả định nghĩa hai loại khác nhau:

- **Temporal dimension fragments** cho phép bạn phát một phần của video hoặc hoạt ảnh từ một thời điểm bắt đầu cụ thể đến một thời điểm kết thúc cụ thể, sau đó phương tiện sẽ tạm dừng.
- **Spatial dimension fragments** cho phép bạn hiển thị một vùng hình chữ nhật cụ thể của phương tiện bằng cách chỉ định kích thước của khung hiển thị và tọa độ của góc trên bên trái của khung đó.

## Cú pháp fragment theo thời gian

```url
https://example.com/video.mp4#t=[npt:][timeStart][,timeEnd]
```

Các phần chính của cú pháp là:

- `t=`
  - : Phần mở đầu của cú pháp chiều thời gian. Phần này luôn phải được bao gồm sau ký hiệu dấu thăng.
- `npt:` {{optional_inline}}
  - : Tên định danh của định dạng cú pháp được dùng. `npt` là viết tắt của **normal play time**, và là định dạng mặc định đồng thời cũng là định dạng duy nhất được hỗ trợ, vì vậy phần này có thể bỏ qua.
- `timeStart` {{optional_inline}}
  - : Thời lượng bắt đầu của phần phương tiện.
- `timeEnd` {{optional_inline}}
  - : Thời lượng kết thúc của phần phương tiện.

Các giá trị `timeStart` và `timeEnd` có thể được chỉ định theo các định dạng sau, và có thể trộn lẫn trong cùng một fragment:

- `seconds`
  - : Một số biểu thị giá trị tính bằng giây. Đây là một số từ `0` trở lên, có thể bao gồm phần thập phân để biểu thị phần nhỏ hơn một giây.
- `hh:mm:ss`
  - : Các giá trị giờ, phút và giây, được ngăn cách bằng dấu hai chấm. Giá trị giờ là một số nguyên từ `0` trở lên. Giá trị phút là một số nguyên từ `0` đến `59`. Giá trị giây là một số từ `0` đến `59`, có thể bao gồm phần thập phân để biểu thị phần nhỏ hơn một giây.
- `mm:ss`
  - : Các giá trị phút và giây, được ngăn cách bằng dấu hai chấm. Giá trị phút là một số nguyên từ `0` đến `59`. Giá trị giây là một số từ `0` đến `59`, có thể bao gồm phần thập phân để biểu thị phần nhỏ hơn một giây.

Vì vậy, chẳng hạn, các fragment sau đều sẽ phát phương tiện từ đầu đến giây thứ 5:

```plain
#t=0,5
#t=,5
#t=0:00:00,5
#t=00:00,0:00:05
```

Hai fragment sau đều sẽ phát phương tiện từ giây thứ 2 cho đến hết:

```plain
#t=2
#t=0:00:02
```

Các fragment sau sẽ phát phương tiện từ giây thứ 2 cho đến giây thứ 3.5:

```plain
#t=2,3.5
#t=0:00:02,3.5
#t=0:00:02,00:03.5
```

## Cú pháp fragment theo không gian

```url
https://example.com/test.svg#xywh=[unit:]xCoord,yCoord,width,height
```

Các phần chính của cú pháp là:

- `xywh=`
  - : Phần mở đầu của cú pháp chiều không gian. Phần này luôn phải được bao gồm sau ký hiệu dấu thăng.
- `unit:` {{optional_inline}}
  - : Đơn vị dùng để chỉ định cho `xCoord`, `yCoord`, `width` và `height`. Mặc định là `pixel:` nếu bỏ qua. Các giá trị có thể là:
    - `pixel:`
      - : Các giá trị biểu thị một số pixel tuyệt đối.
    - `percent:`
      - : Các giá trị biểu thị phần trăm của chiều rộng hoặc chiều cao vốn có của phương tiện.
- `xCoord`
  - : Khoảng cách ngang của góc trên bên trái của khung hiển thị so với góc trên bên trái của phương tiện.
- `yCoord`
  - : Khoảng cách dọc của góc trên bên trái của khung hiển thị so với góc trên bên trái của phương tiện.
- `width`
  - : Chiều rộng của khung hiển thị.
- `height`
  - : Chiều cao của khung hiển thị.

Vì vậy, chẳng hạn, các fragment sau đều sẽ hiển thị một khung pixel `320x240` với góc trên bên trái cách mép trái `160px` và cách mép trên `120px` của phương tiện gốc:

```plain
xywh=160,120,320,240
xywh=pixel:160,120,320,240
```

Fragment sau sẽ hiển thị một khung `50%x50%` với góc trên bên trái cách mép trái `25%` và cách mép trên `25%` của phương tiện gốc:

```plain
xywh=percent:25,25,50,50
```

## Ví dụ

### Phát các đoạn trích có thời lượng giới hạn từ tệp âm thanh và video

#### HTML

Đoạn HTML sau nhúng một video và một đoạn âm thanh vào trang, đồng thời bao gồm các temporal fragments trên các URL phương tiện để giới hạn lượng nội dung được phát:

```html live-sample___limited-time
<video controls width="250">
  <source src="/shared-assets/videos/flower.mp4#t=2,4" type="video/mp4" />
</video>

<hr />

<audio controls src="/shared-assets/audio/t-rex-roar.mp3#t=,00:01"></audio>
```

#### Kết quả

Kết quả hiển thị như sau:

{{embedlivesample("limited-time", "100%", 220)}}

Hãy thử phát video và âm thanh bằng các trình phát được cung cấp để xem temporal fragments ảnh hưởng đến việc phát như thế nào. Video gốc dài 5 giây, nhưng chỉ phát đoạn từ giây thứ 2 đến giây thứ 4. Âm thanh gốc dài 2 giây, nhưng chỉ phát giây đầu tiên.

### Hiển thị một phần của ảnh SVG

#### HTML

Trong ví dụ này, chúng ta nhúng một ảnh SVG vào trang bằng phần tử {{htmlelement("img")}}, đồng thời cũng dùng cùng ảnh đó làm nền CSS trên phần tử {{htmlelement("div")}}.

Trên nguồn của phần tử `<img>`, chúng ta bao gồm một spatial fragment, `#xywh=100,100,400,400`, fragment này hiển thị một phần ảnh kích thước 400x400 pixel với góc trên bên trái tại tọa độ `(100,100)` tính từ góc trên bên trái của ảnh gốc. Chúng ta đặt `width` và `height` thành `200`, điều này khiến phần ảnh cắt ra được hiển thị với kích thước 200x200 pixel.

```html live-sample___limited-dimension
<img
  src="/shared-assets/images/examples/firefox-logo.svg#xywh=100,100,400,400"
  width="200"
  height="200" />

<hr />

<div class="bgtest"></div>
```

#### CSS

Chúng ta đặt thuộc tính CSS {{cssxref("background-image")}} trên phần tử `<div>` trỏ đến cùng ảnh SVG đó. Lần này, spatial fragment là `#xywh=100,100,100,100`, làm cho phần ảnh có kích thước 100x100 pixel với góc trên bên trái tại tọa độ `(100,100)` tính từ góc trên bên trái của ảnh gốc. Chúng ta đặt thuộc tính {{cssxref("background-size")}} thành `50px 50px`, vì vậy phần đó được lát gạch trên nền của `<div>` với kích thước 50x50 pixel.

```css live-sample___limited-dimension
.bgtest {
  width: 100%;
  height: 200px;
  background-image: url("/shared-assets/images/examples/firefox-logo.svg#xywh=100,100,100,100");
  background-size: 50px 50px;
}
```

#### Kết quả

Đoạn mã trên hiển thị như sau:

{{embedlivesample("limited-dimension", "100%", 440)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Hỗ trợ cho media fragments bị giới hạn trong các ngữ cảnh sau:

- Temporal fragments hoạt động trên URL tệp video và âm thanh, chẳng hạn như được dùng trong các phần tử `<audio>` và `<video>`, trong tất cả các trình duyệt hiện đại.
- Temporal fragments cũng hoạt động trên [tệp ảnh SVG](/en-US/docs/Web/SVG/Guides/SVG_as_an_image) có [hoạt ảnh SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL) trong [Firefox 147](/en-US/docs/Mozilla/Firefox/Releases/147) và các phiên bản mới hơn.
- Spatial fragments hoạt động trên tệp ảnh SVG trong Firefox 147 trở lên. Giá trị pixel hoạt động như mong đợi, nhưng giá trị phần trăm dường như hoạt động không ổn định và chúng tôi khuyên bạn nên tránh dùng chúng.
