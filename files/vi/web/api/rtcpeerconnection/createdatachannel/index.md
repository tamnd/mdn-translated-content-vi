---
title: "RTCPeerConnection: phương thức createDataChannel()"
short-title: createDataChannel()
slug: Web/API/RTCPeerConnection/createDataChannel
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.createDataChannel
---

{{APIRef("WebRTC")}}

Phương thức **`createDataChannel()`** của giao diện {{domxref("RTCPeerConnection")}} tạo một kênh mới được liên kết với máy ngang hàng từ xa, qua đó có thể truyền bất kỳ loại dữ liệu nào.
Điều này hữu ích cho nội dung kênh phụ như hình ảnh, truyền tệp, chat văn bản, gói cập nhật trò chơi, v.v.

Nếu kênh dữ liệu mới là kênh đầu tiên được thêm vào kết nối, việc thương lượng lại sẽ được bắt đầu bằng cách gửi sự kiện {{DOMxRef("RTCPeerConnection/negotiationneeded_event", "negotiationneeded")}}.

## Cú pháp

```js-nolint
createDataChannel(label)
createDataChannel(label, options)
```

### Tham số

- `label`
  - : Tên dễ đọc cho kênh.
    Chuỗi này không được dài hơn 65.535 byte.
- `options` {{optional_inline}}
  - : Đối tượng cung cấp các tùy chọn cấu hình cho kênh dữ liệu.
    Nó có thể chứa các trường sau:
    - `ordered` {{optional_inline}}
      - : Cho biết các thông điệp gửi trên {{domxref("RTCDataChannel")}} có bắt buộc phải đến đúng thứ tự như lúc gửi (`true`) hay được phép đến không theo thứ tự (`false`).
        **Mặc định: `true`.**
    - `maxPacketLifeTime` {{optional_inline}}
      - : Số mili giây tối đa mà việc truyền một thông điệp có thể mất trong chế độ không đáng tin cậy.
        Mặc dù giá trị này là một số nguyên không dấu 16 bit, mỗi user agent có thể giới hạn nó xuống mức tối đa mà nó cho là phù hợp.
        **Mặc định: `null`.**
    - `maxRetransmits` {{optional_inline}}
      - : Số lần tối đa mà user agent nên cố gắng truyền lại một thông điệp nếu lần đầu thất bại trong chế độ không đáng tin cậy.
        Mặc dù giá trị này là một số nguyên không dấu 16 bit, mỗi user agent có thể giới hạn nó xuống mức tối đa mà nó cho là phù hợp.
        **Mặc định: `null`.**
    - `protocol` {{optional_inline}}
      - : Tên của giao thức con được dùng trên {{domxref("RTCDataChannel")}}, nếu có;
        nếu không thì là chuỗi rỗng (`""`).
        **Mặc định: chuỗi rỗng (`""`).**
        Chuỗi này không được dài hơn 65.535 _byte_.
    - `negotiated` {{optional_inline}}
      - : Theo mặc định (`false`), các kênh dữ liệu được thương lượng trong băng, nơi một bên gọi `createDataChannel`, và bên kia lắng nghe sự kiện {{domxref("RTCDataChannelEvent")}} bằng trình xử lý sự kiện {{DOMxRef("RTCPeerConnection.datachannel_event", "ondatachannel")}}.
        Ngoài ra (`true`), chúng có thể được thương lượng ngoài băng, nơi cả hai bên gọi `createDataChannel` với một ID đã thống nhất.
        **Mặc định: `false`.**
    - `id` {{optional_inline}}
      - : ID số 16 bit cho kênh;
        giá trị hợp lệ là từ 0 đến 65534.
        Nếu bạn không bao gồm tùy chọn này, user agent sẽ chọn một ID cho bạn.

> [!NOTE]
> Các tùy chọn này đại diện cho tập con có thể đặt bằng script của các thuộc tính trên giao diện {{domxref("RTCDataChannel")}}.

### Giá trị trả về

Một đối tượng {{domxref("RTCDataChannel")}} mới với `label` được chỉ định, được cấu hình bằng các tùy chọn trong `options` nếu tham số đó được bao gồm; nếu không, các giá trị mặc định được liệt kê ở trên sẽ được áp dụng.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("RTCPeerConnection")}} đã đóng.
- {{jsxref("TypeError")}}
  - : Ném ra trong các trường hợp sau:
    - Chuỗi label và/hoặc protocol quá dài; chúng không được dài hơn 65.535 byte (byte chứ không phải ký tự).
    - `id` là 65535. Mặc dù đây là một giá trị hợp lệ của số nguyên không dấu 16 bit, nó không phải là giá trị được phép cho `id`.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném ra nếu cả `maxPacketLifeTime` và `maxRetransmits` đều được chỉ định.
    Bạn chỉ được phép chỉ định một trong hai giá trị này khác `null`.
- `ResourceInUse` {{domxref("DOMException")}}
  - : Ném ra nếu `id` đã được chỉ định nhưng một {{domxref("RTCDataChannel")}} khác đang dùng cùng giá trị đó.
- `OperationError` {{domxref("DOMException")}}
  - : Ném ra nếu `id` được chỉ định đã được dùng, hoặc nếu không chỉ định `id`, lớp WebRTC không thể tự động tạo ID vì tất cả ID đều đã được dùng.

## Ví dụ

Ví dụ này cho thấy cách tạo một data channel và thiết lập trình xử lý cho các sự kiện {{DOMxRef("RTCDataChannel/open_event", "open")}} và {{DOMxRef("RTCDataChannel/message_event", "message")}} để gửi và nhận thông điệp trên đó (để ngắn gọn, ví dụ giả định `onnegotiationneeded` đã được thiết lập).

```js
// Phía bên mời

const pc = new RTCPeerConnection(options);
const channel = pc.createDataChannel("chat");
channel.onopen = (event) => {
  channel.send("Hi you!");
};
channel.onmessage = (event) => {
  console.log(event.data);
};
```

```js
// Phía bên trả lời

const pc = new RTCPeerConnection(options);
pc.ondatachannel = (event) => {
  const channel = event.channel;
  channel.onopen = (event) => {
    channel.send("Hi back!");
  };
  channel.onmessage = (event) => {
    console.log(event.data);
  };
};
```

Ngoài ra, bạn có thể dùng thương lượng ngoài băng đối xứng hơn bằng một `id` đã thống nhất (ở đây là 0):

```js
// Cả hai phía

const pc = new RTCPeerConnection(options);
const channel = pc.createDataChannel("chat", { negotiated: true, id: 0 });
channel.onopen = (event) => {
  channel.send("Hi!");
};
channel.onmessage = (event) => {
  console.log(event.data);
};
```

Để xem ví dụ kỹ hơn về cách thiết lập kết nối và kênh, xem [Một mẫu RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCDataChannel")}}
- [Một mẫu RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
- {{domxref("RTCPeerConnection")}}
