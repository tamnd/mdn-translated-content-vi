---
title: "BaseAudioContext: thuộc tính state"
short-title: state
slug: Web/API/BaseAudioContext/state
page-type: web-api-instance-property
browser-compat: api.BaseAudioContext.state
---

{{ APIRef("Web Audio API") }}

Thuộc tính chỉ đọc `state` của {{ domxref("BaseAudioContext") }}
trả về trạng thái hiện tại của `AudioContext`.

## Giá trị

Một chuỗi. Các giá trị có thể có là:

- `closed`
  - : Audio context đã bị đóng (bằng phương thức
    {{domxref("AudioContext.close()")}}.)
- `interrupted`
  - : Audio context đã bị gián đoạn bởi một sự kiện nằm ngoài sự kiểm soát của ứng dụng web.
- `running`
  - : Audio context đang chạy bình thường.
- `suspended`
  - : Audio context đã bị tạm dừng (bằng phương thức
    {{domxref("AudioContext.suspend()")}}.)

## Mô tả

Thuộc tính `state` của audio context được dùng để phơi bày trạng thái hoạt động hiện tại của nó. Việc này thường được thực hiện bằng cách truy vấn `state` bên trong một trình xử lý sự kiện {{domxref("BaseAudioContext.statechange_event", "statechange")}} để có thể phản ứng phù hợp với các thay đổi trạng thái.

Các giá trị `running` và `closed` khá rõ ràng: chúng cho biết audio context đang chạy bình thường, hoặc đã bị đóng (thông qua phương thức {{domxref("AudioContext.close()")}}).

Hai trạng thái `interrupted` và `suspended` đều biểu diễn trạng thái "tạm dừng" có thể tiếp tục lại sau đó, nhưng khác nhau về ý nghĩa:

- Trạng thái `suspended` cho biết audio context đã bị tạm dừng do hành động của người dùng bên trong ứng dụng web, bằng cách chạy phương thức {{domxref("AudioContext.suspend()")}} trong một trình xử lý sự kiện `click` (hoặc tương tự). Trong trường hợp này, ngữ cảnh sẽ được tiếp tục bằng cách chạy phương thức {{domxref("AudioContext.resume()")}}.
- Trạng thái `interrupted` cho biết audio context đã bị tạm dừng do một sự gián đoạn nằm ngoài sự kiểm soát của ứng dụng web. Trong trường hợp này, trình duyệt quyết định khi nào tạm dừng và tiếp tục ứng dụng. Khi đó ứng dụng web có thể xử lý trạng thái `interrupted` cho phù hợp, ví dụ tạm dừng một luồng âm thanh để tránh lãng phí tài nguyên khi ứng dụng không được sử dụng.

Các sự gián đoạn có thể kích hoạt trạng thái `interrupted` bao gồm:

- Một ứng dụng hội nghị hoặc điện thoại trên cùng hệ thống yêu cầu quyền truy cập độc quyền vào phần cứng âm thanh của thiết bị.
- Người dùng đóng laptop của họ.
- Các tính năng API được thiết kế để khởi tạo hoặc phản hồi lại các gián đoạn âm thanh.

> [!NOTE]
> Cách trạng thái `interrupted` được kích hoạt có thể khác nhau giữa các trình duyệt.

Cũng cần lưu ý khả năng chuyển đổi giữa các trạng thái `interrupted` và `suspended`:

- Nếu `suspend()` được gọi trên một audio context trong lúc có gián đoạn (`state` là `interrupted`), trạng thái sẽ chuyển sang `suspended` ngay lập tức.
- Nếu `resume()` được gọi trên một audio context đang `suspended` trong lúc có gián đoạn, trạng thái sẽ chuyển sang `interrupted` ngay lập tức.
- Nếu một sự gián đoạn xảy ra khi audio context đang ở trạng thái `suspended`, ngữ cảnh sẽ không chuyển sang `interrupted`. Sự chuyển đổi này sẽ không xảy ra trừ khi `resume()` được gọi trên ngữ cảnh (như điểm trước đã nêu). Lựa chọn này được đưa ra để tránh tiết lộ quá nhiều thông tin về thiết bị cho các trang web, ví dụ như ghi lại mọi lần laptop bị đóng có thể là một vấn đề về quyền riêng tư.

## Ví dụ

### Xử lý thay đổi trạng thái

Đoạn mã sau được lấy từ [bản demo AudioContext states](https://github.com/mdn/webaudio-examples) của chúng tôi ([xem chạy trực tiếp](https://mdn.github.io/webaudio-examples/audiocontext-states/).) Trình xử lý {{domxref("BaseAudioContext.statechange_event", "onstatechange")}} được dùng để ghi log trạng thái hiện tại ra console mỗi khi nó thay đổi.

```js
audioCtx.onstatechange = () => {
  console.log(audioCtx.state);
};
```

### Tiếp tục các trạng thái phát bị gián đoạn trong iOS Safari

Trong iOS Safari, khi người dùng rời khỏi trang (ví dụ chuyển tab, thu nhỏ trình duyệt hoặc tắt màn hình)
trạng thái của audio context sẽ chuyển sang "interrupted" và cần được tiếp tục lại. Ví dụ:

```js
function play() {
  if (audioCtx.state === "interrupted") {
    audioCtx.resume().then(() => play());
    return;
  }
  // phần còn lại của hàm play()
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
