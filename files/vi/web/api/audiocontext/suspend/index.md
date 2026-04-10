---
title: "AudioContext: phương thức suspend()"
short-title: suspend()
slug: Web/API/AudioContext/suspend
page-type: web-api-instance-method
browser-compat: api.AudioContext.suspend
---

{{ APIRef("Web Audio API") }}

Phương thức `suspend()` của giao diện {{ domxref("AudioContext") }} tạm dừng dòng thời gian trong ngữ cảnh âm thanh, tạm thời ngừng truy cập phần cứng âm thanh và giảm mức sử dụng CPU/pin trong quá trình đó. Điều này hữu ích nếu bạn muốn một ứng dụng tắt phần cứng âm thanh khi nó sẽ không dùng đến audio context trong một khoảng thời gian.

Phương thức này sẽ khiến ngoại lệ `INVALID_STATE_ERR` được ném ra nếu được gọi trên một {{domxref("OfflineAudioContext")}}.

## Cú pháp

```js-nolint
suspend()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn tất với {{jsxref('undefined')}}. Promise sẽ bị từ chối nếu ngữ cảnh đã bị đóng.

## Ví dụ

Đoạn mã sau được lấy từ [bản demo AudioContext states](https://github.com/mdn/webaudio-examples/blob/main/audiocontext-states/index.html) của chúng tôi ([xem chạy trực tiếp](https://mdn.github.io/webaudio-examples/audiocontext-states/).) Khi nút tạm dừng/tiếp tục được nhấn, {{domxref("BaseAudioContext/state", "AudioContext.state")}} được kiểm tra: nếu là `running` thì gọi `suspend()`; nếu là `suspended` thì gọi {{domxref("AudioContext/resume", "resume()")}}. Trong mỗi trường hợp, nhãn văn bản của nút được cập nhật tương ứng sau khi promise hoàn tất.

```js
susResBtn.onclick = () => {
  if (audioCtx.state === "running") {
    audioCtx.suspend().then(() => {
      susResBtn.textContent = "Resume context";
    });
  } else if (audioCtx.state === "suspended") {
    audioCtx.resume().then(() => {
      susResBtn.textContent = "Suspend context";
    });
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
