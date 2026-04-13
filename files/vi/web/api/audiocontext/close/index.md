---
title: "AudioContext: phương thức close()"
short-title: close()
slug: Web/API/AudioContext/close
page-type: web-api-instance-method
browser-compat: api.AudioContext.close
---

{{ APIRef("Web Audio API") }}

Phương thức `close()` của giao diện {{ domxref("AudioContext") }} đóng ngữ cảnh âm thanh, giải phóng mọi tài nguyên âm thanh hệ thống mà nó sử dụng.

Hàm này không tự động giải phóng mọi đối tượng do `AudioContext` tạo ra, trừ khi các tham chiếu khác đến chúng cũng đã được giải phóng; tuy nhiên, nó sẽ cưỡng chế giải phóng mọi tài nguyên âm thanh hệ thống có thể ngăn việc tạo và sử dụng thêm `AudioContext`, tạm dừng dòng thời gian âm thanh trong audio context, và dừng xử lý dữ liệu âm thanh. {{jsxref("Promise")}} được trả về sẽ hoàn tất khi tất cả tài nguyên đang chặn việc tạo `AudioContext` đã được giải phóng. Phương thức này ném ra ngoại lệ `INVALID_STATE_ERR` nếu được gọi trên một {{domxref("OfflineAudioContext")}}.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn tất với {{jsxref('undefined')}}.

## Ví dụ

Đoạn mã sau được lấy từ [bản demo AudioContext states](https://github.com/mdn/webaudio-examples/blob/main/audiocontext-states/index.html) của chúng tôi ([xem chạy trực tiếp](https://mdn.github.io/webaudio-examples/audiocontext-states/).) Khi nút dừng được nhấn, `close()` sẽ được gọi. Khi promise hoàn tất, ví dụ được đặt lại về trạng thái ban đầu.

```js
stopBtn.onclick = () => {
  audioCtx.close().then(() => {
    startBtn.removeAttribute("disabled");
    susResBtn.setAttribute("disabled", "disabled");
    stopBtn.setAttribute("disabled", "disabled");
  });
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
