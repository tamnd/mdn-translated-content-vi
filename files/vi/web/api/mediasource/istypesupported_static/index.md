---
title: "MediaSource: isTypeSupported() static method"
short-title: isTypeSupported()
slug: Web/API/MediaSource/isTypeSupported_static
page-type: web-api-static-method
browser-compat: api.MediaSource.isTypeSupported_static
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức tĩnh **`MediaSource.isTypeSupported()`** trả về một giá trị boolean là `true` nếu MIME type và codec (tùy chọn) đã cho _có khả năng_ được {{Glossary("user agent")}} hiện tại hỗ trợ.

Tức là, nếu nó có thể tạo thành công các đối tượng {{domxref("SourceBuffer")}} cho loại media đó.
Nếu giá trị trả về là `false`, thì tác nhân người dùng chắc chắn rằng nó _không thể_ truy cập media ở định dạng được chỉ định.

## Cú pháp

```js-nolint
MediaSource.isTypeSupported(type)
```

### Tham số

- `type`
  - : Một chuỗi chỉ định MIME type của media và (tùy chọn) một [tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) chứa danh sách các codec được hỗ trợ, phân cách bằng dấu phẩy.

### Giá trị trả về

Giá trị `false` nếu media của loại đã cho _sẽ không_ phát được.

Giá trị `true` được trả về nếu trình duyệt _có thể_ phát media của loại được chỉ định.
Đây _không_ phải là sự đảm bảo, và code của bạn phải được chuẩn bị cho khả năng media sẽ không phát được nếu có.

Tất cả các Web API hoạt động với các tệp media đều sử dụng cách tiếp cận "không/có thể/có thể" (hoặc trong trường hợp này là "không hoặc có thể") khi xác định xem một loại media có thể được sử dụng hay không.
Điều này là vì các tệp media là các cấu trúc phức tạp, tinh tế với quá nhiều biến thể tinh tế để chắc chắn hoàn toàn về bất cứ điều gì cho đến khi bạn thực sự sử dụng nội dung của media.

## Ví dụ

Đoạn code sau từ một ví dụ do Nick Desaulniers viết ([xem demo trực tiếp đầy đủ](https://nickdesaulniers.github.io/netfix/demo/bufferAll.html), hoặc [tải mã nguồn xuống](https://github.com/nickdesaulniers/netfix/blob/gh-pages/demo/bufferAll.html) để xem kỹ hơn). Hàm `getMediaSource()`, không được định nghĩa ở đây, trả về một `MediaSource`.

```js
const assetURL = "frag_bunny.mp4";
// Need to be specific for Blink regarding codecs
// ./mp4info frag_bunny.mp4 | grep Codec
const mimeCodec = 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"';
let mediaSource;

if ("MediaSource" in window && MediaSource.isTypeSupported(mimeCodec)) {
  mediaSource = getMediaSource();
  console.log(mediaSource.readyState); // closed
  video.src = URL.createObjectURL(mediaSource);
  mediaSource.addEventListener("sourceopen", sourceOpen);
} else {
  console.error("Unsupported MIME type or codec: ", mimeCodec);
}

function sourceOpen() {
  console.log(this.readyState); // open
  const sourceBuffer = mediaSource.addSourceBuffer(mimeCodec);
  fetchAB(assetURL, (buf) => {
    sourceBuffer.addEventListener("updateend", () => {
      mediaSource.endOfStream();
      video.play();
      console.log(mediaSource.readyState); // ended
    });
    sourceBuffer.appendBuffer(buf);
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media Source Extensions API](/en-US/docs/Web/API/Media_Source_Extensions_API)
- [Hướng dẫn về các loại và định dạng media trên web](/en-US/docs/Web/Media/Guides/Formats)
- [Codec trong các loại media phổ biến](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter)
- {{domxref("SourceBuffer")}}
- {{domxref("SourceBufferList")}}
