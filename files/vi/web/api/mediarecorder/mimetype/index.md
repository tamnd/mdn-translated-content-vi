---
title: "MediaRecorder: thuộc tính mimeType"
short-title: mimeType
slug: Web/API/MediaRecorder/mimeType
page-type: web-api-instance-property
browser-compat: api.MediaRecorder.mimeType
---

{{APIRef("MediaStream Recording")}}

Thuộc tính chỉ đọc **`mimeType`** của giao diện {{domxref("MediaRecorder")}} trả về loại phương tiện {{Glossary("MIME")}} được chỉ định khi tạo đối tượng {{domxref("MediaRecorder")}}, hoặc nếu không có loại nào được chỉ định, loại được trình duyệt chọn. Đây là định dạng tệp của tệp sẽ tạo ra nếu ghi tất cả dữ liệu đã ghi vào đĩa.

Hãy nhớ rằng không phải tất cả codec đều được hỗ trợ bởi một container nhất định; nếu bạn ghi phương tiện bằng codec không được hỗ trợ bởi một container phương tiện nhất định, tệp kết quả có thể không hoạt động đáng tin cậy hoặc hoàn toàn khi bạn cố phát lại. Xem [hướng dẫn về loại và định dạng phương tiện](/en-US/docs/Web/Media/Guides/Formats) để biết thông tin về hỗ trợ container và codec trên các trình duyệt.

> [!NOTE]
> Thuật ngữ "MIME type" hiện tại được coi là lịch sử; các chuỗi này hiện được gọi chính thức là **loại phương tiện**. Nội dung MDN Web Docs sử dụng các thuật ngữ này thay thế cho nhau.

## Giá trị

Loại phương tiện MIME mô tả định dạng của phương tiện đã ghi, dưới dạng chuỗi. Chuỗi này _có thể_ bao gồm [tham số `codecs`,](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) cung cấp chi tiết về codec và cấu hình codec được dùng bởi bộ ghi phương tiện.

Các chuỗi loại phương tiện được chuẩn hóa bởi Internet Assigned Numbers Authority (IANA). Xem danh sách chính thức các chuỗi loại phương tiện đã định nghĩa trong bài viết [Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml) trên trang IANA. Xem thêm [loại phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) để tìm hiểu thêm về loại phương tiện và cách chúng được sử dụng trong nội dung web và bởi các trình duyệt web.

## Ví dụ

```js
if (navigator.mediaDevices) {
  console.log("getUserMedia supported.");

  const constraints = { audio: true, video: true };
  const chunks = [];

  navigator.mediaDevices
    .getUserMedia(constraints)
    .then((stream) => {
      const options = {
        audioBitsPerSecond: 128000,
        videoBitsPerSecond: 2500000,
        mimeType: "video/mp4",
      };
      const mediaRecorder = new MediaRecorder(stream, options);
      m = mediaRecorder;

      m.mimeType; // sẽ trả về 'video/mp4'
      // …
    })
    .catch((error) => {
      console.error(error.message);
    });
}
```

Thay đổi `mimeType` trong `options` thành `'video/mp4; codecs="avc1.424028, mp4a.40.2"'` khiến `MediaRecorder` cố gắng dùng AVC Constrained Baseline Profile Level 4 cho video và AAC-LC (Low Complexity) cho âm thanh, phù hợp cho thiết bị di động và các tình huống có tài nguyên hạn chế khác.

Giả sử cấu hình này được tác nhân người dùng chấp nhận, giá trị trả về sau đó bởi `m.mimeType` sẽ là `video/mp4; codecs="avc1.424028, mp4a.40.2"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [Codec trong các loại phương tiện phổ biến](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter)
- [Web Dictaphone](https://mdn.github.io/dom-examples/media/web-dictaphone/): MediaRecorder + getUserMedia + Web Audio API visualization demo, bởi [Chris Mills](https://github.com/chrisdavidmills) ([mã nguồn trên GitHub](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone).)
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), bởi [Sam Dutton](https://github.com/samdutton).
- {{domxref("MediaDevices.getUserMedia()")}}
