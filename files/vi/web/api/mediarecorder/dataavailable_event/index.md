---
title: "MediaRecorder: sự kiện dataavailable"
short-title: dataavailable
slug: Web/API/MediaRecorder/dataavailable_event
page-type: web-api-event
browser-compat: api.MediaRecorder.dataavailable_event
---

{{APIRef("MediaStream Recording")}}

Sự kiện **`dataavailable`** của giao diện {{domxref("MediaRecorder")}} được kích hoạt khi MediaRecorder chuyển dữ liệu phương tiện đến ứng dụng của bạn để sử dụng. Dữ liệu được cung cấp trong một đối tượng {{domxref("Blob")}} chứa dữ liệu đó. Điều này xảy ra trong bốn tình huống:

- Khi luồng phương tiện kết thúc, mọi dữ liệu phương tiện chưa được chuyển đến trình xử lý `ondataavailable` của bạn sẽ được truyền trong một {{domxref("Blob")}} duy nhất.
- Khi {{domxref("MediaRecorder.stop()")}} được gọi, tất cả dữ liệu phương tiện đã được ghi từ khi bắt đầu ghi hoặc từ lần sự kiện `dataavailable` xảy ra cuối cùng sẽ được chuyển trong một {{domxref("Blob")}}; sau đó, việc ghi kết thúc.
- Khi {{domxref("MediaRecorder.requestData()")}} được gọi, tất cả dữ liệu phương tiện đã được ghi từ khi bắt đầu ghi hoặc từ lần sự kiện `dataavailable` xảy ra cuối cùng sẽ được chuyển; sau đó một `Blob` mới được tạo và việc ghi tiếp tục vào blob đó.
- Nếu thuộc tính `timeslice` được truyền vào phương thức {{domxref("MediaRecorder.start()")}} bắt đầu ghi phương tiện, sự kiện `dataavailable` sẽ được kích hoạt mỗi `timeslice` mili giây. Điều đó có nghĩa là thông thường, mỗi blob sẽ có một khoảng thời gian cụ thể (ngoại trừ blob cuối cùng, có thể ngắn hơn, vì đó là bất cứ thứ gì còn lại từ sự kiện cuối cùng). Vì vậy nếu lời gọi phương thức trông như thế này: `recorder.start(1000);` - sự kiện `dataavailable` sẽ kích hoạt sau mỗi giây ghi phương tiện, và trình xử lý sự kiện sẽ được gọi mỗi giây với một blob dữ liệu phương tiện dài một giây. Bạn có thể dùng `timeslice` cùng với {{domxref("MediaRecorder.stop()")}} và {{domxref("MediaRecorder.requestData()")}} để tạo ra nhiều blob có cùng độ dài cùng với các blob ngắn hơn.

> [!NOTE]
> Giống như các giá trị thời gian khác trong web API, `timeslice` không chính xác và các khoảng thực tế có thể bị trễ do các tác vụ đang chờ xử lý khác, tính năng trình duyệt (tạm dừng camera và microphone trên Safari), các hành vi riêng của trình duyệt (khóa màn hình khi đang ghi trên Chrome trên Android tạm dừng sự kiện `dataavailable`), hoặc các lỗi trình duyệt khác. Những tình huống như vậy cũng có thể dẫn đến các đoạn dữ liệu lớn hơn đáng kể.
>
> Do đó, đừng dựa vào `timeslice` và số lượng đoạn nhận được để tính thời gian đã trôi qua, vì các lỗi có thể tích lũy. Thay vào đó, hãy giữ một bộ đếm thời gian riêng biệt bằng cách dùng {{domxref("Event.timeStamp")}} hoặc tương tự, ghi lại tổng thời gian đã trôi qua kể từ khi bắt đầu.

{{domxref("Blob")}} chứa dữ liệu phương tiện có sẵn trong thuộc tính `data` của sự kiện `dataavailable`.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dataavailable", (event) => { })

ondataavailable = (event) => { }
```

## Loại sự kiện

Một {{domxref("BlobEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("BlobEvent")}}

## Ví dụ

```js
const chunks = [];

mediaRecorder.onstop = (e) => {
  console.log("data available after MediaRecorder.stop() called.");

  const audio = document.createElement("audio");
  audio.controls = true;
  const blob = new Blob(chunks, { type: mediaRecorder.mimeType });
  const audioURL = window.URL.createObjectURL(blob);
  audio.src = audioURL;
  console.log("recorder stopped");
};

mediaRecorder.ondataavailable = (e) => {
  chunks.push(e.data);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API)
- [Web Dictaphone](https://mdn.github.io/dom-examples/media/web-dictaphone/): MediaRecorder + getUserMedia + Web Audio API visualization demo, bởi [Chris Mills](https://github.com/chrisdavidmills) ([mã nguồn trên GitHub](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone).)
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), bởi [Sam Dutton](https://github.com/samdutton).
- {{domxref("Navigator.getUserMedia()")}}
- [Dealing with huge MediaRecorder chunks](https://blog.addpipe.com/dealing-with-huge-mediarecorder-slices/) trên addpipe.com (2024)
