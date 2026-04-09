---
title: "AudioContext: phương thức resume()"
short-title: resume()
slug: Web/API/AudioContext/resume
page-type: web-api-instance-method
browser-compat: api.AudioContext.resume
---

{{ APIRef("Web Audio API") }}

Phương thức **`resume()`** của giao diện {{ domxref("AudioContext") }} tiếp tục dòng thời gian trong một ngữ cảnh âm thanh đã bị tạm dừng trước đó.

Phương thức này sẽ khiến ngoại lệ `INVALID_STATE_ERR` được ném ra nếu được gọi trên một {{domxref("OfflineAudioContext")}}.

## Syntax

```js-nolint
resume()
```

### Parameters

Không có.

### Return value

Một {{jsxref("Promise")}} hoàn tất khi ngữ cảnh đã tiếp tục chạy. Promise sẽ bị từ chối nếu ngữ cảnh đã bị đóng.

## Examples

Đoạn mã sau được lấy từ [bản demo AudioContext states](https://github.com/mdn/webaudio-examples/tree/main/audiocontext-states) của chúng tôi ([xem chạy trực tiếp](https://mdn.github.io/webaudio-examples/audiocontext-states/).) Khi nút tạm dừng/tiếp tục được nhấn, {{domxref("BaseAudioContext/state", "AudioContext.state")}} được kiểm tra: nếu là `running` thì gọi {{domxref("AudioContext.suspend()", "suspend()")}}; nếu là `suspended` thì gọi `resume()`. Trong mỗi trường hợp, nhãn văn bản của nút được cập nhật tương ứng sau khi promise hoàn tất.

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

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
