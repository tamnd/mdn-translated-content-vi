---
title: "RTCDataChannel: phương thức send()"
short-title: send()
slug: Web/API/RTCDataChannel/send
page-type: web-api-instance-method
browser-compat: api.RTCDataChannel.send
---

{{APIRef("WebRTC")}}

Phương thức **`send()`** của
Giao diện {{domxref("RTCDataChannel")}} gửi dữ liệu qua kênh dữ liệu tới
ngang hàng từ xa.
Việc này có thể được thực hiện bất kỳ lúc nào ngoại trừ trong quá trình ban đầu của
tạo ra kênh vận chuyển cơ bản. Dữ liệu được gửi trước khi kết nối sẽ được lưu vào bộ đệm nếu
có thể xảy ra (hoặc xảy ra lỗi nếu không thể thực hiện được) và cũng được lưu vào bộ đệm nếu được gửi trong khi
kết nối đang đóng hoặc đóng.

> [!LƯU Ý]
> Các trình duyệt khác nhau có những giới hạn khác nhau về kích thước của tin nhắn mà bạn có thể
> gửi. Các thông số kỹ thuật tồn tại để xác định cách tự động phân đoạn các tin nhắn lớn, nhưng
> không phải tất cả các trình duyệt đều triển khai chúng và những trình duyệt có nhiều tính năng bổ sung khác nhau
> hạn chế. Điều này sẽ trở nên ít phức tạp hơn theo thời gian, nhưng bây giờ, nếu bạn có
> câu hỏi, xem [Hiểu giới hạn kích thước tin nhắn](/en-US/docs/Web/API/WebRTC_API/Using_data_channels#understanding_message_size_limits).


## Cú pháp

```js-nolint
send(data)
```


### Thông số

- `data`
  - : Dữ liệu cần truyền qua kết nối. Đây có thể là một chuỗi,

    đối tượng {{domxref("Blob")}}, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}.

### Giá trị trả về


Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném khi kênh dữ liệu chưa thiết lập xong kết nối của chính nó (tức là
    {{domxref("RTCDataChannel.readyState", "readyState")}} là `connecting`). Kênh dữ liệu
    phải thiết lập kết nối riêng vì nó sử dụng kênh truyền tải tách biệt với kênh nội dung đa phương tiện. Lỗi này xảy ra khi không gửi hoặc lưu vào bộ nhớ đệm `data`.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném khi `data` được chỉ định cần được đệm và không còn chỗ cho nó trong bộ đệm.
- {{jsxref("TypeError")}}
  - : Bị ném nếu `data` được chỉ định quá lớn để thiết bị ngang hàng khác có thể nhận được. Kể từ khi
    có nhiều kỹ thuật để chia dữ liệu lớn thành các phần nhỏ hơn để
    chuyển, có thể gặp phải các tình huống trong đó thiết bị ngang hàng khác không
    ủng hộ những cái tương tự. Ví dụ: nếu một thiết bị ngang hàng là trình duyệt hiện đại hỗ trợ
    sử dụng cờ `EOR` (Kết thúc bản ghi) để cho biết khi nào một tin nhắn đã nhận được

    phần cuối cùng của một đối tượng gồm nhiều phần được gửi bằng `send()`. Để biết thêm
    thông tin về giới hạn kích thước tin nhắn, xem
    [Hiểu giới hạn kích thước tin nhắn](/en-US/docs/Web/API/WebRTC_API/Using_data_channels#understanding_message_size_limits).

## Ví dụ

Trong ví dụ này, một quy trình có tên `sendMessage()` được tạo; nó chấp nhận một
đối tượng làm đầu vào và gửi đến thiết bị ngang hàng ở xa, qua {{domxref("RTCDataChannel")}},
Chuỗi JSON có đối tượng được chỉ định và dấu thời gian.

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("BackChannel");

function sendMessage(msg) {
  const obj = {
    message: msg,
    timestamp: new Date(),

  };
  dc.send(JSON.stringify(obj));
}

```

## Thông số kỹ thuật


{{Specifications}}

## Khả năng tương thích của trình duyệt


{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.readyState")}}
- sự kiện {{DOMxRef("RTCDataChannel.close_event", "close")}}
