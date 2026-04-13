---
title: "MediaStreamTrack: thuộc tính contentHint"
short-title: contentHint
slug: Web/API/MediaStreamTrack/contentHint
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.contentHint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`contentHint`** của giao diện {{domxref("MediaStreamTrack")}} là một chuỗi gợi ý về loại nội dung mà track chứa. Các giá trị cho phép phụ thuộc vào giá trị của thuộc tính {{domxref("MediaStreamTrack.kind")}}.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `""`
  - : Chưa có `contentHint` nào được đặt.
- `"speech"`
  - : Track nên được xử lý như thể nó chứa dữ liệu giọng nói. Khi đặt giá trị này, giá trị của {{domxref("MediaStreamTrack.kind")}} phải là `"audio"`.
- `"speech-recognition"`
  - : Track nên được xử lý như thể nó chứa dữ liệu nhằm mục đích nhận dạng giọng nói bằng máy. Khi đặt giá trị này, giá trị của {{domxref("MediaStreamTrack.kind")}} phải là `"audio"`.
- `"music"`
  - : Track nên được xử lý như thể nó chứa nhạc. Khi đặt giá trị này, giá trị của {{domxref("MediaStreamTrack.kind")}} phải là `"audio"`.
- `"motion"`
  - : Track nên được xử lý như thể nó chứa video trong đó chuyển động là quan trọng. Ví dụ: video webcam, phim hoặc trò chơi điện tử. Khi đặt giá trị này, giá trị của {{domxref("MediaStreamTrack.kind")}} phải là `"video"`.
- `"detail"`
  - : Track nên được xử lý như thể chi tiết video đặc biệt quan trọng. Ví dụ: bài thuyết trình hoặc trang web có nội dung văn bản, tranh vẽ hoặc tranh nét. Khi đặt giá trị này, giá trị của {{domxref("MediaStreamTrack.kind")}} phải là `"video"`.
- `"text"`
  - : Track nên được xử lý như thể chi tiết video đặc biệt quan trọng, và các cạnh sắc nét đáng kể cũng như các vùng màu đồng nhất có thể xuất hiện thường xuyên. Ví dụ: bài thuyết trình hoặc trang web có nội dung văn bản. Khi đặt giá trị này, giá trị của {{domxref("MediaStreamTrack.kind")}} phải là `"video"`.

## Ví dụ

### Một hàm đặt contentHint

Hàm này nhận một luồng và một giá trị `contentHint`, và áp dụng gợi ý cho mỗi track. [Xem ví dụ đầy đủ tại đây](https://webrtc.github.io/samples/src/content/capture/video-contenthint/), cho thấy các giá trị `contentHint` khác nhau thay đổi cách các track hiển thị như thế nào.

```js
function setVideoTrackContentHints(stream, hint) {
  const tracks = stream.getVideoTracks();
  tracks.forEach((track) => {
    if ("contentHint" in track) {
      track.contentHint = hint;
      if (track.contentHint !== hint) {
        console.error(`Invalid video track contentHint: "${hint}"`);
      }
    } else {
      console.error("MediaStreamTrack contentHint attribute not supported");
    }
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}
