---
title: "AudioContext: phương thức setSinkId()"
short-title: setSinkId()
slug: Web/API/AudioContext/setSinkId
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.AudioContext.setSinkId
---

{{APIRef("Web Audio API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`setSinkId()`** của giao diện {{domxref("AudioContext")}} thiết lập thiết bị đầu ra âm thanh cho `AudioContext`. Nếu sink ID không được đặt tường minh, thiết bị đầu ra âm thanh mặc định của hệ thống sẽ được sử dụng.

Để đặt thiết bị âm thanh khác với thiết bị mặc định, nhà phát triển cần có quyền truy cập vào các thiết bị âm thanh. Nếu cần, người dùng có thể được nhắc cấp quyền cần thiết thông qua lời gọi {{domxref("MediaDevices.getUserMedia()")}}.

Ngoài ra, tính năng này có thể bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection).

## Syntax

```js-nolint
setSinkId(sinkId)
```

### Parameters

- `sinkId`
  - : Sink ID của thiết bị mà bạn muốn đặt làm thiết bị đầu ra âm thanh. Giá trị này có thể thuộc một trong các kiểu sau:
    - String
      - : Một chuỗi biểu diễn sink ID, ví dụ được lấy qua thuộc tính `deviceId` của các đối tượng {{domxref("MediaDeviceInfo")}} được trả về bởi {{domxref("MediaDevices.enumerateDevices()")}}.
    - `AudioSinkOptions`
      - : Một đối tượng biểu diễn các tùy chọn khác nhau cho sink ID. Hiện tại đối tượng này chỉ có một thuộc tính là `type` với giá trị `none`. Việc thiết lập tham số này khiến âm thanh được xử lý mà không phát qua bất kỳ thiết bị đầu ra âm thanh nào. Đây là một lựa chọn hữu ích để giảm tiêu thụ điện năng khi bạn không cần phát lại cùng với xử lý.

### Return value

Một {{jsxref("Promise")}} hoàn tất với giá trị `undefined`.

Việc cố đặt sink ID thành chính giá trị hiện có của nó (tức giá trị được trả về bởi {{domxref("AudioContext.sinkId")}}) sẽ không ném lỗi, nhưng quá trình sẽ bị hủy ngay lập tức.

### Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc truy cập thiết bị đầu ra âm thanh đã chọn thất bại.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không có quyền truy cập các thiết bị âm thanh.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu `sinkId` được truyền vào không khớp với bất kỳ thiết bị âm thanh nào được tìm thấy trên hệ thống.

## Examples

Trong [ví dụ kiểm thử SetSinkId](https://mdn.github.io/dom-examples/audiocontext-setsinkid/) của chúng tôi (hãy xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/audiocontext-setsinkid)), chúng tôi tạo một đồ thị âm thanh sinh ra một đoạn white noise dài ba giây bằng {{domxref("AudioBufferSourceNode")}}, đồng thời cho nó đi qua một {{domxref("GainNode")}} để giảm âm lượng bớt.

```js
mediaDeviceBtn.addEventListener("click", async () => {
  if ("setSinkId" in AudioContext.prototype) {
    selectDiv.textContent = "";

    const stream = await navigator.mediaDevices.getUserMedia({
      audio: true,
    });
    const devices = await navigator.mediaDevices.enumerateDevices();

    // Most of the DOM scripting to generate the dropdown cut out for brevity

    const audioOutputs = devices.filter(
      (device) =>
        device.kind === "audiooutput" && device.deviceId !== "default",
    );

    audioOutputs.forEach((device) => {
      const option = document.createElement("option");
      option.value = device.deviceId;
      option.textContent = device.label;
      select.appendChild(option);
    });

    const option = document.createElement("option");
    option.value = "none";
    option.textContent = "None";
    select.appendChild(option);

    select.addEventListener("change", async () => {
      if (select.value === "none") {
        await audioCtx.setSinkId({ type: "none" });
      } else {
        await audioCtx.setSinkId(select.value);
      }
    });
  }
});
```

Chúng tôi cũng cung cấp cho người dùng một menu thả xuống để cho phép họ thay đổi thiết bị đầu ra âm thanh ngay lập tức. Để làm điều này, chúng tôi:

1. Cung cấp một nút để điền dữ liệu vào menu thả xuống. Đầu tiên chúng tôi gọi {{domxref("MediaDevices.getUserMedia()")}} để kích hoạt hộp thoại xin quyền cần thiết cho phép liệt kê thiết bị, rồi dùng {{domxref("MediaDevices.enumerateDevices()")}} để lấy tất cả thiết bị khả dụng. Chúng tôi lặp qua các thiết bị khác nhau và biến từng thiết bị thành một tùy chọn trong phần tử {{htmlelement("select")}}. Chúng tôi cũng tạo thêm tùy chọn "None" cho trường hợp bạn không muốn phát âm thanh ra bất kỳ đầu ra nào.
2. Thêm trình nghe sự kiện {{domxref("HTMLElement/change_event", "change")}} vào phần tử {{htmlelement("select")}} để thay đổi sink ID và do đó thay đổi thiết bị đầu ra âm thanh khi một giá trị mới được chọn. Nếu "None" được chọn trong menu, chúng tôi gọi `setSinkId()` với tham số đối tượng `{ type : 'none' }` để không chọn thiết bị âm thanh nào; nếu không, chúng tôi gọi nó với ID thiết bị âm thanh chứa trong thuộc tính `value` của phần tử `<select>`.

Thiết bị đầu ra có thể được thay đổi trong khi đang phát âm thanh, cũng như trước hoặc giữa các lần phát.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Change the destination output device in Web Audio](https://developer.chrome.com/blog/audiocontext-setsinkid/)
- {{domxref("AudioContext.sinkId")}}
- {{domxref("AudioContext/sinkchange_event", "sinkchange")}}
