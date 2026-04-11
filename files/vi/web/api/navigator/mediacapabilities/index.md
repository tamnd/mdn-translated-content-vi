---
title: "Navigator: thuộc tính mediaCapabilities"
short-title: mediaCapabilities
slug: Web/API/Navigator/mediaCapabilities
page-type: web-api-instance-property
browser-compat: api.Navigator.mediaCapabilities
---

{{APIRef("Media Capabilities API")}}

Thuộc tính chỉ đọc **`mediaCapabilities`** của giao diện {{domxref("Navigator")}} tham chiếu đến đối tượng {{domxref("MediaCapabilities")}} có thể hiển thị thông tin về khả năng giải mã và mã hóa cho một định dạng phương tiện và khả năng đầu ra nhất định.

## Giá trị

Đối tượng {{domxref("MediaCapabilities")}}.

## Ví dụ

```js
navigator.mediaCapabilities
  .decodingInfo({
    type: "file",
    audio: {
      contentType: "audio/mp3",
      channels: 2,
      bitrate: 132700,
      samplerate: 5200,
    },
  })
  .then((result) => {
    console.log(
      `This configuration is ${result.supported ? "" : "not "}supported,`,
    );
    console.log(`${result.smooth ? "" : "not "}smooth, and`);
    console.log(`${result.powerEfficient ? "" : "not "}power efficient.`);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Media Capabilities API](/en-US/docs/Web/API/Media_Capabilities_API)
- {{domxref("Navigator")}}
