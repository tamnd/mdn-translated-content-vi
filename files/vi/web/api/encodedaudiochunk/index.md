---
title: EncodedAudioChunk
slug: Web/API/EncodedAudioChunk
page-type: web-api-interface
browser-compat: api.EncodedAudioChunk
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`EncodedAudioChunk`** của {{domxref('WebCodecs API','','',' ')}} đại diện cho một chunk dữ liệu âm thanh đã mã hóa.

## Hàm khởi tạo

- {{domxref("EncodedAudioChunk.EncodedAudioChunk", "EncodedAudioChunk()")}}
  - : Tạo một đối tượng `EncodedAudioChunk` mới.

## Thuộc tính phiên bản

- {{domxref("EncodedAudioChunk.type")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết liệu chunk dữ liệu này có phải là key chunk hay không.
- {{domxref("EncodedAudioChunk.timestamp")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên đại diện cho timestamp của âm thanh tính bằng micro giây.
- {{domxref("EncodedAudioChunk.duration")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên đại diện cho thời lượng của âm thanh tính bằng micro giây.
- {{domxref("EncodedAudioChunk.byteLength")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên đại diện cho độ dài của âm thanh tính bằng byte.

## Phương thức phiên bản

- {{domxref("EncodedAudioChunk.copyTo()")}}
  - : Sao chép dữ liệu âm thanh đã mã hóa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
