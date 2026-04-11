---
title: Page Visibility API
slug: Web/API/Page_Visibility_API
page-type: web-api-overview
browser-compat: api.Document.visibilityState
---

{{DefaultAPISidebar("Page Visibility API")}}

Page Visibility API cung cấp các sự kiện mà bạn có thể theo dõi để biết khi nào một tài liệu trở nên hiển thị hoặc bị ẩn, đồng thời cung cấp các tính năng để xem trạng thái hiển thị hiện tại của trang.

API này đặc biệt hữu ích để tiết kiệm tài nguyên và cải thiện hiệu năng bằng cách giúp trang tránh thực hiện các tác vụ không cần thiết khi tài liệu không hiển thị.

## Khái niệm và cách dùng

Khi người dùng thu nhỏ cửa sổ, chuyển sang tab khác, hoặc tài liệu bị một cửa sổ khác che khuất hoàn toàn, API sẽ gửi sự kiện {{domxref("document.visibilitychange_event", "visibilitychange")}} để cho các listener biết trạng thái của trang đã thay đổi. Bạn có thể phát hiện sự kiện này và thực hiện một số hành động hoặc ứng xử khác đi. Ví dụ, nếu ứng dụng web của bạn đang phát video, nó có thể tạm dừng video khi người dùng đưa tab xuống nền, và tiếp tục phát lại khi người dùng quay lại tab. Người dùng không mất vị trí đang xem trong video, âm thanh của video không làm phiền tab đang ở nền trước mới, và người dùng cũng không bỏ lỡ bất kỳ phần nào của video trong khoảng thời gian đó.

Trạng thái hiển thị của một {{HTMLElement("iframe")}} giống với tài liệu cha. Việc ẩn một `<iframe>` bằng các thuộc tính CSS, như {{cssxref("display", "display: none;")}}, không kích hoạt sự kiện hiển thị và cũng không làm thay đổi trạng thái của tài liệu bên trong khung.

### Trường hợp sử dụng

Hãy xem xét một vài trường hợp sử dụng cho Page Visibility API.

- Một trang có băng chuyền ảnh không nên chuyển sang slide tiếp theo trừ khi người dùng đang xem trang
- Một ứng dụng hiển thị bảng điều khiển thông tin không muốn thăm dò máy chủ để cập nhật khi trang không hiển thị
- Một trang muốn tắt âm thanh khi thiết bị ở chế độ chờ (người dùng nhấn nút nguồn để tắt màn hình)

Trước đây, các nhà phát triển thường dùng những cơ chế thay thế không hoàn hảo để phát hiện điều này. Ví dụ, theo dõi các sự kiện {{domxref("Window/blur_event", "blur")}} và {{domxref("Window/focus_event", "focus")}} trên cửa sổ giúp bạn biết khi nào trang của mình không phải là trang đang hoạt động, nhưng nó không cho biết trang thực sự đã bị ẩn khỏi người dùng hay chưa. Page Visibility API giải quyết vấn đề này.

> [!NOTE]
> Mặc dù {{domxref("Window.blur_event", "onblur")}} và {{domxref("Window.focus_event", "onfocus")}} sẽ cho bạn biết nếu người dùng chuyển cửa sổ, điều đó không nhất thiết có nghĩa là trang bị ẩn. Trang chỉ trở thành hidden khi người dùng chuyển tab hoặc thu nhỏ cửa sổ trình duyệt chứa tab đó.

### Các chính sách đang áp dụng để hỗ trợ hiệu năng của trang nền

Tách biệt với Page Visibility API, các user agent thường có một số chính sách để giảm tác động hiệu năng của các tab nền hoặc tab bị ẩn. Các chính sách này có thể bao gồm:

- Hầu hết trình duyệt ngừng gửi các callback {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} tới các tab nền hoặc các {{ HTMLElement("iframe") }} bị ẩn để cải thiện hiệu năng và thời lượng pin.
- Các bộ hẹn giờ như {{domxref("Window.setTimeout", "setTimeout()")}} bị điều tiết trong các tab nền/không hoạt động để giúp cải thiện hiệu năng. Xem [Reasons for longer delays than specified](/en-US/docs/Web/API/Window/setTimeout#reasons_for_longer_delays_than_specified) để biết thêm chi tiết.
- Trình duyệt triển khai cơ chế điều tiết timeout nền dựa trên ngân sách. Cơ chế này hoạt động tương tự trên các trình duyệt hiện đại, với chi tiết như sau:
  - Trong Firefox, mỗi cửa sổ ở tab nền có ngân sách thời gian riêng tính bằng mili giây - giá trị tối đa và tối thiểu lần lượt là +50 ms và -150 ms. Chrome tương tự, ngoại trừ việc ngân sách được tính bằng giây.
  - Cửa sổ sẽ chịu điều tiết sau 30 giây, với các quy tắc trễ điều tiết giống như quy tắc được chỉ định cho timer của cửa sổ (xem [Reasons for longer delays than specified](/en-US/docs/Web/API/Window/setTimeout#reasons_for_longer_delays_than_specified)). Trong Chrome, giá trị này là 10 giây.
  - Các tác vụ timer chỉ được phép khi ngân sách không âm.
  - Khi mã của một timer chạy xong, khoảng thời gian mà nó đã thực thi sẽ bị trừ khỏi ngân sách timeout của cửa sổ.
  - Ngân sách được tái tạo với tốc độ 10 ms mỗi giây, cả trong Firefox lẫn Chrome.

Một số tiến trình được miễn khỏi hành vi điều tiết này. Trong những trường hợp đó, bạn có thể dùng Page Visibility API để giảm tác động hiệu năng của các tab khi chúng bị ẩn.

- Các tab đang phát âm thanh được xem là foreground và không bị điều tiết.
- Các tab chạy mã đang dùng kết nối mạng thời gian thực ([WebSockets](/en-US/docs/Web/API/WebSockets_API) và [WebRTC](/en-US/docs/Web/API/WebRTC_API)) sẽ không bị điều tiết để tránh việc các kết nối này bị timeout và đóng ngoài ý muốn.
- Các tiến trình [IndexedDB](/en-US/docs/Web/API/IndexedDB_API) cũng không bị điều tiết để tránh timeout.

## Mở rộng cho các giao diện khác

### Thuộc tính thể hiện

Page Visibility API thêm các thuộc tính sau vào giao diện {{domxref("Document")}}:

- {{domxref("Document.hidden")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu trang ở trạng thái được xem là bị ẩn đối với người dùng, và `false` trong trường hợp ngược lại.
- {{domxref("Document.visibilityState")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết trạng thái hiển thị hiện tại của tài liệu. Các giá trị có thể là:
    - `visible`
      - : Nội dung trang có thể hiển thị ít nhất một phần. Trên thực tế, điều này có nghĩa là trang là tab ở nền trước của một cửa sổ không bị thu nhỏ.
    - `hidden`
      - : Nội dung của trang không hiển thị với người dùng, do tab của tài liệu nằm ở nền sau hoặc nằm trong một cửa sổ bị thu nhỏ, hoặc vì màn hình của thiết bị đã tắt.

### Sự kiện

Page Visibility API thêm sự kiện sau vào giao diện {{domxref("Document")}}:

- {{domxref("Document.visibilitychange_event", "visibilitychange")}}
  - : Được kích hoạt khi nội dung của một tab trở nên hiển thị hoặc bị ẩn.

## Ví dụ

### Tạm dừng âm thanh khi trang bị ẩn

Ví dụ này tạm dừng âm thanh đang phát khi trang bị ẩn và tiếp tục phát khi trang trở nên hiển thị trở lại.
Phần điều khiển của phần tử `<audio>` cho phép người dùng chuyển đổi giữa trạng thái phát và tạm dừng âm thanh.
Biến boolean `playingOnHide` được dùng để ngăn âm thanh phát lại nếu trang chuyển sang trạng thái `visible`, nhưng media không đang phát khi trang bị ẩn.

```css hidden
audio {
  width: 100%;
}
```

#### HTML

```html
<audio
  controls
  src="https://mdn.github.io/webaudio-examples/audio-basics/outfoxing.mp3"></audio>
```

#### JavaScript

```js
const audio = document.querySelector("audio");

let playingOnHide = false;

document.addEventListener("visibilitychange", () => {
  if (document.hidden) {
    playingOnHide = !audio.paused;
    audio.pause();
  } else if (playingOnHide) {
    // Trang đã trở nên hiển thị! Tiếp tục phát nếu âm thanh "đang phát khi ẩn"
    audio.play();
  }
});
```

#### Kết quả

{{EmbedLiveSample("Pausing audio on page hide", "", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.visibilityState")}}
- {{domxref("Document.hidden")}}
- [Timing element visibility with the Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility)
